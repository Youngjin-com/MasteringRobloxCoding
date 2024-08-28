--[[
	3장 '이벤트 기반 프로그래밍'의 예시 답안입니다. 
	게임의 나머지 부분은 아래에서 확인할 수 있습니다.
	https://www.roblox.com/games/8645775042/Event-Based-Game
	◘◘◘를 클릭하고 'studio에서 편집'을 클릭해 게임을 엽니다. 
--]]

local Players = game:GetService("Players")

local map = workspace.Map


-- 

function setup()
	-- Workspace의 Map 모델에서 모든 파트를 반복
	for _, part in pairs(map:GetChildren()) do
		
		-- part가 파트인지 확인 
		if part:IsA("BasePart") then
			
			-- .Touched 이벤트 감지
			part.Touched:Connect(function(hit)
				
				-- handleHit() 함수 호출
				-- @1 첫 번째 인수는 터치한 부분입니다. 
				-- handleHit() 함수가 색상을 변경하려면 이 파트가 필요합니다.				
				-- @2 두 번째 인수는 파트에 닿은 부분입니다.
				
				handleHit(part, hit)
				
			end)
			
		end
		
	end
	
end

function handleHit(part, hit)
	-- 캐릭터 가져오기
	local character = hit.Parent
	
	-- Player 가져오기
	local player = Players:GetPlayerFromCharacter(character)
	
	-- 플레이어가 nil이 아닌지 확인
	if player ~= nil then
		
		-- 팀 컬러 가져오기
		local teamColor = player.Team.TeamColor
		
		-- 파트 컬러 설정 
		part.BrickColor = teamColor
		
	end
end


--

setup()