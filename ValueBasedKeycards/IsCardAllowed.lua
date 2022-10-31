-- // Copyright 2022, Aprax3d, All rights reserved. 

local IsAllowed = {}

local Values = {
  Guest = false,
  Member = true,
  Admin = true, 
}

IsAllowed.IsAllowed = false

local function Allowed ()
	IsAllowed.IsAllowed = true
end

local function Denied ()
	IsAllowed.IsAllowed = false
end

function IsAllowed.ReadCard(plr)
	local CardLevel = plr.Character.CardLevel.Value
	if CardLevel == "Owner" then
		Allowed()
	elseif CardLevel == "Admin" then
		if Values.Admin == true then
			Allowed()
		elseif Values.Admin == false then
			Denied()
		else
			error("CardLevel Error 402. Please contact the developers.")
		end
	elseif CardLevel == "Member" then
		if Values.Member == true then
			Allowed()
		elseif Values.Member == false then
			Denied()
		else
			error("CardLevel Error 402. Please contact the developers.")
		end
  elseif CardLevel == "Guest" then
    if Values.Guest == true then
      Allowed()
    elseif Values.Guest == false then
      Denied()
    else
      error("CardLevel Error 402. Please contact the developers.")
	else
		error("CardLevel Error 404. Please contact the developers.")
	end
end

return IsAllowed
  
  
  
--[[ In your main script
  local IsCardAllowed = require(script.Parent.IsCardAllowed)
  IsCardAllowed.ReadCard(plr)
  wait(0.05)
  if IsAllowed.IsAllowed == true then
    -- Door open function
  elseif IsAllowed.IsAllowed == false then
    -- Error function
  else
    error("CardLevel Error 500. Please contact the developers."
]]
