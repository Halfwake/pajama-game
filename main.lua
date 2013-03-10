require 'screen'
require 'gui'
require 'sprite'

function love.load()
	love.graphics.setCaption('Pajama Game')

	Root = {}

	sprite_a = Sprite.new("start_button", 256, 64)
	sprite_b = Sprite.new("start_button", 256, 64)
	sprite_b:setFrame(1)

	function Root:changeMode(newMode)
		self.screen = Screen[newMode].new(self)
		self.mode = newMode
	end

	function Root:draw()
		if self.screen then
			self.screen:draw()

			sprite_a:draw(10, 400)
			sprite_b:draw(10, 500)
		end
	end

	function Root:update(dt)
		if self.screen then
			self.screen:update()
		end
	end

	Root:changeMode('StartScreen')
end

function love.update(dt)
	Root:update(dt)
end

function love.draw()
	Root:draw()	
end
