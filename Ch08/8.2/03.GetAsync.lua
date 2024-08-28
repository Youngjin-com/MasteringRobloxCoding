local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local DataStoreTesting = DataStoreService:GetDataStore("LastPlayed")

--

function playerJoined(player)
	-- 데이터 저장소에서 데이터 호출
	local currentPlayingSecond = os.time()
	local lastPlayingSecond = nil
	
	local suc, err = pcall(function()
		lastPlayingSecond = DataStoreTesting:GetAsync(
			-- 키
			"Plr_" .. player.UserId
		)
	end)
	if not suc then
		warn(err)
	else
		-- 데이터 사용
		print("It has been [" .. currentPlayingSecond - 
			lastPlayingSecond .. "] seconds since you last played!")
	end	
end

--

Players.PlayerAdded:Connect(playerJoined)