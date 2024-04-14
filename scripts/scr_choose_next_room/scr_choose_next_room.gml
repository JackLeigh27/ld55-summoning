function scr_choose_next_room()
{
	return array_shuffle(obj_level_manager.rooms)[0];
}