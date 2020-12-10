/// @description Buffs/DeBuffs

//regen Buff
buffPrice[Buff.Regeneration] = 1500;
regenBuffEffect = 0.5;

//health Buff
buffPrice[Buff.Health] = 1500;
healthBuffEffect = 1.5;

//resistenceBuff
buffPrice[Buff.Resistance] = 1500;
resistBuffEffect = 0.2;

//staminaBuff
buffPrice[Buff.Stamina] = 1500;
staminaBuffEffect = 2;

//agility
buffPrice[Buff.Agility] = 1500;
agilityBuffJogSpeed = 1;
agilityBuffSprintSpeed = 2;

//reload Buff
buffPrice[Buff.Reload] = 1500;
reloadBuffEffect = 1;

//ammo Buff
buffPrice[Buff.Ammo] = 1500;
ammoBuffAmmo = 1.3;
ammoBuffMag = 1.5;

//damage Buff
buffPrice[Buff.Damage] = 1500;
damageBuffFire = 0.5;
damageBuffBullet = 1;
damageBuffElectric = 1;
damageBuffShotgun = 1;
damageBuffMelee = 2;
damageBuffExplosive = 3;

//critical Buff
buffPrice[Buff.Critical] = 1500;
criticalBuffEffect = 0.05;

//scout Buff
buffPrice[Buff.Scout] = 1500;
scoutBuffHealthRate = 0.5;
scoutBuffDamage = 1;
scoutBuffShowHealthTime = 2.5;

//medic Buff
buffPrice[Buff.Medic] = 1500;
medicBuffRange = 5 *  global.worldUnit;//radius in world units
medicBuffRegenHealth = 1;
medicBuffChanceItemNotConsume = 0.5;
medicBuffReviveFactor = 2;

//demo Buff
buffPrice[Buff.Demo] = 1500;
demoBuffAddGrenade = 2;
demoBuffChanceGrenadeNotConsume = 0.35;
demoBuffCooldown = 180;//seconds



//debuff ignite
deBuffStack[DeBuff.Ignite] = true;
deBuffDuration[DeBuff.Ignite] = 5;
deBuffDamage[DeBuff.Ignite] = 1;
deBuffCurable[DeBuff.Ignite] = false;

//debuff acid
deBuffStack[DeBuff.Acid] = true;
deBuffDuration[DeBuff.Acid] = 10;
deBuffDamage[DeBuff.Acid] = 1;
deBuffCurable[DeBuff.Acid] = true;

//debuff bleed
deBuffStack[DeBuff.Bleed] = true;
deBuffDuration[DeBuff.Bleed] = 4;
deBuffDamage[DeBuff.Bleed] = 2;
deBuffCurable[DeBuff.Bleed] = true;

//debuff poison
deBuffStack[DeBuff.Poison] = false;
deBuffDuration[DeBuff.Poison] = 120;
deBuffDamage[DeBuff.Poison] = 9999;
deBuffCurable[DeBuff.Poison] = true;