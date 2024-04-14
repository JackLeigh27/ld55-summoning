/// @description Spawn

var _point = instance_create_depth(x,y,0,obj_fuel_point);

fuel_amount -= _point.amount;

if(fuel_amount <= 0)
	instance_destroy();
	
alarm[0] = tick_rate;