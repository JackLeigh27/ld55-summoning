/// @description Sound and effect

// Inherit the parent event
event_inherited();

audio_play_sound(choose(snd_enemy_slime_die_1,snd_enemy_slime_die_2),0,false);

repeat(10)
	instance_create_depth(x,y-sprite_height/2,depth,obj_enemy_slime_death_particle);