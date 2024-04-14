/// @description Draw

if(alarm[0] > lifetime - check_delay)
{
	draw_set_colour(c_orange);
	draw_set_alpha(0.2);
	draw_circle(x,y,radius,false);
	draw_set_alpha(1);
}

draw_set_colour(c_red);
if(alarm[0] > lifetime - check_delay)
{
	draw_circle(x,y,radius,true);
	draw_circle(x,y,radius+1,true);
}

var _inner_radius = (1-(alarm[0]/lifetime)) * radius;

draw_circle(x,y,_inner_radius,true);
draw_circle(x,y,_inner_radius+1,true);

draw_sprite_ext(spr_explosion,(1-(alarm[0]/lifetime))*sprite_get_number(spr_explosion),x,y,SCALE_BASE,SCALE_BASE,0,c_white,1);