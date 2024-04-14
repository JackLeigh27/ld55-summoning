/// @description Draw buttons

var _button_to_present = noone;

for(var _i = 0; _i < array_length(buttons); _i++)
{
	var _button = buttons[_i];
	
	if(_i == button_highlighted)
	{
		_button.scale_x_tween = lerp(_button.scale_x_tween,_button.scale_x,0.1);
		_button.scale_y_tween = lerp(_button.scale_y_tween,_button.scale_y,0.1);
		
		_button_to_present = _button;
	}
	else
	{
		_button.scale_x_tween = lerp(_button.scale_x_tween,_button.scale_x * 0.5,0.1);
		_button.scale_y_tween = lerp(_button.scale_y_tween,_button.scale_y * 0.5,0.1);
	}
}

draw_set_valign(fa_top);
draw_set_halign(fa_center);

draw_set_font(fnt_upgrade_name);

scr_draw_text_outline(room_width/2,32,"Choose an upgrade", c_white, make_colour_rgb(24,20,37),SCALE_BASE);

if(button_highlighted == -1 or instance_exists(obj_transition))
	exit;

draw_set_valign(fa_bottom);

draw_set_font(fnt_upgrade_description);

scr_draw_text_outline(room_width/2,room_height - 32,_button_to_present.upgrade_index.upgrade_description, c_white, make_colour_rgb(24,20,37),SCALE_BASE);
var _string_height = string_height("A") * SCALE_BASE * 2.25;

draw_set_font(fnt_upgrade_name);

var _upgrade_title = _button_to_present.upgrade_index.upgrade_name;
if(_button_to_present.upgrade_index.levels > 0)
	_upgrade_title = string("{0} {1}", _upgrade_title, _button_to_present.upgrade_index.levels+1);
	
scr_draw_text_outline(room_width/2,room_height - 32 - _string_height, _upgrade_title, c_white, make_colour_rgb(24,20,37),SCALE_BASE);

