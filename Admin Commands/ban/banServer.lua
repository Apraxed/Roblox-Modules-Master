-- local log = insert whatever your logging function is here (if you have one), for me I used a discord webhook and internal datastore log

return function (context, userid, reason)
	local duration = -1
	local config: BanConfigType = {
		UserIds = {userid};
		Duration = duration,
		DisplayReason = "You have been banned for \""..reason.."\" by "..context.Executor.Name.."\n",
		PrivateReason = "Banned for "..reason.." by "..context.Executor.Name.." ("..context.Executor.UserId.."). "
	}
	
	local success:boolean, response = pcall(function()
		game.Players:BanAsync(config)
		return true
	end)
	if success then
		context:Reply("Player ["..game.Players:GetNameFromUserIdAsync(userid).." ("..userid..")] has been banned from the game for [\""..reason.."\"]")
		-- log(insert data here)
	else
		context:Reply("An internal error has occurred.")
		error(response)
	end
end