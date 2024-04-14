function scr_camera_focus_object_instant(_id)
{
	if(instance_exists(_id))
		scr_camera_focus_position_instant(_id.x, _id.y);
}