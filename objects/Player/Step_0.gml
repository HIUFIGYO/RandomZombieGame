var xThrow = InputGetAxis(player_inputID, Axis.Horizontal);
var yThrow = InputGetAxis(player_inputID, Axis.Verticle);
var _inst;

xSpeed += xThrow * acceleration;
xSpeed = clamp(xSpeed, -maxSpeed, maxSpeed);
if(xThrow == 0)
{
	xSpeed = lerp(0, xSpeed, friction);
}

_inst = instance_place(x + xSpeed , y, BlockParent);
if(_inst)
{
	if(xSpeed > 0)
		x = _inst.bbox_left - sprite_get_bbox_left(sprite_index);
	else
		x = _inst.bbox_right + sprite_get_bbox_left(sprite_index);
	xSpeed = 0;
}
else
	x += xSpeed * DeltaTime();

ySpeed += grav;
ySpeed = min(ySpeed, maxFallSpeed);

if(yThrow != 0 and instance_place(x, y+ySpeed, BlockParent))
{
	ySpeed = -jumpSpeed;
}

y += ySpeed * DeltaTime();

if(instance_place(x, y, BlockParent))
{
	y -= ySpeed;
	if(instance_place(x, y+1, BlockParent))
		ySpeed = 0;
	else
		ySpeed = 1;
}