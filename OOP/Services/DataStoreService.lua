local DataStoreService = {}

-- saving data (Datastore for each game)

DataStoreService.createConnection = function(game)
    local DATASTORE = {}
    setmetatable(DATASTORE, {})

    DATASTORE.Game = game
    DATASTORE.DataStores = {}

    -- returns a datastore along with it methods ("getData", "setData", "removeData", "updateData")
    DATASTORE.getDataStore = function(self, name)
        self.DataStores[name] = self.DataStores[name] or {} -- accessing datastore/ creating it

        return {
            -- sets data in datastore with given key
            setData = function(key, data)
                self.DataStores[name][key] = data
            end,

            -- returns the data within the datastore, stored via given key
            getData = function(key)
                return self.DataStores[name][key]
            end,

            -- removes the data from the datastore via given key
            removeData = function(key)
                self.DataStores[name][key] = nil
            end,

            -- returns datastore info which can be used in the updateFunction to update the data
            updateData = function(key, updateFunction)
                local saveDestination = self.DataStores[name][key]
                if (saveDestination == nil) then
                    print("Can not update data! No data to update")
                    return
                end
                updateFunction(saveDestination)
            end
        }
    end

    return DATASTORE
end

return DataStoreService