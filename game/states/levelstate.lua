require("states.endstate")
require("core.player")
require("core.floater")

local STI = require("sti")

LevelState = Class('LevelState', State)


function LevelState:initialize(number)
	self.number = number
end

function LevelState:enter()
	Map = STI(string.format("assets/map/level_%d.lua", self.number), {"box2d"})
	self.world = love.physics.newWorld(0, 0)

	-- load important object level details from Tiled	
	for _, object in pairs(Map.objects) do
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

		-- create temporary platforms manually - they don't have 'collidable' property in Tiled
        if object.name == "temp" then
            local body = love.physics.newBody(self.world, object.x + object.width / 2, object.y + object.height / 2, "static")  -- Create static body

            -- Create a fixture for the object
            local shape = love.physics.newRectangleShape(object.width, object.height)
            local fixture = love.physics.newFixture(body, shape)

            -- marking it as a temporary platform
            if object.name == "temp" then
                fixture:setUserData({ temp = true, collidable = true, timer = 0, standingOn = false, hasBeenStoodOn = false, broken = false})
				object.fixture = fixture
				print("created temp")
            end
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

	Map:box2d_init(self.world)

	Map.layers.solid.visible = false
	Map.layers.death.visible = false
	
	DeathZones = {}
	-- find all tiles which the player should die at
	for _, object in pairs(Map.objects) do
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

	-- Check the timers for all temporary platforms the player is standing on
    for _, object in pairs(Map.objects) do
		if object.name == "temp" then
			local fixture = object.fixture
			if fixture then
				local userData = fixture:getUserData()
				
				-- only increment timers of platforms the player has stood on at least once.
				-- doesnt matter if they get off it, timer doesnt stop
				if userData and userData.temp and (userData.standingOn or userData.hasBeenStoodOn) then
					print("stood on")
					userData.hasBeenStoodOn = true
					
					userData.timer = userData.timer + dt

					-- Check if the timer exceeds the threshold
					if userData.timer >= .8 then  
						fixture:setSensor(true) -- mark as non-collidable rather than remove entirely
						
						if userData.standingOn then
							self.player.grounded = false
						end

						print("Temporary platform broken!")
						if not userData.broken then
							love.audio.newSource("assets/sfx/platformbreak.wav", "static"):play()
							userData.broken = true	
						end	
					end
				end
			end
		end
	end
end


function LevelState:draw()
    love.graphics.push()
    love.graphics.scale(ScalingFactor, ScalingFactor)
    love.graphics.draw(Bg)
	--self.map:draw(0, 0, ScalingFactor, ScalingFactor)
	Map:drawLayer(Map.layers["ground"])
	if not self.player.moved then
		Map:drawLayer(Map.layers["hidden"])
	end

    -- Draw all entities
    for _, value in ipairs(Entities) do
        value:draw()
    end

    love.graphics.pop()

end

function LevelState:exit()
	love.audio.newSource("assets/sfx/complete.wav", "static"):play()
end
