-- // Copyright 2023, Aprax3d and albie368, All rights reserved.

game.DescendantAdded:Connect(function(descendant)
    if descendant.Source then
        local originalSource = descendant.Source
        descendant.Source = string.format("-- // Copyright %s, %s, All rights reserved.\n\n",os.date("%Y"), game:GetService("Players"):GetNameFromUserIdAsync(game:GetService("StudioService"):GetUserId()))
        descendant.Source ..= originalSource
    end
end)
