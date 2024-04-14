/// @description Initialize

// Inherit the parent event
event_inherited();

depth = -50;

upgrade_index = obj_par_upgrade;

function draw()
{
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		scale_x_tween,
		scale_y_tween,
		image_angle,
		image_blend,
		image_alpha
	);
	
	draw_sprite_ext(
		upgrade_index.sprite_index,
		0,
		x,
		y,
		scale_x_tween,
		scale_y_tween,
		image_angle,
		image_blend,
		image_alpha
	);
}