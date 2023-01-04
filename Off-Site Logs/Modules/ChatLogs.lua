-- // Copyright 2022, Aprax3d, All rights reserved. 

local module = {}

function module.Load ()
	local Services = {
		Players = game:GetService("Players"),
		RunService = game:GetService("RunService"),
		HttpService = game:GetService("HttpService")
	}
	
	local AncestorModule = script.Parent.Parent
	local Hooks = require(AncestorModule.hooks)
	local webhook = Hooks["ChatLogs Webhook Link"].Value

	
	Services.Players.PlayerAdded:Connect(function(plr)
		plr.Chatted:Connect(function(msg)
			local username = plr.DisplayName.." (@"..plr.Name..")"
			if Services.RunService:IsStudio() then
				username = plr.DisplayName.." (@"..plr.Name..") (Studio Instance)"
			else 
				return
			end
			local data =
				{
					["content"] = msg,
					["username"] = username,
					["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(plr.UserId).."&width=420&height=420&format=png",
				}

			Services.HttpService:PostAsync(webhook, Services.HttpService:JSONEncode(data))
		end)
	end)
end

return module
