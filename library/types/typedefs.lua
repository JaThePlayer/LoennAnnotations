---@meta

---@module 'love'

---@alias Viewport table

---@alias NormalizedColorTable [number, number, number, number|nil]
---@alias TableVector2 [number, number]
---@alias TableRectangle [number, number, number, number]
---@alias NamedVector2 { x: number, y: number }

---@alias MapSaveable number|integer|string|boolean|nil

---@class Rectangle
---@field x number
---@field y number
---@field width number
---@field height number

---@alias AnyVector2 TableVector2|NamedVector2
---@alias AnyColor NormalizedColorTable|string

---@class Node
---@field x number
---@field y number

---@class Entity : table
---@field x number
---@field y number
---@field width number?
---@field height number?
---@field _id integer
---@field _type "entity"
---@field nodes table<integer, Node>

---@class Trigger : Entity
---@field width number
---@field height number
---@field _type "trigger"

---An entity with missing field warnings suppressed.
---@class UnknownEntity : Entity
---@field [string] any

---A trigger with missing field warnings suppressed.
---@class UnknownTrigger : Trigger
---@field [string] any

---@class Decal

---@class Tiles
---@field _type "tiles"
---@field raw any
---@field matrix Matrix

---@class ObjectTiles

---@class Room
---@field name string
---@field x number
---@field y number
---@field width number
---@field height number
---@field musicLayer1 boolean
---@field musicLayer2 boolean
---@field musicLayer3 boolean
---@field musicLayer4 boolean
---@field musicProgress string
---@field ambienceProgress string
---@field dark boolean
---@field space boolean
---@field underwater boolean
---@field whisper boolean
---@field disableDownTransition boolean
---@field delayAlternativeMusicFade boolean
---@field music string
---@field musicAlternative string
---@field ambience string
---@field windPattern string
---@field color integer
---@field cameraOffsetX number
---@field cameraOffsetY number
---@field entities Entity[]
---@field triggers Trigger[]
---@field decalsFg Decal[]
---@field decalsBg Decal[]
---@field tilesFg Tiles
---@field tilesBg Tiles
---@field sceneryObj ObjectTiles
---@field sceneryFg ObjectTiles
---@field sceneryBg ObjectTiles

---@class Filler
---@field x number
---@field y number
---@field width number
---@field height number

---@class Map
---@field rooms Room[]
---@field fillers Filler[]

---@class Drawable

---@class Selection