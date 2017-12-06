
local SteeringWheel = import("app.model.SteeringWheel")

local ControllerSystemCtrl = class("ControllerSystemCtrl")

function ControllerSystemCtrl:ctor(sence)
    self.steeringWheel_ = SteeringWheel:create()
    self:onCreate(sence)
end

function ControllerSystemCtrl:onCreate(sence)
    local ControllerSystemLayer = require("app.views.ControllerSystemLayer")
    ControllerSystemLayer:create()
        :setOnTouchListenerToRocker(handler(self, self.onTouchBegan), handler(self, self.onTouchMoved))
        :addTo(sence)
end

-- 触摸开始  
function ControllerSystemCtrl:onTouchBegan(touch, event)
    local target = event:getCurrentTarget()
    if cc.rectContainsPoint(target:getParent():getBoundingBox(), cc.p(touch:getLocation().x, touch:getLocation().y))  then
        local target = event:getCurrentTarget()  --获取当前的控件
        target:setPosition(cc.p(touch:getLocation().x, touch:getLocation().y))
        return true
    end
    return false  
end  

function ControllerSystemCtrl:onTouchMoved(touch, event)
    local target = event:getCurrentTarget()
    if cc.rectContainsPoint(target:getParent():getBoundingBox(), cc.p(touch:getLocation().x, touch:getLocation().y)) 
        and cc.rectContainsPoint(target:getParent():getBoundingBox(), cc.p(touch:getPreviousLocation().x, touch:getPreviousLocation().y))  then
        local target = event:getCurrentTarget()  --获取当前的控件
        target:setPosition(cc.p(touch:getLocation().x, touch:getLocation().y))
    end
end

return ControllerSystemCtrl