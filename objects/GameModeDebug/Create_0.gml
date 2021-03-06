event_inherited();

//UI
zombieSelect = 0;
zombieMaxSelect = 14;

zombieSprite[0] = spr_limperidle;
zombieSprite[1] = spr_rabididle;
zombieSprite[2] = spr_lardidle;
zombieSprite[3] = spr_grappleidle;
zombieSprite[4] = spr_ghostidle;
zombieSprite[5] = spr_bursteridle;
zombieSprite[6] = spr_twitcheridle;
zombieSprite[7] = spr_speweridle;
zombieSprite[8] = spr_injectoridle;
zombieSprite[9] = spr_bladeidle;
zombieSprite[10] = spr_Screeperidle;
zombieSprite[11] = spr_bioidle;
zombieSprite[12] = spr_ripperidle;
zombieSprite[13] = spr_Acreeperidle;
zombieSprite[14] = spr_infernoidle;

zombie[0] = LimperZombie;
zombie[1] = RabidZombie;
zombie[2] = LardZombie;
zombie[3] = GrappleZombie;
zombie[4] = GhostZombie;
zombie[5] = BursterZombie;
zombie[6] = TwitcherZombie;
zombie[7] = SpewerZombie;
zombie[8] = InjectorZombie;
zombie[9] = BladeZombie;
zombie[10] = StrayCreeperZombie;
zombie[11] = BioZombie;
zombie[12] = RipperZombie;
zombie[13] = AlphaCreeperZombie;
zombie[14] = InfernoZombie;

weaponSelect = 0;

godMode = false;

showControls = true;

textMessage[0] = "Press num8 to show controls";
textMessage[1] = "Press num8 to show controls\nPress num 4 & 6 to toggle zombies\nPress num5 to spawn Zombie\nPress num 1 & 3 to toggle weapons\nPress num2 to spawn weapon\nPress num7 to toggle godmode\nPress num9 to cycle difficulty\nPress Delete to clear room";

zombieImage = UICreateImage(16, 16, zombieSprite[0], UIDrawTo.GUI);
UISetAlign(zombieImage, RectAlign.Right, RectAlign.Top);
UISetSize(zombieImage, 64, 128);

weaponImage = UICreateImage(16, 144, spr_weapons, UIDrawTo.GUI);
UISetAlign(weaponImage, RectAlign.Right, RectAlign.Top);
UISetSize(weaponImage, 64, 128);

difficultyImage = UICreateImage(16, 176, spr_difficultyIcons, UIDrawTo.GUI);
UIImageSetSubImage(difficultyImage, global.difficulty);
UISetAlign(difficultyImage, RectAlign.Right, RectAlign.Top);
UISetSize(difficultyImage, 64, 128);

controlText = UICreateText(16, 48, textMessage[0], UIDrawTo.GUI);
UISetAlign(controlText, RectAlign.Center, RectAlign.Top);
UISetSize(controlText, 480, 480);
UITextSetLineSep(controlText, 16);

totalZombieText = UICreateText(16, 16, "", UIDrawTo.GUI);
UISetAlign(totalZombieText, RectAlign.Center, RectAlign.Top);
UISetSize(totalZombieText, 256, 32);