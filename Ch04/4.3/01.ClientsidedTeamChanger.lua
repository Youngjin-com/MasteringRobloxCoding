local Players = game:GetService("Players")
local player = Players.LocalPlayer
local Teams = game:GetService("Teams")

local blueTeamButton = script.Parent.MainFrame.BlueTeam
local redTeamButton = script.Parent.MainFrame.RedTeam

function switchTeam(teamName)
    -- 팀 정보 받아오기
    local team = Teams:FindFirstChild(teamName)
    -- 팀이 있는지 확인
    if team ~= nil then
        player.Team = team
    else
        warn("Team [" .. teamName .. "] does not exist!")
    end
end

function swichBlueTeam()
    switchTeam("Blue")
end

function switchRedTeam()
    switchTeam("Red")
end

blueTeamButton.MouseButton1Click:Connect(swichBlueTeam)
redTeamButton.MouseButton1Click:Connect(switchRedTeam)