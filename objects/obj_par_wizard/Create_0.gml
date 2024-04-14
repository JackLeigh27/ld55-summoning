/// @description Initialize

// Inherit the parent event
event_inherited();

depth = room_height - y;

cast_rate = round(scr_scale_value_with_upgrade(600, obj_upgrade_magus, 0.95, 1));
alarm[0] = cast_rate;

cast_animation_threshold = round(cast_rate / 8);

function cast_spell()
{
	if(!instance_exists(obj_par_evil_wizard))
		return;
		
	var _spell = instance_create_depth(x,y,0,obj_wizard_spell);
	
	_spell.move_direction = point_direction(x,y,obj_par_evil_wizard.x,obj_par_evil_wizard.y);
}

function update()
{
	if(alarm[0] <= cast_animation_threshold)
	{
		if(!audio_is_playing(snd_wizard_spell_charge))
			audio_play_sound(snd_wizard_spell_charge,0,false);
		var _percent = 1-(alarm[0]/cast_animation_threshold);
		sprite_index = spr_wizard_cast;
		image_index = sprite_get_number(sprite_index) * _percent;
	}
}