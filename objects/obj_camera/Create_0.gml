/// @description Initialize camera

#macro VIEW view_camera[0]

event_inherited();

target_object = noone;

shake = 0;

function update_end()
{
	scr_camera_code();
}