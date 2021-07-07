if(follow == noone)
	return;

x = follow.x;
y = follow.y;

electricity.TranslateRegion(x, y);
spark.TranslateRegion(x, y);
trail.TranslateRegion(x, y);

PartEmitStream(electricity, PartType.TeslaShotElectricity, 4);
PartEmitStream(spark, PartType.TeslaShotSpark, 3);
PartEmitStream(trail, PartType.TeslaShotTrail, 2);