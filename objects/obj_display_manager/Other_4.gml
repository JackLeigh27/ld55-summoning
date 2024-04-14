/// @description Spawn camera

view_enabled = true;
view_visible[0] = true;

if(!instance_exists(obj_camera))
	instance_create_depth(0,0,0,obj_camera);