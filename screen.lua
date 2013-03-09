require 'util'

if not Screen then Screen = {} end

local screenTemplate = {}

function screenTemplate:update(dt) end
function screenTemplate:draw() end

function Screen.new(owner, image, buttons)
	local self = table.shallow_copy(screenTemplate)
	self.owner = owner
	self.image = image
	self.buttons = buttons
	return self
end
