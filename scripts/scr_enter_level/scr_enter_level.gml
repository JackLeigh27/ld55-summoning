function scr_enter_level(_room)
{
	var _transition = instance_create_depth(0,0,0,obj_transition);
	_transition.transition_to_room = _room;
	
	obj_level_manager.last_room = _room;
	
	return _transition;
}