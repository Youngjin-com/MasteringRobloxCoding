-- (1)

--[[
    지침:
    ReplicatedStorage에 Animations 폴더를 만들고 대기 및 손 흔들기 애니메이션을 포함합니다.  
    Build Rig plugin으로 Dummy NPC도 넣어야 합니다. 
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local animations = ReplicatedStorage:WaitForChild("Animations")

local npc = workspace:WaitForChild("Dummy")

--

function setup()
    playAnimation(npc, "IdleAnimation", true, Enum.AnimationPriority.Idle)
    task.wait(10)
    playAnimation(npc, "WaveAnimation", false, Enum.AnimationPriority.Action)
end

function playAnimation(character, animationName, looped, animationPriority)
    -- 휴머노이드와 애니메이션 받아오기
    local humanoid = npc:WaitForChild("Humanoid", 5)
    local animation = animations:FindFirstChild(animationName)
    if humanoid ~= nil and animation ~= nil then
        -- 애니메이터 호출
        local animator = humanoid:WaitForChild("Animator", 5)
        if animator ~= nil then
            -- 애니메이션 재생
            local animationTrack = animator:LoadAnimation(animation)
            animationTrack.Looped = looped
            animationTrack.Priority = animationPriority
            animationTrack:Play()
        end
    end
end

--

setup()


-- (2)
local npc = workspace:WaitForChild("Dummy")

function stopAllAnimations()
    -- 휴머노이드 찾기
    local humanoid = npc:WaitForChild("Humanoid", 5)
    if humanoid ~= nil then
        -- 애니메이터 찾기
        local animator = humanoid:WaitForChild("Animator", 5)
        if animator ~= nil then
            -- 애니메이션 재생
            local animationTracks = animator:GetPlayingAnimationTracks()

            -- 애니메이션 트랙 반복
            for _, animationTrack in pairs(animationTracks)
            do
                animationTrack:Stop()
            end
        end
    end
end

stopAllAnimations()