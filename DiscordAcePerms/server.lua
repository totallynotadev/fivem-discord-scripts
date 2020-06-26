-----------------------------------
--- Discord ACE Perms by Totallynotadev ---
-----------------------------------

--- Code ---

roleList = {
{0, "builtin.everyone"},
{706263857990991941, "builtin.everyone"},
{706263857999642719, "group.weapons"},
{706263857999642720, "group.gun4"},
{706263857999642721, "group.gun3"},
{706263857999642722, "group.gun2"},
{706263857999642723, "group.gun1"},
{706263857999642714, "group.faa5"},
{706263857999642715, "group.faa4"},
{706263857999642716, "group.faa3"},
{706263857999642717, "group.faa2"},
{706263857999642718, "group.faa1"},
{706263858083266662, "group.staff"},
{706263858083266663, "group.trialstaff"},
{706263858083266664, "group.moderator"},
{706263858083266665, "group.seniormoderator"},
{706263858083266666, "group.admin"},
{706263858083266667, "group.senioradmin"},
{706263858083266669, "group.headadmin"},
{706263858083266670, "group.staffmanager"},
{706263858087592020, "group.staffdirector"},
{706263858087592021, "group.cofounder"},
{706263858087592022, "group.founder"},
}
local function has_value (tab, val)
    for index, value in ipairs(tab) do
        if value == val then
            return true
        end
    end

    return false
end
function PlayerIdentifier(type, id)
    local identifiers = {}
    local numIdentifiers = GetNumPlayerIdentifiers(id)

    for a = 0, numIdentifiers do
        table.insert(identifiers, GetPlayerIdentifier(id, a))
    end

    for b = 1, #identifiers do
        if string.find(identifiers[b], type, 1) then
            return identifiers[b]
        end
    end
    return false
end
function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

hasPermsAlready = {}

AddEventHandler('playerConnecting', function()
	local src = source
	local hex = string.sub(tostring(PlayerIdentifier("steam", src)), 7)
	permAdd = "add_principal identifier.steam:" .. hex .. " "
	for k, v in ipairs(GetPlayerIdentifiers(src)) do
			if string.sub(v, 1, string.len("discord:")) == "discord:" then
				identifierDiscord = v
			end
	end
	if identifierDiscord then
		if not has_value(hasPermsAlready, GetPlayerName(src)) then
			local roleIDs = exports.discord_perms:GetRoles(src)
			if not (roleIDs == false) then
				for i = 1, #roleList do
					for j = 1, #roleIDs do
						if (tostring(roleList[i][1]) == tostring(roleIDs[j])) then
							print("Added " .. GetPlayerName(src) .. " to role group " .. roleList[i][2] .. " with discordRole ID: " .. roleIDs[j])
							ExecuteCommand(permAdd .. roleList[i][2])
						end
					end
				end
				table.insert(hasPermsAlready, GetPlayerName(src))
			else
				print(GetPlayerName(src) .. " has not gotten their permissions cause roleIDs == false")
			end
		end
	end
end)

RegisterServerEvent("DiscordAcePerms:GivePerms")
AddEventHandler("DiscordAcePerms:GivePerms", function(_source)
	-- Deprecated
end)
