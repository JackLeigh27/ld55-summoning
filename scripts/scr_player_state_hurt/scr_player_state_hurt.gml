function scr_player_state_hurt()
{
	hspd = lengthdir_x(hurt_move_speed, hurt_move_direction);
	vspd = lengthdir_y(hurt_move_speed, hurt_move_direction);
	
	x += hspd;
	y += vspd;
	
	if(!audio_is_playing(snd_player_hurt))
		audio_play_sound(snd_player_hurt,0,false);
}