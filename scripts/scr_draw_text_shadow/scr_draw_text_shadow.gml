function scr_draw_text_shadow(_x, _y, _text, _shadow_x, _shadow_y, _colour, _shadow_colour, _scale)
{
	draw_set_colour(_shadow_colour);
	draw_text_transformed(_x + _shadow_x * _scale, _y + _shadow_y * _scale, _text, _scale, _scale, 0);
	
	draw_set_colour(_colour);
	draw_text_transformed(_x, _y, _text, _scale, _scale, 0);
}