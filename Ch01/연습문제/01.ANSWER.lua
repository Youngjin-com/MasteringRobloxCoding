-- 2
local baseplate = workspace.Baseplate

-- 3
print(baseplate.Name)

-- 4
baseplate.Name = "Cool Part"

-- 5&6
print("The name of the baseplate is: '" .. baseplate.Name .. "'")

-- 7
baseplate.CanCollide = false

-- 8
baseplate.Color = Color3.fromRGB(51, 88, 130)

-- 9
local terrain = workspace.Terrain

-- 10
baseplate.Parent = terrain