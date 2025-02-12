--[[
EFSP's Death Messages Client-side
By EFSP
Copyright © EFSP 2025: Do not redistribute.
(76561198267684212)
]]--

-- Process a template and build a token table.
--[[local function ProcessTemplate(template, replacements)
    local tokens = {}
    local startIndex = 1
    for s, placeholder, key, e in template:gmatch("()(%[(%w+)%])()") do
        local before = template:sub(startIndex, s - 1)
        if before ~= "" then
            table.insert(tokens, before)
        end

        if key == "victim" and replacements.victim then
            table.insert(tokens, Color(255, 0, 0))
            table.insert(tokens, replacements.victim)
            table.insert(tokens, Color(255, 255, 255))
        elseif key == "attacker" and replacements.attacker then
            table.insert(tokens, Color(0, 255, 0))
            table.insert(tokens, replacements.attacker)
            table.insert(tokens, Color(255, 255, 255))
        elseif key == "player" and replacements.player then
            table.insert(tokens, replacements.player)
        else
            table.insert(tokens, placeholder)
        end

        startIndex = e
    end

    local remaining = template:sub(startIndex)
    if remaining ~= "" then
        table.insert(tokens, remaining)
    end

    return tokens
end

-- Receive and display death messages.
net.Receive("EFSPDeathMessage", function()
    local isSuicide = net.ReadBool()
    
    if isSuicide then
        local template = net.ReadString()
        local victimName = net.ReadString()
        local tokens = ProcessTemplate(template, { victim = victimName })
        chat.AddText(unpack(tokens))
    else
        local regularTemplate = net.ReadString()
        local victimName = net.ReadString()
        local attackerName = net.ReadString()
        local tokens = ProcessTemplate(regularTemplate, { victim = victimName, attacker = attackerName })
        chat.AddText(unpack(tokens))
        
        local hasKillstreak = net.ReadBool()
        if hasKillstreak then
            local streakTemplate = net.ReadString()
            local tokensStreak = ProcessTemplate(streakTemplate, { attacker = attackerName })
            chat.AddText(unpack(tokensStreak))
        end
    end
end)

-- Receive and play sounds.
net.Receive("EFSPDeathSound", function()
    local soundPath = net.ReadString()
    surface.PlaySound(soundPath)
end)

-- Stop any currently playing sounds when the player spawns.
hook.Add("PlayerSpawn", "StopDeathMessageSounds", function()
    RunConsoleCommand("stopsound")
end)]]--