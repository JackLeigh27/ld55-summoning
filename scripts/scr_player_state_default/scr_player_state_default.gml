function scr_player_state_default()
{
	var _h = obj_input_manager.horizontal;
	var _v = obj_input_manager.vertical;
	
	var _running = !obj_input_manager.run_held;
	var _shooting = obj_input_manager.shoot_held;
	
	// Calculate speed
	var _target_speed = (_running and !_shooting) ? run_speed : walk_speed;
	
	if(_h != 0 and _v != 0)
		_target_speed *= diagonal_speed_multiplier;
		
	if(_shooting)
		_target_speed *= shoot_speed_multiplier;
	
	if(_h != 0)
		hspd = lerp(hspd, _target_speed * _h, acceleration_speed)
	else
		hspd = lerp(hspd, 0, deceleration_speed);
		
	if(_v != 0)
		vspd = lerp(vspd, _target_speed * _v, acceleration_speed)
	else
		vspd = lerp(vspd, 0, deceleration_speed);
		
	// Move player
	x += hspd;
	y += vspd;
	
	var _was_facing = horizontal_facing;
	
	if(mouse_x > x)
		horizontal_facing = 1
	else
		horizontal_facing = -1;
	
	// Shooting
	if(_shooting and alarm[0]==-1)
	{
		var _centre_x = x - sprite_xoffset + sprite_width/2;
		var _centre_y = y - sprite_yoffset + sprite_height/2;
		
		var _natural_aim_offset = sin(degtorad((current_time * 1.25) mod 360)) * 10;
		
		var _aim_direction = point_direction(_centre_x,_centre_y,mouse_x,mouse_y) + _natural_aim_offset;
		
		var _projectile = instance_create_depth(_centre_x,_centre_y,depth+1,obj_par_projectile);
		_projectile.move_direction = _aim_direction;
		
		scr_scale(random_range(0.95,1.05),random_range(0.95,1.05));
		
		fuel = max(fuel - fire_rate, 0);
		if(fuel <= 0)
			can_shoot = false;
		
		alarm[0] = can_shoot ? fire_rate : fire_rate * 6;
		
		if(!audio_is_playing(snd_fire_breath))
			audio_play_sound(snd_fire_breath,0,true);
	}
	else if(alarm[0]==-1)
	{
		if(audio_is_playing(snd_fire_breath))
			audio_stop_sound(snd_fire_breath);
		
		var _recovery_rate = can_shoot ? fuel_recovery_rate : fuel_recovery_rate_tired;
		
		fuel = min(fuel + _recovery_rate, fuel_max);
		
		if(!can_shoot and fuel >= fuel_threshold)
			can_shoot = true;
	}
	
	// Taking damage
	var _hazard_touching = instance_place(x,y,obj_par_hazard);
	if(_hazard_touching != noone and alarm[1] == -1 and _hazard_touching.can_hurt)
	{
		scr_player_take_damage(_hazard_touching.damage);
		
		if(hp > 0)
		{
			state = EPLAYER_STATE.HURT;
			alarm[1] = invincibility_frames;
			alarm[2] = hurt_duration;
			hurt_move_direction = point_direction(_hazard_touching.x, _hazard_touching.y, x, y);
		}
		
		scr_temporarily_freeze_game(6);
		scr_camera_shake(30);
	}
	
	if(alarm[1] != -1)
	{
		if(alarm[1] > invincibility_frames/3)
			image_alpha = (alarm[1] div 10) mod 2
		else
			image_alpha = (alarm[1] div 5) mod 2;
	}
	else
		image_alpha = 1;
		
	// Falling into pit
	if(position_meeting(x+hole_left_bound,y+hole_top_bound,obj_hole)
		and position_meeting(x+hole_right_bound,y+hole_top_bound,obj_hole)
		and position_meeting(x+hole_left_bound,y+hole_bottom_bound,obj_hole)
		and position_meeting(x+hole_right_bound,y+hole_bottom_bound,obj_hole)
	)
	{
		hole_frames--;
		if(hole_frames<=0)
		{
			state = EPLAYER_STATE.FALLING;
			alarm[3] = fall_duration;
		}
	}
	else
		hole_frames = hole_frames_max;
		
	if(horizontal_facing != _was_facing)
		scr_scale(0.7,1.3);
}