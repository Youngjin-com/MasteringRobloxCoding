function randomBoolean()
    return math.random(0, 5) == 0
end

function countTries()
    -- 카운터 변수
    local tries = 0
    
    -- repeat until문
    repeat
        tries += 1
    until
    randomBoolean() == true
    
    -- 반복문이 끝날 때까지 실행된 횟수를 출력
    print("It took " .. tries .. " tries to end the loop.")
end

countTries()