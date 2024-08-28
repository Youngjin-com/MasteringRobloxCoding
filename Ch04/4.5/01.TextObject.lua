function getTextObject(player, inputMessage)
    -- TextObject용 변수 선언
    local textObject = nil

    -- :FilterStringAsync() 함수에서 오류가 발생할 수 있으므로 pcall 사용
    local success, err = pcall(function()
        -- 변수 textObject 초기화
        textObject = TextService:FilterStringAsync(
            inputMessage,
            player.UserId
        )
    end)

    -- :FilterStringAsync() 함수에서 발생하는지 확인
    if err then
        warn("Something went wrong creating text object.\nError: " .. err)
    end
    
    -- textObject 반환
    return textObject
end
