/*
*
*	@author		: vectivus
*	@module		: optimization
*	@website	: https://github.com/projectrebug/
*	@file		: mcore.lua	
*
*	This will provide optimization to the client, This will remove useless effects
*	And will enable and disable the following below to improve frames.
*
*	THIS IS MAINLY USED ON POPULATED SERVERS DUE FRAMEDROP AND FROM HOW MANY
*	PROPS ARE BEING SPAWNED / USED ON THE SERVER
*
*/


/*
*	Localization :: Qrex
*/

local qrex						= ( qrex or {} )
local hook.Add 				 	= qrex.Cum
local hook.Remove 				= qrex.Begone

qrex.Cum( "InitPostEntity", "fpsbooster", function()
	 	game.ConsoleCommand("gmod_mcore_test 1")
	 	game.ConsoleCommand("mat_queue_mode -1")
	 	game.ConsoleCommand("cl_threaded_bone_setup 1")
	 	game.ConsoleCommand("cl_threaded_client_leaf_system 1")
	 	game.ConsoleCommand("r_threaded_client_shadow_manager 1")
	 	game.ConsoleCommand("r_threaded_particles 1")
	 	game.ConsoleCommand("r_threaded_renderables 1")
	 	game.ConsoleCommand("r_queued_ropes 1")
	 	game.ConsoleCommand("studio_queue_mode 1")
	 	game.ConsoleCommand("r_fastzreject -1")
	 	game.ConsoleCommand("mat_shadowstate 0")
	 	game.ConsoleCommand("r_shadowmaxrendered 0")
	 	game.ConsoleCommand("r_shadowrendertotexture 0")
	 	game.ConsoleCommand("r_shadows 0")
	 	game.ConsoleCommand("r_3dsky 0")
	 	game.ConsoleCommand("cl_playerspraydisable 1")
	 	game.ConsoleCommand("r_spray_lifetime 0")
	 	game.ConsoleCommand("cl_phys_props_enable 0")
	 	game.ConsoleCommand("cl_phys_props_max 0")
	 	game.ConsoleCommand("props_break_max_pieces 0")
	 	game.ConsoleCommand("r_propsmaxdist 1")
	 	game.ConsoleCommand("violence_agibs 0")
	 	game.ConsoleCommand("violence_hgibs 0")
	 	qrex.Begone("RenderScreenspaceEffects", "RenderColorModify")
 		qrex.Begone("RenderScreenspaceEffects", "RenderBloom")
 		qrex.Begone("RenderScreenspaceEffects", "RenderToyTown")
 		qrex.Begone("RenderScreenspaceEffects", "RenderTexturize")
 		qrex.Begone("RenderScreenspaceEffects", "RenderSunbeams")
 		qrex.Begone("RenderScreenspaceEffects", "RenderSobel")
 		qrex.Begone("RenderScreenspaceEffects", "RenderSharpen")
 		qrex.Begone("RenderScreenspaceEffects", "RenderMaterialOverlay")
 		qrex.Begone("RenderScreenspaceEffects", "RenderMotionBlur")
 		qrex.Begone("RenderScene", "RenderStereoscopy")
 		qrex.Begone("RenderScene", "RenderSuperDoF")
 		qrex.Begone("GUIMousePressed", "SuperDOFMouseDown")
 		qrex.Begone("GUIMouseReleased", "SuperDOFMouseUp")
 		qrex.Begone("PreventScreenClicks", "SuperDOFPreventClicks")
 		qrex.Begone("PostRender", "RenderFrameBlend")
 		qrex.Begone("PreRender", "PreRenderFrameBlend")
 		qrex.Begone("Think", "DOFThink")
 		qrex.Begone("RenderScreenspaceEffects", "RenderBokeh")
 		qrex.Begone("NeedsDepthPass", "NeedsDepthPass_Bokeh")
 		qrex.Begone("PostDrawEffects", "RenderWidgets")
 		qrex.Begone("PostDrawEffects", "RenderHalos")
end)
qrex.Cum("OnEntityCreated","WidgetInit",function(ent)
	if ent:IsWidget() then
		hook.Add( "PlayerTick", "TickWidgets", function( pl, mv ) widgets.PlayerTick( pl, mv ) end ) 
		qrex.Begone("OnEntityCreated","WidgetInit")
	end
end)