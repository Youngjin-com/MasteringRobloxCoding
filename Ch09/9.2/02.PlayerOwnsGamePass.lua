--[[
    지침:
    - 새 게임 패스를 만듭니다.
    - ServerScriptService에서 스크립트를 생성하고 아래의 스크립트를 붙여넣습니다.
    - 아래의 스크립트에서 게임 패스 ID를 자신의 게임 패스 ID로 바꿉니다.
--]]

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local MarketplaceService = game:GetService("MarketplaceService")

local tools = ServerStorage.Tools

--

function playerJoined(player)
	if
		MarketplaceService:UserOwnsGamePassAsync(
			-- 사용자 ID
			player.UserId,
			
			-- 게임 패스 ID
			123456789
		)
	then
		tools.GamePassTool:Clone().Parent = player.Backpack
		tools.GamePassTool:Clone().Parent = player.StarterGear
	end
end

--

Players.PlayerAdded:Connect(playerJoined)