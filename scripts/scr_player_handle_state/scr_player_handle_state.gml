function scr_player_handle_state()
{
	switch(state)
	{
		case EPLAYER_STATE.DEFAULT:
			scr_player_state_default();
			scr_player_state_default_animation();
			break;
			
		case EPLAYER_STATE.HURT:
			scr_player_state_hurt();
			scr_player_state_hurt_animation();
			break;
			
		case EPLAYER_STATE.FALLING:
			scr_player_state_falling();
			scr_player_state_falling_animation();
			break;
			
		case EPLAYER_STATE.DYING:
			scr_player_state_dying();
			scr_player_state_dying_animation();
			break;
	}
}