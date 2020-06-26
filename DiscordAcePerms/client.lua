-----------------------------------
--- Discord ACE Perms by Totallynotadev ---
-----------------------------------

--- Code ---

AddEventHandler('playerSpawned', function()
    local src = source
    TriggerServerEvent("DiscordAcePerms:GivePerms", src)
end)
