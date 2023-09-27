-- Made by illunious, made better by Aprax3d

game.DescendantAdded:Connect(function(descendant)
	if descendant:IsA("Script") or descendant:IsA("LocalScript") then
		if descendant.Source == 'print(\"Hello world!\")\n' then
			descendant.Source = "-- // Copyright "..os.date("%Y")..", "..game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId())..", All rights reserved.\n\nprint(\"Hello World!\")"
		end
	elseif descendant:IsA("ModuleScript") then
		if descendant.Source == 'local module = {}\n\nreturn module\n' then
			descendant.Source = "-- // Copyright "..os.date("%Y")..", "..game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId())..", All rights reserved.\n\nlocal module = {}\n\n\nfunction module.test()\n\tprint('Hello world!')\nend\n\n\nreturn module"
		end
	end
end)