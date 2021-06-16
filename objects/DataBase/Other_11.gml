/// @description Buffs/DeBuffs

//regen Buff
regenBuffEffect = 0.5;

//health Buff
healthBuffEffect = 1.5;

//resistenceBuff
resistBuffEffect = 0.2;
resistBuffCooldown = 2.5;
resistBuffEffectDuration = 2.5;

//staminaBuff
staminaBuffEffect = 2;

//agility
agilityBuffJogSpeed = 1;
agilityBuffSprintSpeed = 2;

//reload Buff
reloadBuffEffect = 0.6;

//ammo Buff
ammoBuffAmmo = 1.3;
ammoBuffMag = 1.5;

//damage Buff
damageBuffFire = 0.5;
damageBuffBullet = 1;
damageBuffElectric = 0.5;
damageBuffShotgun = 1;
damageBuffMelee = 3;
damageBuffMythic = 2;
damageBuffExplosive = 4;

//critical Buff
criticalBuffEffect = 0.1;

//scout Buff
scoutBuffHealthRate = 0.35;
scoutBuffDamage = 0.5;
scoutBuffShowHealthTime = 2.5;

//medic Buff
medicBuffRange = 7 * global.worldUnit;//radius in world units
medicBuffRegenHealth = 1;
medicBuffChanceItemNotConsume = 0.5;
medicBuffReviveFactor = 2;

//demo Buff
demoBuffAddGrenade = 2;
demoBuffChanceGrenadeNotConsume = 0.35;
demoBuffCooldown = 150;//seconds



//debuff ignite
deBuffStack[DeBuff.Ignite] = true;
deBuffDuration[DeBuff.Ignite] = SetStat(irandom_range(3, 5), irandom_range(5, 7), irandom_range(5, 7), irandom_range(5, 7));
deBuffDamage[DeBuff.Ignite] = 1;
deBuffCurable[DeBuff.Ignite] = false;

//debuff acid
deBuffStack[DeBuff.Acid] = true;
deBuffDuration[DeBuff.Acid] = SetStat(irandom_range(8, 10), irandom_range(10, 12), irandom_range(10, 12), irandom_range(10, 12));
deBuffDamage[DeBuff.Acid] = 1;
deBuffCurable[DeBuff.Acid] = true;

//debuff bleed
deBuffStack[DeBuff.Bleed] = true;
deBuffDuration[DeBuff.Bleed] = SetStat(irandom_range(2, 4), irandom_range(4, 6), irandom_range(4, 6), irandom_range(4, 6));
deBuffDamage[DeBuff.Bleed] = 2;
deBuffCurable[DeBuff.Bleed] = true;

//debuff poison
deBuffStack[DeBuff.Poison] = false;
deBuffDuration[DeBuff.Poison] = 120;
deBuffCurable[DeBuff.Poison] = true;

deBuffDamageEasy = 33;
deBuffDamageMed = 66;
deBuffDamageHard = 99;
deBuffDamageVeryHard = 9999;

//debuff radiation
deBuffStack[DeBuff.Radiation] = true;
deBuffDuration[DeBuff.Radiation] = SetStat(irandom_range(5, 7), irandom_range(7, 9), irandom_range(7, 9), irandom_range(7, 9));;
deBuffCurable[DeBuff.Radiation] = true;
deBuffPlayerHealth = 0.75;
deBuffZombieHealth = 1.25;
deBuffPlayerDamageTaken = 1.20;
deBuffZombieDamageTaken = 0.80;
