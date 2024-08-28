-- (1)
local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

function switchTeam(player, teamName)
    -- 팀 정보 받아오기
    local team = Teams:FindFirstChild(teamName)

    -- 팀이 있는지 확인
    if team ~= nil then
        if player.Team ~= team then
            -- 플레이어를 팀에 배치
            player.Team = team

            -- 성공 반환
            return true
        else
            return "You are already on this team!"
        end
    else
        return "Team does not exist!"
    end
end

ReplicatedStorage.ChangeTeam.OnServerInvoke = switchTeam


-- (2)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local blueTeamButton = script.Parent.MainFrame.BlueTeam
local redTeamButton = script.Parent.MainFrame.RedTeam
local notificationLabel = script.Parent.MainFrame.NotificationMessage

function switchTeam(teamName)
    local result = ReplicatedStorage.ChangeTeam:InvokeServer(teamName)
    if result ~= true then
        showNotification(result)
    end
end

function swichBlueTeam()
    switchTeam("Blue")
end

function switchRedTeam()
    switchTeam("Red")
end

function showNotification(message)
    notificationLabel.Text = tostring(message)
end

blueTeamButton.MouseButton1Click:Connect(swichBlueTeam)
redTeamButton.MouseButton1Click:Connect(switchRedTeam)