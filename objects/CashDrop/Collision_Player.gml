if(canPickUp)
{
	if(other.money == DataBaseGetMaxMoney())
		exit;
	
	if(other.money + value > DataBaseGetMaxMoney())
	{
		value = DataBaseGetMaxMoney() - other.money;
	}
	else
	{
		instance_destroy();
	}
	PlayerGiveMoney(other, value);
}