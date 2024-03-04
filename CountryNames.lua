local countryNamesAndISP = {
    ["Internet Service Provider"] = "isp",
    ["Hosting Company"] = "hosting",
    ["AT&T"] = "att.com",
    ["Thailand ISP"] = "totidc.net",
    ["KV Asia"] = "kvhasia.com",
    ["United States"] = "US",
    ["United Kingdom"] = "GB",
    ["South Korea"] = "KR",
    ["Indonesia"] = "ID",
    ["Taiwan"] = "TW",
    ["Hong Kong"] = "HK",
    ["Russia"] = "RU",
    ["Vietnam"] = "VN",
    ["China"] = "CN",
    ["Japan"] = "JP",
    ["Singapore"] = "SG",
    ["India"] = "IN",
    ["Germany"] = "DE",
    ["Phillipines"] = "PH",
    ["Ivory Coast"] = "CI",
    ["France"] = "FR",
    ["Italy"] = "IT",
    ["Spain"] = "ES",
    ["Australia"] = "AU",
    ["Brazil"] = "BR",
    ["Canada"] = "CA",
    ["Mexico"] = "MX",
    ["South Africa"] = "ZA",
    ["Nigeria"] = "NG",
    ["Kenya"] = "KE",
    ["Egypt"] = "EG",
    ["Saudi Arabia"] = "SA",
    ["United Arab Emirates"] = "AE",
    ["Turkey"] = "TR"    
}


-- reverses the countryNamesAndISP table
local reversedCountryNames = {}
for k, v in pairs(countryNamesAndISP) do
    reversedCountryNames[v] = k
end

return reversedCountryNames