function scr_game_start()
{
	instance_create_depth(0,0,0,obj_cursor);
	
	room_goto(rm_splash_screen);
}