-- // Copyright 2023, Aprax3d, All rights reserved.

-- This script runs checks and makes sure that the system has the required prerequisits


--[[BROKEN]]

--[[
local ErrorSent = false

while true do 

	if script.Parent.DELETE_ME then
		script.Parent.DELETE_ME:Destroy()
		wait(0.1)
	else
		warn("[EQUALED STUDIOS] Bug Report System Loading..")
		if game:GetService("ReplicatedStorage").FireBugReport then
			if script.Parent.README then
				script.Parent.README:Destroy()
			else
				return
			end
			warn("[EQUALED STUDIOS] Loading complete!")
			script.Parent:Destroy()
		else
			local RemoteEvent = Instance.new("RemoteEvent")
			RemoteEvent.Parent game:GetService("ReplicatedStorage")
			RemoteEvent.Name = "FireBugReport"
		end
	end
end]]