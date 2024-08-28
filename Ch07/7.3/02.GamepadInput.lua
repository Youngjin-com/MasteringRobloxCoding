local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--

function setup()
	if
		-- 키보드 사용 가능 여부 확인
		UserInputService.KeyboardEnabled == true
		-- 게임패드 사용 가능 여부 확인
		or UserInputService.GamepadEnabled == true
	then
		-- .InputBegan 이벤트 감지
		UserInputService.InputBegan:Connect(inputBegan)
	end
end

function inputBegan(inputObject, gameProcessedEvent)
	-- 로블록스에서 해당 이벤트 사용 여부 확인
	if gameProcessedEvent == false then
		if
            -- B 키 입력 확인(키보드)
            inputObject.KeyCode == Enum.KeyCode.B
            -- X 버튼 입력 확인(게임패드)
            or inputObject.KeyCode == Enum.KeyCode.ButtonX
        then
			-- 클라이언트 측에서 폭발 생성
			local explosion = Instance.new("Explosion")
			explosion.Parent = player.Character.PrimaryPart
			explosion.Position = explosion.Parent.Position
		end
	end
end

--

setup()