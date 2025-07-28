---@meta structs.drawable_line

---@module 'atlases'
local atlases
---@module 'utils'
local utils
---@module 'utils.drawing'

---@module 'structs.drawable_rectangle'
local drawableRectangle
---@module 'structs.drawable_sprite'
local drawableSprite

---@class DrawableLine : Drawable
---@field points number[]
---@field color NormalizedColorTable
---@field thickness number
---@field offsetX number
---@field offsetY number
---@field magnitudeOffset number
---@field depth number
local DrawableLine = {}

local drawableLine = {}

local lineExtraWidth = 0.2

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param color any
---@param thickness number
---@param smooth number
---@param offsetX number
---@param offsetY number
---@param magnitudeOffset number
---@param depth number
---@return DrawableSprite
local function getRotatedRectangleSprite(x1, y1, x2, y2, color, thickness, smooth, offsetX, offsetY, magnitudeOffset, depth)
    local theta = math.atan2(y2 - y1, x2 - x1)
    local magnitude = math.sqrt((x1 - x2)^2 + (y1 - y2)^2) + magnitudeOffset

    local halfThickenss = thickness / 2
    local x = smooth and x1 - lineExtraWidth or x1
    local y = y1
    local width = smooth and magnitude + lineExtraWidth * 2 or magnitude

    local sprite = drawableRectangle.fromRectangle("fill", x, y, width, thickness, color):getDrawableSprite()

    sprite:setOffset(offsetX / magnitude, 0.5 / thickness + offsetY / thickness)
    sprite.rotation = theta
    sprite.depth = depth

    return sprite
end

---@return DrawableSprite[]
function DrawableLine:getDrawableSprite() end

---@param x number
---@param y number
function DrawableLine:setOffset(x, y) end

---@param offset number
function DrawableLine:setMagnitudeOffset(offset) end

---@param thickness number
function DrawableLine:setThickness(thickness) end

---@param color AnyColor
function DrawableLine:setColor(color) end

function DrawableLine:draw() end

---@param points number[]
---@param color AnyColor?
---@param thickness number?
---@param offsetX number?
---@param offsetY number?
---@param magnitudeOffset number?
---@return DrawableLine
function drawableLine.fromPoints(points, color, thickness, offsetX, offsetY, magnitudeOffset) end

return drawableLine