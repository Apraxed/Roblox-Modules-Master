-- // Copyright 2023, Aprax3d, All rights reserved.

--[[
	Make a LocalScript in StarterPlayer.StarterPlayerScripts and put this script in 
]]

local Services = {
	TextChatService = game:GetService("TextChatService")
	Players = game:GetService("Players")
}



Services.TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	local properties = Instance.new("TextChatMessageProperties")
	if message.TextSource then
		local player = Services.Players:GetPlayerByUserId(message.TextSource.UserId)
		if player.UserId == game.CreatorId then
			properties.PrefixText = "<font color='#5B9A4C'>[OWNER]</font> " .. message.PrefixText
		end
	end

	return properties
end
