//for(var i=0; i<global.maxPlayers; i++)
//{
//	if(select[i] != noone)
//	{
//		var lastSelect = select[i];
//		if(select[i].UILeft != noone and InputGetButtonDown(i, Button.Left))
//		{
//			select[i] = select[i].UILeft;
//		}
	
//		if(select[i].UIRight != noone and InputGetButtonDown(i, Button.Right))
//		{
//			select[i] = select[i].UIRight;
//		}
	
//		if(select[i].UIUp != noone and InputGetButtonDown(i, Button.Up))
//		{
//			select[i] = select[i].UIUp;
//		}
	
//		if(select[i].UIDown != noone and InputGetButtonDown(i, Button.Down))
//		{
//			select[i] = select[i].UIDown;
//		}
//		select[i].isSelected = true;
//		if(lastSelect != select[i])
//			lastSelect.isSelected = false;
//	}
//}