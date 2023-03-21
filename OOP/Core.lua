local DosLib = require "DosLib"
local Admins = {
    "Niklas"
}

-- stores information about the CORE-System package

return {
    getPermissionLevel = function(playerName)
        if (DosLib.Table.find(Admins, playerName)) then
            return true
        end
        return false
    end
}