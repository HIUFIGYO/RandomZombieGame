/// @description Weapons

var i;
weapon = ds_grid_create(WeapStat.count, Weapon.count);

i=0; //Standard Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Melee1;

i++; //Standard Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 12;
weapon[# WeapStat.Ammo, i] = 168;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1.5;
weapon[# WeapStat.BulletSpeed, i] = 60;
weapon[# WeapStat.xOffset, i] = 26;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Pistol1;

i++; //Standard Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 24;
weapon[# WeapStat.yOffset, i] = 41;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Rifle1;

i++; //Standard Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.One;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.75;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 72;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.BulletSpeed, i] = 56;
weapon[# WeapStat.xOffset, i] = 24;
weapon[# WeapStat.yOffset, i] = 33;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 5;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = Sound_ShotGun1;

i++; //Advanced Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Damage, i] = 5;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = Sound_Melee2;

i++; //Advanced Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Damage, i] = 4;
weapon[# WeapStat.FireRate, i] = 0.15;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 112;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 29;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Pistol2;

i++; //Advanced Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Damage, i] = 1.5;
weapon[# WeapStat.FireRate, i] = 0.12;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.9;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 25;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Rifle2;

i++; //Advanced Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Two;
weapon[# WeapStat.Damage, i] = 1.5;
weapon[# WeapStat.FireRate, i] = 0.2;
weapon[# WeapStat.Mag, i] = 2;
weapon[# WeapStat.Ammo, i] = 58;
weapon[# WeapStat.Accuracy, i] = 0.75;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1.5;
weapon[# WeapStat.BulletSpeed, i] = 56;
weapon[# WeapStat.xOffset, i] = 23;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 7;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = Sound_ShotGun2;

i++; //Super Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Damage, i] = 7;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 3;
weapon[# WeapStat.Sound, i] = Sound_Melee3;

i++; //Super Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Damage, i] = 8;
weapon[# WeapStat.FireRate, i] = 0.3;
weapon[# WeapStat.Mag, i] = 6;
weapon[# WeapStat.Ammo, i] = 84;
weapon[# WeapStat.Accuracy, i] = 0.925;
weapon[# WeapStat.Range, i] = 1.5;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 33;
weapon[# WeapStat.yOffset, i] = 45;
weapon[# WeapStat.BulletImage, i] = BulletImage.Pistol;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = Sound_Pistol3;

i++; //Super Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Damage, i] = 2.5;
weapon[# WeapStat.FireRate, i] = 0.08;
weapon[# WeapStat.Mag, i] = 20;
weapon[# WeapStat.Ammo, i] = 280;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1.5;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.BulletSpeed, i] = 64;
weapon[# WeapStat.xOffset, i] = 29;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rifle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = Sound_Rifle3;

i++; //Super Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Three;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = 7;
weapon[# WeapStat.Ammo, i] = 70;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.BulletSpeed, i] = 56;
weapon[# WeapStat.xOffset, i] = 23;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Shotgun;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 9;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = Sound_ShotGun3;

i++; //Flamethrower
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Damage, i] = 0.5;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 350;
weapon[# WeapStat.Accuracy, i] = 0.85;
weapon[# WeapStat.Range, i] = 0.25;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.BulletSpeed, i] = 30;
weapon[# WeapStat.xOffset, i] = 30;
weapon[# WeapStat.yOffset, i] = 36;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 2;
weapon[# WeapStat.Sound, i] = noone;

i++; //Rocket Launcher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Damage, i] = 20;
weapon[# WeapStat.FireRate, i] = 0.8;
weapon[# WeapStat.Mag, i] = 1;
weapon[# WeapStat.Ammo, i] = 19;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1.5;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.BulletSpeed, i] = 48;
weapon[# WeapStat.xOffset, i] = 27;
weapon[# WeapStat.yOffset, i] = 47;
weapon[# WeapStat.BulletImage, i] = BulletImage.Rocket;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = noone;

i++; //Tesla Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.2;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 250;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 0.1;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.BulletSpeed, i] = 80;
weapon[# WeapStat.xOffset, i] = 28;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = true;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 3;
weapon[# WeapStat.Sound, i] = noone;

i++; //BioLauncher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Four;
weapon[# WeapStat.Damage, i] = 10;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = 5;
weapon[# WeapStat.Ammo, i] = 35;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 0.25;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.BulletSpeed, i] = 40;
weapon[# WeapStat.xOffset, i] = 32;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Acid;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = noone;

i++; //Heated Blade
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Damage, i] = 9;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.BulletSpeed, i] = noone;
weapon[# WeapStat.xOffset, i] = 0;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = noone;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = noone;
weapon[# WeapStat.Pierce, i] = 3;
weapon[# WeapStat.Sound, i] = Sound_Melee4;

i++; //Purple Gun
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Damage, i] = 10;
weapon[# WeapStat.FireRate, i] = 0.66;
weapon[# WeapStat.Mag, i] = 1;
weapon[# WeapStat.Ammo, i] = 39;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.BulletSpeed, i] = 80;
weapon[# WeapStat.xOffset, i] = 15;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Purple;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 8;
weapon[# WeapStat.Sound, i] = noone;

i++; //Undead Drainer
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.25;
weapon[# WeapStat.Mag, i] = 4;
weapon[# WeapStat.Ammo, i] = 56;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.BulletSpeed, i] = 48;
weapon[# WeapStat.xOffset, i] = 27;
weapon[# WeapStat.yOffset, i] = 34;
weapon[# WeapStat.BulletImage, i] = BulletImage.Drainer;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = noone;

i++; //B.H. Darker
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Tier, i] = Tier.Five;
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.5;
weapon[# WeapStat.Mag, i] = 5;
weapon[# WeapStat.Ammo, i] = 10;
weapon[# WeapStat.Accuracy, i] = 1;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 4;
weapon[# WeapStat.BulletSpeed, i] = 72;
weapon[# WeapStat.xOffset, i] = 33;
weapon[# WeapStat.yOffset, i] = 32;
weapon[# WeapStat.BulletImage, i] = BulletImage.Particle;
weapon[# WeapStat.Auto, i] = false;
weapon[# WeapStat.Burst, i] = 1;
weapon[# WeapStat.Pierce, i] = 1;
weapon[# WeapStat.Sound, i] = noone;