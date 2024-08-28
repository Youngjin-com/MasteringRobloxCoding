-- (1)
local students = {"William", "Sophie"}
table.insert(students, "Robert")


-- (2)
local students = {"William", "Sophie", "Robbert"}
students[3] = "Robert"


-- (3)
local students = {"William", "Sophie", "Robert"}

function setup()
    customTableInsert(students, "Emily")
    print(unpack(students))
end

function customTableInsert(table, newData)
    -- 인덱스 정보 얻기
    local currentIndex = #table
    local newIndex = currentIndex + 1
    
    -- 세 데이터 입력하기
    table[newIndex] = newData
end

setup()


-- (4)
local students = {"William", "Sophie", "Robert"}
table.remove(students, 3)