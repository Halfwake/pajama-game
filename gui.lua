require 'util'
require 'screen'
require 'resource'

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
	love.graphics.draw(self.image, self.x - self.image:getWidth() / 2, self.y - self.image:getHeight() / 2)
end

function buttonTemplate:isWithin(x, y)
	self_x = self.x - self.image:getWidth() / 2
	self_y = self.y - self.image:getHeight() / 2
	if self_x < x and x < self_x + self.image:getWidth() then
		if self_y < y and y < self_y + self.image:getHeight() then
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
	self.image = image
	if not x then self.x = love.graphics.getWidth() / 2 - self.image:getWidth() / 2 else self.x = x end
	if not y then self.y = love.graphics.getHeight() / 2 - self.image:getHeight() / 2 else self.y = y end
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
							self.image = IMAGE.start_button_down
						end,
						function(self)
							owner:changeMode('MainMenu')
						end,
						function(self)
							self.image = IMAGE.start_button_up
						end
					  )
			}
	local self = Screen.MenuScreen.new(owner, IMAGE.start_screen, buttons)
	return self
end
