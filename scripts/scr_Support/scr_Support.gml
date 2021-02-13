///@function SupportGetSprite(support)

function SupportGetSprite(_support)
{
	return DataBase.supportSprite[_support - SupportType.Barricade];
}

///@function SupportGetObject(support)

function SupportGetObject(_support)
{
	return DataBase.supportObject[_support - SupportType.Barricade];
}