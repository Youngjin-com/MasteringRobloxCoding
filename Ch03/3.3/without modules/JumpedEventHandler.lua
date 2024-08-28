--[[
    지침:
    1) ServerScriptService에 스크립트를 만듭니다.
    2) JumpedEventListener 스크립트의 지침을 따르세요. 
--]]

local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- 새 캐릭터에서 휴머노이드 찾기
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            
            -- 총 점프 수 변수 선언
            local totalJumps = 0
            
            -- 커스텀 이벤트 생성
            local jumped, timesJumped = createCustomEvents(humanoid)
            
            -- 휴머노이드에서 .Jumped 이벤트 감지
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- 전체 점프 수 증가
                    totalJumps += 1
                    
                    -- 커스텀 이벤트 실행
                    jumped:Fire()
                end
            end)
            
            timesJumped.OnInvoke = function()
                -- 전체 점프 수 반환
                return totalJumps
            end
        end
    end

    -- 새 캐릭터 감지
    player.CharacterAdded:Connect(characterAdded)
end

function createCustomEvents(humanoid) 
    local jumped = Instance.new("BindableEvent")
    jumped.Name = "Jumped"
    jumped.Parent = humanoid
    
    local timesJumped = Instance.new("BindableFunction")
    timesJumped.Name = "TimesJumped"
    timesJumped.Parent = humanoid
    
    -- 이벤트 반환
    return jumped, timesJumped
end

Players.PlayerAdded:Connect(playerJoined)