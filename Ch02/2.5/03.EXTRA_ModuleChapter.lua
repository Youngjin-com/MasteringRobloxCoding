--[[
    모듈 스크립트를 사용한 프로그래밍을 위한 추가 연습입니다.
    책에 표시된 대로 ServerStorage에 'StudentSystem' 모듈이 있는지 확인합니다.
--]]

local ServerStorage = game:GetService("ServerStorage")
local StudentSystem = require(ServerStorage.StudentSystem)

local MINIMUM_GRADE = 1
local MAXIMUM_GRADE = 10


-- setup 함수

function setup()
	print(calculateAverage("William"))
	addGrade("William", 5)
	print(calculateAverage("William"))
	addGrade("William", 10)
	print(calculateAverage("William"))
end


-- 메인 함수

function addGrade(studentName, grade)
	-- 성적 가져오기
	local grades = getGrades(studentName)
	
	-- 성적이 nil이 아닌지 확인
	if grades ~= nil then
		
		-- 입력된 성적이 올바른지 확인
		if isCorrectGrade(grade) then
			-- 성적 추가
			table.insert(grades, grade)
		end
		
	end
end

function calculateAverage(studentName)
	-- 성적 가져오기
	local grades = getGrades(studentName)

	-- 성적이 nil이 아닌지 확인
	if grades ~= nil and #grades > 0 then
		
		-- 평균을 계산하기 위한 변수 
		local gradesSum = 0
		local totalGrades = #grades
		
		-- 학생의 성적 합계 계산
		for _, grade in pairs(grades) do
			gradesSum += grade
		end
		
		-- 평균 계산
		return gradesSum / totalGrades
		
	end
	
	return 0
end


-- 보조 함수

function isCorrectGrade(grade)
	-- 성적이 숫자인지 확인
	if typeof(grade) == "number" then
		-- 성적이 허용되는 숫자인지 확인
		if grade >= MINIMUM_GRADE and grade <= MAXIMUM_GRADE then
			-- 성적 추가 가능
			return true
		end
	end
	
	-- 성적이 잘못된 숫자인 경우
	return false
end

function getGrades(studentName)
	-- 학생 정보 가져오기
	local studentInfo = StudentSystem.getStudentInfo(studentName)
	
	-- 학생 정보가 nil이 아닌지 확인
	if studentInfo ~= nil then
		-- 성적 반환
		return studentInfo.grades
	end
end

--

setup()