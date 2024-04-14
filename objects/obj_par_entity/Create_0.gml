/// @description Initialize entity

scr_register_entity(id);

pause_level = EPAUSELEVEL.GAME_SOFT_FROZEN;

depth = scr_entity_get_depth(id);

function update_begin()
{
	
}

function update()
{
	
}

function update_paused_base()
{
	for(var _i = 0; _i <= 11; _i++)
		if(alarm[_i]>1)
			alarm[_i]++;
}

function update_paused()
{
	
}

function update_end()
{
	
}