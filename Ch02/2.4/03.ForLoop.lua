-- (1)
for i = 1, 10 do
    print(i)
end


-- (2)
for numberCounter = 1, 10, 2 do
    print(numberCounter)
end


-- (3)
local messages = {"Hello", "how", "are", "you"}

for i, v in pairs(messages) do
    print(i, v)
end