-- // Copyright 2023, Aprax3d, All rights reserved.

--[[ BROKEN ]]

--[[
local Services = {
	SSS = game:GetService("ServerScriptService"),
	RepStorage = game:GetService("ReplicatedStorage"),
}

-- Loads Ancestor.Config
Config = script.Parent:FindFirstChildWhichIsA("Configuration")
BoardName = Config:FindFirstChild("Board Name").Value
ListName = Config:FindFirstChild("List Name").Value
Remote = Services.RepStorage:WaitForChild("FireBugReport")

-- Loads the API and finds needed info
TAPI = require(Services.SSS:WaitForChild("TrelloApi"))
BoardID = TAPI:GetBoardID(BoardName)
ListID = TAPI:GetListID(ListName.Value,BoardID)


local function OnEvent(plr, description)
	wait(0.01)
	if not Remote then
		script:Destroy()
	else
		if not script:FindFirstAncestorOfClass("ServerScriptService") then
			warn("[EQUALED STUDIOS] script `FireBugReports` should be located in ServerScriptService!")
			TAPI:AddCard("New bug report", "\""..description.."\"\nBug report filed "..os.date("%c %Z").." by "..plr.Name.."\nFireBugReports script should be located in ServerScriptService for security!", listid)
		else
			warn("[EQUALED STUDIOS] A new bug report has been submitted by `"..plr.Name.."`.")
			TAPI:AddCard("New bug report", "\""..description.."\"\nBug report filed "..os.date("%c %Z").." by "..plr.Name, listid)	
		end
	end
end

Config.Remote.OnServerEvent:Connect(function(plr, description)
	pcall(OnEvent, plr, description)
end)]]