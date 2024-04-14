/// @description Draw player health

if(!instance_exists(obj_par_player) or obj_par_player.state == EPLAYER_STATE.DYING)
	exit;
	
var _hp_sprite = spr_player_hp;
var _hp_x = 16;
var _hp_y = 16;

for(var _i = 0; _i < obj_par_player.hp_max; _i++)
{
	if(_i >= obj_par_player.hp)
		_hp_sprite = spr_player_hp_empty;
		
	draw_sprite_ext(_hp_sprite, (current_time div 200) mod sprite_get_number(_hp_sprite), _hp_x + _i * ((sprite_get_width(_hp_sprite) + 4) * SCALE_BASE), _hp_y, SCALE_BASE, SCALE_BASE, 0, c_white, 1);
}

draw_set_font(fnt_level_counter);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

scr_draw_text_outline(16,room_height-16,string("Level {0}", level), c_white, make_colour_rgb(24,20,37), SCALE_BASE);
var _string_height = string_height("Level 0") * SCALE_BASE;

if(array_length(registered_upgrades)==0)
	exit;

var _upgrade_width = sprite_get_width(spr_upgrade_ignis) * SCALE_BASE;
var _upgrade_height = sprite_get_height(spr_upgrade_ignis) * SCALE_BASE;

var _upgrade_x = 16 + _upgrade_width / 2;
var _upgrade_y = room_height - 16 - _upgrade_height - _string_height;

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);

draw_set_font(fnt_upgrade_level);

for(var _i = 0; _i < array_length(registered_upgrades); _i++)
{
	draw_sprite_ext(registered_upgrades[_i].sprite_index, 0, _upgrade_x + _i * _upgrade_width + 4, _upgrade_y + 4, SCALE_BASE, SCALE_BASE, 0, c_black, 1);
	draw_sprite_ext(registered_upgrades[_i].sprite_index, 0, _upgrade_x + _i * _upgrade_width, _upgrade_y, SCALE_BASE, SCALE_BASE, 0, c_white, 1);
	
	if(registered_upgrades[_i].levels > 1)
		scr_draw_text_outline(_upgrade_x + _i * _upgrade_width + _upgrade_width/2, _upgrade_y + _upgrade_height/2, string(registered_upgrades[_i].levels),c_white,make_colour_rgb(24,20,37),SCALE_BASE);
}