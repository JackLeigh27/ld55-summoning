function scr_choose_next_room()
{
	var _rooms = array_shuffle(obj_level_manager.rooms);
	
	if(_rooms[0] == obj_level_manager.last_room)
		return _rooms[1];
	
	return _rooms[0];
}