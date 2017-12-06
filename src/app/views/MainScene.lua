
local MainScene = class("MainScene", cc.load("mvc").ViewBase)
local ControllerSystemCtrl = import("..controller.ControllerSystemCtrl")

function MainScene:onCreate()
    -- add background image
    display.newSprite("HelloWorld.png")
        :move(display.center)
        :addTo(self)

    -- add HelloWorld label
    cc.Label:createWithSystemFont("Hello World", "Arial", 40)
        :move(display.cx, display.cy + 200)
        :addTo(self)

    ControllerSystemCtrl:create(self)
end

return MainScene
