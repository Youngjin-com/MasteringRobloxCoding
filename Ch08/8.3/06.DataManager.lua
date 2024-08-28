--[[
    지침:
    1) DataManager라는 ModuleScript를 만듭니다.
    2) 책에 있는 설명을 참고하여 다음 코드를 삽입합니다.
--]]

--[[
	문서:
	
	DataManager를 가져오는 방법(new script):
		1) local DataManager = require(PATH_TO_MODULE)
		
	플레이어의 참여 여부 확인 방법: 
		2) DataManager.PlayerAdded:Connect(function(player)
		3)     -- 여기에 코드 작성
		4) end)
		Note: 이 이벤트는 Players.PlayerAdded 대신 사용됩니다.
		
	사용할 수 있는 함수:
	
		1. DataManager:DataLoaded(player)
			플레이어의 데이터 로드 여부를 반환
		
		2. DataManager:Get(player, key)
			특정 키의 값을 반환
			
			Example:
				local playerData = {
					["Madpoint83"] = {
						["coins"] = 500
					}
				}
				
				print(DataManager:Get(player, "coins")) -> 500
			
		3. DataManager:Set(player, key, value)
			현재 값을 재정의하고 값 인수에 지정된 값으로 설정
		
		4. DataManager:Increment(player, key, value)
			현재 값을 값 인수로 지정된 만큼 증가
			Note: 숫자로만 작동합니다.
    
    Note: 이 모듈은 독립형 모듈입니다. 
	이 모듈을 사용하려면 위의 지침에 따라 새 스크립트를 만들어야 합니다.
--]]

local DataManager = {}

local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("PlayerData")

local DataLoadedEvent = Instance.new("BindableEvent")

local AUTO_SAVE_INTERVAL = 30

local DEFAULT_PLAYER_DATA = {
	["coins"] = 500,
	["tools"] = {}
}

local playerData = {}


-- setup 

function setupEvents()
	DataManager["PlayerAdded"] = DataLoadedEvent.Event
end


-- 공개 함수

function DataManager:DataLoaded(player)
	-- 데이터 로드 여부 확인
	return playerData[player.Name] ~= nil
end

function DataManager:Get(player, key)
	-- 데이터 로드 여부 확인
	if DataManager:DataLoaded(player) ~= true then
		error("[Data Not Loaded]: Use the DataManager.PlayerAdded event in favor of the Players.PlayerAdded event!")
	end

	-- 캐시된 데이터 호출
	local cachedData = playerData[player.Name]

	-- 키가 유효한지 확인
	if cachedData[key] == nil then
		error("[Invalid Key]: Key [" .. key .. "] does not exist.")
	end

	-- 데이터 반환
	return cachedData[key]
end

function DataManager:Set(player, key, value)
	-- 데이터 로드 여부 확인
	if DataManager:DataLoaded(player) ~= true then
		error("[Data Not Loaded]: Use the DataManager.PlayerAdded event in favor of the Players.PlayerAdded event!")
	end

	-- 데이터 설정
	playerData[player.Name][key] = value
end

function DataManager:Increment(player, key, value)
	-- 데이터 로드 여부 확인
	if DataManager:DataLoaded(player) ~= true then
		error("[Data Not Loaded]: Use the DataManager.PlayerAdded event in favor of the Players.PlayerAdded event!")
	end

	-- 캐시된 데이터 호출
	local cachedData = playerData[player.Name]

	-- 키가 유효한지 확인
	if cachedData[key] == nil then
		error("[Invalid Key]: Key [" .. key .. "] does not exist.")
	end

	-- 데이터 타입 확인
	if typeof(cachedData[key]) ~= "number" then
		error("[Invalid data type]: You can only use the :Increment() function on numbers. Consider using :Set().")
	end

	-- 데이터 증가
	cachedData[key] += value
end


-- 플레이어 함수

function playerJoined(player)
	-- 데이터 호출 및 캐싱
	playerData[player.Name] = get(player)

	-- 데이터 로드 이벤트 실행
	DataLoadedEvent:Fire(player)
end

function playerLeft(player)
	-- 데이터 저장
	save(player)

	-- 캐시된 데이터 삭제
	playerData[player.Name] = nil
end


-- 데이터베이스 함수

function get(player)
	-- 여유량이 생길 때까지 대기
	yieldUntilBudget(Enum.DataStoreRequestType.GetAsync)

	-- 데이터 저장
	local loaded = nil
	local suc, err
	--
	repeat
		suc, err = pcall(function()
			loaded = DataStore:GetAsync("Plr_" .. player.UserId)
		end)
		if not suc then
			-- 경고 출력
			warn(err)

			-- 재시도 전 잠시 대기
			task.wait(6)
		end
	until
	suc
	--
	if loaded == nil then
		return copyTable(DEFAULT_PLAYER_DATA)
	else
		return loaded
	end
end

function save(player)
	-- 여유량이 생길 때까지 대기
	yieldUntilBudget(Enum.DataStoreRequestType.SetIncrementAsync)

	-- 데이터 저장
	local suc, err
	repeat
		suc, err = pcall(function()
			DataStore:SetAsync(
				-- 키
				"Plr_" .. player.UserId,
				
				-- 캐시된 데이터
				playerData[player.Name]
			)
		end)
		if not suc then
			-- 경고 출력
			warn(err)

			-- 재시도 전 잠시 대기
			task.wait(6)
		end
	until
	suc

end


-- 자동 저장 함수

function autoSave()
	while true do
		-- 자동 저장 간격만큼 대기
		task.wait(AUTO_SAVE_INTERVAL)

		-- 플레이어 정보 호출
		for _, player in pairs(Players:GetPlayers()) do
			-- 데이터 캐시 여부 확인
			if playerData[player.Name] ~= nil then
				-- 자동 저장
				task.spawn(function()
					save(player)
				end)
			end
		end
	end
end

function yieldUntilBudget(dataStoreRequestType)
	while 
		DataStoreService:GetRequestBudgetForRequestType(dataStoreRequestType) <= 0
	do
		task.wait(1)
	end
end


-- 테이블 함수

function copyTable(toCopy)
	-- 새로운 copy 테이블 생성
	local copy = {}

	-- toCopy 테이블 반복
	for i, v in pairs(toCopy) do
		-- 값이 중첩된 테이블/딕셔너리인지 확인하기
		if typeof(v) == "table" then
			-- 중첩된 테이블/딕셔너리 복사
			v = copyTable(v)
		end

		-- 복사된 테이블에 값 입력
		copy[i] = v
	end

	-- copy 반환
	return copy
end


--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
setupEvents()
task.spawn(autoSave)

return DataManager