if(!isDead)
	UpdateDebuffs(id, false);

if(isChangingState)
{
	isChangingState = false;
	currentState = nextState;
}

currentState();