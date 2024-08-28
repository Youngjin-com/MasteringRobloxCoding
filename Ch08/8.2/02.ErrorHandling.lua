local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local DataStoreTesting = DataStoreService:GetDataStore("LastPlayed")

--

function playerLeft(player)	
	-- 플레이어가 나간 시간 저장
	-- 다시 플레이할 때 얼마만에 돌아왔는지 계산하는 데 사용
	local suc, err = pcall(function()
		DataStoreTesting:SetAsync(
			-- 키
			"Plr_" .. player.UserId,
			
			-- 데이터
			os.time()
		)
	end)
	if not suc then
		warn(err)
	end
	
end

--

Players.PlayerRemoving:Connect(playerLeft)