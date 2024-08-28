-- (1)
local UserInputService = game:GetService("UserInputService")

function inputBegan(inputObject, gameProcessedEvent)
	print(gameProcessedEvent, inputObject.KeyCode)
end

UserInputService.InputBegan:Connect(inputBegan)


-- (2)
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

--

function setup()
	-- 키보드 사용 가능 여부 확인
	if UserInputService.KeyboardEnabled == true then
		-- .InputBegan 이벤트 감지
		UserInputService.InputBegan:Connect(inputBegan)
	end
end

function inputBegan(inputObject, gameProcessedEvent)
	-- 로블록스에서 해당 이벤트 사용 여부 확인
	if gameProcessedEvent == false then
		-- B 키 입력 확인
		if inputObject.KeyCode == Enum.KeyCode.B then
			-- 클라이언트 측에서 폭발 생성
			local explosion = Instance.new("Explosion")
			explosion.Parent = player.Character.PrimaryPart
			explosion.Position = explosion.Parent.Position
		end
	end
end

--

setup()