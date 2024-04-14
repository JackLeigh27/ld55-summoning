/// @description Initialize

event_inherited();

upgrades_to_show = 3;
upgrade_pool = [];

if(array_length(obj_level_manager.registered_upgrades)>=5)
	upgrade_pool = obj_level_manager.registered_upgrades
else
{
	with(obj_par_upgrade)
		array_push(other.upgrade_pool, object_index);
}

buttons = [];
button_highlighted = 1;

depth = -10;

var _upgrade_pool_shuffled = array_shuffle(upgrade_pool);

for(var _i = -1; _i <= 1; _i++)
{
	var _button = instance_create_depth(room_width/2 + (room_width/3)*_i,room_height/2,-2,obj_upgrade_button);
	_button.upgrade_index = _upgrade_pool_shuffled[_i + 1];
	
	array_push(buttons, _button);
}

function update()
{
	button_highlighted = -1;
	
	if(instance_exists(obj_transition))
		return;
		
	for(var _i = 0; _i < array_length(buttons); _i++)
	{
		with(buttons[_i])
		{
			if(mouse_x > bbox_left and mouse_y > bbox_top and mouse_x < bbox_right and mouse_y < bbox_bottom)
			{
				other.button_highlighted = _i;
				if(obj_input_manager.shoot_pressed)
				{
					if(!scr_has_upgrade(upgrade_index))
						array_push(obj_level_manager.registered_upgrades,upgrade_index);
						
					upgrade_index.levels++;
					scr_next_level();
				}
			}
		}
	}
}