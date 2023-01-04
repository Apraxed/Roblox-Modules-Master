-- // Copyright 2022, Aprax3d, All rights reserved.

local _Config = {
	_Config = script.Parent:FindFirstChildWhichIsA("Configuration"),
	Prefix = _Config:WaitForChild("Command_Prefix"),
	OverrideDefaultGUI = _Config["Override Default GUI"].Value,
	CustomGUI = _Config["Override Default GUI"]["Custom GUI"].Value
	if OverrideDefaultGUI == true then
		GUI = CustomGUI
	else
		GUI = require(11710354561).ScreenGUI
}

local cmds = {
	_Config.Prefix.."bugreport",
	_Config.Prefix.."bug",
	_Config.Prefix.."breport",
	_Config.Prefix.."bugreport ",
	_Config.Prefix.."bug ",
	_Config.Prefix.."breport ",
}

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg == table.find(cmds) then
			_Config.GUI:Clone.Parent = plr.PlayerGui
		else
			return
		end
	end)
end)