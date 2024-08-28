-- 일반적인 변수
local variableA = 5
local variableB = variableA
variableB += 1
print(variableA) --> 그대로 5
print(variableB) --> 5 + 1 = 6

-- 테이블
local tableA = {5}
local tableB = tableA
tableB[1] += 1
print(tableA[1]) --> 6
print(tableB[1]) --> 6