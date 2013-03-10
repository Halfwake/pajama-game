require 'util'

Sprite = {}

local spriteTemplate = {}

function spriteTemplate:draw(x, y)
	local drawQuad = self:getDrawQuad()
	love.graphics.drawq(self.image, drawQuad, x, y)
end

function spriteTemplate:getDrawQuad()
	local fX
	local fY
	local stX = self.image:getWidth() / self.sprite_width
	local stY = self.image:getHeight() / self.sprite_height
	fX = self.frame % stX
	fY = self.frame / stX
	return love.graphics.newQuad(
		fX * self.sprite_width,
		fY * self.sprite_height,
		self.sprite_width,
		self.sprite_height,
		self.image:getWidth(),
		self.image:getHeight()
	)
end

function spriteTemplate:setFrame(frame)
	self.frame = frame
end

function Sprite.new(image_name, sprite_width, sprite_height)
	local self = table.shallow_copy(spriteTemplate)

	self.sprite_width = sprite_width
	self.sprite_height = sprite_height
	self.image = IMAGE[image_name]
 	self.frame = 0

	return self
end
