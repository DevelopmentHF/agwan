require("states.endstate")
require("core.player")
require("core.floater")

local STI = require("sti")

LevelState = Class('LevelState', State)


function LevelState:initialize()
	self.map = STI("assets/map/level_1.lua", {"box2d"})
	self.world = love.physics.newWorld(0, 0)

	self.player = Player:new(
		6 * TileWidth,
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

	-- Set user data for objects on the death layer
    for _, layer in ipairs(self.map.layers) do
        if layer.name == "death" then
            for _, object in ipairs(layer.objects) do
                if object.fixture then
                    object.fixture:setUserData("death")
                end
            end
        end
    end

	self.map.layers.solid.visible = false
	self.map.layers.death.visible = false

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
	--self.map:draw(0, 0, ScalingFactor, ScalingFactor)
	self.map:drawLayer(self.map.layers["ground"])
	if not self.player.moved then
		self.map:drawLayer(self.map.layers["hidden"])
	end

    -- Draw all entities
    for _, value in ipairs(Entities) do
        value:draw()
    end
	
    love.graphics.pop()

end

function LevelState:exit()

end
