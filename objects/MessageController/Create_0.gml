messageList = ds_list_create();
messageColor = ds_list_create();
messageMaxSize = 10;

fadeOutTime = 3;
fadeOut = fadeOutTime;

xPadding = 8;
yPadding = 96;

//the bits in the filter represent the filter flags, default all on so all messages show up.
messageFilter = $FF;