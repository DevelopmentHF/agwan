require("states.endstate")
require("core.player")
require("core.floater")

local STI = require("sti")

LevelState = Class('LevelState', State)


function LevelState:initialize(number)
	self.number = number
end

function LevelState:enter()
	self.map = STI(string.format("assets/map/level_%d.lua", self.number), {"box2d"})
	self.world = love.physics.newWorld(0, 0)

	-- load important object level details from Tiled	
	for _, object in pairs(self.map.objects) do
		-- spawn point
		if object.name == "spawn" then
			self.spawnX = object.x
			self.spawnY = object.y
		end

		-- level end point
		if object.name == "end" then
			EndZone = {
				x = object.x,
				y = object.y,
				width = object.width,
				height = object.height
			}
		end
	end

	self.player = Player:new(
		self.spawnX,
		self.spawnY,
		1,
		8,
		8,
		TileWidth,
		TileHeight-2,
		0.05,
		self.world
	)

	-- Set specific collision callbacks for player instance
    self.world:setCallbacks(
        function(a, b, collision) self.player:beginContact(a, b, collision) end,
        function(a, b, collision) self.player:endContact(a, b, collision) end
    )

	self.map:box2d_init(self.world)

	self.map.layers.solid.visible = false
	self.map.layers.death.visible = false
	
	DeathZones = {}
	-- find all tiles which the player should die at
	for _, object in pairs(self.map.objects) do
		-- death zone 
		if object.name == "death" then
			table.insert(DeathZones, {
				x = object.x,
            	y = object.y,
				width = object.width,
				height = object.height
			})
		end
	end
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
