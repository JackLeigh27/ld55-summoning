function scr_restart_game()
{
	with(obj_level_manager)
		instance_destroy();
		
	instance_create_depth(0,0,0,obj_level_manager);
	
	/*
	scr_enter_level(scr_choose_next_room());
	*/
	
	var _transition = instance_create_depth(0,0,0,obj_transition);
	_transition.type = ETRANSITION_TYPE.IN;
	room_goto(scr_choose_next_room());
}