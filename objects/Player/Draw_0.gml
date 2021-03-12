if(isDead)
{
	PlayerDrawDeadBody();
	return;
}

var offset = 0;
if(isCrouching)
	offset = crouchOffset;

PlayerDrawLegs();
PlayerDrawTorso(offset);
PlayerDrawArms(offset);
PlayerDrawHead(offset);


if(isMelee)
{
	PlayerDrawMelee(offset);
}

if(isThrowing)
{
	PlayerDrawThrow(offset);
}