local Servers = {}
local DosLib = require "DosLib"

Servers.new = function(id, game)
    local SERVER = {}

    setmetatable(SERVER, {})

    SERVER.Id = id
    SERVER.Game = game
    SERVER.PlayerLimit = 12
    SERVER.Players = {}

    SERVER.requestClose = function(self)
        self.Game:removeServer(self)
    end

    SERVER.newUser = function(self, player)
        if (self:inServer(player)) then
            return "connection failed, player is already in game"
        end
        if (#self.Players >= self.PlayerLimit) then
            return "connection failed, player-limit exceeded"
        end

        table.insert(self.Players, player)
        player.Ingame = true

        return "connected"
    end

    SERVER.removeUser = function(self, player)
        local inGame = DosLib.Table.find(self.Players, player)
        if (not inGame) then
            return "Player is not in the server. Player cannot leave this server"
        end

        player.Ingame = false
        self.Players[inGame] = nil
        return "Player has been disconnected from the game"
    end

    SERVER.inServer = function(self, player)
        if (DosLib.Table.find(self.Players, player)) then
            return true
        end
        return false
    end

    return SERVER
end

return Servers