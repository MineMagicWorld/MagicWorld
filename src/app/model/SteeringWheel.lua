-- 方向盘数据模型
local SteeringWheel = class("SteeringWheel")

function SteeringWheel:ctor()
    -- 设置初始角度为0度
    self.angle_ = 0
end

function SteeringWheel:getAngle()
    return self.angle_
end


function SteeringWheel:setAngle(angle)
    self.angle_ = angle
    return self
end

return SteeringWheel
