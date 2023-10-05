Player = Class{}

function Player:init(x, y, width, height, life)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.life = life
    self.dx = 0
    self.dy = 0
end

function Player:update(dt)
    self.y = self.y + self.dy * dt < WINDOW_HEIGHT - self.height and math.max(0, self.y + self.dy * dt) or WINDOW_HEIGHT - self.height
    self.x = self.x + self.dx * dt
end

function Player:render()
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
end