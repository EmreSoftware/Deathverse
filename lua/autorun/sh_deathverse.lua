--[[
    Death messages, death sounds, and killstreaks for Garry's Mod.
    Copyright (C) 2025 EmreSoftware

    This software is provided "as is," without warranty of any kind, express or implied. 
    You are permitted to use, modify, and contribute to this project. However, you 
    MAY NOT redistribute, resell, or upload this software, in whole or in part, 
    to any platform, including but not limited to the Steam Workshop, without 
    explicit written permission from the author.

    Contributions: You are allowed to submit pull requests on GitHub to improve 
    or fix the code. By submitting a contribution, you grant the author the right 
    to use, modify, and distribute your contributions as part of the project.

    Unauthorized redistribution may result in legal action.
]]


print("----------------------------------------")
print(" Deathverse: Enhanced Annihilation Suite")
print("              By EFSP")
print("          76561198267684212")
print("----------------------------------------")
AddCSLuaFile()

-- Define victimSoundAmount before using it.
local victimSoundAmount = 69

-- Create a single global table to hold all addon data.
DeathVerse = DeathVerse or {}
DeathVerse.contextMenu = true

-- Store configuration in the global table.
DeathVerse.Config = {
    -- Chat message templates.
    DeathMessages = {
        "[victim] was eliminated by [attacker]",
        "[attacker] took down [victim]",
        "[victim] met their demise at the hands of [attacker]",
        "[attacker] turned off [victim]'s router",
        "[attacker] set [victim]'s kill-streak to 0",
        "[attacker] did a little trolling to [victim]",
        "[attacker] cancelled [victim] on twitter",
        "[attacker] wiped [victim] from the server",
        "[attacker] sent [victim] to the Furry Hangout",
        "[attacker] gave [victim] personal advice",
        "[attacker] took away [victim]'s power armor",
        "[attacker] made [victim] uninstall the game",
        "[attacker] made [victim] uninstall Windows",
        "[attacker] made [victim] uninstall life",
        "[attacker] made [victim] uninstall existence",
        "[attacker] offscreen'd [victim]",
        "[attacker] WIN | [victim] LOSE",
        "[attacker] saw [victim] vent",
        "[attacker] said [victim] was sus",
        "[attacker] put [victim] in the femur breaker",
        "[attacker] put [victim] into a springlock suit",
        "[attacker] sent [victim] to brazil",
        "[attacker] broke [victim]'s legs",
        "[attacker] showed [victim] the concept of death",
        "[attacker] consumed [victim]'s liver",
        "[victim] was slain by [attacker]",
        "[attacker] turned [victim] into a marketable plushie",
        "[attacker] set [victim]'s health to 0",
        "[attacker] put [victim] to sleep",
        "[attacker] ROK ROK ROK ROK ROK ROK [victim]",
        "'[victim] if you're reading this, you're bad' - [attacker]",
        "i kid you not, [attacker] killed [victim]. funniest thing i've ever seen",
        "[attacker] turned [victim]'s blood into vinegar",
        "[attacker] reduced [victim] to atoms",
        "[attacker] moderated [victim]",
        "[attacker] forced [victim] to watch jojo",
        "[attacker] clowned on [victim]",
        "[attacker] parented [victim] to nil",
        "[attacker] left [victim]'s party",
        "[attacker] put [victim] in another timeline",
        "[attacker] read [victim] like a book",
        "[attacker] played [victim] like a fiddle",
        "[attacker] pinged [victim]",
        "[attacker] installed bonzi buddy on [victim]'s hard drive",
        "[attacker] ratio'd [victim]",
        "[attacker] counter ratio'd [victim]",
        "[attacker] pierced [victim]'s plot armor",
        "[attacker] saved [victim]'s nft",
        "[attacker] speedran [victim]'s death",
        "[attacker] wrote a fanfic about [victim]",
        "[attacker] POW! [victim] is dead!",
        "[attacker] was four parallel universes ahead of [victim]",
        "[attacker] showed [victim] the definition of pain",
        "[attacker] deleted [victim]",
        "[attacker] downvoted [victim]'s post",
        "[attacker] ended [victim]'s whole career",
        "[attacker] slapped [victim]",
        "[attacker] stole [victim]'s lunch",
        "[attacker] rekt [victim]",
        "[attacker] stole [victim]'s AA batteries",
        "[attacker] exposed [victim]",
        "[attacker] proved [victim] has a skill issue",
        "[attacker] gave [victim] a papercut in between their fingers",
        "[attacker] stole [victim]'s kidneys",
        "[attacker] stole [victim]'s heart (not metaphorically)",
        "[attacker] scronched [victim]",
        "[attacker] rick rolled [victim]",
        "[attacker] RDM'd [victim]",
        "[attacker] pelted [victim] with rocks",
        "[attacker] unsubscribed from [victim]'s youtube channel",
        "[attacker] made [victim] to do repression work",
        "[attacker] told [victim] to Ctrl + K",
        "[attacker] sent [victim] to 15 second detention",
        "[attacker] force-fed [victim] medium cooked chicken",
        "[attacker] sent [victim] to ocram's house",
        "[attacker] grounded [victim]",
        "[attacker] forced [victim] to solve 8 - 0 (they answered -8)",
        "[attacker] made [victim] do the room temperature challenge",
        "[attacker] shapeshifted [victim] into a dead person",
        "[attacker] collected [victim]'s page"
    },
    
    SuicideMessages = {
        "[victim] couldn't handle the pressure.",
        "[victim] took their own life.",
        "[victim] ended it all.",
        "[victim] L",
        "[victim] sus",
        "[victim] 10/10",
        "[victim] the concept of death",
        "[victim] watch yo jet",
        "[victim] d",
        "[victim] cope",
        "[victim] too much trolling",
        "[victim] gg ez skill issues",
        "[victim] mad cuz bad",
        "[victim] cry about it",
        "[victim] die a thousand deaths",
        "[victim] owo whats this? *nuzzles your cowpsey worspy uwu*",
        "[victim] couldn't handle the neutron style",
        "[victim] you the when when you the when",
        "[victim] hopefully they homie stock you",
        "[victim] can't deal with cancel culture?",
        "[victim] caught you lacking",
        "[victim] thought too fast chucklenuts",
        "[victim] bopeebob",
        "[victim] :pogchamp:",
        "[victim] protip: don't die, espically to yourself",
        "[victim] skill issue",
        "[victim] protip: you are dead",
        "[victim] is just like mari from omori",
        "[victim] smells like you farded (farded)",
        "[victim] caught in 4k",
        "[victim] mald",
        "[victim] XD",
        "[victim] lol",
        "[victim] don't you feel Silly, don't you feel stupid, don't you feel a little ashamed",
        "[victim] the bad ending",
        "[victim] stupendous work, pal, absolutely phenomenal",
        "[victim] died",
        "[victim] why",
        "[victim] died of death",
        "[victim] \"You died\"",
        "[victim] oh the misery",
        "[victim] that wasn't very cash money of you",
        "[victim] thanks for playing",
        "[victim] you tried your baka-mi best",
        "[victim] miss",
        "[victim] sorry not sorry",
        "[victim] get real",
        "[victim] that ain't falco",
        "[victim] mid",
        "[victim] @new role look at this bozo lol",
        "[victim] 5 second detention for you",
        "[victim] gutterball",
        "[victim] fallout",
        "[victim] after you've scrubbed all the floors in hyrule, then we can talk about mercy",
        "[victim] glad im not you",
        "[victim] you just got karted- oops wrong fangame",
        "[victim] -3 iq",
        "[victim] well that sucks",
        "[victim] die monster",
        "[victim] Sometimes, I dream about Cheese.",
        "[victim] sucks to suck",
        "[victim] have you tried turning it off and on again?",
        "[victim] womp womp",
        "[victim] blud thought he was him",
        "[victim] nah i'd win",
        "[victim] sin city just wasn't made for you",
        "[victim] chipi chipi chapa chapa dubi dubi daba daba magico mi dubi dubi boom boom boom boom",
        "[victim] god don't do that in E3 please",
        "[victim] remember to take a break every 5 to 10 minutes",
        "[victim] okay call me bad, but does baldi have negative answers or am I just dumb"
    },

    -- Sound paths.
    RegularVictimSounds = (function()
        local sounds = {}
        for i = 1, victimSoundAmount do
            sounds[i] = "deathverse/victimsounds/" .. i .. ".wav"
        end
        return sounds
    end)(),
    
    RegularAttackerSound = "buttons/blip1.wav",
    StreakAttackerSounds = {"deathverse/streakattacker/1.wav"},
    StreakVictimSounds = {"deathverse/streakvictim/1.wav"}
}

