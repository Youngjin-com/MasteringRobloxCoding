local Players = game:GetService("Players")

function playerJoined(player)
    local function characterAdded(character)
        -- 새 캐릭터에서 휴머노이드 찾기
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then

            -- 휴머노이드에서 "Jump" 속성 변경 감지
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump == true then
                    -- 점프한 플레이어명 출력
                    print(player.Name .. " jumped!")
                    
                    -- 플레이어 색상 변경
                    changeCharacterColor(character)
                end
            end)
        end
    end
    
    -- 새 캐릭터 감지
    player.CharacterAdded:Connect(characterAdded)
end

function changeCharacterColor(character)
    -- 새 색상 설정
    local newColor = randomColor()
    
    -- 색상 변경
    for _, part in pairs(character:GetChildren()) do
        -- 파트가 "BasePart" 클래스에 속하는지 확인
        if part:IsA("BasePart") then
            part.Color = newColor
        end
    end
end

function randomColor()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return Color3.fromRGB(r, g, b)
end

Players.PlayerAdded:Connect(playerJoined)