local Bird = {}

Bird.flappyBird = nil
Bird.flappyX = 100
Bird.flappyY = 100
--                   x, y, width, heigth
Bird.hitbox = {
    Bird.flappyX + 45,
    Bird.flappyY + 69,
    160,
    113
}
Bird.is_alive = true
Bird.print_hitbox = false
Bird.point = 0

function Bird.load()
    Bird.flappyBird = love.graphics.newImage("flappy.png")
end

function Bird.update(top)
    -- Mise à jour de la position et de la hitbox de l'oiseau
    if top == 0 then
        Bird.flappyY = Bird.flappyY + 2
    else
        Bird.flappyY = Bird.flappyY - 5
    end
    Bird.hitbox[2] = Bird.flappyY + 69
end

function Bird.draw()
    if Bird.is_alive then
        love.graphics.draw(Bird.flappyBird, Bird.flappyX, Bird.flappyY, 0, 0.5, 0.5)
        if Bird.print_hitbox then
            love.graphics.setColor(255, 0, 0)
            love.graphics.rectangle("line", Bird.hitbox[1], Bird.hitbox[2], Bird.hitbox[3], Bird.hitbox[4])
            love.graphics.setColor(255, 255, 255)
        end
    end
end

function Bird.collision(obstacles)
    for i, value in ipairs(obstacles) do
        if (Bird.hitbox[1] + Bird.hitbox[3]) >= value[1][1] and (Bird.hitbox[1] + Bird.hitbox[3]) <= (value[1][1] + value[1][4]) and value[3] == false then
            if Bird.hitbox[2] <= value[1][3] or (Bird.hitbox[2] + Bird.hitbox[4]) >= value[2][2] then
                Bird.is_alive = false
            else
                Bird.point = Bird.point + 1
                value[3] = true
            end
        end
    end
end

return Bird
