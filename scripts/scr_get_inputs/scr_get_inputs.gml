function scr_get_inputs()
{
	obj_input_manager.horizontal =
		scr_check_input(EINPUT.RIGHT) - scr_check_input(EINPUT.LEFT);
	obj_input_manager.horizontal_pressed =
		scr_check_input_pressed(EINPUT.RIGHT) - scr_check_input_pressed(EINPUT.LEFT);
		
	obj_input_manager.vertical =
		scr_check_input(EINPUT.DOWN) - scr_check_input(EINPUT.UP);
	obj_input_manager.vertical_pressed =
		scr_check_input_pressed(EINPUT.DOWN) - scr_check_input_pressed(EINPUT.UP);
		
	obj_input_manager.run_pressed =
		scr_check_input_pressed(EINPUT.RUN);
	obj_input_manager.run_held =
		scr_check_input(EINPUT.RUN);
		
	obj_input_manager.shoot_pressed =
		scr_check_input_pressed(EINPUT.SHOOT);
	obj_input_manager.shoot_held =
		scr_check_input(EINPUT.SHOOT);
		
	obj_input_manager.pause =
		scr_check_input_pressed(EINPUT.PAUSE);
}