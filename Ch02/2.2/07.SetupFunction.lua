-- setup 함수
function setup()
    local sum = add(5, 5)
    local difference = subtract(10, 5)
    print(sum)
    print(difference)
end


-- 계산기 함수
function add(x, y)
    return x + y
end

function subtract(x, y)
    return x - y
end

setup()