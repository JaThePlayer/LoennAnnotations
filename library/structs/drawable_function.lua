---@class DrawableFunction : Drawable
---@field _type "drawableFunction"
---@field func function
---@field args table

---@meta structs.drawable_function

local drawableFunction = {}

---@generic T
---@param func fun(...: T)
---@param ... T
---@return DrawableFunction
function drawableFunction.fromFunction(func, ...) end

return drawableFunction