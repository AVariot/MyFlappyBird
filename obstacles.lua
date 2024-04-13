local Obstacles = {}

Obstacles.list = {}
Obstacles.speed = 7

function Obstacles.addObstacle()
    -- x, y heigth, width
    top_size_y = math.random(200, 400)
    bot_pos_y = top_size_y + 200
    table.insert(
        Obstacles.list, {
            {2000, 0, top_size_y, 200},
            {2000, bot_pos_y, 1000, 200},
            false
        }
    )
end

function Obstacles.removeObstacle(index)
    table.remove(
        Obstacles.list,
        index
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
    for i = #Obstacles.list, 1, -1 do
        local value = Obstacles.list[i]
        if value[1][1] + value[1][3] <= 0 then
            Obstacles.removeObstacle(i)  -- Correction ici
        end
    end
    for i, value in ipairs(Obstacles.list) do
        love.graphics.rectangle("fill", value[1][1], value[1][2], value[1][4], value[1][3])
        love.graphics.rectangle("fill", value[2][1], value[2][2], value[2][4], value[2][3])
    end
    love.graphics.setColor(255, 255, 255)
end

function Obstacles.destroyer()
    for i = #Obstacles.list, 1, -1 do
        Obstacles.removeObstacle(i)
    end
end

return Obstacles
