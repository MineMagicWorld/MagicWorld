
local Rocker = class("Rocker");

function Rocker:ctor(imageRes, rockerModel)
    self._model = rockerModel;
end

function Rocker:getModel()
    return self._model;
end


return Rocker