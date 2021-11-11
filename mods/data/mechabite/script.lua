--Cutscene functions
local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('camGame.visible',false);
		setProperty('camHUD.visible',false);
		runTimer('cutsceneTimer',1,1);

		allowCountdown = true;
		return Function_Stop;
	end
	setProperty('camGame.visible',true);
	setProperty('camHUD.visible',true);

	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'cutsceneTimer' then
		startVideo('mechabiteIntro')
	end
end


function onCreate()
	--Add taperecorder BG sprites
	makeLuaSprite('BGT1', 'phila/taperecorder/Layer 11_TR BG', -1200, -1115);
	setScrollFactor('BGT1', 0.1, 0.1);
	scaleObject('BGT1', 1.7, 1.7);

	makeLuaSprite('BGTFloor', 'phila/taperecorder/Layer 03_TR Ground', -1200, -1115);
	scaleObject('BGTFloor', 1.7, 1.7);

	--Add Bon death sprite
    addCharacterToList('bon_dead', 'boyfriend')
    
    makeAnimatedLuaSprite('bon_dead', 'bon_dead');
    luaSpriteAddAnimationByPrefix('bon_dead', 'firstDeath', 'firstDeath', 24, false)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathLoop', 'deathLoop', 24, true)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathConfirm', 'deathConfirm', 24, false)

    setPropertyFromClass('GameOverSubstate', 'characterName', 'bon_dead')
end

--This is called every beat
function onBeatHit()
	--Actual beat is 208
	if curBeat == 4 then
		swapToTaperecorder()
	end
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

function swapToTaperecorder()
	--Swap sprites to taperecorder

	--Remove unwanted sprites
	removeLuaSprite('BG1', true)
	removeLuaSprite('hex', true);
	removeLuaSprite('golinLoop', true);
	removeLuaSprite('BG2', true);
	removeLuaSprite('BG3', true);
	removeLuaSprite('BG4', true);
	removeLuaSprite('crowd', true);
	removeLuaSprite('FG2', true);
	removeLuaSprite('FG', true);

	--Add taperecorder BG sprites
	addLuaSprite('BGT1', false)
	addLuaSprite('BGTFloor', false)

	--Change camera zoom
	setProperty('defaultCamZoom', 0.55)
end
