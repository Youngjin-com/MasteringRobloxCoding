function add(x, y)
    return x + y
end

function subtract(x, y)
    return x - y
end

local sum = add(5, 5)
local difference = subtract(10, 5)

local result = subtract(add(5, 5), 5)
print(result)