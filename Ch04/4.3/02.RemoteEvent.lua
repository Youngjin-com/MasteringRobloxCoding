-- (1)
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function switchTeam(player, teamName)
    -- 팀 정보 받아오기
    local team = Teams:FindFirstChild(teamName)

    -- 팀이 있는지 확인
    if team ~= nil then
        player.Team = team
    else
        warn("Team [" .. teamName .. "] does not exist!")
    end
end

ReplicatedStorage.ChangeTeam.OnServerEvent:Connect(switchTeam)


-- (2)
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local blueTeamButton = script.Parent.MainFrame.BlueTeam
local redTeamButton = script.Parent.MainFrame.RedTeam

function switchBlueTeam()
    ReplicatedStorage.ChangeTeam:FireServer("Blue")
end

function switchRedTeam()
    ReplicatedStorage.ChangeTeam:FireServer("Red")
end

blueTeamButton.MouseButton1Click:Connect(switchBlueTeam)
redTeamButton.MouseButton1Click:Connect(switchRedTeam)