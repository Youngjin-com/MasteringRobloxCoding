-- (1)
local Players = game:GetService("Players")
function playerJoined(player)
	print(player.Name .. " joined the game!")
end
Players.PlayerAdded:Connect(playerJoined)


-- (2)
local Players = game:GetService("Players")
function playerJoined(player)
	print(player.Character)
end
Players.PlayerAdded:Connect(playerJoined)


-- (3)
local Players = game:GetService("Players")

function playerJoined(player)
	local function characterAdded(character)
		print(character.Name)
	end

	player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)


-- (4)
local Players = game:GetService("Players")

function playerJoined(player)
	local function characterAdded(character)
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if humanoid ~= nil then
			print("Humanoid found!")
		end
	end

	player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)