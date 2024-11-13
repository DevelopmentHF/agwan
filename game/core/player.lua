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
end

function Player:update(dt)
	Entity.update(self, dt)

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

    -- Check if the player lands on a "death" object
    if ny > 0 then
        self:land(collision)
    end
end

-- check whether the player is within a death bounded area 
function Player:inDeathZone()
	for _, zone in pairs(DeathZones) do
		if self.x < zone.x + zone.width and
		   self.x + self.width > zone.x and
		   self.y < zone.y + zone.height and
		   self.y + self.height/2 > zone.y then
			return true
		end
	end
	return false -- Player is safe
end

-- Play death anim and stuff
function Player:die()
	if not self.isDying then
		self.isDying = true
		self.animation:resume()
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
		if (self.currentGroundCollision == collision) then
			self.grounded = false	
		end
	end
end

function Player:jump(key)
	if (key == "w" or key == "up") and self.grounded then
		self.yVel = self.jumpFactor
		self.grounded = false
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

