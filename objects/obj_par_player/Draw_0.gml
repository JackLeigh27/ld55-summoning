/// @description Draw fuel gauge

if(state == EPLAYER_STATE.DYING)
{
	draw_set_colour(make_colour_rgb(24,20,37));
	draw_rectangle(-64, -64, GAME_WIDTH + 64, GAME_HEIGHT + 64, false);
	depth = -100;
}

// Inherit the parent event
event_inherited();

if(fuel >= fuel_max or state == EPLAYER_STATE.DYING)
	exit;
	
var _centre_x = x - sprite_xoffset + sprite_width/2;
var _top_y = y - sprite_yoffset - 12;
	
var _gauge_colour = can_shoot ? c_orange : c_grey;

scr_draw_bar(_centre_x, _top_y, fuel, fuel_max, _gauge_colour, make_colour_rgb(24,20,37), 48 + (hp_max div 40), 6);