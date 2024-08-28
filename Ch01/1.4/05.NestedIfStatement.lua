local MINIMUM_PLAYERS = 1
local MAXIMUM_PLAYERS = 8
local playerPosition = 1

-- 플레이어의 순위가 올바른지 확인
if playerPosition >= MINIMUM_PLAYERS and playerPosition <= MAXIMUM_PLAYERS then
    -- 플레이어의 순위에 따른 메시지 출력
    if playerPosition <= 3 then
        print("Well done! You are in spot".. playerPosition .. "!")
    elseif playerPosition <= 5 then
        print("You are almost there!")
    else
        print("You are not in the top three yet! Keep going!")
    end
else
    -- 플레이어의 순위가 올바르지 않은 경우
    warn("Incorrect player position [" .. playerPosition .. "]!")
end