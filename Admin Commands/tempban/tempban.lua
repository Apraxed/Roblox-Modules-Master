return {
	Name = "tempban",
	Aliases = {"tbean", "tbarn"},
	Description = "Temporarily bans a player",
	Group = "Moderator"; -- Change to whatever group rank you want to be able to use tempban
	Args = {
		{
			Type = "playerId",
			Name = "Player",
			Description = "Username"
		},
		{
			Type = "duration",
			Name = "Length",
			Description = "Length of ban",
		},
		{
			Type = "string",
			Name = "reason",
			Description = "Reason for ban"
		}
	}
}