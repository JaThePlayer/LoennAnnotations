---@meta structs.ellipse

---@alias Ellipse.Mode "line"|"fill"

---@class Ellipse
---@field _type "ellipse"
---@field x number
---@field y number
---@field radiusX number
---@field radiusY number
local Ellipse = {}

local ellipses = {}

---@param radiusX number
---@param radiusY number
---@return number
function ellipses.getApproxCirumference(radiusX, radiusY) end

---@param x number
---@param y number
---@param radiusX number
---@param radiusY number
---@param mode? Ellipse.Mode
---@param checks? number
---@return [number, number][]
function ellipses.getPoints(x, y, radiusX, radiusY, mode, checks) end

---@param mode? Ellipse.Mode
---@param checks? number
---@return [number, number][]
function Ellipse:getPoints(mode, checks) end

---@param x number
---@param y number
---@param radiusX number
---@param radiusY number
---@return Ellipse
function ellipses.create(x, y, radiusX, radiusY) end

return ellipses
