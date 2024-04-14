/// @description Initialize scaling

// Inherit the parent event
event_inherited();

scr_initialize_scaling_variables(SCALE_BASE, SCALE_TWEEN_SPEED);

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
}