-- Disable default death sound on both server and client.
hook.Add("PlayerDeathSound", "DisableDefaultDeathSound", function()
    return true
end)

-- Killstreak configuration.
DeathVerse.KillStreakMessages = {
    [3] = {"[player] is dominating! (3X STREAK)"},
    [5] = {"[player] is on fire! (5X STREAK)"},
    [10] = {"[player] is unstoppable! (10X STREAK)"}
}

if CLIENT then
    CreateClientConVar("deathverse_volume", "0.5", true, true, "Volume for Deathverse sounds (0-1)", 0, 1)

    
    hook.Add("PlayerDeathSound", "DisableDefaultDeathSound", function()
        return true
    end)


    -- Add to context menu
    hook.Add("PopulateToolMenu", "DeathverseSettings", function()
        spawnmenu.AddToolMenuOption("Utilities", "Deathverse", "VolumeControl", "Volume", "", "", function(panel)
            panel:ClearControls()
            panel:AddControl("Slider", {
                Label = "Sound Volume",
                Command = "deathverse_volume",
                Type = "Float",
                Min = 0,
                Max = 1
            })
        end)
    end)

    --[[
        ProcessTemplate:
        Processes a chat message template by replacing tokens with color-coded text.
        Supported tokens: [victim], [attacker], [player]
    ]]
    local function ProcessTemplate(template, replacements)
        local tokens = {}
        local startIndex = 1
        
        for s, placeholder, key, e in template:gmatch("()(%[(%w+)%])()") do
            local before = template:sub(startIndex, s - 1)
            if before ~= "" then table.insert(tokens, before) end

            if key == "victim" and replacements.victim then
                table.insert(tokens, Color(255, 0, 0))
                table.insert(tokens, replacements.victim)
                table.insert(tokens, Color(255, 255, 255))
            elseif key == "attacker" and replacements.attacker then
                table.insert(tokens, Color(0, 255, 0))
                table.insert(tokens, replacements.attacker)
                table.insert(tokens, Color(255, 255, 255))
            elseif key == "player" and replacements.player then
                table.insert(tokens, Color(255, 255, 0))
                table.insert(tokens, replacements.player)
                table.insert(tokens, Color(255, 255, 255))
            else
                table.insert(tokens, placeholder)
            end

            startIndex = e
        end

        local remaining = template:sub(startIndex)
        if remaining ~= "" then table.insert(tokens, remaining) end

        return tokens
    end

    -- Receive and display death messages.
    net.Receive("EFSPDeathMessage", function()
        local isSuicide = net.ReadBool()
        
        if isSuicide then
            local template = net.ReadString()
            local victimName = net.ReadString()
            chat.AddText(unpack(ProcessTemplate(template, { victim = victimName })))
        else
            local template = net.ReadString()
            local victimName = net.ReadString()
            local attackerName = net.ReadString()
            local hasStreak = net.ReadBool()
            
            chat.AddText(unpack(ProcessTemplate(template, {
                victim = victimName,
                attacker = attackerName
            })))

            if hasStreak then
                local streakTemplate = net.ReadString()
                chat.AddText(unpack(ProcessTemplate(streakTemplate, {
                    player = attackerName
                })))
            end
        end
    end)

    -- 3D sound receiver with error handling.
    net.Receive("EFSPDeathSound3D", function()
        local soundPath = net.ReadString()
        local pos = net.ReadVector()
        local vol = GetConVar("deathverse_volume"):GetFloat()
        
        local attenuation = 0.5
        if ConVarExists("deathverse_sound_attenuation") then
            attenuation = GetConVar("deathverse_sound_attenuation"):GetFloat()
        end
        
        local success, err = pcall(function()
            sound.Play(
            soundPath,
            pos,
            75,                           -- Sound level in decibels.
            100,                          -- Pitch.
            GetConVar("deathverse_volume"):GetFloat()  -- Volume between 0 and 1.
        )
        end)
        
        if not success then
            print("[Deathverse ERROR] Failed to play sound:", soundPath, "Error:", err)
        end
    end)

    -- 2D sound receiver.
    net.Receive("EFSPDeathSound2D", function()
        local soundPath = net.ReadString()
        local vol = GetConVar("deathverse_volume"):GetFloat()
        LocalPlayer():EmitSound(soundPath, 75, 100, vol)  -- SNDLVL_IDLE, pitch 100, volume 0-1
        print("[Deathverse] Played 2D sound:", soundPath, "at volume", vol)
    end)
end

if SERVER then
    -- Precaching resources for sounds.
    resource.AddFile("sound/deathverse/victimsounds/")
    for i = 1, victimSoundAmount do
        resource.AddFile("sound/deathverse/victimsounds/" .. i .. ".wav")
    end
    resource.AddFile("sound/deathverse/streakattacker/")
    resource.AddFile("sound/deathverse/streakvictim/")
    resource.AddFile("sound/deathverse/streakattacker/1.wav")
    resource.AddFile("sound/deathverse/streakvictim/1.wav")
end
