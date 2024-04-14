function scr_reset_entity_groups()
{
	obj_entity_manager.entity_groups =
		array_create(array_length(obj_entity_manager.entity_type_priority), undefined);
}