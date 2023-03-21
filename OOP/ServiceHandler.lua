local ServiceHandler = {}

local Services = {
    "DataStoreService", "TweenService"
}

ServiceHandler.createConnection = function (game)
    local SERVICES = {}
    setmetatable(SERVICES, {})

    SERVICES.Game = game
    SERVICES.Services = {}

    for i, service in pairs(Services) do
        local _service = require("DosLibTest.Services."..service)
        if (_service) then
            print("ADDED SERVICE: ", service)

            if (_service.createConnection) then
                SERVICES.Services[service] = _service.createConnection(game)
            else
                SERVICES.Services[service] = _service
            end
        end
    end

    SERVICES.getService = function(self, serviceName)
        local _service = self.Game.Service.Services[serviceName]
        if (not _service) then print("Service not found!") return end

        return _service
    end

    return SERVICES
end

return ServiceHandler