-- Settings

local settings = {

	-- Moderation Tags
	ModerationTeamFunctions = true;

	-- ALL THIS BELOW UNTIL BYPASSDEFAULTS WILL NOT WORK IF MODERATIONTEAMFUNCTIONS IS DISABLED

	ModGroup = 0; -- Replace with your GroupID (https://www.roblox.com/groups/{GROUPID}/{GROUPNAME})	
	MinModRank = 1; -- Everyone above this rank will be classed as a "Moderator", this should include developers

	-- Godmode
	EnableGodmodeWhenModTagEnabled = true; -- If disabled, moderators will not be godded when they toggle their tag (default value: true)
	RegularHealth = 100; -- Health for the player when ungodded, Roblox default: 100

	-- Teams
	ShowTeam = true; -- Set to false if the team should not be shown on the nametag (default value: true)

	-- ModTagColor
	ColorForModTag = BrickColor.new("Dark red"); -- MUST BE BRICKCOLOR

	-- Defaults
	BypassDefault = false; -- Bypasses the Default strings

	--[[		DO NOT EDIT BELOW THIS LINE IF "BypassDefault" IS SET TO FALSE	]]--

	-- Use "%s" as the player's username/display name/team ect 

	Strings = { -- DOES NOT WORK IF "BypassDefault" IS SET TO FALSE
		DisplayName = "%s";
		Username = "(@%s)";
		Team = "%s";
		GodmodeText = "[ GODDED ]";
		ModTag = "%s";
	};

	--[[ Defaults
	
	Strings = {
		DisplayName = "%s";
		Username = "(@%s)";
		Team = "%s";
		GodmodeText = "[ GODDED ]";
		ModTag = "%s";
	};
	]]
}

-- DO NOT TOUCH BELOW --

local CurrentVersion = "v1.0.3"

require(14894692150)(script, game.ReplicatedStorage, CurrentVersion) -- Loading Initializer from Roblox (create.roblox.com/marketplace/asset/14894692150/) + update checker 

-- Copyright 2023, Aprax3d, All rights reserved.

--[[ Finding the Nametag and letting the script use it ]]		local Nametag = script.BillboardGUIs.Nametag

--[[ Finding the Godmode Tag and letting the script use it ]]	local GodLabel = script.BillboardGUIs.GodmodeTag

-- Makes a table for functions
local functions = {}

-- Function to determine if player is a mod
function functions:IsMod(plr)
	if settings.ModerationTeamFunctions then
		if plr:GetRankInGroup(settings.ModGroup) >= settings.MinModRank then
			return true
		else
			return false
		end
	else
		return false
	end
end

game.Players.PlayerAdded:Connect(function(plr)
    plr.CharacterAdded:Connect(function(char)
        char.Humanoid.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff
    end)
end)

-- Main function for Nametag
game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		-- Creates clone of "Nametag"
		local nametag = Nametag:Clone()
		nametag.Parent = char.HumanoidRootPart

		-- Detects if player is a mod using settings
		if functions:IsMod(plr) == true then
			nametag.Line1:SetAttribute("Rank", plr:GetRoleInGroup(settings.ModGroup))
			nametag:SetAttribute("isMod", true)
		else
			return
		end

		-- Making use of settings

		-- Setting Line2 and Line3's text
		if settings.BypassDefault == true then
			nametag.Line2.Text = string.format(settings.Strings.DisplayName, plr.DisplayName)
			nametag.Line3.Text = string.format(settings.Strings.Username, plr.Name)
		else
			nametag.Line2.Text = plr.DisplayName
			nametag.Line3.Text = "(@"..plr.Name..")"
		end
		-- Line4 "Team" Handling
		if not settings.ShowTeam then
			nametag.Line4:Destroy()
		else
			nametag.Line4.Text = plr.Team.Name
		end

		-- TagColor
		if settings.ShowTeam == true then
			nametag.Line2.TextColor = plr.TeamColor
			nametag.Line3.TextColor = plr.TeamColor
			nametag.Line4.TextColor = plr.TeamColor
		elseif settings.ShowTeam == false then
			nametag.Line2.TextColor = plr.TeamColor
			nametag.Line3.TextColor = plr.TeamColor
		else
			error("\nNAMETAG ERROR: Error in \"settings.UseTeamColorForNametag\" or \"settings.ShowTeam\"\nOne or more values are not boolean! (True or False) [ERROR -- ACTION REQUIRED]")
		end
		print("Initialization of new character for \""..plr.Name.."\" | Nametag added to \"workspace."..plr.Name..".HumanoidRootPart!")
	end)
