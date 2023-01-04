-- // Copyright 2022, Aprax3d, All rights reserved.

---- Loads Ancestor.Config
Config = script.Parent:FindFirstChildWhichIsA("Configuration")
OverrideDefaultGUI = Config["Override Default GUI"].Value
CustomGUI = Config["Override Default GUI"]["Custom GUI"].Value
GUI = require(11710354561).ScreenGUI

if OverrideDefaultGUI == true then
	GUI = CustomGUI
else
	GUI = require(11710354561).ScreenGUI
end


Prefix = Config:WaitForChild("Command_Prefix")

local cmds = {
	Prefix.."bugreport",
	Prefix.."bug",
	Prefix.."breport",
	Prefix.."bugreport ",
	Prefix.."bug ",
	Prefix.."breport ",
}

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg == table.find(cmds) then
			GUI:Clone().Parent = plr.PlayerGui
		else
			return
		end
	end)
end)