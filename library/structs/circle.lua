---@meta structs.circle

---@class Circle
---@field x number
---@field y number
---@field radius number
---@field _type "circle"
local Circle = {}

local circles = {}

---@param radius number
---@return number
function circles.getCirumference(radius) end

---Gets points needed to render the circle.
---@param x number
---@param y number
---@param radius number
---@param mode? "line"|"fill"
---@param checks? number
---@return [number, number][]
function circles.getPoints(x, y, radius, mode, checks) end

---Gets points needed to render the circle.
---@param mode "line"|"fill"
---@param checks? number
---@return [number, number][]
function Circle:getPoints(mode, checks) end

---Creates a new Circle object.
---@param x number
---@param y number
---@param radius number
---@return Circle
function circles.create(x, y, radius) end

return circles