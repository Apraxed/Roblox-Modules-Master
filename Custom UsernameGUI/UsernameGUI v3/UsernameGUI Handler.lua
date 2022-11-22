-- // Copyright 2022, Aprax3d, All rights reserved.

game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	end)
end)

game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		local clone = require(11470095967).guiv3:Clone()
		clone.Parent = char.HumanoidRootPart
		clone.Line1.Text = plr.DisplayName
		clone.Line2.Text = "@"..plr.Name
	end)
end)
