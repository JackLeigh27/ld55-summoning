/// @description Transition

if(type == ETRANSITION_TYPE.OUT)
{
	room_goto(transition_to_room);
	type = ETRANSITION_TYPE.IN;
	alarm[0] = transition_duration;
}
else if(type == ETRANSITION_TYPE.IN)
{
	instance_destroy();
}