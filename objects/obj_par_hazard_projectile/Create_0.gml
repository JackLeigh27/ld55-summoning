/// @description Initialize

// Inherit the parent event
event_inherited();

move_speed = 4;
move_direction = 0;

hspd = 0;
vspd = 0;

duration = 180;

function update()
{
	if(alarm[0] == -1)
		alarm[0] = duration;
		
	hspd = lengthdir_x(move_speed, move_direction);
	vspd = lengthdir_y(move_speed, move_direction);
	
	x += hspd;
	y += vspd;
}