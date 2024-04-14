/// @description Initialize

// Inherit the parent event
event_inherited();

base_hp = 105;
hp = scr_scale_value_with_level(base_hp, 1.15, 0);
hp_max = hp;

move_speed = 3.5;
move_speed_in_range = 1.2;

scr_enemy_pathing_to_player();
move_direction = scr_enemy_pathing_direction();

hspd = 0;
vspd = 0;
horizontal_facing = 1;

enter_range = 96;
exit_range = 128;
in_range = false;

fire_rate_initial = 90;
fire_rate = 60;

can_hurt = false;

alarm[1] = 5;

function update()
{
	if(in_range and alarm[0] == -1)
		alarm[0] = fire_rate;
		
	move_direction = scr_enemy_pathing_direction();
	
	if(!in_range and point_distance(x,y,obj_par_player.x,obj_par_player.y)<=enter_range)
		in_range = true
	else if(in_range and point_distance(x,y,obj_par_player.x,obj_par_player.y)>exit_range)
		in_range = false;
	
	var _target_speed = in_range ? move_speed_in_range : move_speed;
	
	hspd = lerp(hspd, lengthdir_x(_target_speed, move_direction), 0.05);
	vspd = lerp(vspd, lengthdir_y(_target_speed, move_direction), 0.05);
	
	image_speed = 0.5 + 0.5*(((abs(hspd)+abs(vspd))/2)/move_speed);
	
	x += hspd;
	y += vspd;
	
	var _was_facing = horizontal_facing;
	if(obj_par_player.x > x)
		horizontal_facing = 1
	else
		horizontal_facing = -1;
			
	if(horizontal_facing != _was_facing)
		scr_scale(0.7,1.3);
		
	if(alarm[0]!=-1)
	{
		var _percent = 1-(alarm[0]/fire_rate);
		sprite_index = spr_enemy_skeleton_attack;
		image_index = sprite_get_number(sprite_index) * _percent;
	}
	else
		sprite_index = spr_enemy_skeleton;
}

function draw()
{
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		scale_x_tween * horizontal_facing,
		scale_y_tween,
		image_angle,
		image_blend,
		image_alpha
	);
}