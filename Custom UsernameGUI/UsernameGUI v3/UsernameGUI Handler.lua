-- // Copyright 2023, Aprax3d, All rights reserved.

local Players = game:GetService("Players")

local function OnEvent(plr, char)
	char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local clone = require(11470095967).guiv3:Clone()
	clone.Parent = char.HumanoidRootPart
	clone.Line1.Text = plr.DisplayName
	clone.Line2.Text = "@"..plr.Name
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		OnEvent(plr, char)
	end)
end)
