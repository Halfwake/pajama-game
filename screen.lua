Root = {
		mode = 'startscreen',
       }

function Root.changeMode(newMode)
	self.mode = newMode
	if self.mode == 'startscreen' then
		self.screen = Menu.StartScreen.new()
	elseif self.mode == 'mainmenu' then
		self.screen = Menu.MainMenuScreen.new()
	end
end

function Root.draw()
	if self.screen then
		self.screen:draw()
	end
end

function Root.update()
	if self.screen then
		self.screen:update()
	end
end

		


