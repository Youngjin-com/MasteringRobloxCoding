local Players = game:GetService("Players")
local DataStoreService = game:GetService("DataStoreService")
local BackpackDataStore = DataStoreService:GetDataStore("BackpackData")


-- 플레이어  함수

function playerJoined(player)
	-- 다시 플레이할 때 툴 정보 호출
	initializeUnequipTools(player)
	
	-- 툴 정보 가져오기
	local tools = nil
	
	local suc, err = pcall(function()
		tools = BackpackDataStore:GetAsync("Plr_" .. player.UserId)
	end)
	if not suc then
		-- 에러 출력
		warn(err)
	else
		-- 기본 툴 정보
		if tools == nil then
			tools = {"StarterTool"}
		end
		
		-- 툴 정보 출력
		print("Player Tools:")
		if #tools > 0 then
			for _, toolName in pairs(tools) do
				print("\t-" .. toolName)
			end
		else
			print("\t- No Tools")
		end
		
		--[[
			Note:
			이 시스템을 직접 테스트하는 경우, 클라이언트가 아닌 서버에서 도구를 만들어야 합니다.
			Filtering Enabled 때문에 클라이언트에서 만든 도구는 이 스크립트에서 볼 수 없습니다. 
		--]]
	end
end

function playerLeft(player)
	-- 툴 정보 호출
	local tools = getTools(player)
	
	-- 툴 정보 저장
	local suc, err = pcall(function()
		BackpackDataStore:SetAsync(
			"Plr_" .. player.UserId,
			tools
		)
	end)
	if not suc then
		-- 에러 출력
		warn(err)
	end
end


-- 툴 함수

function initializeUnequipTools(player)
	player.CharacterRemoving:Connect(function(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid ~= nil then
			humanoid:UnequipTools()
		end
	end)
end

function getTools(player)
	-- 툴 저장 변수
	local tools = {}
	
	for _, tool in pairs(player.Backpack:GetChildren()) do
		if tool.ClassName == "Tool" then
			table.insert(tools, tool.Name)
		end
	end
	
	-- 툴 반환
	return tools
end


--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)