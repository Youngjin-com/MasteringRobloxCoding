function addAndSubstract(x, y)
    -- 중첩된 add 함수
    local function add()
        return x + y
    end
    
    -- 중첩된 subtract 함수
    local function subtract()
        return x - y
    end

    -- 결과 반환
    return add(), subtract()
end

local sum, difference = addAndSubstract(10, 5)