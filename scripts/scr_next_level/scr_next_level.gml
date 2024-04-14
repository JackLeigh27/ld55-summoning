function scr_next_level()
{
	obj_level_manager.level++;
	
	scr_enter_level(scr_choose_next_room());
}