---@meta structs.drawable_sprite

---@module 'atlases'
local atlases
---@module 'utils'
local utils
---@module 'utils.drawing'

---@class DrawableSprite.Meta
---@field width number
---@field realWidth number
---@field height number
---@field realHeight number
---@field offsetX number
---@field offsetY number
---@field quad love.Quad
---@field quadCache table<number, table<number, table<number, table<number, {[1]: love.Quad, [2]: number, [3]: number }>>>>
---@field image love.Image
---@field layer number

---@class DrawableSprite : Drawable
---@field x number
---@field y number
---@field justificationX number
---@field justificationY number
---@field scaleX number
---@field scaleY number
---@field offsetX number?
---@field offsetY number?
---@field renderOffsetX number
---@field renderOffsetY number
---@field color NormalizedColorTable
---@field rotation number
---@field depth integer?
---@field meta DrawableSprite.Meta
---@field quad love.Quad
local DrawableSprite = {}

local drawableSpriteStruct = {}

---@param justificationX number
---@param justificationY number
---@return DrawableSprite
function DrawableSprite:setJustification(justificationX, justificationY) end

---@param justification AnyVector2
---@return DrawableSprite
function DrawableSprite:setJustification(justification) end

---@param x number
---@param y number
---@return DrawableSprite
function DrawableSprite:setPosition(x, y) end

---@param pos AnyVector2
---@return DrawableSprite
function DrawableSprite:setPosition(pos) end

---@param x number
---@param y number
---@return DrawableSprite
function DrawableSprite:addPosition(x, y) end

---@param pos AnyVector2
---@return DrawableSprite
function DrawableSprite:addPosition(pos) end

---@param scaleX number
---@param scaleY number
---@return DrawableSprite
function DrawableSprite:setScale(scaleX, scaleY) end

---@param scale AnyVector2
---@return DrawableSprite
function DrawableSprite:setScale(scale) end

--- Set the absolute offset of the sprite, overriding image padding and justification
---@param offsetX number
---@param offsetY number
---@return DrawableSprite
function DrawableSprite:setOffset(offsetX, offsetY) end

--- Set the absolute offset of the sprite, overriding image padding and justification
---@param offset AnyVector2
---@return DrawableSprite
function DrawableSprite:setOffset(offset) end

--- Additional offset after justification and image padding
---@param offsetX number
---@param offsetY number
---@return DrawableSprite
function DrawableSprite:setAdditionalOffset(offsetX, offsetY) end

--- Additional offset after justification and image padding
---@param offset AnyVector2
---@return DrawableSprite
function DrawableSprite:setAdditionalOffset(offset) end

---@param color AnyColor
---@return boolean success Whether the color was set successfully
function DrawableSprite:setColor(color) end

---@param alpha number
---@return boolean success Whether the color was set successfully
function DrawableSprite:setAlpha(alpha) end

---@return number drawX
---@return number drawY
---@return number drawWidth
---@return number drawHeight
function DrawableSprite:getRectangleRaw() end

---@return Rectangle
function DrawableSprite:getRectangle() end

---@param mode love.DrawMode
---@param color NormalizedColorTable
function DrawableSprite:drawRectangle(mode, color) end

---@param alpha number
function DrawableSprite:draw(alpha) end

---@param x number
---@param y number
---@param width number
---@param height number
---@param hideOverflow number?
---@param realSize number?
function DrawableSprite:getRelativeQuad(x, y, width, height, hideOverflow, realSize) end

---@param x number
---@param y number
---@param width number
---@param height number
---@param hideOverflow number?
---@param realSize number?
function DrawableSprite:useRelativeQuad(x, y, width, height, hideOverflow, realSize) end

---@class DrawableSprite.FromMetaData
---@field x number?
---@field y number?
---@field jx number?
---@field jy number?
---@field justificationX number?
---@field justificationY number?
---@field sx number?
---@field sy number?
---@field scaleX number?
---@field scaleY number?
---@field renderOffsetX number?
---@field renderOffsetY number?
---@field rotation number?
---@field r number?
---@field depth integer?
---@field quad love.Quad?
---@field color AnyColor?

---@param meta DrawableSprite.Meta
---@param data DrawableSprite.FromMetaData|DrawableSprite
---@return DrawableSprite
function drawableSpriteStruct.fromMeta(meta, data) end

---@class DrawableSprite.FromTextureData : DrawableSprite.FromMetaData
---@field atlas string?

---@param texture string
---@param data DrawableSprite.FromTextureData
---@return DrawableSprite?
function drawableSpriteStruct.fromTexture(texture, data) end

---@param texture string
---@param data DrawableSprite.FromTextureData
---@return DrawableSprite?
function drawableSpriteStruct.fromInternalTexture(texture, data) end

return drawableSpriteStruct