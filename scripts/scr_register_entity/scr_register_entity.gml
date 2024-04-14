function scr_register_entity(_id)
{
	var _entity_type_priority = obj_entity_manager.entity_type_priority;
	var _entity_group_count = array_length(_entity_type_priority);
	var _entity_groups = obj_entity_manager.entity_groups;
	
	for(var _i = 0; _i < _entity_group_count; _i++)
	{
		if(_entity_groups[_i] == undefined)
			_entity_groups[_i] = [];
			
		var _current_entity_type = _entity_type_priority[_i];
		
		if(object_get_parent(object_index) != _current_entity_type)
		{
			if(!object_is_ancestor(object_index, _current_entity_type))
			{
				if(object_index != _current_entity_type)
				{
					continue;
				}
			}
		}
			
		array_push(_entity_groups[_i], id);
		return;
	}
}