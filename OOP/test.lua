local BaseInstance = require "DosLibTest.Instances.BaseInstance"

local myInstance = BaseInstance.new()
myInstance.Changed:connect(function()
    print("has changed")
end)

myInstance:GetPropertyChangedSignal("Parent").connect(function()
    print("Has changed too")
end)
myInstance:GetPropertyChangedSignal("Parent").connect(function()
    print("Has changed too x2")
end)

for i, func in pairs(myInstance.Changed.connections) do
    func()
end

