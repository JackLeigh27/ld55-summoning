function scr_has_upgrade_3(_upgrade_index)
{
	return instance_exists(_upgrade_index) and _upgrade_index.levels >= 3;
}