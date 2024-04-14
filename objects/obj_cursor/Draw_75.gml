/// @description Draw

var _cursor_sprite = spr_cursor_crosshair;
var _cursor_index = obj_input_manager.shoot_held;

if(!instance_exists(obj_level_manager) or room == rm_upgrade_select or (instance_exists(obj_par_player) and obj_par_player.state == EPLAYER_STATE.DYING))
	_cursor_sprite = spr_cursor;
	
draw_sprite_ext(_cursor_sprite,_cursor_index,x,y,SCALE_BASE,SCALE_BASE,0,c_white,1);