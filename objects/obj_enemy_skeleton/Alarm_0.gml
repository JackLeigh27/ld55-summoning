/// @description Shoot

scr_shoot_hazard_projectile(x,y-sprite_height/2,4,point_direction(x,y,obj_par_player.x,obj_par_player.y));

if(in_range)
	alarm[0] = fire_rate;
	
audio_play_sound(snd_skeleton_attack,0,false);