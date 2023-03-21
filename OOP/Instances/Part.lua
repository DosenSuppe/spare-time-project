local Part = {}

-- part instance
Part.new = function(name, properties)
    local PART = {}
    setmetatable(PART, {})
    PART.Name = name

    return PART
end

return Part