-- [[ UTILS ]]
require 'src.utils.memoise'
require 'src.utils.drawing'

Class     = require 'src.utils.class'

-- [[ MAIN ]]

World = require 'src.engine.world'
World:registerSystem('ShapeRenderer')

local instance_1 = World:create('Player', 100, 100)


function love.draw()
    World:draw()
end

local past_dt = 0
function love.update(dt)
    print(getFPS())
    World:update(dt)
end