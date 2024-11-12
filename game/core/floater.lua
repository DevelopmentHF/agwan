require("core.entity")

Floater = Class('Floater', Entity)

function Floater:initialize(x, y, startFrame, endFrame, spriteRow, spriteWidth, spriteHeight, animationDuration)
	Entity.initialize(self, x, y, startFrame, endFrame, spriteRow, spriteWidth, spriteHeight, animationDuration)

	 -- Store the initial position as the center of the circular path
    self.centerX = x - TileWidth/2
    self.centerY = y - TileHeight/2
    self.radius = 35  -- Radius of the circle
    self.speed = 1     -- Speed of rotation
    self.angle = 0              -- Starting angle
end

function Floater:move(dt)
    -- Update the angle based on speed and time delta
    self.angle = self.angle + self.speed * dt

    -- Calculate the new x and y positions based on the angle
    self.position.x = self.centerX + math.cos(self.angle) * self.radius
    self.position.y = self.centerY + math.sin(self.angle) * self.radius
end

function Floater:update(dt)
	Entity.update(self, dt)
	self:move(dt)
end

function Floater:draw()
	-- Draw the dotted circular path
    love.graphics.setColor(1, 1, 1, 0.1)  -- Set color with some transparency
    local numDots = 20                    -- Number of dots around the circle
    for i = 0, numDots - 1 do
        local angle = (i / numDots) * 2 * math.pi
        local dotX = self.centerX + math.cos(angle) * self.radius
        local dotY = self.centerY + math.sin(angle) * self.radius
        love.graphics.circle("fill", dotX, dotY, 1)  -- Draw a small circle for each dot
    end

    -- Reset color for drawing the floater
    love.graphics.setColor(1, 1, 1, 1)
	Entity.draw(self)
end


