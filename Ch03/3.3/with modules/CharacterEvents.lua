--[[
    지침:
    1) ServerStorage에 ModuleScript를 만듭니다. 
    2) ModuleScript의 이름을 'CharacterEvents'로 지정합니다. 
    3) JumpedEventListener.lua 스크립트의 지침을 따르세요. 
--]]

local CharacterEvents = {}

function CharacterEvents.Jumped(player)
    -- 이벤트 생성
    local jumped = Instance.new("BindableEvent")
    
    -- 캐릭터 추가 이벤트
    local function characterAdded(character)
        -- 새 캐릭터에서 휴머노이드 찾기
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then

            -- 휴머노이드에서 .Jumped 이벤트 감지
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- 커스텀 이벤트 실행
                    jumped:Fire()
                end
            end)            
        end
    end

    -- 새 캐릭터 감지
    player.CharacterAdded:Connect(characterAdded)
    
    -- 리스너 반환
    return jumped.Event
end

return CharacterEvents