local Obstacles = {}

Obstacles.list = {}
Obstacles.speed = 5

function Obstacles.addObstacle()
    --                             x, y heigth, width
    table.insert(
        Obstacles.list, {
            {2000, 0, 300, 200},
            {2000, 1080 - 400, 600, 200},
            false
        }
    )
end

function Obstacles.move()
    for i, value in ipairs(Obstacles.list) do
        value[1][1] = value[1][1] - Obstacles.speed
        value[2][1] = value[2][1] - Obstacles.speed
    end
end

function Obstacles.draw()
    love.graphics.setColor(0, 255, 0)
    for i, value in ipairs(Obstacles.list) do
        love.graphics.rectangle("fill", value[1][1], value[1][2], value[1][4], value[1][3])
        love.graphics.rectangle("fill", value[2][1], value[2][2], value[2][4], value[2][3])
    end
    love.graphics.setColor(255, 255, 255)
end

return Obstacles
