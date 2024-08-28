--[[
    지침:
    Roblox Studio의 명령줄에서 이 코드를 실행합니다.
    이 코드는 .ChildAdded 이벤트에 대한 설명의 일부입니다.
--]]

local BLOCK_SIZE = 25
local AMOUNT_OF_BLOCKS = 50

local folder = Instance.new("Folder")
folder.Name = "ColoredParts"
folder.Parent = workspace

for x = 1, AMOUNT_OF_BLOCKS do
    for y = 1, AMOUNT_OF_BLOCKS do
        local part = Instance.new("Part")
        part.Parent = folder

        part.Name = x .. ", " .. y
        part.Anchored = true
        part.Size = Vector3.new(BLOCK_SIZE, .25, BLOCK_SIZE)

        local positionToCenter = ( (BLOCK_SIZE * AMOUNT_OF_BLOCKS ) / 2 )
        part.Position = Vector3.new(x * BLOCK_SIZE - positionToCenter, 1, y * BLOCK_SIZE - positionToCenter)
    end
    task.wait()
end
print("Command completed!")