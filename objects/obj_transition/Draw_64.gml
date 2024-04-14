/// @description Draw

if(alarm[0]>transition_duration)
	exit;

draw_set_colour(make_colour_rgb(24,20,37));

var _left_x = 0
var _right_x = GAME_WIDTH;
var _top_y = 0;
var _bottom_y = GAME_HEIGHT;

var _percent = 1-(alarm[0]/transition_duration);

if(type == ETRANSITION_TYPE.OUT)
	_left_x = GAME_WIDTH * (1-_percent)
else if(type == ETRANSITION_TYPE.IN)
	_right_x = GAME_WIDTH * (1-_percent);
	
draw_rectangle(_left_x,_top_y,_right_x,_bottom_y,false);