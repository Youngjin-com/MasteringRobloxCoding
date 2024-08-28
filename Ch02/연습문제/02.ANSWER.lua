--[[
    원본 코드 스니펫:
    local spawnLocation = workspace.SpawnLocation

    while true do
        spawnLocation.Orientation += Vector3.new(0, 1, 0)
        task.wait()
    end
--]]

local spawnLocation = workspace.SpawnLocation

repeat
	spawnLocation.Orientation += Vector3.new(0, 1, 0)
	task.wait()
until false