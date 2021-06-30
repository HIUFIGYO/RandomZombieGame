event_inherited();

if(GamePaused())
	return;
	
if(leapTimer > 0)
{
	leapTimer -= DeltaTimeSecond();
	if(leapTimer <= 0)
	{
		leapTimer = 0;
		image_index = 1;
		PhysicsObjectPush(id, 40, x + image_xscale*48, y - 20);
		pounceUsed = true;
	}
}