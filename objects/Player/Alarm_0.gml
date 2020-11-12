spawnedUI = true;

//health bar/text
hpBar = UICreateHealthbar(8, 8, UIDrawTo.ViewPort);
UISetView(hpBar, playerID);
UISetColor(hpBar, c_black);
UISetSize(hpBar, 200, 16);

hpText = UICreateText(8, 8, "", UIDrawTo.ViewPort);
UISetView(hpText, playerID);
UISetColor(hpText, c_yellow);
UISetDepth(hpText, -1);
UISetSize(hpText, 200, 16);

//damage overlay
overlay = UICreateImage();
overlayAlpha = 0;
UIImageSetSprite(overlay, spr_Damaged, 0, true);
UISetDrawTo(overlay, UIDrawTo.ViewPort);
UISetDepth(overlay, 1);
UISetView(overlay, playerID);
UISetAlpha(overlay, 0);
UISetSize(overlay, view_wport[playerID], view_hport[playerID]);

//ammo/mag
ammoText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(ammoText, playerID);
UISetColor(ammoText, c_yellow);
UISetAlign(ammoText, RectAlign.Right, RectAlign.Bottom);
UISetPadding(ammoText, 32, 32);

//TODO: reload timer debug
reloadText = UICreateText(0, 0, "", UIDrawTo.ViewPort);
UISetView(reloadText, playerID);
UISetColor(reloadText, c_yellow);
UISetAlign(reloadText, RectAlign.Right, RectAlign.Bottom);
UISetPadding(reloadText, 32, 64);