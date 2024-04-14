/// @description Initialize

// Inherit the parent event
event_inherited();

amount = 5;

function update()
{
	var _player_x = obj_par_player.x - obj_par_player.sprite_xoffset + obj_par_player.sprite_width/2;
	var _player_y = obj_par_player.y - obj_par_player.sprite_yoffset + obj_par_player.sprite_height/2;
	
	x = lerp(x, _player_x, 0.2);
	y = lerp(y, _player_y, 0.2);
	
	depth = obj_par_player.depth + 1;
	
	if(point_distance(x,y,obj_par_player.x,obj_par_player.y)<=32)
	{
		instance_destroy();
		obj_par_player.fuel = min(obj_par_player.fuel + amount, obj_par_player.fuel_max);
	}
}