-- // Copyright 2022, Aprax3d, All rights reserved.

game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local clone = require(11470095967).gui:Clone()
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
