function scr_player_state_dying()
{
	with(obj_par_hazard)
		instance_destroy();
		
	with(obj_par_wizard)
		instance_destroy();
		
	with(obj_par_projectile)
		instance_destroy();
		
	with(obj_wizard_spell)
		instance_destroy();
		
	if(vspd < 0 or y < death_start_y)
	{
		hspd = horizontal_facing * -death_slide_speed;
		vspd = min(vspd + death_gravity, death_terminal_velocity);
	}
	else
	{
		y = death_start_y;
		hspd = lerp(hspd, 0, 0.05);
		vspd = 0;
	}
	
	x += hspd;
	y += vspd;
	
	if(vspd > 0 and y >= death_start_y)
	{
		vspd = 0;
		y = death_start_y;
		scr_scale_delayed(1.15,0.85,3);
		instance_create_depth(0,0,0,obj_game_over);
	}

}