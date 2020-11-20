event_inherited();

//UI
zombieSelect = 0;
zombieMaxSelect = 9;

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

weaponSelect = 0;

godMode = false;

showControls = true;

textMessage[0] = "Press num8 to show controls";
textMessage[1] = "Press num8 to show controls\nPress num 4 & 6 to toggle zombies\nPress num5 to spawn Zombie\nPress num 1 & 3 to toggle weapons\nPress num2 to spawn weapon\nPress num7 to toggle godmode\nPress num9 to cycle difficulty\nPress Delete to clear room";

zombieImage = UICreateImage(0, 0, zombieSprite[0], UIDrawTo.GUI);
UISetAlign(zombieImage, RectAlign.Right, RectAlign.Top);
UISetPadding(zombieImage, 16, 16);
UISetSize(zombieImage, 64, 128);

weaponImage = UICreateImage(0, 0, spr_weapons, UIDrawTo.GUI);
UISetAlign(weaponImage, RectAlign.Right, RectAlign.Top);
UISetPadding(weaponImage, 16, 144);
UISetSize(weaponImage, 64, 128);

difficultyImage = UICreateImage(0, 0, spr_difficultyIcons, UIDrawTo.GUI);
UISetAlign(difficultyImage, RectAlign.Right, RectAlign.Top);
UISetPadding(difficultyImage, 16, 176);
UISetSize(difficultyImage, 64, 128);

controlText = UICreateText(0, 0, textMessage[0], UIDrawTo.GUI);
UISetAlign(controlText, RectAlign.Center, RectAlign.Top);
UISetPadding(controlText, 16, 16);
UISetSize(controlText, 480, 480);
UITextSetAlign(controlText, fa_right, fa_top);
UITextSetLineSep(controlText, 16);