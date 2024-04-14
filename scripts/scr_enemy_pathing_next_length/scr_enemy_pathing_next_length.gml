function scr_enemy_pathing_next_length()
{
	return point_distance(
		path_get_point_x(path,path_position),
		path_get_point_y(path,path_position),
		path_get_point_x(path,path_position+1),
		path_get_point_y(path,path_position+1)
	);
}