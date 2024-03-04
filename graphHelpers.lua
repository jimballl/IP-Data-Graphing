local graphHelpers = {}

-- allows countryCounts to be used as a frequency table
function graphHelpers.IncrementCountryCount(countryCounts, country)
    if countryCounts[country] then
        countryCounts[country] = countryCounts[country] + 1
    else
        countryCounts[country] = 1
    end
end

-- counts the number of keys in a table
function graphHelpers.CountKeys(t)
    local sum = 0
    for _ in pairs(t) do
        sum = sum + 1
    end
    return sum
end

return graphHelpers