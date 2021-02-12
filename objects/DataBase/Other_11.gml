/// @description Buffs/DeBuffs

//regen Buff
buffName[Buff.Regeneration] = "Regeneration";
buffDescription[Buff.Regeneration] = "Reduce regeneration rate by 50%\nPrice: $1500";
buffPrice[Buff.Regeneration] = 1500;
regenBuffEffect = 0.5;

//health Buff
buffName[Buff.Health] = "Health";
buffDescription[Buff.Health] = "Increases max health by 50%\nPrice: $1500";
buffPrice[Buff.Health] = 1500;
healthBuffEffect = 1.5;

//resistenceBuff
buffName[Buff.Resistance] = "Resistance";
buffDescription[Buff.Resistance] = "Reduce damage taken by 20%\n+20% damage reduction for 2.5 seconds after taking damage (Cooldown: 2.5 seconds)\nPrice: $1500";
buffPrice[Buff.Resistance] = 1500;
resistBuffEffect = 0.2;
resistBuffCooldown = 2.5;
resistBuffEffectDuration = 2.5;

//staminaBuff
buffName[Buff.Stamina] = "Stamina";
buffDescription[Buff.Stamina] = "Increas max stamina by 100%\nPrice: $1500";
buffPrice[Buff.Stamina] = 1500;
staminaBuffEffect = 2;

//agility
buffName[Buff.Agility] = "Agility";
buffDescription[Buff.Agility] = "Increase jog speed by 1\nIncrease sprint speed by 2\nPrice: $1500";
buffPrice[Buff.Agility] = 1500;
agilityBuffJogSpeed = 1;
agilityBuffSprintSpeed = 2;

//reload Buff
buffName[Buff.Reload] = "Reload";
buffDescription[Buff.Reload] = "Reduce reload speeds by 1 second (Minimum 1 second reloads)\nPrice: $1500";
buffPrice[Buff.Reload] = 1500;
reloadBuffEffect = 1;

//ammo Buff
buffName[Buff.Ammo] = "Ammo";
buffDescription[Buff.Ammo] = "Increase mag size by 50%\nIncrease max ammo by 30%\nPrice: $1500";
buffPrice[Buff.Ammo] = 1500;
ammoBuffAmmo = 1.3;
ammoBuffMag = 1.5;

//damage Buff
buffName[Buff.Damage] = "Damage";
buffDescription[Buff.Damage] = "Increase flame damage by 0.5\nIncrease bullet and electric damage by 1\nIncrease pellet count by 1\nIncrease melee damage by 2\nIncrease explosive damage by 3\nPrice: $1500";
buffPrice[Buff.Damage] = 1500;
damageBuffFire = 0.5;
damageBuffBullet = 1;
damageBuffElectric = 1;
damageBuffShotgun = 1;
damageBuffMelee = 2;
damageBuffExplosive = 3;

//critical Buff
buffName[Buff.Critical] = "Critical";
buffDescription[Buff.Critical] = "Gain 5% chance to deal double damage\nPrice: $1500";
buffPrice[Buff.Critical] = 1500;
criticalBuffEffect = 0.05;

//scout Buff
buffName[Buff.Scout] = "Scout";
buffDescription[Buff.Scout] = "Gain the ability to see damaged enemies health\nCan see cloaked enemies\nIncrease damage by 0.5 to enemies below 35% health\nPrice: $1500";
buffPrice[Buff.Scout] = 1500;
scoutBuffHealthRate = 0.35;
scoutBuffDamage = 0.5;
scoutBuffShowHealthTime = 2.5;

//medic Buff
buffName[Buff.Medic] = "Medic";
buffDescription[Buff.Medic] = "Increase nearby teammates health regeneration by 1\n50% chance not to consume healing items\nRevive speed is doubled\nPrice: $1500";
buffPrice[Buff.Medic] = 1500;
medicBuffRange = 5 *  global.worldUnit;//radius in world units
medicBuffRegenHealth = 1;
medicBuffChanceItemNotConsume = 0.5;
medicBuffReviveFactor = 2;

//demo Buff
buffName[Buff.Demo] = "Demo";
buffDescription[Buff.Demo] = "Increase maximum explosives by 2\n35% chance not to consume explosives\nIf hit with a lethal attack, explode and survive with 1 health (Cooldown: 180 seconds)\nPrice: $1500";
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
