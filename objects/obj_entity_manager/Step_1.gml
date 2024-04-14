/// @description Update entities (begin)

var _entity_groups = entity_groups;
var _entity_group_count = array_length(_entity_groups);

for(var _g = 0; _g < _entity_group_count; _g++)
{
	var _entity_group = _entity_groups[_g];
	
	for(var _e = 0; _e < array_length(_entity_group); _e++)
	{
		var _entity = _entity_group[_e];
		
		if(!instance_exists(_entity))
		{
			array_delete(_entity_group, _e, 1);
			_e--;
			continue;
		}
		
		if(_entity.pause_level < pause_level)
			_entity.update_begin();
	}
}