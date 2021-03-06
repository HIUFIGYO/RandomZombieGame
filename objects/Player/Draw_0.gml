if(isDead)
{
	PlayerDrawDeadBody();
	return;
}

if(isPinned)
{
	PlayerDrawPinned();
	return;
}

var offset = 0;
if(isCrouching)
	offset = crouchOffset;

PlayerDrawLegs();
PlayerDrawTorso(offset);
PlayerDrawHead(offset);
PlayerDrawArms(offset);


if(isMelee)
{
	PlayerDrawMelee(offset);
}

if(isThrowing)
{
	PlayerDrawThrow(offset);
}