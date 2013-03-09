require 'util'

Menu = {}

local buttonTemplate = {}

function buttonTemplate:update(dt)
	local x, y
	x, y = love.mouse.getX(), love.mouse.getY()
	if love.box.isWithin(x, y) then
		self:onHover()
		if love.mouse.isDown('l') then
			self:onClick()
		end
	end
end

function buttonTemplate:draw()
	love.graphics.draw(self.image, self.x - self.image:getWidth() / 2, self.y - self.image:getHeight() / 2)
end

function buttonTemplate:onHover() end

function buttonTemplate:onClick() end

function Button.new(image, hover, click)
	local self = table.shallow_copy(buttonTemplate)
	self.image= image
	if hover then self.onHover = hover end
	if click then self.onClick = click end
	return self
end

MenuScreen = {}

local menuScreenTemplate = {}

function menuScreenTemplate:update(dt)
	for _, button in pairs(self.buttons) do
		button:update(dt)
	end
end

function MenuScreen.new(image, buttons)
	local self = table.shallow_copy(menuScreenTemplate)
	self.image = image
	self.buttons = buttons
	return self
end
