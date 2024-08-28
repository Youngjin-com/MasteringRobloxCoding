--[[
    지침: 
        - 책의 내용을 따라 GUI를 만듭니다.
        - 다음 스크립트를 LocalScript에 삽입합니다.
--]]

local screenGui = script.Parent

local givingFeedback = screenGui:WaitForChild("GivingFeedback")
local feedbackReceived = screenGui:WaitForChild("FeedbackReceived")


--

function setup()
    givingFeedback.Visible = true
    feedbackReceived.Visible = false
end

function submitFeedback()
    -- 사용자 입력
    local textbox = givingFeedback:WaitForChild("TextBox")
    local input = textbox.Text
    
    -- 사용자가 작성한 피드백 확인
    if string.len(input) >= 3 then
        -- 피드백 작성 화면 표시
        givingFeedback.Visible = false
        feedbackReceived.Visible = true
        
        -- 피드백 텍스트 재설정
        textbox.Text = ""
    else
        warn("Cannot submit feedback less than 3 characters!")
    end
end

function submitMoreFeedback()
    givingFeedback.Visible = true
    feedbackReceived.Visible = false
end


--

setup()
givingFeedback:WaitForChild("SubmitFeedback").MouseButton1Click:Connect(submitFeedback)
feedbackReceived:WaitForChild("Back").MouseButton1Click:Connect(submitMoreFeedback)