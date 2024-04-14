function scr_check_keyboard_input(_input)
{
	var _key = obj_input_manager.keyboard_mappings[| _input];
	
	if(
		_key == mb_left
		or _key == mb_right
		or _key == mb_middle
	)
		return mouse_check_button(_key);
	
	return keyboard_check(_key);
}