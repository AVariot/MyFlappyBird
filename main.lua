local Bird = require("bird")
local Obstacles = require("obstacles")
local Menu = require("menu")

local keyPressed
local top = 0
local STATE_ENUM = {
    MENU = 1,
    GAME = 2,
    SETTINGS = 3
}
local State = STATE_ENUM.MENU
local menu_touch = nil

function love.keypressed(key)
    if State == STATE_ENUM.GAME then
        if key == "space" then
            keyPressed = "space"
            top = 20
        elseif key == "h" then
            Bird.print_hitbox = not Bird.print_hitbox
        end
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if State == STATE_ENUM.MENU then
        if button == 1 then
            menu_touch = Menu.update(x, y)
        end
    end
end

function love.load()
    love.window.setMode(1920, 1080)
    love.window.setTitle("MyLoveFlappy2D")
    love.graphics.setBackgroundColor(0.41, 0.53, 0.97)
    Menu.load()
end

function love.update(dt)
    if State == STATE_ENUM.GAME then
        Bird.update(top)
        if keyPressed == "space" then
            if top == 0 then
                keyPressed = ""
            else
                top = top - 2
            end
        end
        Obstacles.move()
        Bird.collision(Obstacles.list)
    elseif State == STATE_ENUM.MENU then
        if menu_touch == "play" then
            Obstacles.addObstacle()
            Bird.load()
            State = STATE_ENUM.GAME
        elseif menu_touch == "quit" then
            love.event.quit()
        end
    end
end

function love.draw()
    if State == STATE_ENUM.GAME then
        Bird.draw()
        Obstacles.draw()
        love.graphics.setFont(love.graphics.newFont(50))
        love.graphics.setColor(254, 254, 254)
        love.graphics.print(Bird.point, 1920 / 2 - 25, 10)
        love.graphics.setColor(255, 255, 255)
    elseif State == STATE_ENUM.MENU then
        Menu.draw()
    end
end
