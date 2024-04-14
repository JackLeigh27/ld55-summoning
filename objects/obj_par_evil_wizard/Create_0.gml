/// @description Initialize

// Inherit the parent event
event_inherited();

base_hp = 1200;
hp = scr_scale_value_with_level(base_hp, 1.2, 0);
hp_max = hp;

horizontal_facing = 1;

cast_rate = 150;
spell_frequency = 3;

if(obj_level_manager.level > 20)
{
	cast_rate = 60;
	spell_frequency = 6;
}
if(obj_level_manager.level > 15)
{
	cast_rate = 75;
	spell_frequency = 5;
}
else if(obj_level_manager.level > 10)
{
	cast_rate = 90;
	spell_frequency = 4;
}
else if(obj_level_manager.level > 5)
{
	cast_rate = 120;
	spell_frequency = 3;
}

order = [];

cast_animation_threshold = round(cast_rate / 2);

function initialize()
{
	array_push(order, ECAST_TYPE.SUMMON);
	repeat(spell_frequency)
		array_push(order, ECAST_TYPE.SPELL);
}

function update()
{
	if(alarm[0] == -1)
	{
		alarm[0] = obj_level_manager.level == 1 ? 90 : 30;
		initialize();
	}
	
	if(alarm[0] <= cast_animation_threshold)
	{
		var _percent = 1-(alarm[0]/cast_animation_threshold);
		sprite_index = order[0] == ECAST_TYPE.SPELL ? spr_evil_wizard_cast : spr_evil_wizard_summon;
		image_index = sprite_get_number(sprite_index) * _percent;
		
		if(order[0] == ECAST_TYPE.SPELL and !audio_is_playing(snd_enemy_wizard_charge))
			audio_play_sound(snd_enemy_wizard_charge,0,false)
		else if(order[0] == ECAST_TYPE.SUMMON and !audio_is_playing(snd_enemy_wizard_charge_summon))
			audio_play_sound(snd_enemy_wizard_charge_summon,0,false);
	}
	
	var _was_facing = horizontal_facing;
	if(instance_exists(obj_par_player))
	{
		if(obj_par_player.x > x)
			horizontal_facing = 1
		else
			horizontal_facing = -1;
	}
	
	if(horizontal_facing != _was_facing)
		scr_scale(0.7,1.3);
}

function cast_spell()
{
	if(point_distance(x,y,obj_par_player.x,obj_par_player.y)<160)
		spell_circle()
	else
		spell_missile();
}

function spell_circle()
{
	var _count = 8 + ((obj_level_manager.level-1) div 3);
	var _spread = 360;
	var _spread_individual = _spread / _count;
	
	var _offset = irandom(_spread_individual);
	
	var _projectile_speed = min(scr_scale_value_with_level(1.5, 1, 0.05),3);
	
	for(var _i = 0; _i < _count; _i++)
	{
		var _projectile = scr_shoot_hazard_projectile(x,y-sprite_height/2,_projectile_speed,_i*_spread_individual + _offset);
	}
	
	audio_play_sound(snd_enemy_wizard_spell_circle,0,false);
}

function spell_missile()
{
	var _projectile_speed = min(scr_scale_value_with_level(3, 1, 0.15),8);
	
	var _projectile = scr_shoot_hazard_projectile(x,y-sprite_height/2,_projectile_speed,point_direction(x,y,obj_par_player.x,obj_par_player.y));
	with(_projectile)
		scr_initialize_scaling_variables(SCALE_BASE * 3, SCALE_TWEEN_SPEED);
		
	audio_play_sound(snd_enemy_wizard_spell_missile,0,false);
}

function cast_summon()
{
	var _enemy_struct = choose(
		{type:obj_enemy_slime, count:min(round(scr_scale_value_with_level(3,1,0.2)),9)},
		{type:obj_enemy_skeleton, count:min(round(scr_scale_value_with_level(2,1,0.2)),6)}
	);
	
	var _enemy_type = _enemy_struct.type;
	var _spawn_count = _enemy_struct.count;
	
	var _spawn_points = [];
	
	with(obj_enemy_spawn_point)
		if(point_distance(x,y,obj_par_player.x,obj_par_player.y)>=80)
			array_push(_spawn_points, id);
			
	_spawn_points = array_shuffle(_spawn_points);
	for(var _i = 0; _i < _spawn_count; _i++)
	{
		var _spawn = _spawn_points[_i];
		var _enemy_spawner = instance_create_depth(_spawn.x, _spawn.y, 0, obj_enemy_spawner);
		_enemy_spawner.enemy_type = _enemy_type;
	}
	
	audio_play_sound(snd_enemy_wizard_summon,0,false);
	
	scr_camera_shake(10);
}

function on_kill()
{
	with(obj_par_hazard)
		instance_destroy();
		
	scr_finish_level();	
}

function draw()
{
	draw_sprite_ext(
		sprite_index,
		image_index,
		x,
		y,
		horizontal_facing * scale_x_tween,
		scale_y_tween,
		image_angle,
		image_blend,
		image_alpha
	);
}