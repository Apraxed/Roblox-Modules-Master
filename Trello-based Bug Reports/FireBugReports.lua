-- // Copyright 2023, Aprax3d, All rights reserved.

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
	TAPI:AddCard("New bug report", "\""..description.."\"\nBug report filed "..os.date("%c %Z").." by "..plr.Name, ListID)
end

Config.Remote.OnServerEvent:Connect(function(plr, description)
	OnEvent(plr, description)
end)