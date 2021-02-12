/// @description Weapons

var i;
weapon = ds_grid_create(WeapStat.count, Weapon.count);

i=0; //Standard Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Name, i] = "Standard Melee";
weapon[# WeapStat.Description, i] = "Tier One Melee Weapon\nDamage: 3\nAttack Speed: 0.25\nPenetration: 0\nPrice: Free\nA small knife provided free of charge to use only against the weakest of enemies.";
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 0;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Standard Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Name, i] = "Standard Pistol";
weapon[# WeapStat.Description, i] = "Tier One Secondary Weapon\nDamage: 1\nFirerate: 0.1\nAccuracy: 95%\nMag Size: 12\nMax Ammo: 228\nReload Time: 1.5 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $250\nA cheap and reliable side arm capable of dealing with weak singular enemies.";
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 12;
weapon[# WeapStat.Ammo, i] = 228;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 1.5;
weapon[# WeapStat.Price, i] = 250;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 26;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Standard Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Name, i] = "Standard Rifle";
weapon[# WeapStat.Description, i] = "Tier One Primary Weapon\nDamage: 1\nFirerate: 0.1\nAccuracy: 95%\nMag Size: 30\nMax Ammo: 270\nReload Time: 2 Seconds\nPenetration: 0\nFire Mode: Full-Auto\nPrice: $500\nA versatile assault rifle most capable of dealing with large groups of weaker enemies.";
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.Price, i] = 500;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 24;
weapon[# WeapStat.yOffset, i] = 41;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Standard Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Name, i] = "Standard Shotgun";
weapon[# WeapStat.Description, i] = "Tier One Primary Weapon\nDamage: 1*5\nFirerate: 1\nAccuracy: 80%\nMag Size: 8\nMax Ammo: 72\nReload Time: 1 Second per missing shot\nPenetration: 1\nFire Mode: Semi-Auto\nPrice: $750\nA strong but slow early weapon that deals with both singular enemies and groups.";
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 1;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 72;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 750;
weapon[# WeapStat.BulletSpeed, i] = 50;
weapon[# WeapStat.xOffset, i] = 24;
weapon[# WeapStat.yOffset, i] = 33;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 5;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Advanced Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Name, i] = "Advanced Melee";
weapon[# WeapStat.Description, i] = "Tier Two Melee Weapon\nDamage: 6\nAttack Speed: 0.25\nPenetration: 1\nPrice: $1000\nA machete that can deal with most weak enemies in a single strike and has improved cleave.";
weapon[# WeapStat.Damage, i] = 6;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 1000;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Advanced Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Name, i] = "Advanced Pistol";
weapon[# WeapStat.Description, i] = "Tier Two Secondary Weapon\nDamage: 4\nFirerate: 0.15\nAccuracy: 95%\nMag Size: 8\nMax Ammo: 104\nReload Time: 2 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $1250\nA strong sidearm that can dispatch most weak enemies in only a couple shots.";
weapon[# WeapStat.Damage, i] = 4;
weapon[# WeapStat.FireRate, i] = 0.15;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 104;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.Price, i] = 1250;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 29;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Advanced Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Name, i] = "Advanced Rifle";
weapon[# WeapStat.Description, i] = "Tier Two Primary Weapon\nDamage: 2\nFirerate: 0.15\nAccuracy: 90%\nMag Size: 30\nMax Ammo: 270\nReload Time: 2.5 Seconds\nPenetration: 0\nFire Mode: Full-Auto\nPrice: $1500\nA slower but stronger assault rifle that excels at both single target and cround control damage.";
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.15;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.9;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.Price, i] = 1500;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 25;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Advanced Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Name, i] = "Advanced Shotgun";
weapon[# WeapStat.Description, i] = "Tier Two Primary Weapon\nDamage: 2*6\nFirerate: 0.1\nAccuracy: 75%\nMag Size: 2\nMax Ammo: 58\nReload Time: 3 Seconds\nPenetration: 1\nFire Mode: Semi-Auto\nPrice: $1750\nA powerful but slow double-barreled shotgun that can clear an entire room of enemies quickly.";
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 2;
weapon[# WeapStat.Ammo, i] = 58;
weapon[# WeapStat.Accuracy, i] = 0.75;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 1750;
weapon[# WeapStat.BulletSpeed, i] = 50;
weapon[# WeapStat.xOffset, i] = 23;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 6;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Super Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Name, i] = "Super Melee";
weapon[# WeapStat.Description, i] = "Tier Three Melee Weapon\nDamage: 9\nAttack Speed: 0.25\nPenetration: 2\nPrice: $2000\nA sword with even better cleave and damage that can easily dispatch all weak and most moderate strengthened enemies.";
weapon[# WeapStat.Damage, i] = 9;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 2000;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 3;

i++; //Super Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Name, i] = "Super Pistol";
weapon[# WeapStat.Description, i] = "Tier Three Secondary Weapon\nDamage: 8\nFirerate: 0.3\nAccuracy: 95.5%\nMag Size: 6\nMax Ammo: 84\nReload Time: 1 Second per missing shot\nPenetration: 1\nFire Mode: Semi-Auto\nPrice: $2250\nThe strongest pistol we have to offer, can clear a path and deal heavy damage to strong enemies, but be weary of your reload.";
weapon[# WeapStat.Damage, i] = 8;
weapon[# WeapStat.FireRate, i] = 0.3;
weapon[# WeapStat.Mag, i] = 6;
weapon[# WeapStat.Ammo, i] = 84;
weapon[# WeapStat.Accuracy, i] = 0.925;
weapon[# WeapStat.Range, i] = 3;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 2250;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 33;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Super Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Name, i] = "Super Rifle";
weapon[# WeapStat.Description, i] = "Tier Three Primary Weapon\nDamage: 3\nFirerate: 0.075\nAccuracy: 95%\nMag Size: 20\nMax Ammo: 280\nReload Time: 2.5 Seconds\nPenetration: 0\nFire Mode: Full-Auto\nPrice: $2500\nThe best assault rifle we got for you, with excellent cround control and single target damage.";
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.075;
weapon[# WeapStat.Mag, i] = 20;
weapon[# WeapStat.Ammo, i] = 280;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 3;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.Price, i] = 2500;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 29;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Super Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Name, i] = "Super Shotgun";
weapon[# WeapStat.Description, i] = "Tier Three Primary Weapon\nDamage: 1*7\nFirerate: 0.1\nAccuracy: 80%\nMag Size: 8\nMax Ammo: 72\nReload Time: 1 Second per missing shot\nPenetration: 1\nFire Mode: Semi-Auto\nPrice: $2750\nYou will never have to worry about being over run when you unload this semi-auto shotgun in a group of enemies, weak or strong.";
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 72;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 2750;
weapon[# WeapStat.BulletSpeed, i] = 50;
weapon[# WeapStat.xOffset, i] = 23;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 7;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Flamethrower
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Name, i] = "Flamethrower";
weapon[# WeapStat.Description, i] = "Tier Four Primary Weapon\nDamage: 0.5\nFirerate: 0.1\nAccuracy: 85%\nMag Size: 50\nMax Ammo: 350\nReload Time: 3 Seconds\nPenetration: 1\nFire Mode: Full-Auto\nPrice: $3000\n100% chance to apply IGNITE\nIf you like the smell of flesh burning then look no further than to buy this here Flame Thrower.";
weapon[# WeapStat.Damage, i] = 0.5;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 350;
weapon[# WeapStat.Accuracy, i] = 0.85;
weapon[# WeapStat.Range, i] = 0.25;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3000;
weapon[# WeapStat.BulletSpeed, i] = 30;
weapon[# WeapStat.xOffset, i] = 30;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 2;

i++; //Rocket Launcher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Name, i] = "Rocket Launcher";
weapon[# WeapStat.Description, i] = "Tier Four Primary Weapon\nDamage: Impact-20 Explosion-10\nFirerate: 1\nAccuracy: 95%\nMag Size: 1\nMax Ammo: 19\nReload Time: 4 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $3250\nOne of the strongest weapons here we have to offer. Just be mindful of when you fire, you will be reloading a lot.";
weapon[# WeapStat.Damage, i] = 20;
weapon[# WeapStat.FireRate, i] = 1;
weapon[# WeapStat.Mag, i] = 1;
weapon[# WeapStat.Ammo, i] = 19;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2.5;
weapon[# WeapStat.Reload, i] = 4;
weapon[# WeapStat.Price, i] = 3250;
weapon[# WeapStat.BulletSpeed, i] = 44;
weapon[# WeapStat.xOffset, i] = 27;
weapon[# WeapStat.yOffset, i] = 47;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rocket;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Tesla Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Name, i] = "Tesla Rifle";
weapon[# WeapStat.Description, i] = "Tier Four Primary Weapon\nDamage: 2\nFirerate: 0.2\nAccuracy: 95%\nMag Size: 50\nMax Ammo: 250\nReload Time: 3 Seconds\nPenetration: 0\nFire Mode: Full-Auto\nPrice: $3500\nLacking croud control and want to microwave your enemies from the inside out? This weapons for you and it comes pre-packaged with chain lightning.";
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.2;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 250;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 0.2;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3500;
weapon[# WeapStat.BulletSpeed, i] = 30;
weapon[# WeapStat.xOffset, i] = 28;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //BioLauncher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Name, i] = "BioLauncher";
weapon[# WeapStat.Description, i] = "Tier Four Primary Weapon\nDamage: Impact-15 Explosion-5\nFirerate: 0.2\nAccuracy: 95%\nMag Size: 5\nMax Ammo: 35\nReload Time: 3 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $3750\nWe modified a boring old grenade launcher to fire acidic rounds to melt your enemies. It's shown to be less effective against acidic opponents though.";
weapon[# WeapStat.Damage, i] = 15;
weapon[# WeapStat.FireRate, i] = 0.2;
weapon[# WeapStat.Mag, i] = 5;
weapon[# WeapStat.Ammo, i] = 35;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 0.25;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3750;
weapon[# WeapStat.BulletSpeed, i] = 40;
weapon[# WeapStat.xOffset, i] = 32;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Acid;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //Heated Blade
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Name, i] = "Heated Blade";
weapon[# WeapStat.Description, i] = "Tier Five Melee Weapon\nDamage: 12\nAttack Speed: 0.25\nPenetration: 2\nPrice: $4000\n35% chance to apply IGNITE\nA powerful experimental blade so hot it can cut through flesh easily, and if it doesn't the heat will cause their flesh to burn.";
weapon[# WeapStat.Damage, i] = 12;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 4000;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 3;

i++; //Purple Gun
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Name, i] = "Purple Gun";
weapon[# WeapStat.Description, i] = "Tier Five Secondary Weapon\nDamage: 10\nFirerate: 1\nAccuracy: 95%\nMag Size: 1\nMax Ammo: 39\nReload Time: 3 Seconds\nPenetration: 9\nFire Mode: Semi-Auto\nPrice: $4500\nAn experimental sidearm that fires large sharp projectiles really quickly capable of piercing many foes.";
weapon[# WeapStat.Damage, i] = 10;
weapon[# WeapStat.FireRate, i] = 1;
weapon[# WeapStat.Mag, i] = 1;
weapon[# WeapStat.Ammo, i] = 39;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 4500;
weapon[# WeapStat.BulletSpeed, i] = 80;
weapon[# WeapStat.xOffset, i] = 15;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Purple;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 10;

i++; //Undead Drainer
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Name, i] = "Undead Drainer";
weapon[# WeapStat.Description, i] = "Tier Five Primary Weapon\nDamage: 0.5\nFirerate: 0.25\nAccuracy: 95%\nMag Size: 4\nMax Ammo: 56\nReload Time: 3.5 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $4500\n100% chance to apply BLEED\nThis experimental weapon fires modified projectiles that attach to and drain all the blood from their victim. Best used on single targets.";
weapon[# WeapStat.Damage, i] = 0.5;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = 4;
weapon[# WeapStat.Ammo, i] = 56;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 3.5;
weapon[# WeapStat.Price, i] = 4500;
weapon[# WeapStat.BulletSpeed, i] = 40;
weapon[# WeapStat.xOffset, i] = 27;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Drainer;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;

i++; //B.H. Darker
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Name, i] = "B.H. Darker";
weapon[# WeapStat.Description, i] = "Tier Five Primary Weapon\nDamage: 3\nFirerate: 0.5\nAccuracy: 100%\nMag Size: 5\nMax Ammo: 10\nReload Time: 5 Seconds\nPenetration: 0\nFire Mode: Semi-Auto\nPrice: $5000\nThis weapon is without description...";
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.5;
weapon[# WeapStat.Mag, i] = 5;
weapon[# WeapStat.Ammo, i] = 10;
weapon[# WeapStat.Accuracy, i] = 1;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 5;
weapon[# WeapStat.Price, i] = 5000;
weapon[# WeapStat.BulletSpeed, i] = 40;
weapon[# WeapStat.xOffset, i] = 33;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;