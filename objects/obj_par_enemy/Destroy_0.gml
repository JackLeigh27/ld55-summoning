/// @description Spawn fuel ticker

var _ticker = instance_create_depth(x,y,0,obj_fuel_point_ticker);
_ticker.fuel_amount = base_hp div 5;