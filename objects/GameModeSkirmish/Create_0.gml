event_inherited();
additionalZombies = global.playerAmount * 4 + (global.difficulty * 2);

zombieSpawnRate = 300;
maxSpawnRate = zombieSpawnRate;

alarm[0] = maxSpawnRate - (global.playerAmount * 60);
alarm[1] = 21600; //6 minutes

killsTotalText = UICreateText(0, 0, "", UIDrawTo.GUI);
UISetAlign(killsTotalText, RectAlign.Center, RectAlign.Top);
UISetPadding(killsTotalText, 0, 16);
UITextSetAlign(killsTotalText, fa_center, fa_top);

if(global.playerAmount == 4)
{
	UISetAlign(killsTotalText, RectAlign.Right, RectAlign.Top);
	UITextSetAlign(killsTotalText, fa_right, fa_top);
	UISetPadding(killsTotalText, 16, 16);
}