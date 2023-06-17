Game = {}

require 'player'
require 'enemy'
require 'trap'

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + 3
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - 3
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + 3
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - 3
    end
end

function love.draw()
end