/// @description Fall

state = EPLAYER_STATE.DEFAULT;

var _nearest_spawn = instance_nearest(x,y,obj_enemy_spawn_point);
x = _nearest_spawn.x;
y = _nearest_spawn.y;

scr_player_take_damage(2);