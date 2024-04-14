function scr_camera_focus_position_instant(_x, _y)
{
	var _display_manager = obj_display_manager;
	var _view_width = _display_manager.view_width;
	var _view_height = _display_manager.view_height;
	var _view_scale = _display_manager.view_scale;
	
	obj_camera.x = clamp(_x - _view_width/2, 0, room_width - _view_width);
	obj_camera.y = clamp(_y - _view_height/2, 0, room_height - _view_height);
}