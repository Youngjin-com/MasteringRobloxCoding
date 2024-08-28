--[[
    지침:
    - LocalScript를 만들고 다음 코드를 삽입합니다.
    - TextBox를 참조하도록 textbox를 수정합니다.
--]]

local textBox = ...

function textboxChanged()
    print(textBox.Text)
end

textBox.FocusLost:Connect(textboxChanged)