local countryNames = require 'CountryNames'
local get_location = require 'GetIPLocation'
local graphHelpers = require 'GraphHelpers'
local gd = require "gd"
local parseCSV = require 'ParseCSV'

-- parsing our example data to graph
local data = parseCSV("ip_company_sample.csv")

-- determining the country counts directly from the csv
local countryCounts = {}
for i, row in ipairs(data) do
    local fullCountryName = countryNames[row.country]
    graphHelpers.IncrementCountryCount(countryCounts, fullCountryName)
end

-- determing the country counts from the API translation
local countryCountsFromAPI = {}
for i, row in ipairs(data) do
    local location = get_location(row.start_ip)
    if location ~= nil then
        local fullCountryName = location.country
        graphHelpers.IncrementCountryCount(countryCountsFromAPI, fullCountryName)
    end
end

local function collectBarGraph(countryCounts, numBars, graphName, barColorRGB)
    -- calculating imageWidth
    local barWidth = 20
    local barSpacing = 90
    local imageWidth = (numBars) * (barSpacing)
    local imageHeight = 300

    local im = gd.create(imageWidth, imageHeight)
    local white = im:colorAllocate(255, 255, 255)
    local black = im:colorAllocate(0, 0, 0)
    local barColor = im:colorAllocate(barColorRGB[1], barColorRGB[2], barColorRGB[3])
    
    -- Drawing the bars
    local scaleFactor = 10
    local x = 10
    for country, count in pairs(countryCounts) do
        im:filledRectangle(x, imageHeight - count * scaleFactor, x + barWidth, imageHeight, barColor)
        im:string(gd.FONT_SMALL, x, imageHeight - (count * scaleFactor) - 15, country, black)
        x = x + barSpacing
    end

    -- Save the image to a file
    im:png(graphName)
end

local redRGB = {255, 0, 0}
local blueRGB = {0, 0, 255}

collectBarGraph(countryCounts, graphHelpers.CountKeys(countryCounts), "country_counts.png", redRGB)
collectBarGraph(countryCountsFromAPI, graphHelpers.CountKeys(countryCountsFromAPI), "country_counts_from_api.png", blueRGB)
