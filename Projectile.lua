cooldown = 0.5

Projectile = Class{}

function Projectile:init(shooter)
    self.x = shooter.x + shooter.width
    self.y = shooter.y
    self.dx = 100
end

function Projectile:update(dt)
    self.x = self.x + self.dx * dt
end

function Projectile:render()
    love.graphics.rectangle('fill', self.x, self.y, 25, 25)
end