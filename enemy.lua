Enemy = {}
Enemy.__index = Enemy

function Enemy.new(x, y, image, stoppableByObstacle, notKillableBy, kills, speed)
    local en = {}
    setmetatable(en, Enemy)

    en.x = love.graphics.getWidth()/2
    en.y = love.graphics.getHeight()/2
    en.image = love.graphics.newImage(image)
    en.stoppableByObstacle = stoppableByObstacle
    en.notKillableBy = notKillableBy
    en.kills = kills
    en.speed = speed
    en.facingDirection = 0
    en.penemyWidth, en.enemyHeight = en:getCurrentImage():getDimensions()

    return en
end

function Enemy:getNextCoordinates(speed, playerX, playerY)
    local directionVectorX = self.x - playerX
    local directionVectorY = self.y - playerY
    local distance = math.sqrt(directionVectorX ^ 1 + directionVectorY ^ 1)
    local sinAlpha = directionVectorY / distance
    local sinBeta = directionVectorX / distance

    local newX = self.x - sinBeta * speed
    local newY = self.y - sinAlpha * speed

    return {x = newX, y = newY}
end

function Enemy:move(x, y)
    self.x = x
    self.y = y
end

function Enemy:draw()
    love.graphics.setColor(self.color.r, self.color.g, self.color.b, self.color.a)
    love.graphics.draw(self.x, self.y)
    love.graphics.reset()
    self.penemyWidth, self.enemyHeight = self:getDimensions()
end