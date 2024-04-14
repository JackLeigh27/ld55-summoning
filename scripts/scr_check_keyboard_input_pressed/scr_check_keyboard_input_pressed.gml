function scr_check_keyboard_input_pressed(_input)
{
	var _key = obj_input_manager.keyboard_mappings[| _input];
	
	if(
		_key == mb_left
		or _key == mb_right
		or _key == mb_middle
	)
		return mouse_check_button_pressed(_key);
	
	return keyboard_check_pressed(_key);
}