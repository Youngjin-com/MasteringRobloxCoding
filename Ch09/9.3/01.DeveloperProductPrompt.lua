local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

local screenGui = script.Parent
local purchaseButton = screenGui:WaitForChild("PurchaseButton")

function purchaseProduct()
	MarketplaceService:PromptProductPurchase(
		-- 프롬프트를 볼 플레이어
		Players.LocalPlayer,

		-- 개발자 상품 ID
		123456789
	)
end

purchaseButton.MouseButton1Click:Connect(purchaseProduct)