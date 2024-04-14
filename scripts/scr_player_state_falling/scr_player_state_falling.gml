function scr_player_state_falling()
{
	alarm[1] = invincibility_frames;
	image_alpha = 1;
	
	image_index = sprite_get_number(sprite_index) * (1-(alarm[3]/fall_duration));
}