ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

x += xSpeed * DeltaTime();
y += ySpeed * DeltaTime();

if(place_meeting(x, y, BlockParent))
	instance_destroy();