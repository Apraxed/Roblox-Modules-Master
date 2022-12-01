-- // Copyright 2022, Aprax3d, All rights reserved.

local Prefix = script.Parent:FindFirstChildWhichIsA("Configuration"):WaitForChild("Command_Prefix")
local Players = game:GetService("Players")
local BugReportGUI = require(11710354561).ScreenGUI

Players.PlayerAdded:Connect(function(plr)
	plr.Chatted:Connect(function(msg)
		if msg ~= Prefix.."bugreport" then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		elseif msg ~= Prefix.."bug" then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		elseif msg ~= Prefix.."breport" then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		elseif msg ~= Prefix.."bugreport " then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		elseif msg ~= Prefix.."bug " then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		elseif msg ~= Prefix.."breport " then
			BugReportGUI:Clone().Parent = plr.PlayerGui
		else
			return
		end
	end)
end)