-- // made by illunious and Aprax3d
game.DescendantAdded:Connect(function(descendant)
	if descendant:IsA("Script") or descendant:IsA("LocalScript") then
		descendant.Source = "-- // Copyright "..os.date("%Y")..", "..game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId())..", All rights reserved."
	elseif descendant:IsA("ModuleScript") then
		descendant.Source = "-- // Copyright "..os.date("%Y")..", "..game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId())..", All rights reserved.\n\nlocal module = {}\n\n\nfunction module.test()\n\tprint('Hello world!') \nend\n\n\nreturn module"
	end
end)
