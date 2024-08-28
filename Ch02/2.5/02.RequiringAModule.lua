--[[
    지침: 
    - 'ServerScriptService'에 Script를 만듭니다.
    - '2.5.1.StudentSystem.lua' 파일의 지침을 따릅니다
--]]

local ServerStorage = game:GetService("ServerStorage")
local StudentSystem = require(ServerStorage.StudentSystem)

print(StudentSystem:GetStudentInfo("William"))