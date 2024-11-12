require("states.endstate")
require("core.player")
require("core.floater")

local STI = require("sti")

LevelState = Class('LevelState', State)


function LevelState:initialize()
	self.map = STI("assets/map/map.lua", {"box2d"})
	self.world = love.physics.newWorld(0, 0)

	self.player = Player:new(
		7 * TileWidth,
		50,
		1,
		1,
		8,
		TileWidth,
		TileHeight-2,
		0.1,
		self.world
	)

	-- Set specific collision callbacks for player instance
    self.world:setCallbacks(
        function(a, b, collision) self.player:beginContact(a, b, collision) end,
        function(a, b, collision) self.player:endContact(a, b, collision) end
    )

	self.map:box2d_init(self.world)
	self.map.layers.solid.visible = false 

end

function LevelState:enter()
	Entities = {}
	
	-- load player
	table.insert(Entities, self.player)


end

function LevelState:update(dt)
	-- update world
	self.world:update(dt)

	-- Update all entities
    for _, value in ipairs(Entities) do
		value:update(dt)
    end

    -- Switch to GameOverState 
    if GameOverFlag then
        stateManager:switch(EndState:new())
    end
end


function LevelState:draw()
    love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)
    love.graphics.draw(Bg)
	self.map:draw(0, 0, ScalingFactor, ScalingFactor)

    -- Draw all entities
    for _, value in ipairs(Entities) do
        value:draw()
    end
	
    love.graphics.pop()

end

function LevelState:exit()

end
