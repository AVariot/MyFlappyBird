local Menu = {}

Menu.hitbox_start_button = {}
Menu.hitbox_quit_button = {}

function Menu.load()
    -- x, y, width, height, {r, g, b}, text
    Menu.hitbox_start_button = {300, 400, 300, 100, "START"}
    Menu.hitbox_quit_button = {1200, 400, 300, 100, "QUIT"}
end

function Menu.draw()
    -- print button start
    love.graphics.rectangle(
        "fill",
        Menu.hitbox_start_button[1],
        Menu.hitbox_start_button[2],
        Menu.hitbox_start_button[3],
        Menu.hitbox_start_button[4]
    )
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.setColor(0, 200, 0)
    love.graphics.print(Menu.hitbox_start_button[5], Menu.hitbox_start_button[1] + 75, Menu.hitbox_start_button[2] + 25)
    love.graphics.setColor(1, 1, 1)
    
    -- print button quit
    love.graphics.rectangle(
        "fill",
        Menu.hitbox_quit_button[1],
        Menu.hitbox_quit_button[2],
        Menu.hitbox_quit_button[3],
        Menu.hitbox_quit_button[4]
    )
    love.graphics.setFont(love.graphics.newFont(50))
    love.graphics.setColor(200, 0, 0)
    love.graphics.print(Menu.hitbox_quit_button[5], Menu.hitbox_quit_button[1] + 100, Menu.hitbox_quit_button[2] + 25)
    love.graphics.setColor(255, 255, 255)
end

function Menu.update(x, y)
    -- Check le bouton start
    if x >= Menu.hitbox_start_button[1] and x <= (Menu.hitbox_start_button[1] + Menu.hitbox_start_button[3]) then
        if y >= Menu.hitbox_start_button[2] and y <= (Menu.hitbox_start_button[2] + Menu.hitbox_start_button[4]) then
            return "play"
        end
    end
    -- Check le bouton quit
    if x >= Menu.hitbox_quit_button[1] and x <= (Menu.hitbox_quit_button[1] + Menu.hitbox_quit_button[3]) then
        if y >= Menu.hitbox_quit_button[2] and y <= (Menu.hitbox_quit_button[2] + Menu.hitbox_quit_button[4]) then
            return "quit"
        end
    end
    return "null"
end

return Menu
