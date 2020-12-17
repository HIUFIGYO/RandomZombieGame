/// @description OnPlayerDeath

if(CheckBuff(id, Buff.Demo)and buffCooldown[0] <= 0)
{
	buffCooldown[0] = DataBase.demoBuffCooldown;
	RevivePlayer(id, 1);
	CreateExplosion(id, id);
}