function scr_camera_focus_object(_id)
{
	if(instance_exists(_id))
		scr_camera_focus_position(_id.x, _id.y);
}