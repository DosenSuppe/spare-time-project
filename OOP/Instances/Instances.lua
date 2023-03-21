local Instances = {}

-- creates a new instance
Instances.new = function(instanceName, properties)
    return require("DosLibTest.Instances."..instanceName) .new(instanceName, properties)
end

return Instances