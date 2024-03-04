-- Reads the CSV file and returns a table of rows.
-- Each row is a table with keys from the header row and values from the data rows.
local function parseCSV(filename)
    local file = io.open(filename, "r")
    local data = {}
    local headers = {}
    assert(file, "Error opening file: " .. filename)

    for line in file:lines() do
        if not next(headers) then
            for header in string.gmatch(line, '([^,]+)') do
                table.insert(headers, header)
            end
        else
            local row = {}
            local i = 1
            for value in string.gmatch(line, '([^,]+)') do
                if i <= #headers then
                    row[headers[i]] = value
                    i = i + 1
                end
            end
            table.insert(data, row)
        end
    end

    file:close()

    return data
end


return parseCSV