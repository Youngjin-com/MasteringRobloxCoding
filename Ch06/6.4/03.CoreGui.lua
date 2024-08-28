--[[
    지침:
    - LocalScrips가 실행되는 위치에 LocalScrips를 생성하고 다음 코드를 삽입합니다
--]]

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, false)
--                           Enum.CoreGuiType.Health
--                           Enum.CoreGuiType.PlayerList
--                           Enum.CoreGuiType.Backpack
--                           Enum.CoreGuiType.EmotesMenu
--                           Enum.CoreGuiType.All