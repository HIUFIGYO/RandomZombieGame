if(GameManager.gamePaused)
	return;

PlayerInvincibilityTimer();

PlayerHealthRegeneration();

PlayerStaminaRegeneration();

PlayerProcessRevive();

PlayerBuffCooldown();

UpdateDebuffs(id, true);

PlayerUseMedicalItem();

PlayerProcessVials();

PlayerCalculateSupportCollision()

PlayerProcessInteractible();