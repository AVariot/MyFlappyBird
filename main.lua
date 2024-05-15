function main()
	print("Hello world")
end
local college = love.graphics.newImage("assets/collége.png")
local crampte = love.graphics.newImage("assets/crampté-man.png")

local cramptePos = {
	x = 100,
	y = 500
}
local crampteHitbox = {
	width = 98,
	height = 114
}

local iphone = love.graphics.newImage("assets/IPhone.png")
local iphoneHitbox = {
	width = 50,
	height = 70
}
math.randomseed(os.time())
local iphones_pos = {
	{x = math.random(1920), y = math.random(1080)}
}
for i = 0, 500 do
	table.insert(iphones_pos, {x = math.random(1920), y = math.random(1080)})
end

local floor = {
	{x = 0, y = 1000},
	{x = 1980, y = 950}
}
local quoicoubeh = love.sound.newSoundData( "assets/quoicoubeh.wav" )
local quoicousource = love.audio.newSource(quoicoubeh)
quoicousource.play(quoicousource)

-- Lib

local function checkColision(pos1, hitbox1, pos2, hitbox2)
	if pos1.x < pos2.x + hitbox2.width then
		if pos1.x + hitbox1.width > pos2.x then
			if pos1.y < pos2.y + hitbox2.height then
				if hitbox1.height + pos1.y > pos2.y then
					return true
				end
			end
		end
	end
	return false
end

-- Love
function love.keypressed(key)
	if key == 'z' then
		cramptePos.y = cramptePos.y - 100
	end
	if key == 's' then
		cramptePos.y = cramptePos.y + 100
	end

	if key == 'd' then
		cramptePos.x = cramptePos.x + 50
	end
	if key == 'q' then
		cramptePos.x = cramptePos.x - 50
	end


end

function love.load()
	love.window.setMode(1920, 1080)
    love.window.setTitle("Apagneur")
	love.graphics.setNewFont(12)
end

function love.update(dt)
	local index = 1
	for type, current in ipairs(iphones_pos) do
		if (checkColision(cramptePos, crampteHitbox, current, iphoneHitbox) == true) then
			table.remove(iphones_pos, index)
		end
		index = index + 1
	end
end

function love.draw()
	if key == "escape" then
		love.event.quit()
	end
	love.graphics.draw(college, 0, 0)
	love.graphics.draw(crampte, cramptePos.x, cramptePos.y)

	for type, current in ipairs(iphones_pos) do
			love.graphics.draw(iphone, current.x, current.y)
	end

end