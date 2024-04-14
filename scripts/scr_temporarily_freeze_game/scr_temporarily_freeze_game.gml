function scr_temporarily_freeze_game(_duration)
{
	obj_entity_manager.pause_level = EPAUSELEVEL.GAME_SOFT_FROZEN;
	obj_entity_manager.alarm[0] = _duration;
}