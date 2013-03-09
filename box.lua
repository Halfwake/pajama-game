require 'util'

Box = {}

local boxTemplate = {}

function boxTemplate:bottom()
	return self.y + self.width
end

function boxTemplate:top()
	return self.y
end

function boxTemplate:right()
	return self.x + self.width
end

function boxTemplate:left()
	return self.x
end

function boxTemplate:halfWidth()
	return self.width / 2
end

function boxTemplate:halfHeight()
	return self.height / 2
end

function boxTemplate:isColliding(other)
	if self:left() < other:left() and other:left() < self:right() then
		if self:top() < other:top() and other:top() < self:bottom() then
			return true
		elseif self:top() < other:bottom() and other:bottom() < self:bottom() then
			return true
		end
	elseif self:left() < other:right() and other:right() < self:right() then
		if self:top() < other:top() and other:top() < self:bottom() then
			return true
		elseif self:top() < other:bottom() and other:bottom() < self:bottom() then
			return true
		end
	end
	return false
end

function Box.new(x, y, width, height)
	if not height then height = width end
	local self = table.shallow_copy(boxTemplate)
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	return self
end

function HitBox.new(x, y, width, height, damage)
	local self = Box.new(x, y, width, height)
	self.damage = damage
	return self
end

function StrikeBox.new(x, y, width, height)
	local self = Box.new(x, y, width, height)
	return self
end
