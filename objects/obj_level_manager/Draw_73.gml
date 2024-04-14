/// @description Draw enemy HP bars

with(obj_par_enemy)
{
	var _centre_x = x - sprite_xoffset + sprite_width/2;
	var _top_y = y - sprite_yoffset - 12;

	if(hp < hp_max)
		scr_draw_bar(_centre_x, _top_y - z, hp, hp_max, c_red, make_colour_rgb(24,20,37), 48 + (hp_max div 40), 6);
}