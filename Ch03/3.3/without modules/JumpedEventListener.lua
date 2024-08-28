--[[
    지침:
    1) ServerScriptService에 스크립트를 만듭니다. 
    2) JumpedEventHandler 스크립트의 지침을 따르세요. 
--]]

local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- 새 캐릭터에서 휴머노이드 찾기
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then

            -- 커스텀 이벤트 대기
            local jumped = humanoid:WaitForChild("Jumped")
            local timesJumped = humanoid:WaitForChild("TimesJumped")

            -- 커스텀 이벤트 감지
            jumped.Event:Connect(function()
                -- 점프한 플레이어명 출력
                print(player.Name .. " jumped " .. timesJumped:Invoke() .. " time(s)")
                
                -- 비율 계산
                local headScale = math.floor(timesJumped:Invoke() / 5) + 1
                
                -- 비율 값 획득
                local scaleValue = humanoid:FindFirstChild("HeadScale")
                if scaleValue then
                    scaleValue.Value = headScale
                end
            end)

        end
    end

    -- 새 캐릭터 감지
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)