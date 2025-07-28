---@meta structs.drawable_text

---@class DrawableText : Drawable
---@field _type "drawableText"
---@field text string
---@field x number
---@field y number
---@field width? number
---@field height? number
---@field font? love.Font
---@field fontSize number
---@field color? NormalizedColorTable
local DrawableText = {}

local drawableText = {}

function DrawableText:draw() end

---@param batch Batch
function DrawableText:addToBatch(batch) end

---@param color AnyColor
---@return boolean
function DrawableText:setColor(color) end

---@param text string
---@param x number
---@param y number
---@param width number
---@param height number
---@param font? love.Font
---@param fontSize number
---@param color AnyColor
---@return DrawableText
function drawableText.fromText(text, x, y, width, height, font, fontSize, color) end

return drawableText