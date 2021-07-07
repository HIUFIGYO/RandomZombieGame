if(follow == noone)
	return;
	
x = follow.x;
y = follow.y;

flame.TranslateRegion(x, y);
firePit.TranslateRegion(x, y);
smoke.TranslateRegion(x, y);
spark.TranslateRegion(x, y);