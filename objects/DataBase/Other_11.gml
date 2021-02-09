/// @description Buffs/DeBuffs

//regen Buff
buffName[Buff.Regeneration] = "Regeneration";
buffDescription[Buff.Regeneration] = "";
buffPrice[Buff.Regeneration] = 1500;
regenBuffEffect = 0.5;

//health Buff
buffName[Buff.Health] = "Health";
buffDescription[Buff.Health] = "";
buffPrice[Buff.Health] = 1500;
healthBuffEffect = 1.5;

//resistenceBuff
buffName[Buff.Resistance] = "Resistance";
buffDescription[Buff.Resistance] = "";
buffPrice[Buff.Resistance] = 1500;
resistBuffEffect = 0.2;
resistBuffCooldown = 2.5;
resistBuffEffectDuration = 2.5;

//staminaBuff
buffName[Buff.Stamina] = "Stamina";
buffDescription[Buff.Stamina] = "";
buffPrice[Buff.Stamina] = 1500;
staminaBuffEffect = 2;

//agility
buffName[Buff.Agility] = "Agility";
buffDescription[Buff.Agility] = "";
buffPrice[Buff.Agility] = 1500;
agilityBuffJogSpeed = 1;
agilityBuffSprintSpeed = 2;

//reload Buff
buffName[Buff.Reload] = "Reload";
buffDescription[Buff.Reload] = "";
buffPrice[Buff.Reload] = 1500;
reloadBuffEffect = 1;

//ammo Buff
buffName[Buff.Ammo] = "Ammo";
buffDescription[Buff.Ammo] = "";
buffPrice[Buff.Ammo] = 1500;
ammoBuffAmmo = 1.3;
ammoBuffMag = 1.5;

//damage Buff
buffName[Buff.Damage] = "Damage";
buffDescription[Buff.Damage] = "";
buffPrice[Buff.Damage] = 1500;
damageBuffFire = 0.5;
damageBuffBullet = 1;
damageBuffElectric = 1;
damageBuffShotgun = 1;
damageBuffMelee = 2;
damageBuffExplosive = 3;

//critical Buff
buffName[Buff.Critical] = "Critical";
buffDescription[Buff.Critical] = "";
buffPrice[Buff.Critical] = 1500;
criticalBuffEffect = 0.05;

//scout Buff
buffName[Buff.Scout] = "Scout";
buffDescription[Buff.Scout] = "";
buffPrice[Buff.Scout] = 1500;
scoutBuffHealthRate = 0.35;
scoutBuffDamage = 0.5;
scoutBuffShowHealthTime = 2.5;

//medic Buff
buffName[Buff.Medic] = "Medic";
buffDescription[Buff.Medic] = "";
buffPrice[Buff.Medic] = 1500;
medicBuffRange = 5 *  global.worldUnit;//radius in world units
medicBuffRegenHealth = 1;
medicBuffChanceItemNotConsume = 0.5;
medicBuffReviveFactor = 2;

//demo Buff
buffName[Buff.Demo] = "Demo";
buffDescription[Buff.Demo] = "";
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
deBuffCurable[DeBuff.Poison] = true;
deBuffDamageEasy = 33;
deBuffDamageMed = 66;
deBuffDamageHard = 99;
deBuffDamageVeryHard = 9999;
