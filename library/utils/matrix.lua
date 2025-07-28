---@meta "utils.matrix"
local matrix = {}

---@class char : string

---@class Matrix<T> : { [integer]: T }
---@field _type "matrix"
---@field private _width number
---@field private _height number
local Matrix

---0-based getter that assumes indexes are inbounds.
---@generic T
---@param x number
---@param y number
---@return T
function Matrix:get0Inbounds(x, y) end

---1-based getter that assumes indexes are inbounds.
---@param x number
---@param y number
---@return any
function Matrix:getInbounds(x, y) end

---0-based getter that checks bounds, returning the value of 'default' if out-of-bounds.
---@param x number
---@param y number
---@param default? any
---@return any
function Matrix:get0(x, y, default) end

---1-based getter that checks bounds, returning the value of 'default' if out-of-bounds.
---@param x number
---@param y number
---@param default? any
---@return any
function Matrix:get(x, y, default) end

---0-based setter that assumes indexes are inbounds.
---@param x number
---@param y number
---@param value any
function Matrix:set0Inbounds(x, y, value) end

---1-based setter that assumes indexes are inbounds.
---@param x number
---@param y number
---@param value any
function Matrix:setInbounds(x, y, value) end

---0-based setter that checks bounds, noop if out-of-bounds.
---@param x number
---@param y number
---@param value any
function Matrix:set0(x, y, value) end

---1-based getter that checks bounds, noop if out-of-bounds.
---@param x number
---@param y number
---@param value any
function Matrix:set(x, y, value) end

---Checks if the 1-based coordinates are in-bounds.
---@param x number
---@param y number
---@return boolean
function Matrix:inbounds(x, y) end

---Checks if the 0-based coordinates are in-bounds.
---@param x number
---@param y number
---@return boolean
function Matrix:inbounds0(x, y) end

---@return number width
---@return number height
function Matrix:size() end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param default? any
---@return Matrix slice
function Matrix:getSlice(x1, y1, x2, y2, default) end

---@param x1 integer
---@param y1 integer
---@param x2 integer
---@param y2 integer
---@param slice Matrix|any
function Matrix:setSlice(x1, y1, x2, y2, slice) end

---In-place flip
---@return Matrix self
function Matrix:flipHorizontal() end

---In-place flip
---@return Matrix self
function Matrix:flipVertical() end

---In-place flip
---@param horizontal? boolean
---@param vertical? boolean
---@return Matrix self
function Matrix:flip(horizontal, vertical) end

--- 90 degrees clockwise in-place rotation
---@return Matrix self
function Matrix:rotateLeft() end

-- 90 degrees counter clockwise in-place rotation
---@return Matrix self
function Matrix:rotateRight() end

---In-place rotation, positive steps rotate right, negative - left.
---@param steps integer
---@return Matrix self
function Matrix:rotate(steps) end

---Sets the data of this Matrix to the given Matrix and size. Excess values are nil'd out.
---@param data Matrix
---@param width integer
---@param height integer
---@return Matrix self
function Matrix:updateData(data, width, height) end

---Creates a new Matrix filled with the given value.
---@param default any?
---@param width integer
---@param height integer
---@return Matrix
function matrix.filled(default, width, height) end

---@param t any[]
---@param width integer
---@param height integer
---@return Matrix
function matrix.fromTable(t, width, height) end

---@param func fun(i: integer, width: integer, height: integer):any
---@param width integer
---@param height integer
---@return Matrix
function matrix.fromFunction(func, width, height) end

return matrix