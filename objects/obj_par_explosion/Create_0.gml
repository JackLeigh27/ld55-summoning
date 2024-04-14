/// @description Initialize

// Inherit the parent event
event_inherited();

damage = scr_scale_value_with_upgrade(30, obj_upgrade_displodo, 1, 15);
radius = scr_has_upgrade_3(obj_upgrade_displodo) ? 80 : 48;

check_delay = 5;
lifetime = 30;

alarm[0] = lifetime;

function update()
{
	if(alarm[0] == lifetime - check_delay)
		scr_hurt_enemies_in_radius();
}

scr_camera_shake(20);

audio_play_sound(snd_explosion,0,false);