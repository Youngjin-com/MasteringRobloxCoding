local outsideScopeData = "this is accessible everywhere"
local dataSetInScope

do
    -- 새롭게 생성된 범위, 범위A
    print(outsideScopeData)

    -- 범위A에서 데이터를 설정
    dataSetInScope = "This data is accessible in this scope."

    -- 범위A에서 데이터 출력
    print(dataSetInScope)
end

-- 범위A 밖에서 데이터 출력
print(outsideScopeData)
print(dataSetInScope)