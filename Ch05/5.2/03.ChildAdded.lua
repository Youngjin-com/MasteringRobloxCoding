--[[
    설명:
    먼저 그리드를 만들어야 합니다. 
    그리드를 만드는 코드는 5.2.2.2.CreatingGrid.lua에서 찾을 수 있습니다.
--]]

local coloredParts = workspace:WaitForChild("ColoredParts")

function randomRGB()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return Color3.fromRGB(r, g, b)
end

coloredParts.ChildAdded:Connect(function(addedInstance)
    if addedInstance:IsA("BasePart") then
        addedInstance.Color = randomRGB()
        print("New instance colored!")
    end
end)