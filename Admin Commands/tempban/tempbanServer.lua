-- local log = insert whatever your logging function is here (if you have one), for me I used a discord webhook and internal datastore log

return function (context, userid, dur, reason)
	local config: BanConfigType = {
		UserIds = {userid};
		Duration = dur,
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
		game.ReplicatedStorage.AdRemotes.LogModAction:Fire("tempban", context.Executor, game.Players:GetNameFromUserIdAsync(userid), (reason or "Breaking game rules."), dur)
		game.ReplicatedStorage.AdRemotes.LogAdminCommand:Fire(context.Executor, context.RawText, context.Name, "Attempted to tempban a player. "..response)
		error(response)
	end
end