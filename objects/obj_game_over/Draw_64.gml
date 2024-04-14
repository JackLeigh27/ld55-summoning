/// @description Draw

draw_set_halign(fa_center);
draw_set_valign(fa_top);

var _hud_x = GAME_WIDTH/2;
var _hud_y = 96;

draw_set_font(fnt_upgrade_name);

if(state >= EGAME_OVER_STATE.SHOW_GAME_OVER_TEXT)
	scr_draw_text_outline(_hud_x, _hud_y,  "You were slain...", make_colour_rgb(24,20,37), c_red, SCALE_BASE);

_hud_y += string_height("You were slain...") * SCALE_BASE * 1.75;
draw_set_font(fnt_upgrade_description);
draw_set_colour(c_white);

if(state >= EGAME_OVER_STATE.SHOW_LEVELS_CLEARED)
	draw_text_transformed(_hud_x, _hud_y, string("You defeated {0} wizards", obj_level_manager.level-1),3,3,0);
	
_hud_y += string_height("You defeated blablabla") * 3;
draw_set_colour(c_yellow);

if(state >= EGAME_OVER_STATE.SHOW_NEW_HIGH_SCORE and !hide_high_score_text)
	draw_text_transformed(_hud_x, _hud_y, "(New high score!)", 3, 3, 0);
	
_hud_y += string_height("You defeated blablabla") * 6;
var _time = obj_level_manager.end_time - obj_level_manager.start_time;
draw_set_colour(c_white);

if(state >= EGAME_OVER_STATE.SHOW_TIME_SPENT)
	draw_text_transformed(_hud_x, _hud_y, string("You played for {0}", scr_convert_milliseconds_to_time(_time)), 3, 3, 0);
	
_hud_y += string_height("You defeated blablabla") * 6;

if(state >= EGAME_OVER_STATE.SHOW_BUTTON)
	draw_text_transformed(_hud_x, _hud_y, string("Press R to retry", _time), 3, 3, 0);