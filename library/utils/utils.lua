---@meta utils

local serialize = require("utils.serialize")
local filesystem = require("utils.filesystem")
local osUtils = require("utils.os")
local requireUtils = require("utils.require")
local xnaColors = require("consts.xna_colors")
local bit = require("bit")
local ffi = require("ffi")
local utf8 = require("utf8")

local rectangles = require("structs.rectangle")

local utils = {}

utils.serialize = serialize.serialize
utils.unserialize = serialize.unserialize

---@param s string
---@return string
function utils.stripByteOrderMark(s)
    if s:byte(1) == 0xef and s:byte(2) == 0xbb and s:byte(3) == 0xbf then
        return s:sub(4, #s)
    end

    return s
end

---Creates a new Rectangle object.
---@param x number
---@param y number
---@param width number
---@param height number
---@return Rectangle
function utils.rectangle(x, y, width, height) end

---Creates a new Rectangle object with width/height set to 1.
---@param x number
---@param y number
---@return Rectangle
function utils.point(x, y) end

---@param rectangles Rectangle[]
---@return number
---@return number
---@return number
---@return number
function utils.rectangleBounds(rectangles) end

---@param rectangles Rectangle[]
---@return number
---@return number
---@return number
---@return number
function utils.coverRectangles(rectangles) end

-- Does the bounds and covering manually, reduces table construction
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@return number x
---@return number y
---@return number width
---@return number height
function utils.coverTriangle(x1, y1, x2, y2, x3, y3) end

--- Using counter clockwise rotation matrix since the Y axis is mirrored
---@param x number
---@param y number
---@param theta number
---@return number rotatedX
---@return number rotatedY
function utils.rotate(x, y, theta) end

--- Using counter clockwise rotation matrix since the Y axis is mirrored
---@param point NamedVector2
---@param theta number
---@return number
---@return number
function utils.rotatePoint(point, theta) end

---@param r1 Rectangle
---@param r2 Rectangle
---@return boolean
function utils.aabbCheck(r1, r2) end

---@param x1 number
---@param y1 number
---@param w1 number
---@param h1 number
---@param x2 number
---@param y2 number
---@param w2 number
---@param h2 number
---@return boolean
function utils.aabbCheckInline(x1, y1, w1, h1, x2, y2, w2, h2) end

---@param point NamedVector2
---@param rect Rectangle
---@param threshold number
---@return boolean
---@return integer directionHorizontal
---@return integer directionVertical
function utils.onRectangleBorder(point, rect, threshold) end

---@param px number
---@param py number
---@param rx number
---@param ry number
---@param rw number
---@param rh number
---@param threshold number
---@return boolean isOnBorder
---@return integer directionHorizontal
---@return integer directionVertical
function utils.onRectangleBorderInline(px, py, rx, ry, rw, rh, threshold) end

---@param r1 Rectangle
---@param r2 Rectangle
---@return Rectangle?
function utils.intersection(r1, r2) end

---@param r1 Rectangle
---@param r2 Rectangle
---@return number
---@return number
---@return number
---@return number
function utils.intersectionBounds(r1, r2) end

---@param r1 Rectangle
---@param r2 Rectangle
---@return Rectangle[]
function utils.subtractRectangle(r1, r2) end

---@param width number
---@param height number
---@param maxWidth number
---@param maxHeight number
---@param maxScale number
---@param preMultiplied boolean?
---@return number
function utils.getBestScale(width, height, maxWidth, maxHeight, maxScale, preMultiplied) end

---@param path string
---@param mode openmode
---@param internal boolean?
---@return love.File|file*?
function utils.getFileHandle(path, mode, internal) end

---@param path string
---@param mode openmode
---@param internal boolean?
---@return string?
local function readAll(path, mode, internal) end

---@param path string
---@param mode openmode
---@param internal boolean?
---@return string?
function utils.readAll(path, mode, internal) end

---@param path string
---@param internal boolean
---@return love.Image?
---@return love.ImageData?
function utils.newImage(path, internal) end

---@param s string
---@return string
function utils.trim(s) end

---@param s string
---@param start string
---@return boolean
function utils.startsWith(s, start) end

---@param string string
---@param character string
---@return integer?
function utils.findCharacter(string, character) end

---@param s string
---@param separator string|number
---@return table
function utils.splitUTF8(s, separator) end

---@param name string
---@return string
function utils.titleCase(name) end

---@param name string
---@return string
function utils.humanizeVariableName(name) end

---@param text string
---@return string
function utils.unbackslashify(text) end

---@param color string
---@return boolean success
---@return number r
---@return number g
---@return number b
---@return number? a
function utils.parseHexColor(color) end

---@param r number
---@param g number
---@param b number
---@return string
function utils.rgbToHex(r, g, b) end

---@param r number
---@param g number
---@param b number
---@param a number
---@return string
function utils.rgbaToHex(r, g, b, a) end

-- Based on implementation from Love2d wiki
---@param h number
---@param s number
---@param v number
---@return number
---@return number
---@return number
function utils.hsvToRgb(h, s, v) end

-- Based on implementation from internet
---@param r number
---@param g number
---@param b number
---@return number
---@return number
---@return number
function utils.rgbToHsv(r, g, b) end

-- Case insensitive XNA color getter
---@param name string
---@return NormalizedColorTable|false
---@return string|false
function utils.getXNAColor(name) end

--- Get color in various formats, return as table
---@param color AnyColor
---@return NormalizedColorTable|false
function utils.getColor(color) end

---@param color1 NormalizedColorTable
---@param color2 NormalizedColorTable
---@return boolean
function utils.sameColor(color1, color2) end

---@param f any
---@return boolean
function utils.isCallable(f) end


---@param f any
---@param ... any?
---@return any
function utils.callIfFunction(f, ...) end

-- Unpack the first value if it is a table, otherwise return all arguments
-- Assuming this will never see more than two or three arguments
function utils.unpackIfTable(a, b, c, d, e, f, g, h, i, j) end

--- Call function with arguments
--- Use sub values of first argument if it is a table and call function for each of those instead
---@param f function
---@param value any
---@param ... any
function utils.callIterateFirstIfTable(f, value, ...) end

---@param value any
---@return string
function utils.typeof(value) end

---@param value any
---@return boolean
function utils.isInteger(value) end

---@generic K
---@generic V
---@generic KNew
---@param t { [K]: V }
---@param by fun(k: K, v: V):KNew
---@return { [KNew]: V[] }
function utils.group(t, by) end

---@generic T
---@param ... T[]
---@return T[]
function utils.concat(...) end

---@generic T
---@param predicate fun(t: T):boolean
---@param data T[]
---@return T[]
function utils.filter(predicate, data) end

---Checks if the given table has the provided value
---@param value any
---@param data table
---@return boolean
function utils.contains(value, data)
    for _, dataValue in pairs(data) do
        if value == dataValue then
            return true
        end
    end

    return false
end

---@generic T
---@param data T[]
---@param hashFunc fun(t: T):any
---@return T[]
function utils.unique(data, hashFunc) end

---@param data table
---@param path table
---@param default any
---@param createIfMissing boolean
---@return any
function utils.getPath(data, path, default, createIfMissing) end

---@param data table
---@param path table
---@param value any
---@param createIfMissing boolean
---@return any
function utils.setPath(data, path, value, createIfMissing) end

utils.countKeys = serialize.countKeys

---Safe check whether a table is empty
---@param t table
function utils.isEmpty(t)
    return next(t) == nil
end

---Return the 1 index based tile indices for the coordinates
---@param x number
---@param y number
---@return integer
---@return integer
function utils.pixelsToTiles(x, y)
    return math.floor(x / 8) + 1, math.floor(y / 8) + 1
end

---@param x number
---@param y number
---@param map Map
---@return Room|false
function utils.getRoomAtCoords(x, y, map) end

---@param x number
---@param y number
---@param map Map
---@return Filler|false
function utils.getFillerAtCoords(x, y, map) end

---@param n number
---@param d number
---@return number
function utils.mod1(n, d)
    local m = n % d

    return m == 0 and d or m
end

---@param n number
---@return -1|0|1
function utils.sign(n)
    if n > 0 then
        return 1

    elseif n < 0 then
        return -1

    else
        return 0
    end
end

---@param v1 number
---@param v2 number
---@param tolerance? number
---@return boolean
function utils.isApprox(v1, v2, tolerance) end

---@param n number
---@param decimals? number
---@param addDotZero? boolean
---@return string
function utils.prettifyFloat(n, decimals, addDotZero) end

---@param base number
---@param n number
---@return number
function utils.logn(base, n)
    return math.log(n) / math.log(base)
end

---@param v number|string
function utils.setRandomSeed(v) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function utils.distanceSquared(x1, y1, x2, y2) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@return number
function utils.distance(x1, y1, x2, y2) end

---@param x number
---@param y number
---@return number
function utils.getSimpleCoordinateSeed(x, y) end

---@param x number
---@param y number
function utils.setSimpleCoordinateSeed(x, y) end

---@generic T
---@param v T
---@param copyMetatables? boolean
---@return T
function utils.deepcopy(v, copyMetatables) end

---Add all items missing in "from" into "to" recursively
---Returns true if "to" was changed
---@param from table
---@param to table
---@return boolean
function utils.mergeTables(from, to) end

---Shuffles the order of elements in the given table in-place.
---@param t { [integer]: any }
function utils.shuffle(t) end

---Shallow mode doesn't check table values recursively
---@param lhs any
---@param rhs any
---@param shallow? boolean
---@return boolean
function utils.equals(lhs, rhs, shallow) end

---@param value number
---@param min number
---@param max number
---@return number
function utils.clamp(value, min, max)
    return math.min(math.max(value, min), max)
end

---@param n number
---@param decimals? number
---@return number
function utils.round(n, decimals) end

-- Add all of require utils into utils
--for k, v <- requireUtils do
--    utils[k] = v
--end

-- Add all of os utils into utils
--for k, v <- osUtils do
--    utils[k] = v
--end

-- Add all of filesystem helper into utils
--for k, v <- filesystem do
--    utils[k] = v
--end

---@return number?
function utils.getProcessId() end

return utils