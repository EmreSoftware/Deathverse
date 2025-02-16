--[[
    Death messages, death sounds and killstreaks for Garry's Mod.
    Copyright (C) 2024  EmreSoftware

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License,or any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
]]--

print("----------------------------------------")
print(" Deathverse: Enhanced Annihilation Suite")
print("              By EFSP")
print("          76561198267684212")
print("----------------------------------------")

util.AddNetworkString("EFSPDeathMessage")
util.AddNetworkString("EFSPDeathSound2D")
util.AddNetworkString("EFSPDeathSound3D")

include("autorun/sh_deathverse.lua")

-- Configuration ConVars
local efspSoundsEnabled = CreateConVar("deathverse_enable_sounds", "1", FCVAR_ARCHIVE + FCVAR_REPLICATED, "Enable death message sounds")
local efsp3DSounds = true
local efspSoundAttenuation = CreateConVar("deathverse_sound_attenuation", "0.5", 
    FCVAR_ARCHIVE + FCVAR_REPLICATED, 
    "3D sound attenuation (0.1-2.0)"
)

-- Recent selections tracking for non-repeating messages/sounds
local recentSuicideIndices = {}
local recentDeathIndices = {}
local recentRegularVictimSoundIndices = {}
local recentStreakVictimSoundIndices = {}

-- Returns a non-repeating random selection from a table and updates recentList.
local function GetNonRepeatingSelection(tbl, recentList)
    local available = {}
    for i = 1, #tbl do
        if not table.HasValue(recentList, i) then
            table.insert(available, i)
        end
    end

    if #available == 0 then
        -- Reset recentList and repopulate available indices in order.
        recentList = {}
        available = {}
        for i = 1, #tbl do
            table.insert(available, i)
        end
    end

    local selected = table.Random(available)
    table.insert(recentList, selected)
    
    if #recentList > 3 then
        table.remove(recentList, 1)
    end
    
    return tbl[selected], recentList
end

-- Reset killstreak on player spawn.
hook.Add("PlayerSpawn", "EFSPResetKillStreak", function(ply)
    ply:SetNWInt("EFSPKillstreak", 0)
end)

-- Main death hook.
hook.Add("PlayerDeath", "EFSPGlobalDeathMessage", function(victim, inflictor, attacker)
    if not IsValid(victim) then return end
    
    -- Suicide handling.
    if victim == attacker then
        victim:SetNWInt("EFSPKillstreak", 0)
        local template
        template, recentSuicideIndices = GetNonRepeatingSelection(SuicideMessages, recentSuicideIndices)
        
        net.Start("EFSPDeathMessage")
            net.WriteBool(true)
            net.WriteString(template)
            net.WriteString(victim:Nick())
        net.Broadcast()
        
        if efspSoundsEnabled:GetBool() then
            local soundPath
            soundPath, recentRegularVictimSoundIndices = GetNonRepeatingSelection(RegularVictimSounds, recentRegularVictimSoundIndices)
            
            net.Start("EFSPDeathSound3D")
                net.WriteString(soundPath)
                net.WriteVector(victim:GetPos())
            net.SendOmit(victim)
            
            net.Start("EFSPDeathSound2D")
                net.WriteString(soundPath)
            net.Send(victim)
        end
        return
    end

    -- Regular death handling.
    victim:SetNWInt("EFSPKillstreak", 0)
    local attackerName = "Unknown"
    if IsValid(attacker) then
        if attacker:IsPlayer() then
            attackerName = attacker:Nick()
        elseif attacker == game.GetWorld() then
            attackerName = "The world"
        elseif attacker:GetClass() == "prop_physics" then
            local model = attacker:GetModel() or ""
            attackerName = "Prop (" .. model .. ")"
        elseif type(attacker.Name) == "function" then
            attackerName = attacker:Name()
        else
            attackerName = attacker:GetClass() or "Unknown"
        end
    end

    local killstreakReached = false
    local streakTemplate = ""

    if IsValid(attacker) and attacker:IsPlayer() then
        local currentStreak = (attacker:GetNWInt("EFSPKillstreak", 0) or 0) + 1
        attacker:SetNWInt("EFSPKillstreak", currentStreak)
        
        -- Use a custom OMNICIDAL message for high killstreaks (multiples of 5 after 10).
        if currentStreak > 10 and currentStreak % 5 == 0 then
            streakTemplate = "[player] is OMNICIDAL! (" .. currentStreak .. "X STREAK)"
        end
    
        -- If there is a predefined killstreak message for this streak, mark killstreak reached.
        if KillStreakMessages[currentStreak] then
            killstreakReached = true
            if streakTemplate == "" then
                streakTemplate = table.Random(KillStreakMessages[currentStreak])
            end
        end
    end 

    local regularTemplate
    regularTemplate, recentDeathIndices = GetNonRepeatingSelection(DeathMessages, recentDeathIndices)
    
    net.Start("EFSPDeathMessage")
        net.WriteBool(false)
        net.WriteString(regularTemplate)
        net.WriteString(victim:Nick())
        net.WriteString(attackerName)
        net.WriteBool(killstreakReached)
        if killstreakReached then
            net.WriteString(streakTemplate)
        end
    net.Broadcast()

    -- Sound handling.
    if efspSoundsEnabled:GetBool() then
        local victimSound
        if killstreakReached then
            victimSound, recentStreakVictimSoundIndices = GetNonRepeatingSelection(StreakVictimSounds, recentStreakVictimSoundIndices)
        else
            victimSound, recentRegularVictimSoundIndices = GetNonRepeatingSelection(RegularVictimSounds, recentRegularVictimSoundIndices)
        end
        
        net.Start("EFSPDeathSound3D")
            net.WriteString(victimSound)
            net.WriteVector(victim:GetPos())
        net.SendOmit(victim)

        net.Start("EFSPDeathSound2D")
            net.WriteString(victimSound)
        net.Send(victim)
    end
end)
