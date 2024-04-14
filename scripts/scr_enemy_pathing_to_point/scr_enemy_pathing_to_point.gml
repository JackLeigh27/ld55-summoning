function scr_enemy_pathing_to_point(_x, _y)
{
	path = path_add();
	
	mp_grid_path(
		obj_level_manager.pathfinding_grid,
		path,
		x,
		y,
		ceil(_x),
		ceil(_y),
		true
	);
}