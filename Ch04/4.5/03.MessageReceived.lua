function messageReceived(player, inputMessage)
	-- 서버 검사
	if inputMessage == nil or typeof(inputMessage) ~= "string" then
		-- 메시지가 제공되지 않았거나 매개변수에 문자열이 포함되어 있지 않으면 함수 종료
		return
	end
	
	if not ( string.len(inputMessage) > 0 ) then
		-- 메시지가 비어 있으면 함수 종료
		return
	end 

	-- 디바운스 검사
	if playerHasDebounceCooldown(player) == true then
		-- 플레이어의 디바운스 쿨다운이 활성화되어 있으면 함수 종료
		return
	end
	
	-- 함수 구현
	local textObject = getTextObject(player, inputMessage)
	if textObject ~= nil then
		local filteredMessage = filterBroadcastString(textObject)
		ReplicatedStorage.ReceivedMessage:FireAllClients(player, filteredMessage)
	end
end
