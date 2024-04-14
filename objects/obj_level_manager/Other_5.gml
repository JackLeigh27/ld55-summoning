/// @description Fix music

if(room == rm_upgrade_select)
{
	var _upgrade_selector = instance_create_depth(0,0,0,obj_upgrade_selector);
	audio_sound_gain(song, 1.0, 500);
	audio_sound_set_track_position(song, audio_sound_get_track_position(song_upgrade));
	audio_sound_gain(song_upgrade, 0.0, 500);
}