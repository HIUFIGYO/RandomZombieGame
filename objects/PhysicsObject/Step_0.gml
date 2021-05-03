if(GamePaused())
	return;

ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);
collision = false;

var block = instance_place(x+xSpeed, y, BlockParent);
if(block)
{
	collision = true;
	while(!place_meeting(x+sign(xSpeed), y, block))
		x += sign(xSpeed);
	var bounceSpd = -lerp(0, xSpeed, bounce);
	if(bounceSpd >= -bounceCutOff and bounceSpd <= bounceCutOff)
		bounceSpd = 0;
	xSpeed = bounceSpd;
}
x += clamp(xSpeed * DeltaTime(), -maxSpeed, maxSpeed);

block = instance_place(x, y+ySpeed, BlockParent);
if(block)
{
	collision = true;
	while(!place_meeting(x, y+sign(ySpeed), block))
		y += sign(ySpeed);
	var bounceSpd = -lerp(0, ySpeed, bounce);
	if(bounceSpd >= -bounceCutOff and bounceSpd <= bounceCutOff)
		bounceSpd = 0;
	ySpeed = bounceSpd;
	xSpeed = lerp(0, xSpeed, friction);
}
y += clamp(ySpeed * DeltaTime(), -maxFallSpeed, maxFallSpeed);