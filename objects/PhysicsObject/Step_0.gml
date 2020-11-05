ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

if(place_meeting(x+xSpeed, y, BlockParent))
{
	while(!place_meeting(x+sign(xSpeed), y, BlockParent))
		x += sign(xSpeed);
	xSpeed = -xSpeed * bounce;
}
x += clamp(xSpeed * DeltaTime(), -maxSpeed, maxSpeed);

if(place_meeting(x, y+ySpeed, BlockParent))
{
	while(!place_meeting(x, y+sign(ySpeed), BlockParent))
		y += sign(ySpeed);
	ySpeed = -ySpeed * bounce;
	xSpeed = lerp(0, xSpeed, friction);
}
y += clamp(ySpeed * DeltaTime(), -maxFallSpeed, maxFallSpeed);