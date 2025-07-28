---@meta structs.drawable_nine_patch

---@alias DrawableNinePatch.RepeatMode "random"|"repeat"

---@class DrawableNinePatch : Drawable
---@field _type "drawableNinePatch"
---@field texture string
---@field tileWidth number
---@field tileHeight number
---@field borderLeft number
---@field borderRight number
---@field borderTop number
---@field borderBottom number
---@field drawWidth number
---@field drawHeight number
---@field color NormalizedColorTable
---@field borderMode DrawableNinePatch.RepeatMode
---@field fillMode DrawableNinePatch.RepeatMode
---@field atlas string
---@field drawX number
---@field drawY number
---@field mode "border"|"fill"
---@field useRealSize boolean
---@field hideOverflow boolean
local DrawableNinePatch = {}

local utils = require("utils")
local drawing = require("utils.drawing")
local atlases = require("atlases")
local drawableSprite = require("structs.drawable_sprite")
local matrixLib = require("utils.matrix")

local drawableNinePatch = {}

---@param sprite DrawableSprite
---@return number
---@return number
function DrawableNinePatch:getSpriteSize(sprite) end

---@return Matrix?
function DrawableNinePatch:cacheNinePatchMatrix() end

---@return Matrix?
function DrawableNinePatch:getMatrix()
    return self:cacheNinePatchMatrix()
end

---@param atlas string?
---@param texture string
---@param x number
---@param y number
---@param matrix Matrix
---@param quadX number
---@param quadY number
---@param color AnyColor
---@return DrawableSprite
local function getMatrixSprite(atlas, texture, x, y, matrix, quadX, quadY, color) end

---@param sprites Drawable[]
---@param atlas string
---@param texture string
---@param x number
---@param y number
---@param width number
---@param height number
---@param matrix? Matrix UNUSED
---@param spriteWidth number
---@param spriteHeight number
function DrawableNinePatch:addCornerQuads(sprites, atlas, texture, x, y, width, height, matrix, spriteWidth, spriteHeight) end

---@param sprites Drawable[]
---@param atlas string
---@param texture string
---@param x number
---@param y number
---@param width number
---@param height number
---@param matrix? Matrix UNUSED
---@param spriteWidth number
---@param spriteHeight number
function DrawableNinePatch:addEdgeQuads(sprites, atlas, texture, x, y, width, height, matrix, spriteWidth, spriteHeight) end

---@param sprites Drawable[]
---@param atlas string
---@param texture string
---@param x number
---@param y number
---@param width number
---@param height number
---@param matrix Matrix
---@param spriteWidth number
---@param spriteHeight number
function DrawableNinePatch:addMiddleQuads(sprites, atlas, texture, x, y, width, height, matrix, spriteWidth, spriteHeight) end

---@return DrawableSprite[]
function DrawableNinePatch:getDrawableSprite() end

function DrawableNinePatch:draw() end

---@param color AnyColor
function DrawableNinePatch:setColor(color) end

---@class DrawableNinePatch.Options
---@field atlas? string
---@field useRealSize? boolean
---@field hideOverflow? boolean
---@field borderMode? DrawableNinePatch.RepeatMode
---@field fillMode? DrawableNinePatch.RepeatMode
---@field mode? "border"|"fill"
---@field color? AnyColor
---@field tileSize? number If set, tileWidth==tileHeight==tileSize
---@field tileWidth? number
---@field tileHeight? number
---@field border? number If set, borderLeft==borderRight==borderBottom==borderTop==border
---@field borderLeft? number
---@field borderRight? number
---@field borderTop? number
---@field borderBottom? number

---@param texture string
---@param options DrawableNinePatch.Options|"border"|"fill"
---@param drawX number
---@param drawY number
---@param drawWidth number
---@param drawHeight number
---@return DrawableNinePatch?
function drawableNinePatch.fromTexture(texture, options, drawX, drawY, drawWidth, drawHeight) end

return drawableNinePatch