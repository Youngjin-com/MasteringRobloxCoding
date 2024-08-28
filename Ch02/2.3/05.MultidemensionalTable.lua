-- (1)
local students = {
   {
      name = "William",
      id = 1,
      class = "H1",
      ["times late"] = 0
   },
   {
      name = "Sophie",
      id = 2,
      class = "H1",
      ["times late"] = 0
   },
}


-- (2)
local students = {
   {
       name = "William",
       class = "H1",
       ["times late"] = 0
   },
   {
       name = "Sophie",
       class = "H1",
       ["times late"] = 0
   },
}

print(students[1]["class"])


-- (3)
local students = {}

function addStudent(studentName, studentClass)
   table.insert(
      students,
      {
         name = studentName,
         class = studentClass,
         ["times late"] = 0
      }
   )
end

addStudent("Nicole", "H1")