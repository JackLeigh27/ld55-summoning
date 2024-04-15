/// @description Initialize

// Inherit the parent event
event_inherited();

hp = 15;
hp_max = hp;

z = 0;

path = undefined;

// Pit checking
hole_frames = 30;
hole_frames_max = hole_frames;

hole_left_bound = -sprite_width/4;
hole_right_bound = sprite_width/4;
hole_top_bound = -sprite_height/24;
hole_bottom_bound = sprite_height/16;

function update_end()
{
	depth = room_height - y;
	
	if(object_is_ancestor(object_index,obj_par_evil_wizard) or object_index == obj_par_evil_wizard)
		exit;
		
	var _enemy_touching = instance_place(x,y,obj_par_enemy);
	if(_enemy_touching != noone)
	{
		x -= lengthdir_x(1,point_direction(x,y,_enemy_touching.x,_enemy_touching.y));
		y -= lengthdir_y(1,point_direction(x,y,_enemy_touching.x,_enemy_touching.y));
	}
	
	// Falling into pit
	if(z <= 0 and position_meeting(x+hole_left_bound,y+hole_top_bound,obj_hole)
		and position_meeting(x+hole_right_bound,y+hole_top_bound,obj_hole)
		and position_meeting(x+hole_left_bound,y+hole_bottom_bound,obj_hole)
		and position_meeting(x+hole_right_bound,y+hole_bottom_bound,obj_hole)
	)
	{
		hole_frames--;
		
		var _nearest_spawn = instance_nearest(x,y,obj_enemy_spawn_point);
		var _direction = point_direction(x,y,_nearest_spawn.x,_nearest_spawn.y);
		
		x += lengthdir_x(2, _direction);
		y += lengthdir_y(2, _direction);
		
		if(hole_frames<=0)
		{
			audio_play_sound(snd_enemy_die,0,false);
			on_kill();
			instance_destroy();
		}
	}
	else
		hole_frames = hole_frames_max;
}

function on_kill()
{
	if(scr_has_upgrade(obj_upgrade_displodo))
		var _explosion = instance_create_depth(x,y,depth,obj_par_explosion);
}