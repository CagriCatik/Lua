-- main.lua
local mymodule = require("mymodule")

local function main()
    print("Welcome to my Lua project!")
    
    -- Use a function from the module
    local sum = mymodule.add(10, 20)
    print("The sum of 10 and 20 is: " .. sum)
end

main()
