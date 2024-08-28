local ServerStorage = game:GetService("ServerStorage")

local toolsStorage = ServerStorage.Tools

local flashlightGiver = workspace.FlashlightGiver
local proximityPrompt = flashlightGiver.GiveTool

--

function proximityPromptTriggered(player)
	--이미 해당 툴이 있는지 확인
	if not playerHasTool(player, "Flashlight") then
		-- ServerStorage > Tools에 손전등이 있는지 확인
		local flashlight = toolsStorage:FindFirstChild("Flashlight")
		if flashlight ~= nil then
			-- 손전등 복사
			local toolClone = flashlight:Clone()
			
			-- Backpack 자녀로 넣기
			toolClone.Parent = player.Backpack
		else
			warn("Flashlight tool missing!")
		end
	end
end

function playerHasTool(player, toolName)
	local character = player.Character
	local backpack = player.Backpack
	--
	local characterTool = character:FindFirstChildOfClass("Tool")
	if 
		backpack:FindFirstChild(toolName)
		or
		( characterTool ~= nil and characterTool.Name == toolName )		
	then
		-- 이미 도구가 있음
		return true
	end
	-- 도구가 없음
	return false
end

--

proximityPrompt.Triggered:Connect(proximityPromptTriggered)