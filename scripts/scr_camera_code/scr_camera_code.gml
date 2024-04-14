function scr_camera_code()
{
	/*
	scr_camera_focus_object(target_object);
	*/
	var _clamp = 16;
	var _left_x = -_clamp;
	var _right_x = room_width + _clamp;
	var _top_y = -_clamp;
	var _bottom_y = room_height + _clamp;
	
	var _width = _right_x - GAME_WIDTH - _left_x;
	var _height = _bottom_y - GAME_HEIGHT - _top_y;
	
	if(instance_exists(obj_par_player))
	{
		var _player_x = obj_par_player.x;
		var _player_y = obj_par_player.y - obj_par_player.sprite_yoffset + obj_par_player.sprite_height/2;
		
		var _player_x_map = (_player_x/room_width) * _width;
		var _player_y_map = (_player_y/room_height) * _height;
	
		x = _player_x_map;
		y = _player_y_map;
	}
	
	var _shake_x = irandom_range(-shake, shake);
	var _shake_y = irandom_range(-shake, shake);
	
	camera_set_view_pos(VIEW, round(x) + _shake_x, round(y) + _shake_y);
	
	shake = max(shake-1, 0);
}