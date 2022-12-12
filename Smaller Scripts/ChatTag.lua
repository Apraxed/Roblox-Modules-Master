-- // Copyright 2022, Aprax3d, All rights reserved.

--[[
	Make a LocalScript in StarterPlayer.StarterPlayerScripts and put this script in 
]]

local TextChatService = game:GetService("TextChatService")
local Players = game:GetService("Players")

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")
	if message.TextSource then
		local player = Players:GetPlayerByUserId(message.TextSource.UserId)
		if player.UserId == game.CreatorId
			properties.PrefixText = "<font color='#5B9A4C'>[OWNER]</font> " .. message.PrefixText
		end
	end

	return properties
end
