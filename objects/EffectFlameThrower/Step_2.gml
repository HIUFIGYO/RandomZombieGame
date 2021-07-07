if(follow == noone)
	return;
	
x = follow.x;
y = follow.y;

ball.TranslateRegion(x, y);
beam.TranslateRegion(x, y);
spark.TranslateRegion(x, y);