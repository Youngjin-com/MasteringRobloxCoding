local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local screenGui = script.Parent
local purchaseButton = screenGui:WaitForChild("PurchaseButton")

function purchaseGamePass()
	MarketplaceService:PromptGamePassPurchase(
		-- 프롬프트 볼 플레이어
		Players.LocalPlayer,

		-- 게임 패스 ID
		123456789
	)
end

purchaseButton.MouseButton1Click:Connect(purchaseGamePass)