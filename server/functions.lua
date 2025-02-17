---@class PlayerIdentifiers
---@field license string
---@field license2 string Preferred identifier; should always refer to Rockstar Social Club ID.
---@field discord? string
---@field fivem? string
---@field steam? string

---Return all identifiers for the given source.
---@param source number | string
---@return PlayerIdentifiers
function Ox.GetIdentifiers(source)
    local identifiers = {}

    for i = 0, GetNumPlayerIdentifiers(source) - 1 do
        local prefix, identifier = string.strsplit(':', GetPlayerIdentifier(source --[[@as string]], i))

        if prefix ~= 'ip' then
            identifiers[prefix] = identifier
        end
    end

    return identifiers
end
