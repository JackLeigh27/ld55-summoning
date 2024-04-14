/// @description Set tiles

if(room == rm_upgrade_select)
{
	var _upgrade_selector = instance_create_depth(0,0,0,obj_upgrade_selector);
	audio_sound_gain(song, 0.0, 500);
	audio_sound_set_track_position(song_upgrade, audio_sound_get_track_position(song));
	audio_sound_gain(song_upgrade, 1.0, 500);
	exit;
}

var _level_theme = choose(
	{tileset:ts_yellow, back_image: spr_bg_yellow, back_colour:make_colour_rgb(0,170,255)},
	{tileset:ts_green, back_image: spr_bg_green, back_colour:make_colour_rgb(79,29,76)},
	{tileset:ts_brown, back_image: spr_bg_brown, back_colour:make_colour_rgb(24,20,37)}
);

var _background_layer = layer_get_id("Background");
var _background = layer_background_get_id(_background_layer);
layer_background_sprite(_background, _level_theme.back_image);
layer_background_blend(_background, c_white);

var _tile_layer = layer_get_id("Tiles");
var _tiles = layer_tilemap_get_id(_tile_layer);
tilemap_tileset(_tiles, _level_theme.tileset);

pathfinding_grid = mp_grid_create(0,0,ceil(room_width/32),ceil(room_height/32),32,32);
mp_grid_add_instances(pathfinding_grid, obj_hole, false);