/// @description Initialize

// Inherit the parent event
event_inherited();

base_move_speed = 5;
move_speed = scr_has_upgrade_3(obj_upgrade_longus) ? 6 : base_move_speed;
move_direction = 0;

damage = scr_scale_value_with_upgrade(3,obj_upgrade_ignis,1,1);

duration = scr_scale_value_with_upgrade(20,obj_upgrade_longus,1,3);

scr_scale_delayed(0.6,0.6,5);

function update()
{
	if(alarm[0] == -1)
		alarm[0] = duration;
		
	var _speed = place_meeting(x,y,obj_par_enemy) ? base_move_speed : move_speed;
	
	x += lengthdir_x(_speed, move_direction);
	y += lengthdir_y(_speed, move_direction);
	
	scr_hurt_enemy_on_touch();
}

function draw()
{
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		scale_x_tween,
		scale_y_tween,
		move_direction,
		image_blend,
		image_alpha
	);
}