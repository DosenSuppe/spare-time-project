local Script = {}
local BaseInstance = require("DosLibTest.Instances.BaseInstance")

-- script instance
Script.new = function(name, properties)
    local SCRIPT = {}
    
    for propertie, value in pairs(BaseInstance.new()) do
        SCRIPT[propertie] = value
    end

    setmetatable(SCRIPT, {})

    SCRIPT.Name = name

    SCRIPT.SourceCode = ""

    -- runs the given code
    SCRIPT.run = function(self) load(self.SourceCode)() end

    return SCRIPT
end

return Script