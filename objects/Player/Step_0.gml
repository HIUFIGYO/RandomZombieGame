var xInput = (InputPlayerGetButton(player_inputID, Button.Right) - InputPlayerGetButton(player_inputID, Button.Left));
var maxSpd = PlayerProcessSprint(xInput);

PlayerAddVelocity(xInput, maxSpd);

PlayerFlip(xInput);

PlayerProcessCrouch();

PlayerJump();

PlayerCheckCollision();

PlayerTranslate(maxSpd);

PlayerProcessReloading();

PlayerActionTimer();

PlayerPerformAction();

PlayerAnimate();