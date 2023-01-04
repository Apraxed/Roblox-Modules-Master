-- // Copyright 2022, Aprax3d, All rights reserved.

local Services = {
	SSS = game:GetService("ServerScriptService"),
	RepStorage = game:GetService("ReplicatedStorage"),
}

local _Config = {
	_Config = script.Parent:FindFirstChildWhichIsA("Configuration"),
	BoardName = _Config:FindFirstChild("Board Name").Value,
	ListName = _Config:FindFirstChild("List Name").Value,
	Remote = Services.RepStorage:WaitForChild("FireBugReport"),
}

local api = {
	TAPI = require(Services.SSS.TrelloApi),
	BoardID = api:GetBoardID(_Config.BoardName),
	ListID = api:GetListID(_Config.ListName.Value,BoardID),
}

local function OnEvent(plr, description)
	api.TAPI:AddCard("New bug report", "\""..description.."\"\nBug report filed "..os.date("%c %Z").." by "..plr.Name, ListID)
end

_Config.Remote.OnServerEvent:Connect(OnEvent(plr, description))