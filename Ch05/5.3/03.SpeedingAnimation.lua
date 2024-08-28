--[[
    지침:
    ReplicatedStorage에 Animations 폴더를 만들고 DorkyDance 애니메이션을 포함합니다.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local character = script.Parent
local animations = ReplicatedStorage:WaitForChild("Animations")

--

function playAnimation()
    local humanoid = character:FindFirstChildOfClass("Humanoid")
    if humanoid ~= nil then
        local animator = humanoid:FindFirstChild("Animator")
        local animation = animations:FindFirstChild("DorkyDance")
        if animator ~= nil and animation ~= nil then
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack:Play()
            animationTrack:AdjustSpeed(5)
        end
    end
end

--

task.wait(1)
playAnimation()