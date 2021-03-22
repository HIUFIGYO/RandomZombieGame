///@desc Set Up UI Elements

spawnedUI = true;

//health bar/text
hpBar = UICreateHealthbar(8, 8, UIDrawTo.ViewPort);
UISetView(hpBar, playerID);
UISetColor(hpBar, c_black);
UISetSize(hpBar, 128, 16);

hpText = UICreateText(8, 8, "", UIDrawTo.ViewPort);
UISetView(hpText, playerID);
UISetColor(hpText, c_yellow);
UISetDepth(hpText, -2);
UISetSize(hpText, 128, 16);

//armour bar
armourBar = UICreateHealthbar(8, 8, UIDrawTo.ViewPort);
UISetView(armourBar, playerID);
UIHealthbarSetColor(armourBar, c_black, c_blue, c_blue);
UISetDepth(armourBar, -1);
UISetSize(armourBar, 128, 8);

//stamina bar
staminaBar = UICreateHealthbar(8, 24, UIDrawTo.ViewPort);
UISetView(staminaBar, playerID);
UIHealthbarSetColor(staminaBar, c_black, c_yellow, c_yellow);
UISetSize(staminaBar, 96, 8);

//buff icon
buffIcon[0] = UICreateImage(8, 40, spr_buffs, UIDrawTo.ViewPort);
UISetView(buffIcon[0], playerID);

buffIcon[1] = UICreateImage(48, 40, spr_buffs, UIDrawTo.ViewPort);
UISetView(buffIcon[1], playerID);

buffPassive[0] = UICreateImage(8, 80, spr_buffPassiveIcons, UIDrawTo.ViewPort);
UISetView(buffPassive[0], playerID);

buffPassive[1] = UICreateImage(48, 80, spr_buffPassiveIcons, UIDrawTo.ViewPort);
UISetView(buffPassive[1], playerID);

buffCooldown[0] = UICreateImage(8, 40, spr_buffDurationRing, UIDrawTo.ViewPort);
UISetView(buffCooldown[0], playerID);
UISetDepth(buffCooldown[0], -1);

buffCooldown[1] = UICreateImage(48, 40, spr_buffDurationRing, UIDrawTo.ViewPort);
UISetView(buffCooldown[1], playerID);
UISetDepth(buffCooldown[1], -1);

buffCooldownP[0] = UICreateImage(8, 80, spr_buffDurationRing, UIDrawTo.ViewPort);
UISetView(buffCooldownP[0], playerID);
UISetDepth(buffCooldownP[0], -1);

buffCooldownP[1] = UICreateImage(48, 80, spr_buffDurationRing, UIDrawTo.ViewPort);
UISetView(buffCooldownP[1], playerID);
UISetDepth(buffCooldownP[1], -1);

//Revive Bar
reviveBar = UICreateHealthbar(0, 0, UIDrawTo.Room);
UIHealthbarSetColor(reviveBar, c_black, c_white, c_white);
UISetSize(reviveBar, 64, 8);
UISetAlpha(reviveBar, 0);

//damage overlay
overlay = UICreateImage();
overlayAlpha = 0;
UIImageSetSprite(overlay, spr_Damaged, 0, true);
UISetDrawTo(overlay, UIDrawTo.ViewPort);
UISetDepth(overlay, 1);
UISetView(overlay, playerID);
UISetAlpha(overlay, 0);
UISetSize(overlay, view_wport[playerID], view_hport[playerID]);
UISetColor(overlay, c_red);

//danger overlay
dangerOverlay = UICreateImage();
dangerOverlayAlpha = 0;
UIImageSetSprite(dangerOverlay, spr_Damaged, 0, true);
UISetDrawTo(dangerOverlay, UIDrawTo.ViewPort);
UISetDepth(dangerOverlay, 1);
UISetView(dangerOverlay, playerID);
UISetAlpha(dangerOverlay, 0);
UISetSize(dangerOverlay, view_wport[playerID], view_hport[playerID]);
UISetColor(dangerOverlay, c_black);

//grenades
grenadeText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(grenadeText, playerID);
UISetAlign(grenadeText, RectAlign.Right, RectAlign.Bottom);
UISetPadding(grenadeText, 8, 20);
UISetColor(grenadeText, c_yellow);

grenadeIcon = UICreateImage(0, 0, spr_grenades, UIDrawTo.ViewPort);
UISetView(grenadeIcon, playerID);
UISetParent(grenadeText, grenadeIcon);
UISetPadding(grenadeIcon, -16, 4);

//ammo/mag
ammoText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(ammoText, playerID);
UISetColor(ammoText, c_yellow);
UISetAlign(ammoText, RectAlign.Right, RectAlign.Bottom);
UISetPadding(ammoText, 8, 8);

//reload circle
reloadImage = UICreateImage(0, 0, spr_reloadCircle, UIDrawTo.ViewPort);
UISetView(reloadImage, playerID);
UISetAlign(reloadImage, RectAlign.Center, RectAlign.Center);

//kills
killsText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(killsText, playerID);
UISetColor(killsText, c_yellow);
UISetAlign(killsText, RectAlign.Left, RectAlign.Bottom);
UISetPadding(killsText, 8, 24);

//money
moneyText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(moneyText, playerID);
UISetColor(moneyText, c_yellow);
UISetAlign(moneyText, RectAlign.Left, RectAlign.Bottom);
UISetPadding(moneyText, 8, 8);