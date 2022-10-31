-- // Copyright 2022, Aprax3d, All rights reserved.

local GroupId = 0
local Ranks = {
  Guest = 0,
  Member = 1,
  Admin = 254,
  Owner = 255,
  -- Add your other group ranks here 
}

game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local GroupRank = plr:GetRankInGroup(GroupId)
		local Card
		if GroupRank == Ranks.Guest then
			Card = Instance.new("StringValue")
			Card.Parent = char
			Card.Name = "CardLevel"
			Card.Value = "Guest"
		elseif GroupRank == Ranks.Member then
			Card = Instance.new("StringValue")
			Card.Parent = char
			Card.Name = "CardLevel"
			Card.Value = "Member"
		elseif GroupRank == Ranks.Admin then
			Card = Instance.new("StringValue")
			Card.Parent = char
			Card.Name = "CardLevel"
			Card.Value = "Admin"
		elseif GroupRank == Ranks.Owner then
			Card = Instance.new("StringValue")
			Card.Parent = char
			Card.Name = "CardLevel"
			Card.Value = "Owner"
    -- Add other values here
    else
      Card = Instance.New("StringValue")
      Card.Parent = char
      Card.Name = "CardLevel"
      Card.Value = "Guest
		end
	end)
end)
