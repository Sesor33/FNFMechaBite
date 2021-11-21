

function onCreate()
	-- background shit
	makeLuaSprite('BG1', 'phila/Layer 09_Phila BG 3', -550, -350);
	setScrollFactor('BG1', 0.1, 0.1);

	makeAnimatedLuaSprite('hex','phila/Layer 08_Phila SnowHex Loop', 1650, 70);
	addAnimationByPrefix('hex','bump','Layer 08_Phila SnowHex Loop', 24, false);
	setScrollFactor('hex', 1, 1);
	scaleObject('hex', 1, 1);

	makeAnimatedLuaSprite('golinLoop','phila/Layer 07_Phila Golin REC Loop', -200, 35);
	addAnimationByPrefix('golinLoop','bump','Layer 07_Phila Golin REC Loop', 24, false);
	scaleObject('golinLoop', 1, 1);

	makeLuaSprite('BG2', 'phila/Layer 06_Phila BG 2', -550, -400);
	setScrollFactor('BG2', 1, 1);

	makeLuaSprite('BG3', 'phila/Layer 05_Phila BG 1', -550, -350);
	setScrollFactor('BG3', 1, 1);

	makeLuaSprite('BG4', 'phila/Layer 04_Phila Croud Ground', -550, -350);
	setScrollFactor('BG4', 1, 1);

	makeAnimatedLuaSprite('crowd','phila/Layer 03_Phila Croud', -275, 250);
	addAnimationByPrefix('crowd','bump','Layer 03_Phila Croud', 24, false);
	setScrollFactor('crowd', 1, 1);
	
	makeLuaSprite('FG', 'phila/Layer 01_Phila FG 1', -550, -350);
	setScrollFactor('FG', 1, 1);
	scaleObject('FG', 1, 1);

	makeLuaSprite('FG2', 'phila/Layer 02_Phila FG 2', -550, -350);
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


