require 'screen'
require 'gui'
	
function love.load()
	love.graphics.setCaption('Pajama Game')

	Root = {}

	function Root:changeMode(newMode)
		self.screen = Screen[newMode].new(self)
		self.mode = newMode
	end

	function Root:draw()
		if self.screen then
			self.screen:draw()
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
