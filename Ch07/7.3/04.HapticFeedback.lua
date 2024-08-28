-- (1)
local HapticService = game:GetService("HapticService")

HapticService:SetMotor(
    -- UserInputType
    Enum.UserInputType.Gamepad1,

    -- Vibration Motor Enum
    Enum.VibrationMotor.Large,
    --Enum.VibrationMotor.Small
    --Enum.VibrationMotor.LeftHand
    --Enum.VibrationMotor.RightHand
    --Enum.VibrationMotor.LeftTrigger
    --Enum.VibrationMotor.RightTrigger
    
    -- Intensity (0-1)
    0.5
)

-- (2)
local HapticService = game:GetService("HapticService")

function giveHapticFeedback(inputType, vibrationMotor, duration, ...)
    if 
        -- 진동 지원 여부 확인
        HapticService:IsVibrationSupported(inputType) == true
        -- 모터 지원 확인
        and HapticService:IsMotorSupported(inputType, vibrationMotor) == true
    then
        -- 게임패드 모터 설정
        HapticService:SetMotor(inputType, vibrationMotor, ...)
        
        -- 대기
        if duration > 0 then
            task.wait(duration)
            HapticService:SetMotor(inputType, vibrationMotor, 0)
        end
    end
end

giveHapticFeedback(
    Enum.UserInputType.Gamepad1, -- inputType
    Enum.VibrationMotor.Large,  -- vibrationMotor
    .5, -- duration
    .5 -- intensity
)


-- (3)
function printEverything(...)
	local arg = {...}
	for _, data in pairs(arg) do
		print(tostring(data))
	end
end

printEverything("Hey!")
printEverything("Hey, ", "how are ", "you?")
printEverything("Numbers", 124)
printEverything({"table data"})