local module = {}

function module.Load ()
	local players = game:GetService("Players")
	local runservice = game:GetService("RunService")
	local httpservice = game:GetService("HttpService")
	local AncestorModule = script.Parent.Parent.LogsLoader
	local _Values = AncestorModule.Values
	local webhook = _Values["UserLogs Webhook Link"].Value

	players.PlayerAdded:Connect(function(plr)
		local username = GameName
		local JobId = game.JobId
		if runservice:IsStudio() then
			username = "SCF | Site Helix (Studio Instance)"
			JobId = "[Studio Instance]"
		else 
			username = "SCF | Site Helix "
			--[[
			Roblox removed support for joining a game via JobId by link like was used in this script so this feature is useless
			JobId = "["..JobId..".](https://www.roblox.com/games/"..game.PlaceId.."/"..game.Name.."{?server="..game.JobId..")"
			]]
		end
		local data = {
			["content"] = plr.DisplayName.." (@"..plr.Name..") has entered a server. JobId: "..JobId,
			["username"] = username, 
			["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(plr.UserId).."&width=420&height=420&format=png",
		}

		httpservice:PostAsync(webhook, httpservice:JSONEncode(data))
	end)

	players.PlayerRemoving:Connect(function(plr)
		local username = GameName
		if runservice:IsStudio() then
			username = "SCF | Site Helix (Studio Instance)"
			return
		end
		local data = {
			["content"] = plr.DisplayName.." (@"..plr.Name..") has left a server.",
			["username"] = username, 
			["avatar_url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..tostring(plr.UserId).."&width=420&height=420&format=png",
		}

		httpservice:PostAsync(webhook, httpservice:JSONEncode(data))
	end)
end

return module