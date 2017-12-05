
cc.FileUtils:getInstance():setPopupNotify(false)

require "config"
require "cocos.init"

local function main()
    local breakSocketHandle,debugXpCall = require("LuaDebugjit")("localhost",7003)
    require("app.MyApp"):create():run()
end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
    debugXpCall();
    print(msg)
end
