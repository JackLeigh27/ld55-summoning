function scr_draw_bar(_x,_y,_value,_max_value,_colour,_back_colour,_width,_height)
{
	draw_set_colour(_back_colour);
	draw_rectangle(_x - _width/2, _y - _height/2, _x + _width/2, _y + _height/2, false);
	
	_width -= SCALE_BASE * 2;
	_height -= SCALE_BASE * 2;
	
	var _inner_width = _width * (_value/_max_value);
	
	draw_set_colour(_colour);
	draw_rectangle(_x - _width/2, _y - _height/2, _x - _width/2 + _inner_width, _y + _height/2, false);
}