function scr_register_entity_types(_entity_types_array)
{
	obj_entity_manager.entity_type_priority = 
		array_concat(_entity_types_array, obj_entity_manager.base_entity_types);
	
	scr_reset_entity_groups();
}