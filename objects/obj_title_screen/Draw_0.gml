/// @description Draw

draw_sprite_ext(spr_upgrade_portal,(current_time div 300) mod sprite_get_number(spr_upgrade_portal),room_width/2,room_height/2,2,2,(current_time div 50) mod 360, c_white,1);

draw_sprite_ext(spr_logo,0,GAME_WIDTH/2,64 + sin(degtorad(current_time div 15)) * 8,SCALE_BASE,SCALE_BASE,0,c_white,1);

draw_set_font(fnt_upgrade_description);

draw_set_halign(fa_center);
draw_set_valign(fa_bottom);

var _text =
@"W/A/S/D keys to MOVE
Left click to SHOOT
F1 to TOGGLE FULLSCREEN

SHOOT to start!";

scr_draw_text_shadow(GAME_WIDTH/2,GAME_HEIGHT-64,_text,1,1,c_white,make_colour_rgb(24,20,37),SCALE_BASE);