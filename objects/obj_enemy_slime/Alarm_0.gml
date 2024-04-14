/// @description State change

state = (state + 1) mod ESLIME_STATE.COUNT;
alarm[0] = durations[state];

switch(state)
{
	case ESLIME_STATE.JUMP_CHARGE:
		scr_enemy_pathing_to_player();
		jump_direction = scr_enemy_pathing_direction();
		break;
		
	case ESLIME_STATE.JUMPING:
		scr_scale_delayed(1.3,0.7, 3);
		
		jump_start_x = x;
		jump_start_y = y;
		
		jump_end_x = jump_start_x + lengthdir_x(move_speed * durations[ESLIME_STATE.JUMPING], jump_direction);
		jump_end_y = jump_start_y + lengthdir_y(move_speed * durations[ESLIME_STATE.JUMPING], jump_direction);
		
		can_hurt = true;
		
		audio_play_sound(choose(snd_enemy_slime_jump_1,snd_enemy_slime_jump_2,snd_enemy_slime_jump_3),0,false);
		
		break;
		
	default:
		scr_scale(0.9,0.9);
		can_hurt = false;
		break;
}