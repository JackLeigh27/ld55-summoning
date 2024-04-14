function scr_player_state_default_animation()
{
	var _h = obj_input_manager.horizontal;
	var _v = obj_input_manager.vertical;
	
	if(_h != 0 or _v != 0)
		sprite_index = spr_player_run
	else
		sprite_index = spr_player;
}