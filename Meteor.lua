Meteor = class{}

Meteor:init(x, y, width, height)
 self.x = x
 self.y = y
 self.width = width
 self.height = height
end

Meteor:collide()
if (self.x + 2) + (self.width - 4) >= pipe.x and self.x + 2 <= pipe.x + PIPE_WIDTH then
    if (self.y + 2) + (self.height - 4) >= pipe.y and self.y + 2 <= pipe.y + PIPE_HEIGHT then
        return true
    end
end
end