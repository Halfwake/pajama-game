box = {}

function box.new(x, y, width, height)
	if not height then height = width end
	self = {}
	self.x = x
	self.y = y
	self.width = width
	self.height = height
	function self:bottom()
		return self.y + self.width
	end
	function self:top()
		return self.y
	end
	function self:right()
		return self.x + self.width
	end
	function self:left()
		return self.x
	end
	function self:halfWidth()
		return self.width / 2
	end
	function self:halfHeight()
		return self.height / 2
	end
	function self:isColliding(other)
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
	return self
end
