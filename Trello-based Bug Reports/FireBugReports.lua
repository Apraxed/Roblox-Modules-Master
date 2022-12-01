-- // Copyright 2022, Aprax3d, All rights reserved.

local api=require(game:GetService("ServerScriptService").ExternalModules.TrelloApi)
local _Config = script.Parent:FindFirstChildWhichIsA("Configuration")
local boardName = _Config:FindFirstChild("Board Name").Value
local listName = _Config:FindFirstChild("List Name").Value
local boardid=api:GetBoardID(script.Parent.Config["Board Name"].Value)--The board id is different from the link you see when you go to a board
local listid=api:GetListID(script.Parent.Config["List Name"].Value,boardid)

game.ReplicatedStorage:WaitForChild('FireBugReport').OnServerEvent:Connect(function(plr, description)
	api:AddCard("New bug report", "\""..description.."\"\nBug report filed "..os.date("%c %Z").." by "..plr.Name, listid)
end)