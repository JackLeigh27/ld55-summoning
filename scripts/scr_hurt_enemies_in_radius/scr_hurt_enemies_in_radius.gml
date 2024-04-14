function scr_hurt_enemies_in_radius()
{
	var _hurt = false;
	
	with(obj_par_enemy)
	{
		if(point_distance(x,y,other.x,other.y)<=other.radius)
		{
			if(choose(1,0,0,0,0,0,0,0))
			{
				scr_camera_shake(1);
				audio_play_sound(choose(snd_enemy_hurt_1, snd_enemy_hurt_2, snd_enemy_hurt_3, snd_enemy_hurt_4),0,false);
			}
		
			hp -= other.damage;
			alarm[11] = 1;
		
			scr_scale(random_range(0.8,1.2),random_range(0.8,1.2));
			
			_hurt = true;
		
			if(hp <= 0)
			{
				scr_camera_shake(10);
				audio_play_sound(snd_enemy_die,0,false);
				on_kill();
				instance_destroy();
			}
		}
	}
	
	return _hurt;
}