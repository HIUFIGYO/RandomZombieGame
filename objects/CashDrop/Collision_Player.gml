if(canPickUp)
{
	if(other.money == DataBase.maxMoney)
		exit;
	
	if(other.money + value > DataBase.maxMoney)
	{
		value = DataBase.maxMoney - other.money;
	}
	else
	{
		instance_destroy();
	}
	PlayerGiveMoney(other, value);
}