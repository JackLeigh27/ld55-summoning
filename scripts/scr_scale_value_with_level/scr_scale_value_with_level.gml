function scr_scale_value_with_level(_base_value, _mult_by_level, _add_per_level)
{
	if(obj_level_manager.level == 1)
		return _base_value;
	
	return scr_scale_value_by_points(_base_value, obj_level_manager.level - 1, _mult_by_level, _add_per_level);
}