function scr_scale_value_by_points(_base_value, _points, _mult_by_point, _add_per_point)
{
	repeat(_points)
		_base_value *= _mult_by_point;
	
	return _base_value + _add_per_point * _points;
}