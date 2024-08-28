--[[
    지침:
    - StarterGui에 ScreenGui를 만듭니다.
    - ScreenGui에 'ControlsText'라는 TextButton을 만듭니다.
    - ScreenGui에서 LocalScript를 생성하고 다음 코드를 삽입합니다.
--]]

local UserInputService = game:GetService("UserInputService")

local ui = script.Parent
local controlsText = ui:WaitForChild("ControlsText")

local previousInputType = nil

function updateControls(lastInputType)
    -- 변경 사항을 확인할 것
    -- 약간의 최적화로 엄청난 효과를 볼 수 있음
    if previousInputType == lastInputType then
        return
    end

    -- 컨트롤 변경
    if lastInputType == Enum.UserInputType.Gamepad1 then
        -- 플레이어가 게임패드를 사용 중
        previousInputType = lastInputType
        controlsText.Text = "Press [X] to confirm"
        
    elseif lastInputType == Enum.UserInputType.Touch then
        -- 플레이어가 터치스크린, 스마트폰, 태블릿을 사용 중
        previousInputType = lastInputType
        controlsText.Text = "Click here to confirm"
        
    elseif lastInputType == Enum.UserInputType.Keyboard then
        -- 플레이어가 키보드를 사용 중
        previousInputType = lastInputType
        controlsText.Text = "Press Enter to confirm"
        
    end
end

UserInputService.LastInputTypeChanged:Connect(updateControls)