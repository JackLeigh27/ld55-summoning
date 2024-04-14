function scr_shoot_hazard_projectile(_x,_y,_speed,_direction)
{
	var _projectile = instance_create_depth(_x,_y,depth,obj_par_hazard_projectile);
	
	_projectile.move_speed = _speed;
	_projectile.move_direction = _direction;
	
	return _projectile;
}