local PlayerService = {}
local Core = require "DosLibTest.Core"

PlayerService.new = function(Username)
    local PLAYER = {}
    setmetatable(PLAYER, {})

    PLAYER.Username = Username
    PLAYER.UserId = nil
    PLAYER.Ingame = false

    PLAYER.IsAdmin = Core.getPermissionLevel(Username)

    return PLAYER
end


return PlayerService