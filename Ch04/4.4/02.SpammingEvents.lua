--[[
    지침:    
    - StarterPlayerScripts(또는 LocalScripts가 실행되는 다른 위치)에 LocalScript를 만듭니다.
    - LocalScript에 다음 코드를 삽입합니다.
    - Debounces.lua 스크립트도 사용하는 것을 잊지 마세요.
--]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

function setup()
	while true do
		task.wait(1)
		ReplicatedStorage.DebounceTesting:FireServer()
	end
end

setup()