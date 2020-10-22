var i;
weapon = ds_grid_create(WeapStat.count, Weapon.count);

i=0; //Standard Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.5;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 0;

i++; //Standard Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 12;
weapon[# WeapStat.Ammo, i] = 228;
weapon[# WeapStat.Accuracy, i] = 0.9;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 1.5;
weapon[# WeapStat.Price, i] = 250;

i++; //Standard Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.Price, i] = 500;

i++; //Standard Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 1;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 72;
weapon[# WeapStat.Accuracy, i] = 0.5;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 750;

i++; //Advanced Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Damage, i] = 6;
weapon[# WeapStat.FireRate, i] = 0.55;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 1000;

i++; //Advanced Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Damage, i] = 4;
weapon[# WeapStat.FireRate, i] = 0.15;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 104;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2;
weapon[# WeapStat.Price, i] = 1250;

i++; //Advanced Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.15;
weapon[# WeapStat.Mag, i] = 30;
weapon[# WeapStat.Ammo, i] = 270;
weapon[# WeapStat.Accuracy, i] = 0.75;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.Price, i] = 1500;

i++; //Advanced Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 2;
weapon[# WeapStat.Ammo, i] = 58;
weapon[# WeapStat.Accuracy, i] = 0.3;
weapon[# WeapStat.Range, i] = 1;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 1750;

i++; //Super Melee
weapon[# WeapStat.Type, i] = WeapType.Melee;
weapon[# WeapStat.Damage, i] = 9;
weapon[# WeapStat.FireRate, i] = 0.6;
weapon[# WeapStat.Mag, i] = noone;
weapon[# WeapStat.Ammo, i] = noone;
weapon[# WeapStat.Accuracy, i] = noone;
weapon[# WeapStat.Range, i] = noone;
weapon[# WeapStat.Reload, i] = noone;
weapon[# WeapStat.Price, i] = 2000;

i++; //Super Pistol
weapon[# WeapStat.Type, i] = WeapType.SideArm;
weapon[# WeapStat.Damage, i] = 8;
weapon[# WeapStat.FireRate, i] = 0.3;
weapon[# WeapStat.Mag, i] = 6;
weapon[# WeapStat.Ammo, i] = 84;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 3;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 2250;

i++; //Super Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 3;
weapon[# WeapStat.FireRate, i] = 0.075;
weapon[# WeapStat.Mag, i] = 20;
weapon[# WeapStat.Ammo, i] = 280;
weapon[# WeapStat.Accuracy, i] = 0.8;
weapon[# WeapStat.Range, i] = 3;
weapon[# WeapStat.Reload, i] = 2.5;
weapon[# WeapStat.Price, i] = 2500;

i++; //Super Shotgun
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 1;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 8;
weapon[# WeapStat.Ammo, i] = 72;
weapon[# WeapStat.Accuracy, i] = 0.5;
weapon[# WeapStat.Range, i] = 2;
weapon[# WeapStat.Reload, i] = 1;
weapon[# WeapStat.Price, i] = 2750;

i++; //Flamethrower
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 0.5;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 350;
weapon[# WeapStat.Accuracy, i] = 0.75;
weapon[# WeapStat.Range, i] = 0.5;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3000;

i++; //Rocket Launcher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 20;
weapon[# WeapStat.FireRate, i] = 1;
weapon[# WeapStat.Mag, i] = 1;
weapon[# WeapStat.Ammo, i] = 19;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 2.5;
weapon[# WeapStat.Reload, i] = 4;
weapon[# WeapStat.Price, i] = 3250;

i++; //Tesla Rifle
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 2;
weapon[# WeapStat.FireRate, i] = 0.1;
weapon[# WeapStat.Mag, i] = 50;
weapon[# WeapStat.Ammo, i] = 250;
weapon[# WeapStat.Accuracy, i] = 0.95;
weapon[# WeapStat.Range, i] = 0.5;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3500;

i++; //BioLauncher
weapon[# WeapStat.Type, i] = WeapType.Primary;
weapon[# WeapStat.Damage, i] = 15;
weapon[# WeapStat.FireRate, i] = 0.2;
weapon[# WeapStat.Mag, i] = 5;
weapon[# WeapStat.Ammo, i] = 35;
weapon[# WeapStat.Accuracy, i] = 0.85;
weapon[# WeapStat.Range, i] = 0.1;
weapon[# WeapStat.Reload, i] = 3;
weapon[# WeapStat.Price, i] = 3750;