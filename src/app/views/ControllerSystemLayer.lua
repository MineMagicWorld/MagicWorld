
local RockerSprite = import(".RockerSprite")
local SteeringWheelSprite = import(".SteeringWheelSprite")

local ControllerSystemLayer = class("ControllerSystemLayer", function()
    return cc.Layer:create()
end)

function ControllerSystemLayer:ctor()
    self:initLayer()
end

function ControllerSystemLayer:initLayer()

    self.visibleSize = cc.Director:getInstance():getVisibleSize()

    -- 摇杆背景
    self.bg = SteeringWheelSprite:create("HelloWorld.png")
        :addTo(self)

    -- 摇杆
    self.rocker = RockerSprite:create("Star.png")
        :addTo(self.bg)
    self.rocker:setPosition(self.bg:getContentSize().width / 2, self.bg:getContentSize().height / 2)
    self.rocker:setScale(0.8)

    return self
end

function ControllerSystemLayer:setOnTouchListenerToRocker(onTouchBegan, onTouchMoved)
    self.rocker:setOnTouchListener(onTouchBegan, onTouchMoved)
    return self
end

return ControllerSystemLayer