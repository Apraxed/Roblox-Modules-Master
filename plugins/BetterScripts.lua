-- Updated version of BetterScripts+ by albie368 and Aprax3d
game.DescendantAdded:Connect(function(descendant)
    if descendant.Source then
        local originalSource = descendant.Source
        descendant.Source = string.format("-- // Copyright %s, %s, All rights reserved.\n\n",os.date("%Y"), game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId()))
        descendant.Source ..= originalSource
    end
end)
