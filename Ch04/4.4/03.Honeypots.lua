--[[
    지침:
    - ServerScriptService에 Script를 만듭니다 
    - ReplicatedStorage에 'AddMoney'라는 RemoteEvent를 만듭니다.
    - 다음의 코드를 넣으세요.

    유의 사항:  허니팟은 악성 사용자를 쫓아내는 데 사용됩니다. 
                클라이언트에서 이러한 RemoteEvent/RemoteFunction을 호출하지 않도록 합니다. 
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function kickPlayer(player)
    player:Kick("Do not exploit in our game!")
end

ReplicatedStorage.AddMoney.OnServerEvent:Connect(kickPlayer)