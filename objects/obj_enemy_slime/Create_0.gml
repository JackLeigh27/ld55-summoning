/// @description Initialize

// Inherit the parent event
event_inherited();

base_hp = 60;
hp = scr_scale_value_with_level(base_hp, 1.15, 0);
hp_max = hp;

state = ESLIME_STATE.IDLE;

durations = [];
durations[ESLIME_STATE.IDLE] = 15;
durations[ESLIME_STATE.JUMP_CHARGE] = 30;
durations[ESLIME_STATE.JUMPING] = 30;
durations[ESLIME_STATE.RECOVERY] = 15;

hspd = 0;
vspd = 0;
horizontal_facing = 1;

jump_direction = 0;
jump_height = 30;
move_speed = 4;

jump_start_x = x;
jump_start_y = y;
jump_end_x = x;
jump_end_y = y;

can_hurt = false;

z = 0;

alarm[0] = irandom_range(15,60);

function update()
{
	if(state == ESLIME_STATE.JUMPING)
	{
		var _jump_percent = 1-(alarm[0]/durations[ESLIME_STATE.JUMPING]);
		
		x = lerp(jump_start_x, jump_end_x, _jump_percent);
		y = lerp(jump_start_y, jump_end_y, _jump_percent);
		
		z = sin(degtorad(_jump_percent*180)) * jump_height;
	}
	else
	{
		z = 0;
		
		if(state != ESLIME_STATE.JUMP_CHARGE)
		{
			var _was_facing = horizontal_facing;
			if(obj_par_player.x > x)
				horizontal_facing = 1
			else
				horizontal_facing = -1;
			
			if(horizontal_facing != _was_facing)
				scr_scale(0.7,1.3);
		}
	}
	
	switch(state)
	{
		case ESLIME_STATE.IDLE:
		case ESLIME_STATE.RECOVERY:
			sprite_index = spr_enemy_slime;
			break;
		case ESLIME_STATE.JUMP_CHARGE:
			sprite_index = spr_enemy_slime_charge;
			break;
		case ESLIME_STATE.JUMPING:
			sprite_index = spr_enemy_slime_jump;
			break;
	}
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