ROT = require "lib/rotLove/rot"
SCREEN_H = 46
SCREEN_W = 78
FORE_COLOR = ROT.Color.fromString("white")
BACK_COLOR = ROT.Color.fromString("black")

function love.load()
--rotLove's display object accepts an integer width, height, a float scale, and a LOVE color for foreground and background
	display = ROT.Display:new(SCREEN_W, SCREEN_H, 1, FORE_COLOR, BACK_COLOR)
	
	player = {x = SCREEN_W / 2, y = SCREEN_H / 2}

	display:writeCenter('@', SCREEN_H/2)
--So that you can hold down a key to move
	love.keyboard.setKeyRepeat(true)
end

function love.keypressed(key)
	if key == "up" then
		player.y = player.y - 1
	elseif key == "right" then
		player.x = player.x + 1
	elseif key == "down" then
		player.y = player.y + 1
	elseif key == "left" then
		player.x = player.x - 1
	end
end

function love.update(dt)
--This will clear the previous player character
	display:clear()
	display:write('@', player.x, player.y)
end
		
function love.draw()
	display:draw()
end
