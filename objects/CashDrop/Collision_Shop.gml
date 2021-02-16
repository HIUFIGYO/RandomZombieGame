if(canPickUp and other.hasBank)
{
	if(playerID.bankedMoney == DataBase.maxBankedMoney)
		exit;
	
	if(playerID.bankedMoney + value > DataBase.maxBankedMoney)
	{
		value = DataBase.maxBankedMoney - playerID.bankedMoney;
	}
	else
	{
		instance_destroy();
	}
	PlayerBankMoney(playerID, value);
}