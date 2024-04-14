/// @description Draw

if(room == rm_upgrade_select)
{
	depth = -1;
	draw_sprite_ext(spr_upgrade_portal,(current_time div 300) mod sprite_get_number(spr_upgrade_portal),room_width/2,room_height/2,2,2,(current_time div 50) mod 360, c_white,1);
	exit;
}

depth = room_height;

with(obj_par_player)
{
	if(state != EPLAYER_STATE.FALLING)
		scr_draw_character_shadow(x,y,1,1);
}

with(obj_par_wizard)
{
	scr_draw_character_shadow(x,y,1,1);
}

with(obj_par_enemy)
{
	var _x_scale = clamp(1-z/sprite_height,0.5,1);
	var _y_scale = clamp(1-z/sprite_height,0.5,1);
	
	scr_draw_character_shadow(x,y,_x_scale,_y_scale);
}