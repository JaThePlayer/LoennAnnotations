---@meta structs.drawable_rectangle

---@module 'atlases'
local atlases
---@module 'utils'
local utils
---@module 'utils.drawing'

---@module 'structs.drawable_sprite'
local drawableSprite

---@alias DrawableRectangle.mode "fill" | "line" | "bordered"

--- A spritebatchable rectangle drawing implementation.
---@class DrawableRectangle : Drawable
---@field x number
---@field y number
---@field width number
---@field height number
---@field mode DrawableRectangle.mode
---@field color NormalizedColorTable
---@field secondaryColor NormalizedColorTable?
local DrawableRectangle = {}

local drawableRectangle = {}

drawableRectangle.tintingPixelTexture = "1x1-tinting-pixel"

---@param x number
---@param y number
---@param width number
---@param height number
---@param color AnyColor
---@return DrawableSprite?
local function getDrawableSpriteForRectangle(x, y, width, height, color)
    local data = {}

    data.x = x
    data.y = y

    data.scaleX = width
    data.scaleY = height

    data.justificationX = 0
    data.justificationY = 0

    data.color = utils.getColor(color)

    return drawableSprite.fromInternalTexture(drawableRectangle.tintingPixelTexture, data)
end

---@return number
---@return number
---@return number
---@return number
function DrawableRectangle:getRectangleRaw() end

---@return Rectangle
function DrawableRectangle:getRectangle() end

---@param mode love.DrawMode
---@param color NormalizedColorTable
---@param secondaryColor NormalizedColorTable
function DrawableRectangle:drawRectangle(mode, color, secondaryColor) end

---Gets a drawable sprite, using a stretched version of the 1x1 tintable.
---Horizontal lines for "line" and "bordered" are offset to not overlap in the corners.
---@return DrawableSprite|DrawableSprite[] sprites A single sprite if self.mode == "fill", a table of sprites otherwise.
function DrawableRectangle:getDrawableSprite() end

function DrawableRectangle:draw() end

---Sets the color and secondary color of this rectangle. If an argument is null, that field is not changed.
---@param color AnyColor?
---@param secondaryColor AnyColor?
function DrawableRectangle:setColor(color, secondaryColor)
    local tableColor = utils.getColor(color)
    local tableSecondaryColor = utils.getColor(secondaryColor)

    if tableColor then
        self.color = tableColor
    end

    if tableSecondaryColor then
        self.secondaryColor = tableSecondaryColor
    end
end

---@param mode DrawableRectangle.mode
---@param x number
---@param y number
---@param width number
---@param height number
---@param color AnyColor?
---@param secondaryColor AnyColor?
---@return DrawableRectangle
function drawableRectangle.fromRectangle(mode, x, y, width, height, color, secondaryColor) end

---@param mode DrawableRectangle.mode
---@param rect Rectangle|TableRectangle
---@param color AnyColor?
---@param secondaryColor AnyColor?
---@return DrawableRectangle
function drawableRectangle.fromRectangle(mode, rect, color, secondaryColor) end

return drawableRectangle