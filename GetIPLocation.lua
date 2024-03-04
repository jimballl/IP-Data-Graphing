local http = require("socket.http")
local json = require("dkjson")

-- Converts an IP address to a location object
function get_location(ip)
    local url = "http://ip-api.com/json/" .. ip
    local response = http.request(url)
    local location = json.decode(response)
    if location and location['status'] ~= "fail" then
        return location
    else
        return nil
    end
end

return get_location