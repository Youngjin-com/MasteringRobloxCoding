--[[
    설명:
    - Workspace에 'PartA'와 'PartB'라는 두 개의 파트를 만들고 멀리 떨어진 곳에 배치합니다. 
    - StreamingEnabled를 활성화합니다.
    - ServerScriptService에 Script를 만듭니다. 
    - 다음의 코드를 스크립트에 넣으세요. 
--]]

local Players = game:GetService("Players")

local partA = workspace.PartA
local partB = workspace.PartB

local DEBOUNCE_DURATION = 5

local debounceValues = {}


-- 순간이동 관련 함수

function teleportPlayer(player, position)
	if playerHasDebounce(player) == false then
		-- 공간 미리 로드
		player:RequestStreamAroundAsync(position)
		
		-- 플레이어 순간이동
		player.Character:SetPrimaryPartCFrame(CFrame.new(position + Vector3.new(0, 5, 0)))
	end
end

--

function teleportA(hit)
	local player = wasHit(hit)
	if player then
		teleportPlayer(player, partA.Position)
	end
end

function teleportB(hit)
	local player = wasHit(hit)
	if player then
		teleportPlayer(player, partB.Position)
	end
end

--

function wasHit(hit)
	-- 캐릭터 확인
	local character = hit.Parent
	if character ~= nil then
		-- 플레이어 확인
		local player = Players:GetPlayerFromCharacter(character)
		if player ~= nil then
			return player
		end
	end
	return false
end


-- 디바운스

function playerJoined(player)
	debounceValues[player.Name] = 0
end

function playerLeft(player)
	debounceValues[player.Name] = nil
end

function playerHasDebounce(player)
	if(debounceValues[player.Name] + DEBOUNCE_DURATION) < os.time() then
		debounceValues[player.Name] = os.time()
		return false
	end
	return true
end

--

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
partA.Touched:Connect(teleportB)
partB.Touched:Connect(teleportA)