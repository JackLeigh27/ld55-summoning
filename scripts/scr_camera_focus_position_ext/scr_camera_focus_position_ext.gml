function scr_camera_focus_position_ext(_x, _y, _clamp_x_boundary, _clamp_y_boundary)
{
	var _display_manager = obj_display_manager;
	var _view_width = _display_manager.view_width;
	var _view_height = _display_manager.view_height;
	var _view_scale = _display_manager.view_scale;
	
	var _camera_speed = CAMERA_SPEED;
	
	var _focus_x = obj_camera.x;
	var _focus_y = obj_camera.y;
	
	_focus_x = clamp(_x - _view_width/2, -_clamp_x_boundary, room_width - _view_width + _clamp_x_boundary);
	_focus_y = clamp(_y - _view_height/2, -_clamp_y_boundary, room_height - _view_height + _clamp_y_boundary);
	
	obj_camera.x = lerp(obj_camera.x, _focus_x, _camera_speed);
	obj_camera.y = lerp(obj_camera.y, _focus_y, _camera_speed);
}