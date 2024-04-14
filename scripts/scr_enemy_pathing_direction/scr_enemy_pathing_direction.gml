function scr_enemy_pathing_direction()
{
	if(path == undefined)
		return 0;
		
	return point_direction(
		path_get_point_x(path,path_position),
		path_get_point_y(path,path_position),
		path_get_point_x(path,path_position+1),
		path_get_point_y(path,path_position+1)
	);
}