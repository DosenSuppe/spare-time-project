-- local Objects = require("Objects")
local DosLib = require("DosLib")

local BaseInstance = {
    new = function()
        local Object = {}
        setmetatable(Object, {})
        
        -- adding BaseInstance properties
        Object.Children = {}
        Object.Parent = nil
        
        --[[
            EVENTS
        ]]

        -- changed event
        -- fires when property of given object has changed value
        Object.Changed = {
            connections = {},
            connect = function(self, _function)
                if (type(_function)~="function") then
                    error("Expected \"function\" for connection")
                end

                table.insert(self.connections, _function)
                return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
        }

        -- ChildAdded event
        -- fires when a child has been added to given object
        Object.ChildAdded = {
            connections = {},
            connect = function(self, _function)
                if (type(_function)~="function") then
                    error("Expected \"function\" for connection")
                end

                table.insert(self.connections, _function)
                return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
        }

        -- DescendantAdded event
        -- fires when a descendant has been added to given object
        Object.DescendantAdded = {
            connections = {},
            connect = function(self, _function)
                if (type(_function)~="function") then
                    error("Expected \"function\" for connection")
                end

                table.insert(self.connections, _function)
                return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
        }

        -- DescendantRemoved event
        -- fires when a descendant has been removed from given object
        Object.DescendantRemoved = {
            connections = {},
            connect = function(self, _function)
                if (type(_function)~="function") then
                    error("Expected \"function\" for connection")
                end

                table.insert(self.connections, _function)
                return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
        }

        -- ChildRemoved event
        -- fires when a child has been removed from given object
        Object.ChildRemoved = {
            connections = {},
            connect = function(self, _function)
                if (type(_function)~="function") then
                    error("Expected \"function\" for connection")
                end

                table.insert(self.connections, _function)
                return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
        }

        --[[
                METHODS
        ]]

        -- ClearAllChildren method
        -- removes all children from given object
        Object.ClearAllChildren = function(self)

        end

        -- returns a list of all descendants of given instance
        Object.GetDescendants = function(self)
            local descendants = {}
            for i, child in pairs(self.Children) do
                table.insert(descendants, child)
                if (#child.Children > 0) then
                    table.insert(descendants, child:GetDescendants())
                end
            end
            return descendants
        end

        -- GetPropertyChangedSignal method
        -- returns a fire-event that fires when given property of given object has changed
        Object.GetPropertyChangedSignal = function(self, property)
            self.connections = self.connections or {}
            return {
                connect = function(_function)
                    if (type(_function)~="function") then
                        error("Expected \"function\" for connection")
                    end

                    table.insert(self.connections, _function)
                    print(#self.connections)

                    return {disconnect = function()
                        local position = DosLib.Table.find(self.connections, _function) or 1
                        table.remove(self.connections,position)
                    end
                }
            end
            }
        end

        -- SetActor method
        -- sets the actor (client/server) responsible for the changes on given object
        Object.SetActor = function(self, actor)
            self.Actor = actor
        end

        -- GetActor method
        -- returns the actor (client/server) responsible for the changes on given object
        Object.GetActor = function(self) return self.Actor end

        return Object
    end
}



return BaseInstance