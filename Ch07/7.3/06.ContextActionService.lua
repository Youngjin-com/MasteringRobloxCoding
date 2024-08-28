local Players = game:GetService("Players")
local ContextActionService = game:GetService("ContextActionService")

local ACTION_NAME = "ToggleShop"

local ui = script.Parent
local shopFrame = ui:WaitForChild("ShopFrame")

local character = Players.LocalPlayer.Character
local humanoid = character:WaitForChild("Humanoid")

--

function setup()
	-- shopFrame 보이지 않게 설정
	shopFrame.Visible = false
	
	-- FloorMaterial 속성 변경 감지
	humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
		-- 플레이어의 위치가 Foil 위인지 확인
		-- 플레이어가 특정 위치에 있는지 파악하는 데 사용
		if humanoid.FloorMaterial == Enum.Material.Foil then
			beginAction()
		else
			endAction()
		end
	end)
end

function beginAction()
	-- ContextAction 시작
	ContextActionService:BindAction(ACTION_NAME, toggleShop, 
		true, Enum.KeyCode.E, Enum.KeyCode.ButtonX)
	
	-- 모바일 버튼 변경
	ContextActionService:SetTitle(ACTION_NAME, "Shop")
	ContextActionService:SetPosition(ACTION_NAME, UDim2.new(1, -150, 1, -77))
end

function endAction()
	-- ContextAction 중단
	ContextActionService:UnbindAction(ACTION_NAME)
	
	-- 상점 종료(열려 있는 경우)
	closeShop()
end

--

function toggleShop(actionName, inputState, inputObject)
	-- 액션이 Begin인지 확인
	if inputState == Enum.UserInputState.Begin then
		-- 프레임 토글
		shopFrame.Visible = not shopFrame.Visible
	end
end

function closeShop()
	-- 상점이 열려 있는지 확인
	if shopFrame.Visible == true then
		-- 상점 종료
		toggleShop(ACTION_NAME, Enum.UserInputState.Begin)
	end
end

--

setup()