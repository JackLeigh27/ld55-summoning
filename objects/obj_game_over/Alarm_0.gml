/// @description States

if(state >= EGAME_OVER_STATE.SHOW_BUTTON)
	exit;
	
state = state + 1;

if(state == EGAME_OVER_STATE.SHOW_NEW_HIGH_SCORE and (obj_level_manager.level-1) <= obj_game.high_score)
{
	state++;
	hide_high_score_text = true;
}
else
	obj_game.high_score = obj_level_manager.level-1;

alarm[0] = durations[state];