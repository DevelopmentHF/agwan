require("core.entity")

Player = Class('Player', Entity)

function Player:initialize(x, y, startFrame, endFrame, spriteRow, spriteWidth, spriteHeight, animationDuration, world)
	Entity.initialize(self, x, y, startFrame, endFrame, spriteRow, spriteWidth, spriteHeight, animationDuration)
	
	self.spawnX = x
	self.spawnY = y

	self.width = spriteWidth
	self.height = spriteHeight
	self.xVel = 0
	self.yVel = 0
	self.maxSpeed = 100
	self.acceleration = 4000 -- 200/4000 = 0.05s to speed up to max
	self.friction = 3500
	self.gravity = 1500
	self.jumpFactor = -250

	self.grounded = false

	self.moved = false

	self.isDying = false
	self.deathTimer = animationDuration * ((endFrame - startFrame) + 1)
	self.animation:pauseAtStart()

	self.physics = {}
	self.physics.body = love.physics.newBody(world, self.x, self.y, "dynamic")
	self.physics.body:setFixedRotation(true) -- dont rotate
	self.physics.shape = love.physics.newRectangleShape(self.width, self.height)
	self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape)

	self.dt = 0
end

function Player:update(dt)
	Entity.update(self, dt)
	self.dt = dt

	-- special death update logic
	if self.isDying then
		-- Reduce the death timer
		self.deathTimer = self.deathTimer - dt
		if self.deathTimer <= 0 then
			self:respawn() -- Respawn after death animation/delay
		end
	else
		-- Normal update logic
		self:syncPhysics()
		self:applyGravity(dt)
		self:move(dt)
		if self:inDeathZone() then
			self:die()
		elseif self:inEndZone() then
			stateManager:switchToNextLevel()
		end
	end
end

function Player:move(dt)
	if love.keyboard.isDown("d", "right") then
		if self.xVel < self.maxSpeed then
			if self.xVel + self.acceleration * dt < self.maxSpeed then
				self.xVel = self.xVel + self.acceleration * dt
			else
				self.xVel = self.maxSpeed
			end
			self.moved = true
		end
	elseif love.keyboard.isDown("a", "left") then
		if self.xVel > -self.maxSpeed then
			if self.xVel - self.acceleration * dt > -self.maxSpeed then
				self.xVel = self.xVel - self.acceleration * dt
			else
				self.xVel = -self.maxSpeed
			end
		end
		self.moved = true
	else
		self:applyFriction(dt)
	end
end

function Player:applyGravity(dt)
	if not self.grounded then
		self.yVel = self.yVel + self.gravity * dt
	end
end

function Player:applyFriction(dt)
	if self.xVel > 0 then
		if self.xVel - self.friction * dt > 0 then
			self.xVel = self.xVel - self.friction * dt
		else
			self.xVel = 0
		end
	elseif self.xVel < 0 then
		if self.xVel + self.friction * dt < 0 then
			self.xVel = self.xVel + self.friction * dt
		else
			self.xVel = 0
		end
	end
end

function Player:syncPhysics()
	self.x, self.y = self.physics.body:getPosition();
	self.physics.body:setLinearVelocity(self.xVel, self.yVel)
end


function Player:beginContact(a, b, collision)
    if self.grounded == true then return end

    local nx, ny = collision:getNormal()
    local fixture, otherFixture = a, b

    if b == self.physics.fixture then
        fixture, otherFixture = b, a
    end

	-- Check if the player is colliding with a temporary platform 
    if otherFixture and otherFixture:getUserData() then
        local object = otherFixture:getUserData()
        if object and object.temp then
            print("Player is on a temporary platform. It should break.")
            object.standingOn = true  -- Mark that the player is standing on it
			
			-- for some reason with manually platform creation temp platform normals are inverted to regular
			-- collidable objects straight from tiled
			if ny < 0 then
				self:land(collision)
			end
        end
    end

    if ny > 0 then
        self:land(collision)
    end

end

-- check whether the player is within a death bounded area 
function Player:inDeathZone()
	for _, zone in pairs(DeathZones) do
		-- Check if the player's x and y are within the bounds of the zone
		if self.x > zone.x and self.x < zone.x + zone.width and
		   self.y > zone.y and self.y < zone.y + zone.height then
			return true
		end
	end
	return false -- Player is safe
end

function Player:inEndZone()
	local zone = EndZone
	-- Check if the player's x and y are within the bounds of the end zone
	if self.x > zone.x and self.x < zone.x + zone.width and
	   self.y > zone.y and self.y < zone.y + zone.height then
		return true
	end
	return false -- Player is not in the end zone
end

-- Play death anim and stuff
function Player:die()
	if not self.isDying then
		self.isDying = true
		self.animation:resume()
		love.audio.newSource("assets/sfx/hitHurt.wav", "static"):play()
	end
end

function Player:respawn()
	-- Reset player position, velocity, and state
	self.x = self.spawnX
	self.y = self.spawnY
	self.xVel = 0
	self.yVel = 0
	self.isDying = false
	self.deathTimer = self.animationDuration * ((self.endFrame - self.startFrame) + 1)
	self.physics.body:setPosition(self.spawnX, self.spawnY)
	self.physics.body:setLinearVelocity(0, 0)

	-- reset temporary platforms too
	for _, object in pairs(Map.objects) do
		if object.name == "temp" then
			-- Ensure the object has a fixture and userData
			if object.fixture then
				local userData = object.fixture:getUserData()

				if userData then
					-- Reset the userData properties
					userData.standingOn = false  -- Reset the standingOn state
					userData.timer = 0           -- Reset the timer
					userData.collidable = true   -- Ensure the platform is collidable
					userData.hasBeenStoodOn = false
					userData.broken = false

					-- Set the fixture as non-sensor (collidable) if it was a sensor
					object.fixture:setSensor(false)
				end
			end
		end
	end

	-- pause death anim
	self.animation:gotoFrame(1) -- Restart the animation from the first frame
	self.animation:pause()
end

function Player:land(collision)
	self.currentGroundCollision = collision
	self.yVel = 0
	self.grounded = true
end

function Player:endContact(a, b, collision)
    if a == self.physics.fixture or b == self.physics.fixture then
        -- Check if the collision involves the player and a temporary platform
        local tempObject
        if a:getUserData() and a:getUserData().temp then
            tempObject = a
        elseif b:getUserData() and b:getUserData().temp then
            tempObject = b
        end

        if tempObject then
            -- Get the userData of the temporary platform
            local userData = tempObject:getUserData()
            
            if userData and userData.temp then
                -- Reset the standingOn state to false when the player leaves the platform
                userData.standingOn = false
                print("Player is no longer standing on the platform.")
            end
        end

        -- Ensure grounded state is reset
        if self.currentGroundCollision == collision then
            self.grounded = false
        end
    end
end

function Player:jump(key)
	if (key == "w" or key == "up") and self.grounded then
		self.yVel = self.jumpFactor
		self.grounded = false
		love.audio.newSource("assets/sfx/playerjump.wav", "static"):play()
	end
end

function Player:keypressed(key)
    if (key == "w" or key == "up") and self.grounded then
        self:jump(key)
    end
end

function Player:draw()
	Entity.draw(self)
	--love.graphics.circle("fill", self.x, self.y, 1)
end

