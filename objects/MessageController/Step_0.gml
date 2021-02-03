if(ds_list_size(messageList) == 0)
	exit;
	
fadeOut -= DeltaTimeSecond();
if(fadeOut <= 0)
{
	fadeOut = fadeOutTime;
	ds_list_delete(messageList, 0);
}