ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

if(place_meeting(x+xSpeed, y, BlockParent))
{
	while(!place_meeting(x+sign(xSpeed), y, BlockParent))
		x += sign(xSpeed);
	var bounceSpd = -lerp(0, xSpeed, bounce);
	if(bounceSpd >= -bounceCutOff and bounceSpd <= bounceCutOff)
		bounceSpd = 0;
	xSpeed = bounceSpd;
}
x += clamp(xSpeed * DeltaTime(), -maxSpeed, maxSpeed);

if(place_meeting(x, y+ySpeed, BlockParent))
{
	while(!place_meeting(x, y+sign(ySpeed), BlockParent))
		y += sign(ySpeed);
	var bounceSpd = -lerp(0, ySpeed, bounce);
	if(bounceSpd >= -bounceCutOff and bounceSpd <= bounceCutOff)
		bounceSpd = 0;
	ySpeed = bounceSpd;
	xSpeed = lerp(0, xSpeed, friction);
}
y += clamp(ySpeed * DeltaTime(), -maxFallSpeed, maxFallSpeed);