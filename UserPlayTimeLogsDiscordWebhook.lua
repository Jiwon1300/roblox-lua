--Author MJW(MOON JI WON)
--서버스크립트서비스에 만들어주세요.


local JOIN_TIMES = {}
local url1 = "Discord Webhook Link"
local http = game:GetService("HttpService")
game.Players.PlayerAdded:Connect(function(plr)
	JOIN_TIMES[plr] = os.date("%H%M%S")
end)
game.Players.PlayerRemoving:Connect(function(plr)
	currentTime = os.date("%H%M%S")
	print(currentTime)
	joinTime = JOIN_TIMES[plr]
	difference = currentTime - joinTime
	
	min = math.floor(difference - difference % 60) / 60
	hor = math.floor(min - min % 60) / 60
	sec = difference % 60
	local Data ={
		["embeds"] = {{
			["title"] = "플레이 시간 로그",
			["color"] = "5814783",
			["fields"] = {
				{
					["name"] = "플레이어",
					["value"] = plr.Name
				},
				{
					["name"] = "플레이 시간",
					["value"] = os.date(hor.."시간 "..min.."분 "..sec.."초")
				}
			}		
		}}

	}
	Data = http:JSONEncode(Data)
	http:PostAsync(url1,Data)
end)
