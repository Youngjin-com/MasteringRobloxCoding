local furnace = workspace:WaitForChild("KitchenFurnace")

local clickDetector = furnace:WaitForChild("ClickDetector")
local fire = furnace:WaitForChild("Fire")

function clicked()
    fire.Enabled = not fire.Enabled
end

clickDetector.MouseClick:Connect(clicked)