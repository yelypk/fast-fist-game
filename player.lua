Player = {}
Player.__indes = Player


function Player.new(x,y)
    local pl = {}
    setmetatable(pl, Player)

    pl.x = love.graphics.getWidth()/2
    pl.y = love.graphics.getHeight()/2
    pl.image = love.graphics.newImage("/assets/images/player/player.png")
    pl:setColor(1)

    pl.facingDirection = 0
    pl.playerWidth, pl.playerHeight = pl:getCurrentImage():getDimensions()

    return pl
end


function Player:getX()
    return self.x
end

function Player:getY()
    return self.y
end


function Player:moveX(p)
    -- 0 = right, 1 = down, 2 = left, 3 = up
    if p < 0 then
        self.facingDirection = 2
    else
        self.facingDirection = 0
    end

    self.x = self.x + p

    -- Stop at borders
    if self.x < 0 then
        self.x = 0
    end
    if (self.x + self.playerWidth) > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() - self.playerWidth
    end
end


function Player:moveY(pr)
    -- 0 = right, 1 = down, 2 = left, 3 = up
    if pr < 0 then
        self.facingDirection = 3
    else
        self.facingDirection = 1
    end

    self.y = self.y + pr

    -- Stop at borders
    if self.y < 0 then
        self.y = 0
    end
    if (self.y + self.playerHeight) > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.playerHeight
    end
end


function Player:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.draw(self.x, self.y)
    love.graphics.reset()
    self.playerWidth, self.playerHeight = self:getDimensions()
end

function Player:setColor(currentElement)
    local elementColors = {
        -- red
        {r = 1, g = 0, b = 0, a = 1},
        -- blue
        {r = 0, g = 0.8, b = 1, a = 1},
        -- grey
        {r = 0.5, g = 0.5, b = 0.5, a = 1},
        -- yellow
        {r = 1, g = 1, b = 0, a = 1}
    }

    self.color = elementColors[currentElement]
end

