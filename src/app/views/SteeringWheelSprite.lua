-- 摇杆背景
local SteeringWheelSprite = class("SteeringWheelSprite", function(imageRes)
    return cc.Sprite:create(imageRes)
end);

function SteeringWheelSprite:ctor(imageRes)
    self:setPosition(cc.p(100,100))
end

return SteeringWheelSprite