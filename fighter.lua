Fighter = {}

fighterTemplate = {}

function fighterTemplate:punch()
	if self.facing == 'right' then
		table.insert(self.strikeBoxes, StrikeBox.new(self.x, self.y, 60, 20, 50)) --60 is harcode width, 20, height, 50 is hardcocded damage amount		
	elseif self.facing == 'left' then
		table.insert(self.strikeBoxes, StrikeBox.new(self.x - 60, self.y, 60, 20, 50)) --60 is harcode width, 20, height, 50 is hardcocded damage amount		
	end
end

function fighterTemplate:draw()
	love.graphics.draw(self.image, self.x - self.image:getWidth() / 2, self.y - self.image:getHeight() / 2)
end

function Fighter.new(weight, speed, health, facing)
	self = {}
	self.weight = weight
	self.speed = speed
	self.health = health
	self.facing = facing
	self.hitBoxes = {}
	self.strikeBoxes = {}
	return self
end
