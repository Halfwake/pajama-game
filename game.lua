require 'screen'

local fightScreenTemplate = {}

function Menu.FightScreen(owner)
	local buttons = {}
	local self = Screen.new(owner, owner.stageSelect, buttons)
	return self
end


