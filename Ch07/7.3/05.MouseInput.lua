-- (1)
local UserInputService = game:GetService("UserInputService")

function inputBegan(inputObject, gameProcessedEvent)
	print(inputObject.UserInputType)
end

UserInputService.InputBegan:Connect(inputBegan)


-- (2)
local UserInputService = game:GetService("UserInputService")

function inputChanged(inputObject, gameProcessedEvent)
	print(inputObject.UserInputType)
end

UserInputService.InputChanged:Connect(inputChanged)


-- (3)
local UserInputService = game:GetService("UserInputService")
local ui = script.Parent
local frame = ui:WaitForChild("Frame")

--

function setup()
	-- 마우스 연결 여부 확인
	if UserInputService.MouseEnabled == true then
		
		-- 마우스 입력 제어
		local function listenToMouseInput(inputObject, gameProcessedEvent)
			-- 로블록스에서 해당 이벤트 사용 여부 확인
			if gameProcessedEvent == false then
				if inputObject.UserInputType == Enum.UserInputType.MouseMovement then
					-- 마우스 움직임
					repositionFrame()
				elseif inputObject.UserInputType == Enum.UserInputType.MouseButton1 then
					-- 마우스 왼쪽 버튼 클릭
					changeFrameColor()
				end
			end
		end
		
		-- .InputBegan 이벤트 감지
		UserInputService.InputBegan:Connect(listenToMouseInput)
		
		-- .InputChanged 이벤트 감지
		UserInputService.InputChanged:Connect(listenToMouseInput)
	end
end

function changeFrameColor()
	local r = math.random(0, 255)
	local g = math.random(0, 255)
	local b = math.random(0, 255)
	frame.BackgroundColor3 = Color3.fromRGB(r, g, b)
end

function repositionFrame()
	-- 마우스 위치 감지
	local mouseLocation = UserInputService:GetMouseLocation()
	
	-- 프레임 위치 설정
	frame.Position = UDim2.new(0, mouseLocation.X, 0, mouseLocation.Y)
end

--

setup()