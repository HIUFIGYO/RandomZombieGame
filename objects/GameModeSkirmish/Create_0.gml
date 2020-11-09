event_inherited();
additionalZombies = global.playerAmount;

alarm[0] = 60;

killsTotalText = UICreateText(0, 0, "", UIDrawTo.GUI);
UISetSize(killsTotalText, 640, 16);
UISetAlign(killsTotalText, RectAlign.Horizontal);
UISetPadding(killsTotalText, 0, 16);
UITextSetAlign(killsTotalText, fa_center, fa_top);