function add(x, y)
    -- 매개 변수 기본값
    if x == nil or typeof(x) ~= "number" then
        x = 0
    end
    if y == nil or typeof(y) ~= "number" then
        y = 0
    end
    
    -- 함수 로직
    print(x)
    print(y)
end

add(1, "2")