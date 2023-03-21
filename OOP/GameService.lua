local GameService = {}

-- handles game creation

local Servers = require "DosLibTest.Servers"

GameService.new = function(GameId, Name, Creator)
    local GAME = {}
    setmetatable(GAME, {})

    GAME.Name = Name
    GAME.GameId = GameId

    GAME.Service = nil

    GAME.Servers = {}
    GAME.Creator = Creator

    GAME.setService = function(self, Service)
        self.Service = Service
    end

    GAME.addServer = function(self)
        local Id = math.random(os.time())

        print("Creating Server: ", Id)

        local Server = Servers.new(Id, self)
        self.Servers[Id] = Server

        return Server
    end

    GAME.removeServer = function(self, server)
        print("Removing Server: ", server.Id)

        for i, player in pairs(server.Players) do
            local connectionStatus = server:removeUser(player)
            print(connectionStatus)
        end

        self.Servers[server.Id] = nil
    end

    GAME.playerJoins = function(self, player)
        if (player.Ingame) then print("Player is already in game!") return end
        
    end

    GAME.getService = function(self, serviceName)
        return self.Service:getService(serviceName)
    end

    return GAME
end

return GameService