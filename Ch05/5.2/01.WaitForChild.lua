-- (1)
local spawnLocation = workspace:WaitForChild("SpawnLocation")
print(tostring(spawnLocation))


-- (2)
local spawnLocation = workspace:WaitForChild("SomethingThatDoesNotExist", 5)
if spawnLocation ~= nil then
    print("Found!")
else
    print("Couldn't find!")
end