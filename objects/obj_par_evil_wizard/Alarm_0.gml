/// @description Cast cooldown

var _next = order[0];

array_delete(order, 0, 1);
array_push(order, _next);

if(_next == ECAST_TYPE.SUMMON)
	cast_summon()
else if(_next == ECAST_TYPE.SPELL)
	cast_spell();
	
scr_scale_delayed(0.9,0.9,3);

alarm[0] = cast_rate;

sprite_index = _next == ECAST_TYPE.SPELL ? spr_evil_wizard_recovery : spr_evil_wizard_summon_recovery;