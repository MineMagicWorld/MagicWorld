
local ControllerSystemLayer = class("ControllerSystemLayer", function()
    return cc.Layer:create()
end)

function ControllerSystemLayer:ctor()
    self:create()
end

function ControllerSystemLayer:create()

    self.visibleSize = cc.Director:getInstance():getVisibleSize()

    -- 摇杆背景
    self.bg = cc.Sprite:create("HelloWorld.png")
    self.bg:setPosition(cc.p(100,100))
    self:addChild(self.bg)

    -- 摇杆
    self.rocker = cc.Sprite:create("Star.png")
    self.bg:addChild(self.rocker)
    self.rocker:setPosition(self.bg:getContentSize().width / 2, self.bg:getContentSize().height / 2)
    self.rocker:setScale(0.8)

    -- 设置初始角度为0度
    self.angle = 0

    -- 触摸开始  
    local function onTouchBegan(touch, event)
        local bgX, bgY = self.bg:getPosition()
        if cc.rectContainsPoint(self.bg:getBoundingBox(), cc.p(touch:getLocation().x, touch:getLocation().y))  then
            local target = event:getCurrentTarget()  --获取当前的控件
            target:setPosition(cc.p(touch:getLocation().x, touch:getLocation().y))
            return true
        end
        return false  
    end  
  
    local function onTouchMoved(touch, event)
        if cc.rectContainsPoint(self.bg:getBoundingBox(), cc.p(touch:getLocation().x, touch:getLocation().y)) 
            and cc.rectContainsPoint(self.bg:getBoundingBox(), cc.p(touch:getPreviousLocation().x, touch:getPreviousLocation().y))  then
            local target = event:getCurrentTarget()  --获取当前的控件
            target:setPosition(cc.p(touch:getLocation().x, touch:getLocation().y))
        end
    end
  
  
    -- 单点触摸的监听器  
    local listener = cc.EventListenerTouchOneByOne:create()  
    listener:setSwallowTouches(false)  --是否向下传递
    -- 注册两个回调监听方法  
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )  
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    local eventDispatcher = self.rocker:getEventDispatcher()-- 时间派发器  
    -- 绑定触摸事件到层当中  
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self.rocker) 

    return self
end

function ControllerSystemLayer:addTo(target)
    target:addChild(self)
end

return ControllerSystemLayer