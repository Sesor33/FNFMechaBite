

function onCreate()
	-- background shit
	makeLuaSprite('BG1', 'phila/Layer 09_Phila BG 3', -640, -400);
	setScrollFactor('BG1', 0.1, 0.1);

	makeAnimatedLuaSprite('hex','phila/Layer 08_Phila SnowHex Loop', 1200, 0);
	addAnimationByPrefix('hex','bump','Layer 08_Phila SnowHex Loop', 24, false);
	setScrollFactor('hex', 0.5, 0.5);
	scaleObject('hex', 1, 1);

	makeAnimatedLuaSprite('golinLoop','phila/Layer 07_Phila Golin REC Loop', -200, -15);
	addAnimationByPrefix('golinLoop','bump','Layer 07_Phila Golin REC Loop', 24, false);
	setScrollFactor('golinLoop', 0.5, 0.5);
	scaleObject('golinLoop', 1, 1);

	makeLuaSprite('BG2', 'phila/Layer 06_Phila BG 2', -640, -450);
	setScrollFactor('BG2', 0.5, 0.5);

	makeLuaSprite('BG3', 'phila/Layer 05_Phila BG 1', -640, -400);
	setScrollFactor('BG3', 0.6, 0.6);

	makeLuaSprite('BG4', 'phila/Layer 04_Phila Croud Ground', -640, -350);
	setScrollFactor('BG4', 0.7, 0.7);

	makeAnimatedLuaSprite('crowd','phila/Layer 03_Phila Croud', 0, 450);
	addAnimationByPrefix('crowd','bump','Layer 03_Phila Croud', 24, false);
	setScrollFactor('crowd', 1, 1);
	scaleObject('crowd', 0.85, 0.85);

	
	makeLuaSprite('FG', 'phila/Layer 01_Phila FG 1', -550, -275);
	setScrollFactor('FG', 1, 1);
	scaleObject('FG', 1, 1);

	makeLuaSprite('FG2', 'phila/Layer 02_Phila FG 2', -640, -275);
	setScrollFactor('FG2', 1, 1);
	scaleObject('FG2', 1, 1);
	

	--Add all objects to the scene
	addLuaSprite('BG1', false);
	addLuaSprite('hex', false);
	addLuaSprite('golinLoop', false);
	addLuaSprite('BG2', false);
	addLuaSprite('BG3', false);
	addLuaSprite('BG4', false);
	addLuaSprite('crowd', false);
	addLuaSprite('FG2', false);
	addLuaSprite('FG', false);
	
	
	--close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onBeatHit()

	--Play bump animation on every other beat
	if curBeat % 2 == 0 then
		objectPlayAnimation('hex', 'bump', false);
		objectPlayAnimation('golinLoop', 'bump', false);
		objectPlayAnimation('crowd', 'bump', false);
	end
end


