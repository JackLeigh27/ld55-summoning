/// @description Initialize

state = EGAME_OVER_STATE.INTRO;

durations = [];

durations[EGAME_OVER_STATE.INTRO] = 60;
durations[EGAME_OVER_STATE.SHOW_GAME_OVER_TEXT] = 60;
durations[EGAME_OVER_STATE.SHOW_LEVELS_CLEARED] = 60;
durations[EGAME_OVER_STATE.SHOW_NEW_HIGH_SCORE] = 60;
durations[EGAME_OVER_STATE.SHOW_TIME_SPENT] = 60;
durations[EGAME_OVER_STATE.SHOW_BUTTON] = -1;

alarm[0] = 60;

obj_level_manager.end_time = current_time;

hide_high_score_text = false;