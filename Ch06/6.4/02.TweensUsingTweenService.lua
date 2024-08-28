--[[
    지침:
    - StarterGui에 ScreenGui를 만듭니다.
    - ScreenGui에 'SomeFrame'이라는 Frame을 만듭니다.
    - ScreenGui에 LocalScript를 생성하고 다음 코드를 삽입합니다.
--]]


-- (1)
local TweenService = game:GetService("TweenService")

local ui = script.Parent
local frame = ui:WaitForChild("SomeFrame")

function openMenu()
	-- 화면 밖 프레임 설정
	frame.Position = UDim2.new(0.5, 0, 1.5, 0)

	-- 프레임 표시
	frame.Visible = true
	
	-- TweenInfo 설정
	local tweenInfo = TweenInfo.new(
		1,	-- 트윈 길이
		Enum.EasingStyle.Quad,		-- 트윈 스타일(EasingStyle)
		Enum.EasingDirection.Out,	-- EasingStyle 방향
		0,		-- 트윈 반복 횟수
		false,	-- 트윈 반전
		0		-- 트윈 시작 전 대기 시간
	)
	
	local tween = TweenService:Create(frame, tweenInfo, {Position = UDim2.new(0.5, 0, 0.5, 0)})
	tween:Play()
end

openMenu()


-- (2)
local ui = script.Parent
local frame = ui:WaitForChild("SomeFrame")

--

function openMenu()
    -- 화면 밖 프레임 설정
    frame.Position = UDim2.new(0.5, 0, 1.5, 0)
    
    -- 프레임 표시
    frame.Visible = true
    
    -- 프레임을 화면 안으로 이동
    frame:TweenPosition(
        -- (필수) 이동할 위치
        UDim2.new(0.5, 0, 0.5, 0),
        
        -- (선택사항) EasingStyle 방향
        Enum.EasingDirection.Out,
        
        -- (선택사항) 트윈 스타일 (EasingStyle)
        Enum.EasingStyle.Quad,
        
        -- (선택사항) 트윈 길이
        1,
        
        -- (선택사항) true로 설정 시 트윈이 프레임에서 바로 작동
        false,
        
        -- (선택사항) :TweenPosition 완료 후 작동할 함수
        function()
            print("Tween has finished!")
        end
    )
end

--

openMenu()