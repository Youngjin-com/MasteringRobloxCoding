--[[
    지침:
    - ServerScriptService에 Script를 만듭니다. 
    - Script에 다음의 코드를 넣으세요. 
    - ReplicatedStorage에 'DebounceTesting'라는 RemoteEvent를 만듭니다. 
    -- 디바운스를 테스트하기 위해 SpammingEvents.lua 스크립트도 사용하는 것을 잊지 마세요.
--]]

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local DEBOUNCE_DURATION = 5

local debounceValues = {}

function playerJoined(player)
	debounceValues[player.Name] = 0
end

function playerLeft(player)
	debounceValues[player.Name] = nil
end

function debounceFunction(player)
	if(debounceValues[player.Name] + DEBOUNCE_DURATION) < os.time() then
		debounceValues[player.Name] = os.time()
		print("Allowed")
	end
end

Players.PlayerAdded:Connect(playerJoined)
Players.PlayerRemoving:Connect(playerLeft)
ReplicatedStorage.DebounceTesting.OnServerEvent:Connect(debounceFunction)