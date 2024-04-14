/// @description Initialize

// Inherit the parent event
event_inherited();

hspd = 0;
vspd = 0;

move_speed = 3.5;
move_direction = 0;

radius = scr_scale_value_with_upgrade(64,obj_upgrade_magus,1.1,0);
damage = scr_scale_value_with_upgrade(2,obj_upgrade_magus,1.2,0.5);

lifetime = 600;
alarm[0] = lifetime;

function update()
{
	var _target_speed = move_speed;
	
	if(point_distance(x,y,obj_par_player.x,obj_par_player.y)<=radius)
		_target_speed /= 4;
		
	var _hurt_enemy = scr_hurt_enemies_in_radius();
	if(_hurt_enemy and scr_has_upgrade_3(obj_upgrade_magus))
		_target_speed /= 2;
	
	hspd = lengthdir_x(_target_speed, move_direction);
	vspd = lengthdir_y(_target_speed, move_direction);
	
	x += hspd;
	y += vspd;
}

audio_stop_sound(snd_wizard_spell_charge);
audio_stop_sound(snd_wizard_spell);
audio_play_sound(snd_wizard_spell_cast,0,false);
audio_play_sound(snd_wizard_spell,0,false);