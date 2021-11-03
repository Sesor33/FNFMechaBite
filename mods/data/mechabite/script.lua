function onCreate()
    addCharacterToList('bon_dead', 'boyfriend')
    
    makeAnimatedLuaSprite('bon_dead', 'bon_dead');
    luaSpriteAddAnimationByPrefix('bon_dead', 'firstDeath', 'firstDeath', 24, false)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathLoop', 'deathLoop', 24, true)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathConfirm', 'deathConfirm', 24, false)

    setPropertyFromClass('GameOverSubstate', 'characterName', 'bon_dead')
end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    setProperty('boyfriend.curCharacter', 'bon_dead')
    playSound('death', 0.3)
    playSound('BF_Deathsound')
    playMusic('gameOver', 1, true)
	return Function_Continue;
end

function onGameOverConfirm(retry)
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
    setProperty('boyfriend.curCharacter', 'bon_dead')
    luaSpritePlayAnimation('deathConfirm')
    playMusic('gameOverEnd', 1, true)
end
