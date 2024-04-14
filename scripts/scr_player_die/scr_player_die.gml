function scr_player_die()
{
	state = EPLAYER_STATE.DYING;
	vspd = death_bounce_height;
	death_start_y = y;
	audio_play_sound(snd_player_death,0,false);
}