-- // Copyright 2022, Aprax3d, All rights reserved.

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end)

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local clone = require(11470095967).guiv2:Clone()
		clone.Parent = char.Head
		if script.Parent._Config.SmartName.Value == true then
			if plr.DisplayName == plr.Name then
				clone.NameText.Text = plr.Name
			else
				clone.NameText.Text = plr.DisplayName.." (@"..plr.Name..")"
			end
		else
			clone.NameText.Text = plr.DisplayName.." (@"..plr.Name..")"
		end
	end)
end)
