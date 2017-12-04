
local SteeringWheel = class("SteeringWheel");

function SteeringWheel:create(model)
    -- body
end

function SteeringWheel:ctor(imageRes, steeringWheelModel)
    
    self._model = steeringWheelModel;
end

function SteeringWheel:getModel()
    return self._model;
end


return SteeringWheel