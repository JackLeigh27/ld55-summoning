/// @description Draw

draw_set_alpha(0.1);
draw_set_colour(c_white);

var _draw_radius = radius + sin(degtorad(current_time div 5)) * 5;

draw_circle(x,y,_draw_radius,false);

draw_set_alpha(1);
draw_set_colour(make_colour_rgb(85,85,255));

draw_circle(x,y,_draw_radius,true);
draw_circle(x,y,_draw_radius+1,true);