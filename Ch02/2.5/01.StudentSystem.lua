--[[
    지침: 
    - 'StudentSystem'이라는 ModuleScript를 만듭니다.
    - ModuleScript를 'ServerStorage'로 옮깁니다.
    - '2.5.2.RequiringAModule.lua' 파일의 지침을 따르세요
--]]

local StudentSystem = {}

local students = {
    {
        name = "William",
        class = "H1",
        ["times_late"] = 0,
        grades = {}
    },
    {
        name = "Sophie",
        class = "H1",
        ["times late"] = 0,
        grades = {}
    },
}

function StudentSystem:GetStudentInfo(studentName)
    -- students를 반복
    for _, studentInfo in ipairs(students) do
        -- 학생 id에 속한 이름을 받아오기
        local currentStudentName = studentInfo["name"]

        -- 학생의 이름이 찾는 이름인지 확인
        if currentStudentName == studentName then
            return studentInfo
        end
    end

    -- 학생을 찾지 못함
    warn("Student [" .. studentName .. "] does not exist.")
end

return StudentSystem