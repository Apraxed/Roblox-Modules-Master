-- // Copyright 2023, Aprax3d, All rights reserved.

require(script.Parent.loader).Load()

local Players = game:GetService("Players")

local function OnEvent(plr, char)
	wait(0.01)
	char:WaitForChild("Humanoid").DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
	local clone = game.ReplicatedStorage.OverheadGUIV2:Clone() -- This is added by `loader.lua` but can be switched out with a custom one by creating a BillboardGUI nametag with the same name and putting it in ReplicatedStorage
	clone.Parent = char.Head
	clone.NameText.Text = plr.DisplayName.." (@"..plr.Name..")"
end

Players.PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(pcall(OnEvent, plr))
end)
