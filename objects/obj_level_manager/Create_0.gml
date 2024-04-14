/// @description Initialize

rooms = [
	rm_level_1,
	rm_level_2,
	rm_level_3
];

depth = room_height;

pathfinding_grid = undefined;

level = 1;

start_time = current_time;
end_time = current_time;

// Spawn all upgrades
var _ignis = instance_create_depth(0,0,0,obj_upgrade_ignis);
var _salus = instance_create_depth(0,0,0,obj_upgrade_salus);
var _longus = instance_create_depth(0,0,0,obj_upgrade_longus);
var _diutinus = instance_create_depth(0,0,0,obj_upgrade_diutinus);
var _magus = instance_create_depth(0,0,0,obj_upgrade_magus);
var _displodo = instance_create_depth(0,0,0,obj_upgrade_displodo);

registered_upgrades = [];

song = audio_play_sound(snd_song, 0, true, 1.0);
song_upgrade = audio_play_sound(snd_song_upgrade, 0, true, 0.0);