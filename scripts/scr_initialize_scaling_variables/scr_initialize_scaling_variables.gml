function scr_initialize_scaling_variables(_scale, _tween_speed)
{
	scale_x = _scale;
	scale_y = _scale;
	
	scale_x_tween = scale_x;
	scale_y_tween = scale_y;
	
	scale_speed = _tween_speed;
	
	scale_delay = 0;
	
	image_xscale = _scale;
	image_yscale = _scale;
}