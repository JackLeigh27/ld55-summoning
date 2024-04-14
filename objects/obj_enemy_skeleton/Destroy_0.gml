/// @description Effect

// Inherit the parent event
event_inherited();

audio_play_sound(choose(snd_skeleton_die_1,snd_skeleton_die_2),0,false);

repeat(10)
	instance_create_depth(x,y-sprite_height/2,depth,obj_enemy_skeleton_death_particle);