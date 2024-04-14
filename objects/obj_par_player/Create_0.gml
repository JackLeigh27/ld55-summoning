/// @description Initialize

// Inherit the parent event
event_inherited();

hp = scr_scale_value_with_upgrade(3,obj_upgrade_salus,1,1);
hp_max = hp;

invincibility_frames = 180;
hurt_duration = 15;
hurt_move_speed = 4;
hurt_move_direction = 0;

walk_speed = 2.5;
run_speed = 3.5;

acceleration_speed = 0.3;
deceleration_speed = 0.4;

diagonal_speed_multiplier = 0.77;
// Hacky way to get diagonal movement speed right
// To do with vectors or some shite idk
shoot_speed_multiplier = 0.75;

hspd = 0;
vspd = 0;
horizontal_facing = 1;

fuel = scr_scale_value_with_upgrade(100, obj_upgrade_diutinus, 1, 15);
fuel_threshold = fuel div 2;
fuel_max = fuel;

fuel_recovery_rate = scr_has_upgrade_3(obj_upgrade_diutinus) ? 1.5 : 1;
fuel_recovery_rate_tired = scr_has_upgrade_3(obj_upgrade_diutinus) ? 0.75 : 0.5;

can_shoot = true;
fire_rate = scr_has_upgrade_3(obj_upgrade_ignis) ? 2 : 3;

state = EPLAYER_STATE.DEFAULT;

// Pit checking
hole_frames = 6;
hole_frames_max = hole_frames;

hole_left_bound = -sprite_width/3;
hole_right_bound = sprite_width/3;
hole_top_bound = -sprite_height/24;
hole_bottom_bound = sprite_height/16;

// Death animation
death_bounce_height = -4;
death_terminal_velocity = 6;
death_slide_speed = 2;
death_gravity = 0.1;
death_start_y = y;

// Fall animation
fall_duration = 90;

function update()
{
	scr_player_handle_state();
	
	depth = room_height - y;
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