function randomBoolean()
    return math.random(0, 5) == 0
 end

 function countTries()
    -- 카운터 변수
    local tries = 0

    -- While문
    while randomBoolean() == false do
       tries += 1
    end

    -- 반복문이 끝날 때까지 실행된 횟수를 출력
    print("It took " .. tries .. " tries to end the loop.")
 end

 countTries()