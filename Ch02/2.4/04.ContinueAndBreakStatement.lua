-- (1)
local students = {
    {name = "William", class = "H1", ["times late"] = 0},
    {name = "Sophie", class = "H1", ["times late"] = 0},
}

function findStudent(studentName)
    -- students를 반복
    for studentId, studentInfo in pairs(students) do
        print("Current Student Id: " .. studentId)
        
        -- 학생 id에 속한 이름을 받아오기
        local currentStudentName = studentInfo["name"]
        
        -- 학생의 이름이 찾는 이름인지 확인
        if currentStudentName == studentName then
            print("Found! Stopping loop")
            break
        else
            print("Someone else, continuing.")
            continue
        end
    end
end

findStudent("William")


-- (2)
local students = {
    {name = "William", class = "H1", times_late = 0},
    {name = "Sophie", class = "H1", times_late = 0},
}

function findStudent(studentName)
    -- students를 반복
    for studentId, studentInfo in pairs(students) do
        print("Current Student Id: " .. studentId)
        
        -- 학생 id에 속한 이름을 받아오기
        local currentStudentName = studentInfo["name"]
        
        -- 학생의 이름이 찾는 이름인지 확인
        if currentStudentName == studentName then
            print("Found! Stopping function")
            return
        else
            print("Someone else, continuing.")
            continue
        end
    end

    -- 학생을 찾지 못함
    warn("Student [" .. studentName .. "] does not exist.")
end

findStudent("William")
findStudent("NotExistingStudent")