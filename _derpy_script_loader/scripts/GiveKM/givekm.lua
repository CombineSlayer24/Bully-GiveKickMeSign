--[[
	Name: Give Kick Me
	Author: Pyri
	Description: Give Jimmy a Kick Me Sign when the player presses a Keybind and watch the chaos unfold.
	Version: 1.0

	TODO: Support for Xbox and PLayStation gamepad controllers.
]]

local KICK_ME_WEAPON_ID = 372
local textTimer = GetTimer()

gOpenKey = GetConfigString( GetScriptConfig(), "give_kick_key", "T" ) -- custom keybind setting for Kick Me Sign

function MissionSetup()
	-- This is needed, I don't know, but it's needed.
	while not SystemIsReady() do
		Wait( 0 )
	end

	ShowText( "Press your assigned Key to give Kick Me." ) -- TODO: Show custom keybind here
end

function main()
	while true do
		-- If the define key is pressed in the Config, attempt to give the weapon
		if IsKeyPressed( gOpenKey ) then
			GiveWeaponToPlayer( KICK_ME_WEAPON_ID, 1 ) -- Show the notification
			PedSetWeapon( gPlayer, KICK_ME_WEAPON_ID, 1, false ) -- Give the weapon
		end

		Wait( 75 ) -- Wait a few frames to end
		
		-- Sometimes, the script doesn't activate when player Presses keybind, or it activates more than once... huh?
	end
end

function ShowText( iText )
	CreateThread( function()
		repeat	
			SetTextFont( "Georgia" )
			SetTextBlack()
			SetTextColor( 46, 160, 116, 255 ) -- Old color, 20, 230, 20,
			SetTextOutline()
			SetTextScale( 1.38 )
			SetTextAlign( "C", "C" )
			SetTextPosition( 0.5, 0.2 )
			DrawText( iText )
			Wait( 0 )
		until ( GetTimer() - textTimer ) >= 10000
	end )
end
