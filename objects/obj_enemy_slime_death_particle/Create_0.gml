/// @description Initialize

// Inherit the parent event
event_inherited();

scr_scale(1.3,1.3);

hspd = random_range(-2,2);
vspd = random_range(-5,-2);

gravity_speed = 0.2;
terminal_velocity = 6;

lifetime = 15 * 60;
alarm[0] = lifetime + irandom_range(-60,60);

depth = room_height - y;

ystart = random_range(y-32,y+32);
y = ystart;

image_speed = 0;
image_index = irandom(sprite_get_number(sprite_index)-1);

function update()
{
	if(y < ystart)
		vspd = min(vspd + gravity_speed, terminal_velocity);
	
	x += hspd;
	y += vspd;
	
	if(vspd > 0 and y>=ystart)
	{
		hspd = 0;
		vspd = 0;
		y = ystart;
		depth = layer_get_depth(layer_get_id("Tiles"))-1;
		if(place_meeting(x,y,obj_hole))
			instance_destroy();
	}
	
	if(alarm[0] < lifetime/2)
	{
		var _percent = (((alarm[0]/lifetime) * 10) div 1)/10;
		scr_scale(_percent, _percent);
	}
}