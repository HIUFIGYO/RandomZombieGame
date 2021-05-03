if(!isDead and !GameManager.gamePaused)
	UpdateDebuffs(id, false);

if(isChangingState)
{
	isChangingState = false;
	previousState = currentState;
	currentState = nextState;
}

currentState();