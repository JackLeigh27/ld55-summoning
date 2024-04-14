function scr_draw_character_shadow(_x,_y,_x_multiplier, _y_multiplier)
{
	var _shadow_width = sprite_get_width(spr_character_shadow) * SCALE_BASE;
	var _shadow_height = sprite_get_height(spr_character_shadow) * SCALE_BASE;
	
	var _sprite_width = sprite_get_width(object_get_sprite(object_index)) * scale_x_tween;
	var _sprite_height = sprite_get_height(object_get_sprite(object_index)) * scale_y_tween;

	var _shadow_x_scale = (_shadow_width / _sprite_width) * _x_multiplier;
	var _shadow_y_scale = (_shadow_height / _sprite_height) * _y_multiplier;
	
	draw_sprite_ext(spr_character_shadow,0,x,y,scale_x_tween * _shadow_x_scale,scale_y_tween * _shadow_y_scale,image_angle,image_blend,image_alpha);
}