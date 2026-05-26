return {
	Name = "ban",
	Aliases = {"bean", "barn"},
	Description = "Permenantly bans a player",
	Group = "Admin"; -- Change to whatever group you want to be able to ban, (group is your PermissionsMap)
	Args = {
		{
			Type = "playerId",
			Name = "player",
			Description = "Username"
		},

		{
			Type = "string",
			Name = "reason",
			Description = "Reason for ban"
		}
	}
}