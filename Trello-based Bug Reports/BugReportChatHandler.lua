-- // Copyright 2023, Aprax3d, All rights reserved.

---- Loads Ancestor.Config
Config = script.Parent:FindFirstChildWhichIsA("Configuration")
OverrideDefaultGUI = Config["Override Default GUI"].Value
CustomGUI = Config["Override Default GUI"]["Custom GUI"].Value
GUI = require(11710354561).ScreenGUI

if OverrideDefaultGUI == true then
	GUI = CustomGUI
else
	GUI = GUI
end


Prefix = Config:WaitForChild("Command_Prefix")

local Players = game:GetService("Players")

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		wait(0.01)
		if msg == Prefix.."bugreport" or msg == Prefix.."bug" or msg == Prefix.."breport" then
			BugReportGUI:Clone().Parent = plr.PlayerGui
			warn("[EQUALED STUDIOS] "..plr.Name.." has opened the bug report window.")
		else
			return
		end
	end)
end)