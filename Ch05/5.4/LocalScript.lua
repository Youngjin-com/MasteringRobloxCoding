--[[
    지침:
    StarterPlayerScripts에 LocalScript를 만들고 다음 코드를 넣습니다.
    '트윈 데이터 가져오기'에서 수집한 데이터로 GATE_DATA를 변경합니다. 
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local events = ReplicatedStorage:WaitForChild("Events")

local INTERMISSION_TIME = 5
local TWEEN_DURATION = 2

local GATE_DATA = {
	["Open"] = {
		["LeftGatePart"] = {
			["Orientation"] = Vector3.new(-90, 90, 0),
			["Position"] = Vector3.new(-40, 15, 83)
		},
		["RightGatePart"] = {
			["Orientation"] = Vector3.new(-90, -90, 0),
			["Position"] = Vector3.new(-74, 15, 83)
		}
	},
	["Closed"]= {
		["LeftGatePart"] = {
			["Orientation"] = Vector3.new(-90, 0, 0),
			["Position"] = Vector3.new(-50, 15, 75)
		},
		["RightGatePart"] = {
			["Orientation"] = Vector3.new(-90, 0, 0),
			["Position"] = Vector3.new(-67, 15, 75)
		}
	}
}

local debounce = false

--

function toggleGate()
	if debounce == false then
		debounce = true

		-- Gate 파트 불러오기
		local leftGatePart = workspace:WaitForChild("LeftGatePart", 5)
		local rightGatePart = workspace:WaitForChild("RightGatePart", 5)
		if leftGatePart ~= nil and rightGatePart ~= nil then
			-- 문 열기
			animateGate(leftGatePart, "Open", false)
			animateGate(rightGatePart, "Open", true)

			-- 대기
			task.wait(INTERMISSION_TIME)

			-- 문 닫기
			animateGate(leftGatePart, "Closed", false)
			animateGate(rightGatePart, "Closed", true)
		end

		-- 클라이언트 측 디바운스 종료
		debounce = false
	end
end

function animateGate(gate, doorStatus, yield)
	-- 트윈 데이터 읽기
	local tweenData = GATE_DATA[doorStatus][gate.Name]
	
	-- 트윈 재생
	local tween = TweenService:Create(gate, TweenInfo.new(TWEEN_DURATION), tweenData)
	tween:Play()
	
	-- 커스텀 양도
	if yield == true then
		tween.Completed:Wait()
	end
end

--

events:WaitForChild("ToggleGate").OnClientEvent:Connect(toggleGate)