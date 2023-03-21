local PlayerService = require "DosLibTest.PlayerService"
local GameService = require "DosLibTest.GameService"
local Enum = require "DosLibTest.Enum"

-- local Servers = require "DosLibTest.Servers"
Instances = require "DosLibTest.Instances.Instances"

local Services = require "DosLibTest.ServiceHandler"

local myPlayer = PlayerService.new("Niklas")
local game = GameService.new("SomeId", "SomeGame", myPlayer)
game:setService(Services.createConnection(game))

local server = game:addServer()

-- listing all servers for a game.
for i, c in pairs(game.Servers) do
    print("FOUND SERVER: ", i)
end

-- connecting with a new user to the game.
local connectionStatus = server:newUser(myPlayer)
print("SERVER: "..connectionStatus)

-- adding more players to the game
for i = 1, 2 do
    local player = PlayerService.new("Player"..i)
    local connectionSuccess = server:newUser(player)
    print("CLIENT: "..connectionSuccess)
end

print("--------------------------------\n")

-- creating a part 
local part = Instances.new("Part")
print(part.Name)
part.Name = "Part2"
print(part.Name)

local script = Instances.new("Script")
script.SourceCode = [[
    local DosLib = require("DosLib")
    local Event = DosLib.Event.new("Yes")
    Event.OnEvent:Connect(function(x,y)
        print(x.." + "..y.." = "..x+y)
    end)
    Event:Fire(1,2)
    io.write("Please enter two numbers:\n")
    Event:Fire(io.read(), io.read())
]]

script.Changed:connect(function()
    print("Yes")
end)

script:run()

print("\nPlayers in game:")
for i, player in pairs(server.Players) do
    print(player.Username)
end

print("\nTesting Tweenservice:")
local Tweenservice = game:getService("TweenService")
local Tween = Tweenservice.createTween(part, {Name="Yes"}, 1)
Tween:play()

print("--------------------------------\n")

-- requesting the game to close entirely
server:requestClose()


-- checking that every server has been removed from the game
for i, c in pairs(game.Servers) do
    print("FOUND SERVER: ", i)
end

-- making sure the player is no longer in any game/ server 
print(myPlayer.Ingame)
