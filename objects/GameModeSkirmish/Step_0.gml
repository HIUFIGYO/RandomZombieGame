if(currentZombies != GameManager.totalZombies)
{
	var differance = currentZombies - GameManager.totalZombies;
	if(differance > 0)
	{
		zombieCount++;
	}
	currentZombies = GameManager.totalZombies;
}