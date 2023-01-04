-- // Copyright 2023, Aprax3d, All rights reserved.

-- This script adds the bug report remote in case you don't have it.

if not game:GetService("ReplicatedStorage").FireBugReport then
	require(11710354561).Load()
else
	return
end