if(isChangingState)
{
	isChangingState = false;
	previousState = currentState;
	currentState = nextState;
}

currentState();