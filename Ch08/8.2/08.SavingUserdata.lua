DataStore:SetAsync(
	"Plr_" .. player.UserId,
	{
		[1] = {
			["item_type"] = workspace.PlacedItems.Chair,--> 에러
			["position"] = Vector3.new(100, 200, 300) --> 에러
		},
		[2] = {
			["item_type"] = "Chair", --> 적합
			["position"] = {100, 200, 300} --> 적합
		}
	}
)

local data = DataStore:GetAsync("Plr_" .. player.UserId)
local chairPosition = Vector3.new(
	data[2]["position"][1], --> 100
	data[2]["position"][2], --> 200
	data[2]["position"][3] 	--> 300
)