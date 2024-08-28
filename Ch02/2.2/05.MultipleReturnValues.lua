-- (1)
function add(x, y)
    return x + y
end

function subtract(x, y)
    return x - y
end

function addAndSubstract(x, y)
    return add(x, y), subtract(x, y)
end

local sum, difference = addAndSubstract(10, 5)


-- (2)
function add(x, y)
    return x + y
end

function subtract(x, y)
    return x - y
end

local sum, difference = add(10, 5), subtract(10, 5)