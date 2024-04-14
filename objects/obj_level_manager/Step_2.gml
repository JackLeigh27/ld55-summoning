/// @description Background position

var _background_layer = layer_get_id("Background");
layer_x(_background_layer, camera_get_view_x(VIEW));
layer_y(_background_layer, camera_get_view_y(VIEW));

if(instance_exists(obj_par_player) and obj_par_player.state == EPLAYER_STATE.DYING)
{
	audio_stop_sound(song);
	audio_stop_sound(song_upgrade);
}