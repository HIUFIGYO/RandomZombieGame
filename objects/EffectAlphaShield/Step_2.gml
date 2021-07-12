if(follow == noone)
	return;

x = follow.x;
y = follow.y-32;

shield.TranslateRegion(x, y);
center.TranslateRegion(x, y);

PartEmitStream(shield, PartType.AlphaShield, 1);
PartEmitStream(center, PartType.AlphaCenter, 1);