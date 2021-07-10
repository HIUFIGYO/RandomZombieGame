event_inherited();

name = "Blade";

spriteIdle = spr_bladeidle;
spriteWalk = spr_bladerun;
spriteAttack[0] = spr_bladeatk1;
spriteAttack[1] = spr_bladeatk2;
spriteDead = spr_bladedead;
spriteGibs = spr_bladegibs;

damage = SetStat(10, 17, 25, 34);
structureDamage = 17;
hp = SetStat(14, 17, 20, 26) * (1 + ((global.playerAmount - 1) * 0.2));
maxHp = hp;
moveSpeed = SetZombieSpeed(4.5);
bounty = (70 * (SetStat(1.2, 1, 0.9, 0.8))) * (1+ ((global.playerAmount -1) * 0.2));
maxBounty = bounty;
attackRange = 16;
attackSpeed = 0.4;

structureBonusDamage = 2;