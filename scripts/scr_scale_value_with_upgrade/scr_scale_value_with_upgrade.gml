function scr_scale_value_with_upgrade(_base_value, _upgrade, _multiplier, _adder)
{
	if(!scr_has_upgrade(_upgrade))
		return _base_value;
		
	return scr_scale_value_by_points(_base_value, _upgrade.levels, _multiplier, _adder);
}