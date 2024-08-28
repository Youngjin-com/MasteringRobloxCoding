--[[
    지침:
    1) ServerScriptService에 스크립트를 만듭니다. 
    2) CharacterEvents.lua의 지침을 따르세요.
--]]

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local CharacterEvents = require(ServerStorage.CharacterEvents)

function playerJoined(player)
    -- Jumped 이벤트 감지
    CharacterEvents.Jumped(player):Connect(function()
        print(player.Name .. " jumped!")
    end)
end

Players.PlayerAdded:Connect(playerJoined)