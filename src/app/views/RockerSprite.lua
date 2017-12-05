-- 摇杆
local RockerSprite = class("RockerSprite", function(imageRes)
    return cc.Sprite:create(imageRes)
end);

function RockerSprite:ctor(imageRes)
    self:setPosition(cc.p(100,100))
end

function RockerSprite:setOnTouchListener(onTouchBegan, onTouchMoved)
    -- 单点触摸的监听器  
    local listener = cc.EventListenerTouchOneByOne:create()  
    listener:setSwallowTouches(false)  --是否向下传递
    -- 注册两个回调监听方法  
    listener:registerScriptHandler(onTouchBegan,cc.Handler.EVENT_TOUCH_BEGAN )  
    listener:registerScriptHandler(onTouchMoved,cc.Handler.EVENT_TOUCH_MOVED )
    local eventDispatcher = self:getEventDispatcher()-- 时间派发器  
    -- 绑定触摸事件到层当中  
    eventDispatcher:addEventListenerWithSceneGraphPriority(listener, self)
end

return RockerSprite