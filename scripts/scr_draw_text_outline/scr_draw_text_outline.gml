function scr_draw_text_outline(_x, _y, _text, _colour, _outline_colour, _scale)
{
	draw_set_colour(_outline_colour);
	
	draw_text_transformed(_x + _scale, _y, _text, _scale, _scale, 0);
	draw_text_transformed(_x - _scale, _y, _text, _scale, _scale, 0);
	draw_text_transformed(_x, _y + _scale, _text, _scale, _scale, 0);
	draw_text_transformed(_x, _y - _scale, _text, _scale, _scale, 0);
	
	draw_text_transformed(_x + _scale * 2, _y, _text, _scale, _scale, 0);
	draw_text_transformed(_x + _scale * 2, _y + _scale * 2, _text, _scale, _scale, 0);
	
	draw_text_transformed(_x, _y + _scale * 2, _text, _scale, _scale, 0);
	draw_text_transformed(_x - _scale * 2, _y + _scale * 2, _text, _scale, _scale, 0);
	
	draw_text_transformed(_x - _scale * 2, _y, _text, _scale, _scale, 0);
	draw_text_transformed(_x - _scale * 2, _y - _scale * 2, _text, _scale, _scale, 0);
	
	draw_text_transformed(_x, _y - _scale * 2, _text, _scale, _scale, 0);
	draw_text_transformed(_x + _scale * 2, _y - _scale * 2, _text, _scale, _scale, 0);
	
	draw_set_colour(_colour);
	draw_text_transformed(_x, _y, _text, _scale, _scale, 0);
}