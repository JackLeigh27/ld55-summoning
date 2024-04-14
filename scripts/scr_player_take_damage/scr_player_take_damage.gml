function scr_player_take_damage(_amount)
{
	if(scr_has_upgrade_3(obj_upgrade_salus) and hp > 1 and hp-_amount < 1)
		hp = 1
	else
		hp -= _amount;
		
	if(hp<=0)
		scr_player_die();
}