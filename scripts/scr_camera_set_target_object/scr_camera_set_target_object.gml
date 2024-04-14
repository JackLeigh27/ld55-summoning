function scr_camera_set_focus_object(_id)
{
	if(instance_exists(obj_camera))
		obj_camera.target_object = _id;
}