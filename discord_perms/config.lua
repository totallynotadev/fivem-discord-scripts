Config = {
	DiscordToken = "NjkzMjk1Mjg5MTA0MzM0ODg5.Xq6EXA.nXDCEa8QFcm1B-i9o2Jc2Zsdnws",
	GuildId = "706263857990991933",

	-- Format: ["Role Nickname"] = "Role ID" You can get role id by doing \@RoleName
	Roles = {
--		["TestRole"] = "Some Role ID" -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
		["Staff"] = "706263858083266662", -- This would be checked by doing exports.discord_perms:IsRolePresent(user, "TestRole")
	}
}
