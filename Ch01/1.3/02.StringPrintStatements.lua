print("Hello " .. "Laura")
print("Hello " .. "Laura" .. "!")

print("Hello Peter!\nToday is Monday!")
print("Shopping List:\n\t- Bread,\n\t- Butter,\n\t- Milk.")

print("4" .. 5)
print("4" .. tostring(5))
print("4" + 5)
print(tonumber("4") + 5)
print(tonumber("4" .. tostring(5)))
print(tonumber("a5"))       -- nil을 반환합니다.
print(tonumber("a5") + 6)   -- 오류가 발생합니다.