if(GamePaused())
	return;

PlayerInvincibilityTimer();

PlayerFadeOut();

PlayerHealthRegeneration();

PlayerStaminaRegeneration();

PlayerProcessRevive();

PlayerBuffCooldown();

UpdateDebuffs(id, true);

PlayerUseMedicalItem();

PlayerProcessVials();

PlayerCalculateSupportCollision()

PlayerProcessInteractible();