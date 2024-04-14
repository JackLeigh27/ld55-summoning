/// @description Draw

if(alarm[11]!=-1)
	shader_set(choose(shd_hurt_flash,shd_hurt_flash2));
	
// Inherit the parent event
event_inherited();

shader_reset();