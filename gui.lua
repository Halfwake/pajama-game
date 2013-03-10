require 'util'
require 'screen'
require 'resource'
require 'sprite'

if not Screen then Screen = {} end

local buttonTemplate = {}

function buttonTemplate:update(dt)
	local x, y
	x, y = love.mouse.getX(), love.mouse.getY()
	if self:isWithin(x, y) then
		self:onHover()
		if love.mouse.isDown('l') then
			self:onClick()
		end
	else
		self:onNotHover()
	end
end

function buttonTemplate:draw()
	self.sprite:draw(self.x - self.sprite.sprite_width / 2, self.y - self.sprite.sprite_height / 2)
end

function buttonTemplate:isWithin(x, y)
	self_x = self.x - self.sprite.sprite_width / 2
	self_y = self.y - self.sprite.sprite_height / 2
	if self_x < x and x < self_x + self.sprite.sprite_width then
		if self_y < y and y < self_y + self.sprite.sprite_height then
			return true
		end
	end
	return false
end

Button = {}

function buttonTemplate:onHover() end

function buttonTemplate:onClick() end

function Button.new(image, hover, click, notHover, x, y)
	local self = table.shallow_copy(buttonTemplate)
	self.sprite = Sprite.new(image, image:getWidth(), image:getHeight())
	self.x = x
	self.y = y
	if hover then self.onHover = hover end
	if notHover then self.onNotHover = notHover end
	if click then self.onClick = click end
	return self
end

local menuScreenTemplate = {}

function menuScreenTemplate:draw()
	love.graphics.draw(self.image)
	for _, button in pairs(self.buttons) do
		button:draw()
	end
end

function menuScreenTemplate:update(dt)
	for _, button in pairs(self.buttons) do
		button:update(dt)
	end
end

Screen.MenuScreen = {}

function Screen.MenuScreen.new(owner, image, buttons)
	local self = Screen.new(owner, image, buttons)
	self = table.join(self, menuScreenTemplate)
	return self
end

Screen.StartScreen = {}

function Screen.StartScreen.new(owner)
	local buttons = {
				Button.new(
						IMAGE.start_button_up,
						function(self)
							self.sprite.image = IMAGE.start_button_down
						end,
						function(self)
							owner:changeMode('MainMenuScreen')
						end,
						function(self)
							self.sprite.image = IMAGE.start_button_up
						end,
						love.graphics.getWidth() / 2,
						love.graphics.getHeight() / 2
					  )
			}
	local self = Screen.MenuScreen.new(owner, IMAGE.start_screen, buttons)
	return self
end

Screen.MainMenuScreen = {}

function Screen.MainMenuScreen.new(owner)
	local buttons = {
				--buttons need x and y arguments
				Button.new(
						IMAGE.start_button_up,
						function(self)
							self.sprite.image = IMAGE.start_button_down
						end,
						function(self)
							--go to next menu
						end,
						function(self)
							self.sprite.image = IMAGE.start_button_up
						end
					  ),
				Button.new(
						IMAGE.quit_button_up,
						function(self)
							self.sprite.image = IMAGE.quit_button_down
						end,
						function(self)
							--quit
						end,
						function(self)
							self.sprite.image = IMAGE.quit_button_up
						end
					  ),
				Button.new(
						IMAGE.match_button_up,
						function(self)
							self.sprite.image = IMAGE.match_button_down
						end,
						function(self)
							--goToMatchScreen
						end,
						function(self)
							self.sprite.image = IMAGE.match_button_up
						end
					  ),
			}
	local self = Screen.MenuScreen.new(owner, IMAGE.mainmenu_screen, buttons)
	return self
end
