event_inherited();
additionalZombies = 10 - (global.playerAmount *2);

zombieSpawnRate = 360;
maxSpawnRate = zombieSpawnRate;

lastZombieSpawned = noone;

alarm[0] = maxSpawnRate - (global.playerAmount * 60);
alarm[1] = 36000; //10 minutes

killsTotalText = UICreateText(0, 16, "", UIDrawTo.GUI);
UISetAlign(killsTotalText, RectAlign.Center, RectAlign.Top);
UITextSetAlign(killsTotalText, fa_center, fa_top);

if(global.playerAmount == 4)
{
	UISetAlign(killsTotalText, RectAlign.Right, RectAlign.Top);
	UITextSetAlign(killsTotalText, fa_right, fa_top);
	UISetPosition(killsTotalText, 16, 48);
}