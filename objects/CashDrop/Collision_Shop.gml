if(canPickUp and other.hasBank)
{
	if(playerID.bankedMoney == DataBaseGetMaxBankedMoney())
		exit;
	
	if(playerID.bankedMoney + value > DataBaseGetMaxBankedMoney())
	{
		value = DataBaseGetMaxBankedMoney() - playerID.bankedMoney;
	}
	else
	{
		instance_destroy();
	}
	PlayerBankMoney(playerID, value);
}