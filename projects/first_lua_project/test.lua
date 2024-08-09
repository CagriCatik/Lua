-- test.lua
local mymodule = require("mymodule")

local function test_add()
    local result = mymodule.add(5, 7)
    assert(result == 12, "Test failed: expected 12 but got " .. result)
    print("Test passed: add(5, 7) == 12")
end

test_add()
