-- (1)
local Players = game:GetService("Players")

function findPlayer(username)
    local player = Players:FindFirstChild(username)
    if player ~= nil then
        print(player.Name .. " found!")
    else
        print(username .. " is not in-game.")
    end
end

task.wait(1)
findPlayer("YourUsername")


-- (2)
local Players = game:GetService("Players")

function findPlayer()
	local player = Players:FindFirstChildOfClass("Player")
	if player ~= nil then
		print(player.Name .. " found!")
	end
end

task.wait(1)
findPlayer()


-- (3)
local Players = game:GetService("Players")

function printPlayers()
	-- 게임을 플레이하는 모든 플레이어 정보를 테이블로 받음
	local players = Players:GetPlayers()

	-- 모든 플레이어 출력
	print("Current players in our game:")
	for _, player in pairs(players) do
		print("- " .. player.Name)
	end
end

task.wait(1)
printPlayers()