/// @description Clear upgrades

with(obj_par_upgrade)
	instance_destroy();
	
audio_stop_sound(song);
audio_stop_sound(song_upgrade);