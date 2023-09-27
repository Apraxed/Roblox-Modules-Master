-- This file loads all requirements

local module = {}
local LoaderModule = require(11470095967)

function module.Load()
    warn("[NAMETAGS LOADING MANAGER] Loading UsernameGUIHandler.lua")
    wait(0.01)
    if not game:GetService("ReplicatedStorage").OverheadGUIV3 then
        LoaderModule.guiv3:Clone().Parent = game:GetService("ReplicatedStorage") --- this gets the gui and puts it in the ReplicatedStorage
    else
        return warn("NAMETAGS LOADING MANAGER] Default GUI settings overridden. Custom GUI has been loaded instead. If this is an issue make sure that ReplicatedStorage does not have any instance named `OverheadGUIV3`")
    end
    warn("NAMETAGS LOADING MANAGER] UsernameGUIHandler.lua loaded!")
end

return module