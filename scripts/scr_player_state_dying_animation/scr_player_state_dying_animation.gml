function scr_player_state_dying_animation()
{
	sprite_index = spr_player_die;
	
	if(y < death_start_y or vspd < 0)
		image_index = 1
	else
		image_index = 2;
}