local class = {

    modify = function(self, component_id, ...)
        self.components[component_id]:init(...)
    end,

    get  = function(self, component_id)
        return self.components[component_id]
    end,

    add  = function(self, component_id, component_value)
        self.components[component_id] = component_value
    end,

    remove = function(self, component_id)
        self.components[component_id] = nil
    end,

    init = function(self)

    end,

    new = function(self, ...)

        local instance = setmetatable({}, self)

        if not self.NO_REDO_COMPONENTS then
            instance.components = {}

            for i, v in pairs(self.components) do
                local new_table = {}
                for index, value in pairs(v) do
                    new_table[index] = value
                end

                -- TODO: Optimize component retrieval system.
                instance.components[i] = setmetatable(new_table, getmetatable(v))
            end
        end

        if instance.init then
            instance:init(...)
        end

        return instance
    end

}

class.__index = class

return setmetatable(class, {
    __call = function(self, data, components)
        local instance = setmetatable(data, self)
        data.__index = data
        data.components = components or {}

        return instance
    end
})