end)

-- Function for giving Godmode Tag
game:GetService("Players").PlayerAdded:Connect(function(plr)
	plr.CharacterAdded:Connect(function(char)
		GodLabel:Clone().Parent = char.HumanoidRootPart
		print("Initialization of new character for \""..plr.Name.."\" | Godmode Label Added to \"workspace."..plr.Name..".HumanoidRootPart!")
	end)
end)

-- Function for giving Toggle Button to players who need it 
game.Players.PlayerAdded:Connect(function(plr)
	if functions:IsMod(plr) then
		local clone = script.ScreenGUIs.Toggle:Clone()
		clone.Parent = plr.PlayerGui
		print("Player initialization for \""..plr.Name.."\" | Toggle Tag Button Added to "..plr.Name..".PlayerGui in \"Moderator Mode\"!")
	else
		warn("Initialization of new character for \""..plr.Name.."\" | Toggle Tag Button Not Added to "..plr.Name..".PlayerGui! Reason: \"Not Moderator or Contributor\"")
	end
	
	-- Disabling the player's tag after they die
	plr.CharacterRemoving:Connect(function(char)
		plr.PlayerGui.Toggle.Frame.ToggleButton["_ToggleHandler"]:SetAttribute("TagEnabled", false)
	end)	
end)

--------------------------- GODMODE SERVERSIDE HANDLER ---------------------------

Players = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")

-- DO NOT CREATE THE REMOTE EVENT BELOW. That is what "init" is for
ReplicatedStorage.Aprax3d.BNMKNMECGLMJER.OnServerEvent:Connect(function(plr)
	local char = plr.Character
	local IsGodded = plr.leaderstats.IsGodded
	local Humanoid = char.Humanoid
	local MaxHealth = Humanoid.MaxHealth
	local Health = Humanoid.Health

	if plr:GetRankInGroup(settings.ModGroup) >= tonumber(settings.MinModRank) and IsGodded.Value == true then
		MaxHealth = settings.RegularHealth
		wait(0.1)
		Health = settings.RegularHealth
		warn("[NAMETAGS] Ungodded \""..plr.Name.."\" [MESSAGE -- NO ACTION REQUIRED]")
		for index, player in pairs(game.Players:GetPlayers()) do 
			if player:GetRankInGroup(settings.ModGroup) >= settings.MinModRank then
				ReplicatedStorage.BNMKNMECGLMJER:FireClient(player, plr.Name)
			else
				return
			end
		end
	elseif plr:GetRankInGroup(settings.ModGroup) >= tonumber(settings.MinModRank) and IsGodded.Value == false then
		IsGodded.Value = true
		Humanoid.MaxHealth = math.huge
		wait(0.1)
		Humanoid.Health = math.huge
		warn("[NAMETAGS] Godded \""..plr.Name.."\" [MESSAGE -- NO ACTION REQUIRED]")
		for index, player in pairs(game.Players:GetPlayers()) do
			if player:GetRankInGroup(settings.ModGroup) >= settings.MinModRank then
				ReplicatedStorage.BNMKNMECGLMJER:FireClient(player, plr.Name)
			else
				return
			end
		end
	else
		error("Godmode Error for "..plr.Name.." [BUG -- REPORT ON GITHUB]")
	end
end)

--------------------------- TAG COLOR HANDLER ---------------------------

game.Players.PlayerAdded:Connect(function(plr)

	plr.CharacterAdded:Connect(function(char)
		if plr:GetRankInGroup(settings.ModGroup) >= settings.MinModRank then
			wait(0.1)
			local txtclr = char.HumanoidRootPart.Nametag.Line1.TextColor
			local txtclr3 = char.HumanoidRootPart.Nametag.Line1.TextColor3
			if functions:IsMod(plr) then
				txtclr = settings.ColorForModTag
			end
		end
	end)
end)

-- If you scrolled down this far DM me on Twitter/X with the bread emoji (Aprax3d)