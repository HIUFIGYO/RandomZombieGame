PlayerInvincibilityTimer();

PlayerHealthRegeneration();

PlayerStaminaRegeneration();

PlayerProcessRevive();

PlayerBuffCooldown();

UpdateDebuffs(id, true);

PlayerUseMedicalItem();

PlayerProcessVials();

PlayerCalculateSupportCollision()

if(InputPlayerGetButtonDown(player_inputID, Button.Interact))
{
	PlayerInteractWithDoor();
	
	var interactible = PlayerFindInteractible();
	
	if(interactible != noone)
	{
		PlayerProcessInteractible(interactible);
	}
}