function scr_set_default_key_mappings()
{
	var _mappings = obj_input_manager.keyboard_mappings;
	
	ds_list_set(_mappings, EINPUT.LEFT, DEFAULT_KEYBOARD_LEFT);
	ds_list_set(_mappings, EINPUT.RIGHT, DEFAULT_KEYBOARD_RIGHT);
	ds_list_set(_mappings, EINPUT.UP, DEFAULT_KEYBOARD_UP);
	ds_list_set(_mappings, EINPUT.DOWN, DEFAULT_KEYBOARD_DOWN);
	
	ds_list_set(_mappings, EINPUT.RUN, DEFAULT_KEYBOARD_RUN);
	ds_list_set(_mappings, EINPUT.SHOOT, DEFAULT_KEYBOARD_SHOOT);
	
	ds_list_set(_mappings, EINPUT.PAUSE, DEFAULT_KEYBOARD_PAUSE);
}