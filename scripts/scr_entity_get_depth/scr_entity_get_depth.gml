function scr_entity_get_depth(_id)
{
	var _prioritized = array_length(ENTITY_DEPTH_PRIORITY);
	var _deprioritized = array_length(ENTITY_DEPTH_DEPRIORITY);
	
	for(var _i = 0; _i < _prioritized; _i++)
	{
		var _object_index = ENTITY_DEPTH_PRIORITY[_i];
		
		if(_id.object_index == _object_index or object_is_ancestor(_id.object_index, _object_index))
		{
			return _i;
		}
	}
	
	for(var _i = 0; _i < _deprioritized; _i++)
	{
		var _object_index = ENTITY_DEPTH_DEPRIORITY[_i];
		
		if(_id.object_index == _object_index or object_is_ancestor(_id.object_index, _object_index))
		{
			return _prioritized + 2 + _i;
		}
	}
	
	return _prioritized + 1;
}