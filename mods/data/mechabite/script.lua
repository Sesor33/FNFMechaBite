--Cutscene functions
local allowCountdown = false
local isSwapped = false
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

	makeAnimatedLuaSprite('BGT2', 'phila/taperecorder/Layer 08_TR City', -1200, -1115);
	addAnimationByPrefix('BGT2', 'bump', 'Layer 08_TR City', 24, false);
	scaleObject('BGT2', 1.7, 1.7);

	makeAnimatedLuaSprite('BGTShootingStar', 'phila/taperecorder/Layer 10_TR Shootingstar', -1200, -1115);
	addAnimationByPrefix('BGTShootingStar','bump','Layer 10_TR Shootingstar Instanz ',24,false);
	setScrollFactor('BGTShootingStar', 0.5, 0.5);
	scaleObject('BGTShootingStar', 1.7, 1.7);

	makeAnimatedLuaSprite('BGTStars', 'phila/taperecorder/Layer 9_TR Stars', -1200, -1115);
	addAnimationByPrefix('BGTStars','bump','Layer 09_TR Stars', 24,false);
	setScrollFactor('BGTStars', 0.5, 0.5);
	scaleObject('BGTStars', 1.7, 1.7);

	makeAnimatedLuaSprite('BGTFog', 'phila/taperecorder/Layer 07_TR Fog 02', -1200, -1115);
	addAnimationByPrefix('BGTFog','bump','Layer 07_TR Fog 02', 24,true);
	scaleObject('BGTFog', 1.7, 1.7);

	makeLuaSprite('BGTFloor', 'phila/taperecorder/Layer 03_TR Ground', -1200, -1115);
	scaleObject('BGTFloor', 1.7, 1.7);
	
	makeAnimatedLuaSprite('BGTBird', 'phila/taperecorder/Layer 02_Birb', 2750, 850);
	addAnimationByPrefix('BGTBird','bump','Layer 02_Birb', 24,false);
	scaleObject('BGTBird', 2, 2);

	makeAnimatedLuaSprite('FGT1', 'phila/taperecorder/Layer 01_TR FG', -1200, -1115);
	addAnimationByPrefix('FGT1','bump','Layer 01_TR FG', 24,false);
	scaleObject('FGT1', 1.7, 1.7);

	--Add Bon death sprite
    readyDeathSprite()
end

--This is called every beat
function onBeatHit()
	--Actual beat is 208
	if curBeat == 4 then
		swapToTaperecorder()
	end

	--Play every headbop
	if isSwapped and curBeat % 2 == 0 then
		objectPlayAnimation('BGT2', 'bump', false);
		objectPlayAnimation('BGTStars', 'bump', false);
		objectPlayAnimation('FGT1', 'bump', false);
		objectPlayAnimation('BGTBird', 'bump', false);	
	end

	--Play every measure
	if isSwapped and curBeat % 4 == 0 then
		objectPlayAnimation('BGTShootingStar', 'bump', false);
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
	addLuaSprite('BGT2', false)
	addLuaSprite('BGTStars', false)
	addLuaSprite('BGTShootingStar', false)
	addLuaSprite('BGTFog', false)
	addLuaSprite('BGTFloor', false)
	addLuaSprite('BGTBird', false)
	addLuaSprite('FGT1', false)

	--Change player position
	setProperty('boyfriend.x', 1750)
	setProperty('dad.x', -200)
	setProperty('gf.x', 1200)
	setProperty('gf.y', 180)

	--Change camera zoom
	setProperty('defaultCamZoom', 0.50)	

	isSwapped = true
end

--readyDeathSprite adds bon's death sprite
function readyDeathSprite()
	addCharacterToList('bon_dead', 'boyfriend')
    
    makeAnimatedLuaSprite('bon_dead', 'bon_dead');
    luaSpriteAddAnimationByPrefix('bon_dead', 'firstDeath', 'firstDeath', 24, false)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathLoop', 'deathLoop', 24, true)
    luaSpriteAddAnimationByPrefix('bon_dead', 'deathConfirm', 'deathConfirm', 24, false)

    setPropertyFromClass('GameOverSubstate', 'characterName', 'bon_dead')
end
