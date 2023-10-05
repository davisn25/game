WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
x = WINDOW_WIDTH/2
y = WINDOW_HEIGHT/2

Class = require 'class'
require 'Player'
require "Enemy"
require 'Projectile'

local background = love.graphics.newImage('this.jpg')
local backgroundScroll = 0
local BACKGROUND_SCROLL_SPEED = 100
local BACKGROUND_LOOPING_POINT = 6000

projectiles  = {}

function love.load()
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    player1 = Player(x, y, 10, 10, 5)

    love.window.setTitle("meu jogo")
    gameState = 'initial'
end

function love.update(dt)
    backgroundScroll = (backgroundScroll + BACKGROUND_SCROLL_SPEED * dt) % BACKGROUND_LOOPING_POINT

    if love.keyboard.isDown('w') then
        player1.dy = -200
    elseif love.keyboard.isDown('s') then
        player1.dy = 200
    else
        player1.dy = 0
    end

    if love.keyboard.isDown('a') then
        player1.dx = -200
    elseif love.keyboard.isDown('d') then
        player1.dx = 200
    else
        player1.dx = 0
    end

    if love.keyboard.isDown('k') then
        if cooldown >= 0.5 then
            table.insert(projectiles, Projectile(player1))
            cooldown = 0
        end
    end

    cooldown = cooldown + dt

    for k, projectile in pairs(projectiles) do
        projectile:update(dt)
    end

    player1:update(dt)
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' then
        gameState = 'play'
    end
end

function love.draw()
    love.graphics.draw(background, -backgroundScroll, 0) 
    love.graphics.printf("Life: " .. player1.life, 10, 10, 50, 'left')

    if gameState == 'initial' then
        love.graphics.printf('Press Enter to play', 0, 30, WINDOW_WIDTH, 'center')
    end

    player1:render()

    for k, projectile in pairs(projectiles) do
        projectile:render()
    end

    function displayFPS()
        love.graphics.print('FPS: ' .. tostring(love.timer.getFPS()), 10, 10)
    end    
end

