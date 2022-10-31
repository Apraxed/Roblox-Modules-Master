-- // Copyright 2022, Aprax3d, All rights reserved. 

local module = {}

function module.Load ()
	local players = game:GetService("Players")
	local runservice = game:GetService("RunService")
	local httpservice = game:GetService("HttpService")
	local AncestorModule = script.Parent.Parent
	local _Values = AncestorModule.Values
	local webhook = _Values["UserLogs Webhook Link"].Value
	local GameName = _Values["Game Name"].Value
	
	players.PlayerAdded:Connect(function(plr)
		plr.Chatted:Connect(function(msg)
			local username = plr.DisplayName.." (@"..plr.Name..")"
			if runservice:IsStudio() then
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

			httpservice:PostAsync(webhook, httpservice:JSONEncode(data))
		end)
	end)
end

return module