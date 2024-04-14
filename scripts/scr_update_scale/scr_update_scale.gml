function scr_update_scale()
{
	if(scale_delay > 0)
	{
		scale_delay--;
		return;
	}
	
	scale_x_tween = lerp(scale_x_tween, scale_x, scale_speed);
	scale_y_tween = lerp(scale_y_tween, scale_y, scale_speed);
}