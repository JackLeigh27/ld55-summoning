function scr_hurt_enemy_on_touch()
{
	var _enemy_touching = instance_place(x,y,obj_par_enemy);
	
	if(_enemy_touching == noone)
		return;
	
	if(choose(1,0,0,0,0,0,0,0))
	{
		scr_camera_shake(1);
		audio_play_sound(choose(snd_enemy_hurt_1, snd_enemy_hurt_2, snd_enemy_hurt_3, snd_enemy_hurt_4),0,false);
	}
		
	_enemy_touching.hp -= damage;
	_enemy_touching.alarm[11] = 1;
		
	with(_enemy_touching)
		scr_scale(random_range(0.8,1.2),random_range(0.8,1.2));
		
	if(_enemy_touching.hp <= 0)
	{
		scr_camera_shake(10);
			
		with(_enemy_touching)
		{
			audio_play_sound(snd_enemy_die,0,false);
			on_kill();
			instance_destroy();
		}
	}
}