local Teams = game:GetService("Teams")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local notificationLabel = script.Parent.MainFrame.NotificationMessage

function switchTeam(player, teamName)
    -- 팀 정보 받아오기
    local team = Teams:FindFirstChild(teamName)

    -- 팀이 있는지 확인
    if team ~= nil then
        if player.Team ~= team then
            -- 플레이어가 아직 팀에 없음
            player.Team = team
        else
            -- 플레이어가 이미 팀에 있음
            ReplicatedStorage.TeamChangerNotification:
            FireClient(player, "You are already on this team!")
        end
    else
        ReplicatedStorage.TeamChangerNotification:
        FireClient(player, "Team does not exist!")
    end
end

function showNotification(message)
    notificationLabel.Text = message
end

ReplicatedStorage.ChangeTeam.OnServerEvent:Connect(switchTeam)
ReplicatedStorage.TeamChangerNotification.OnClientEvent:Connect(showNotification)