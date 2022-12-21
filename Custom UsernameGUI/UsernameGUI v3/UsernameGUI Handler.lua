-- // Copyright 2022, Aprax3d, All rights reserved.

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end)

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local clone = require(11470095967).guiv3:Clone()
		clone.Parent = char.HumanoidRootPart
		clone.Line1.Text = plr.DisplayName
		clone.Line2.Text = "@"..plr.Name
	end)
end)
