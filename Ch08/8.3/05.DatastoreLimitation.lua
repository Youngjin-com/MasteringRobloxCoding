local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local DataStore = DataStoreService:GetDataStore("PlayerData")

local AUTO_SAVE_INTERVAL = 30

local DEFAULT_PLAYER_DATA = {
	["coins"] = 500,
	["gems"] = 0,
	["times_played"] = 0
}

local playerData = {}


-- 플레이어 함수

function playerJoined(player)
	-- 데이터 호출 및 캐싱
	playerData[player.Name] = get(player)

	-- times_played 업데이트
	playerData[player.Name]["times_played"] += 1
	print(playerData[player.Name]["times_played"])
end

function playerLeft(player)
	-- 데이터 저장
	save(player)

	-- 캐시된 데이터 삭제
	playerData[player.Name] = nil
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
				save(player)
			end
		end
	end
end


-- 데이터 저장소 함수

function get(player)
	-- 여유량이 생길 때까지 대기
	yieldUntilBudget(Enum.DataStoreRequestType.Up)
	
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

task.spawn(autoSave)
Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)