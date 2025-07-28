---@meta

---@alias NumberPairRoomEntityCb<T> [number, number] | fun(room: Room, entity: T): [number, number]

---@alias NodeVisibility
---| "never" Nodes are never visible.
---| "selected" Nodes are visible when the entity is selected.
---| "always" Nodes are always visible.

---@alias NodeLineRenderType
---|"line" Each node is visually connected to the previous and next node in the list, forming a line.
---|"fan" Each node is visually connected directly to the main entity.
---|"circle" Used with a single-noded entity. Node spans a circle around the main entity.
---|false Nodes are not visually connected to the main entity.

---@class EntityHandler<T> : { 
---name: string,
---associatedMods?: fun(entity: T),
---nodeLimits?: (TableVector2|fun(room: Room, entity: T):number,number),
---nodeVisibility?: (NodeVisibility|fun(entity: T):NodeVisibility),
---nodeLineRenderType?: (NodeLineRenderType|fun(entity: T):NodeLineRenderType),
---nodeLineRenderOffset?: ([integer,integer]|fun(entity: T, node: Node, nodeIndex: integer):integer,integer),
---minimumSize?: ([integer, integer]|fun(room:Room, entity: T):integer,integer),
---maximumSize?: ([integer, integer]|fun(room:Room, entity: T):integer,integer),
---warnBelowSize?: ([integer, integer]|fun(room:Room, entity: T):integer,integer),
---warnAboveSize?: ([integer, integer]|fun(room:Room, entity: T):integer,integer),
---ignoredFields?: (string[]|fun(entity: T):string[]),
---ignoredFieldsMultiple?: (string[]|fun(entity: T):string[]),
---ignoredSimilarityKeys?: (string[]|fun(entity: T):string[]),
---fieldOrder?: (string[]|fun(entity: T):string[]),
---fieldInformation?: (table<string, FieldInformationEntry>|fun(entity: T): table<string, FieldInformationEntry>),
---texture?: (string|fun(room: Room, entity: T):string),
---justification?: NumberPairRoomEntityCb<T>,
---offset?: NumberPairRoomEntityCb<T>,
---scale?: NumberPairRoomEntityCb<T>,
---sprite?: (fun(room: Room, entity: T, viewport: Viewport): Drawable|Drawable[]),
---rotation?: number|(fun(room: Room, entity: T):number),
---depth?: integer|(fun(room: Room, entity: T, viewport: Viewport): integer),
---color?: NormalizedColorTable|(fun(room: Room, entity: T):NormalizedColorTable),
---fillColor?: NormalizedColorTable|(fun(room: Room, entity: T):NormalizedColorTable),
---borderColor?: NormalizedColorTable|(fun(room: Room, entity: T):NormalizedColorTable),
---draw?: fun(room: Room, entity: T, viewport: Viewport),
---rectangle?: (fun(room: Room, entity: T, viewport: Viewport): Rectangle),
---selection?: (fun(room: Room, entity: T): Rectangle, Rectangle[]?),
---onNodeAdded?: (fun(room: Room, entity: T, nodeIndex: integer):boolean),
---nodeAdded?: (fun(room: Room, entity: T, nodeIndex: integer): boolean),
---onDelete?: (fun(room: Room, entity: T, nodeIndex: integer): boolean),
---delete?: (fun(room: Room, entity: T, nodeIndex: integer): boolean),
---onResize?: (fun(room: Room, entity: T, offsetX: number, offsetY: number, directionX: number, directionY: number): boolean),
---resize?: (fun(room: Room, entity: T, offsetX: number, offsetY: number, directionX: number, directionY: number): boolean),
---updateResizeSelection?: (fun(room: Room, entity: T, nodeIndex: integer, selection: Selection, offsetX: number, offsetY: number, directionX: number, directionY: number): boolean),
---onMove?: (fun(room: Room, entity: T, nodeIndex: number, offsetX: number, offsetY: number): boolean),
---move?: (fun(room: Room, entity: T, nodeIndex: number, offsetX: number, offsetY: number): boolean),
---updateMoveSelection?: (fun(room: Room, entity: T, nodeIndex: integer, selection: Selection, offsetX: number, offsetY: number): boolean),
---onFlip?: (fun(room: Room, entity: T, horizontal: boolean, vertical: boolean): boolean),
---flip?: (fun(room: Room, entity: T, horizontal: boolean, vertical: boolean): boolean),
---updateFlipSelection?: (fun(room: Room, entity: T, node: Node, selection: Selection, horizontal: boolean, vertical: boolean): boolean),
---onRotate?: (fun(room: Room, entity: T, direction: integer): boolean),
---rotate?: fun(room: Room, entity: T, direction: integer),
---updateRotateSelection?: (fun(room: Room, entity: T, node: Node, selection: Selection, direction: integer): boolean),
---nodeSprite?: (fun(room: Room, entity: T, node: Node, nodeIndex: integer, viewport: Viewport):Drawable|Drawable[]),
---nodeTexture?: string|(fun(room: Room, entity: T, node: Node, nodeIndex: integer, viewport: Viewport):string),
---nodeDraw?: fun(room: Room, entity: T, node: Node, nodeIndex: integer, viewport: Viewport),
---nodeRectangle?: (fun(room: Room, entity: T, node: Node, nodeIndex: integer, viewport: Viewport):Rectangle),
---nodeJustification?: (TableVector2|fun(room: Room, entity: T):TableVector2),
---nodeOffset?: (TableVector2|fun(room: Room, entity: T):TableVector2),
---nodeScale?: (TableVector2|fun(room: Room, entity: T):TableVector2),
---nodeRotation?: (number|fun(room: Room, entity: T):number),
---nodeDepth?: (integer|fun(room: Room, entity: T):integer),
---nodeColor?: (NormalizedColorTable|fun(room: Room, entity: T, node: Node, nodeIndex: integer):NormalizedColorTable),
---nodeFillColor?: (NormalizedColorTable|fun(room: Room, entity: T, node: Node, nodeIndex: integer):NormalizedColorTable),
---nodeBorderColor?: (NormalizedColorTable|fun(room: Room, entity: T, node: Node, nodeIndex: integer):NormalizedColorTable),
---}
---
---The internal name of the entity as defined in the mod
---@field name string
---
---A table containing placement information.
---May either contain the information directly, or multiple tables of placement information, in case there is a need for multiple placements for a single entity.
---@field placements? PlacementInfo|PlacementInfo[]
---
---A list of mod names as specified in the mods' everest.yaml that are associated with this entity.
---Used for displaying the mod name behind the entity name in the placement list, and when determining dependencies of a map that contains this entity.
---Defaults to a one-element list with the name of the mod containing this plugin.
---@field associatedMods? string[]
---
---A pair of integers specifying the minimum and maximum number of nodes that this entity can have. 
---If the maximum value is -1, there is no upper limit. 
---Defaults to {0,0}.
---@field nodeLimits? TableVector2
---
---Determines when the entity's nodes are to be rendered. Defaults to "selected"
---@field nodeVisibility? NodeVisibility
---
---Determines how nodes are visually connected to the main entity. Defaults to false.
---@field nodeLineRenderType? NodeLineRenderType
---
---The position at which the line connects with the node. Only used when nodeLineRenderType is not false. 
---Defaults to the centre of the node.
---@field nodeLineRenderOffset? [integer, integer]
---
---A pair of booleans determining whether the entity can be resized along its horizontal and vertical axis, respectively.
---Defaults to true on the first value if the entity's placement has width and on the second value if the entity's placement has height, false otherwise.
---@field minimumSize? [integer, integer]
---
---A pair of integers determining the maximum width and height in pixels that an entity may have.
---It is not possible to resize the entity above these values.
---Defaults to infinity ({math.huge, math.huge}).
---@field maximumSize? [integer, integer]
---
---A pair of integers determining the minimum width and height in pixels that an entity should have.
---Values between minimumSize and this will display a warning.
---Defaults to the value of minimumSize, or {8, 8} otherwise.
---@field warnBelowSize? [integer, integer]
---
---A pair of integers determining the maximum width and height in pixels that an entity should have.
---Values between this and maximumSize will display a warning.
---Defaults to the value of maximumSize, or infinity ({math.huge, math.huge}) otherwise.
---@field warnAboveSize? [integer, integer]
---
---A list of entity attributes that should not be displayed in the properties menu. Defaults to {"_name", "_id", "originX", "originY"}.
---@field ignoredFields? string[]
---
---A list of additional entity attributes that should not be displayed in the properties menu when multiple entities are selected.
---@field ignoredFieldsMultiple? string[]
---
---A list of entity fields and attributes that should not be considered when checking for similar entities to select in strict mode. 
---Defaults to {"_name", "_id", "_type", "originX", "originY", "x", "y"}.
---@field ignoredSimilarityKeys? string[]
---
---A list of entity attributes specifying the order that these attributes will be displayed in in the properties menu.
---Any attribute not specified in this table will be added to the end of the menu in alphabetical order.
---Defaults to displaying x, y, width and height at the top.
---@field fieldOrder? string[]
---
---Key-value pairs of entity attributes.
---Each key is an attribute name as specified in the placement data and its value is a table specifying additional metadata relevant for displaying the attribute's value.
---Custom form fields may add their own options here.
---@field fieldInformation? table<string, FieldInformationEntry>
---
---The path to the entity texture relative to Atlases/Gameplay.
---If not defined, will try to call draw if that is defined, otherwise will try to draw a rectangle.
---@field texture? string
---
---Justification of the sprite along the X and Y axis. Must be a pair of numbers between 0 and 1.
---Determines the position of the sprite relative to the entity coordinates.
---@field justification? [number, number]
---
---X and Y offset of the sprite in pixels. Used to correctly align the sprite to look identical to in-game.
---@field offset? [number, number]
---
---X and Y scale of the sprite. Defaults to {1.0, 1.0}.
---@field scale? [number, number]
---
---Rotation of the sprite (in radians).
---@field rotation? number
---
---Determines the render depth of the entity.
---Larger numbers are further back and smaller numbers are further forward.
---Negative numbers render in front of the player and positive numbers render behind the player entity.
---The player entity has a depth of 0.
---@field depth? integer
---
---Normalized color table.
---Determines the tint of the sprite or color of the rectangle. Defaults to {1, 1, 1, 1}.
---@field color? NormalizedColorTable
---
---Rectangle drawing mode. Only used when drawing a rectangle and only when not using both fillColor and borderColor.
---@field mode? "fill"|"line"
---
---Normalized color table.
---Only used when drawing a rectangle.
---Determines the fill color of the rectangle.
---Defaults to 'color'.
---@field fillColor? NormalizedColorTable
---
---Normalized color table.
---Only used when drawing a rectangle.
---Determines the border color of the rectangle.
---Defaults to color.
---@field borderColor? NormalizedColorTable
---
---Used for custom sprite rendering.
---Returns either a drawable sprite or a list of sprites.
---Defaults to getting the sprite from texture if defined.
---Most of the time you'll want to define this one if you need anything more than a single texture.
---@field sprite? nil
---
---Highly custom entity drawing. Usually bad for performance; not recommended.
---@deprecated Bad for performance, use 'sprite' instead.
---@field draw? nil
---
---Returns the rectangle used to display the entity.
---Only used if sprite, texture, and draw are not defined.
---Defaults to creating a rectangle using the entity's width and height.
---If the entity has no width and height, a fallback sprite will be used.
---@field rectangle? nil
---
---Used for fine control over selections.
---Returns the main selection rectangle and a table of all node selection rectangles.
---If no nodes are present, the second return value may be nil or an empty table.
---Often implemented using 'utils.rectangle'.
---Defaults to rectangle() if defined, otherwise creates a rectangle based on entity width and height.
---If the entity has no width and height, the default rectangle will try to fully cover the drawable texture.
---@field selection? nil
---
---Callback that is run whenever a new node is added to the entity.
---Return false to cancel the action.
---@field onNodeAdded? nil
---
---Overwrites node-adding behaviour.
---Allows manually modifying 'entity.nodes'.
---Returns true if a node has been successfully added, false otherwise.
---@field nodeAdded? nil
---
---Callback that is run whenever an entity or node is deleted.
---A node index of 0 means the entity itself.
---Return false to cancel the action.
---@field onDelete? nil
---
---Overwrites deletion behaviour. A node index of 0 means the entity itself.
---Returns true if the object has been successfully deleted, false otherwise.
---@field delete? nil
---
---Callback that is run whenever an entity is being resized. Return false to cancel the action.
---@field onResize? nil
---
---Overwrites resizing behaviour. Returns true if any changes have been made, false otherwise.
---@field resize? nil
---
---Overwrites resize selection update.
---Allows manually changing the selection rectangle after a resize.
---A node index of 0 means the entity itself.
---@field updateResizeSelection? nil
---
---Callback that is run whenever an entity or node is being moved.
---A node index of 0 means the entity itself. 
---Return false to cancel the action.
---@field onMove? nil
---
---Overwrites moving behaviour.
---Allows manually modifying entity or node coordinates on move.
---A node index of 0 means the entity itself.
---@field move? nil
---
---Overwrites move selection update.
---Allows manually changing the selection rectangle after a move.
---A node index of 0 means the entity itself.
---@field updateMoveSelection? nil
---
---Callback that is run whenever an entity is being flipped.
---'horizontal' is true if a horizontal flip is being performed,
---'vertical' is true if a vertical flip is being performed.
---Return false to cancel the action.
---@field onFlip nil
---
---Flips the selected entity. 
---'horizontal' is true if the entity should be flipped horizontally, 
---'vertical' is true if the entity should be flipped vertically.
---If this is not implemented, flipping does nothing for this entity.
---Returns true if the entity has been successfully flipped, false otherwise.
---@field flip? nil
---
---Overwrites flip selection update.
---Allows manually changing the selection rectangle after a flip. A node index of 0 means the entity itself.
---@field updateFlipSelection? nil
---
---Callback that is run whenever an entity is being rotated.
---'direction' is an integer specifying the number of steps and direction of the rotation, typically 1 or -1.
---The value is positive for clockwise rotations and negative for anticlockwise rotations. 
---Return false to cancel the action.
---@field onRotate? nil
---
---Rotates the selected entity.
---'direction' is an integer specifying the number of steps and direction of the rotation, typically 1 or -1.
---The value is positive for clockwise rotations and negative for anticlockwise rotations.
---If this is not implemented, rotating does nothing for this entity.
---Returns true if the entity has been successfully rotated, false otherwise.
---@field rotate? nil
---
---Overwrites rotate selection update.
---Allows manually changing the selection rectangle after a rotation.
---A node index of 0 means the entity itself.
---@field updateRotateSelection? nil
---
---@field nodeSprite? nil
---
---@field nodeTexture? nil
---
---@field nodeDraw? nil
---
---@field nodeRectangle? nil
---
---@field nodeJustification? nil
---
---@field nodeOffset? nil
---
---@field nodeScale? nil
---
---@field nodeRotation? nil
---
---@field nodeDepth? nil
---
---@field nodeColor? nil
---
---@field nodeFillColor? nil
---
---@field nodeBorderColor? nil
---
---@field nodeMode? "fill"|"line"
---
local EntityHandler = {
    placements = nil,
    associatedMods = nil,
    nodeLimits = nil,
    nodeVisibility = "selected",
    nodeLineRenderType = false,
    nodeLineRenderOffset = nil,
    minimumSize = nil,
    maximumSize = nil,
    warnBelowSize = nil,
    warnAboveSize = nil,
    ignoredFields = {"_name", "_id", "originX", "originY"},
    ignoredFieldsMultiple = nil,
    ignoredSimilarityKeys = {"_name", "_id", "_type", "originX", "originY", "x", "y"},
    fieldOrder = { "x", "y", "width", "height" },
    fieldInformation = nil,
    rotate = nil,
    sprite = nil,
    draw = nil,
    rectangle = nil,
    selection = nil,
    onNodeAdded = nil,
    nodeAdded = nil,
    onDelete = nil,
    delete = nil,
    onResize = nil,
    resize = nil,
    updateResizeSelection = nil,
    onMove = nil,
    move = nil,
    updateMoveSelection = nil,
}
