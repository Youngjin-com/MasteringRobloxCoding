function filterBroadcastString(textObject)
    -- 필터링된 메시지를 저장하는 변수 선언
    local filteredMessage = nil

    -- :GetNonChatStringForBroadcastAsync()에서 오류가 발생할 수 있으므로 pcall 사용
    local success, err = pcall(function()
        filteredMessage = textObject:GetNonChatStringForBroadcastAsync()
    end)
    
    -- ':GetNonChatStringForBroadcastAsync()'에서 오류 발생 확인
    if err then
        warn("Something went wrong while filtering message. Error: " .. err)
        return "[Failed to filter message]"
    end
    
    -- 필터링된 메시지 반환
    return filteredMessage
end