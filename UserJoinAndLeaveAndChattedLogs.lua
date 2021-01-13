--author MJW(MOON JI WON)
--Put In ServerScriptService

local Players = game:GetService("Players")
local Https = game:GetService("HttpService")
local webhook = "Webhook Link" -- Discord WebHook Link

Players.PlayerAdded:Connect(function(plr)
	local data1 = {
		["embeds"] = {{
			["title"] = "Player Joined",
			["color"] = "114650",
			["fields"] = {
				{
					["name"] = "Username",
					["value"] = plr.Name.." has joined the game."
				}
			}		
		}}}
	Https:PostAsync(webhook,Https:JSONEncode(data1))
	plr.Chatted:Connect(function(msg)
		local data = {
			["embeds"] = {{
				["title"] = "Player Chat",
				["color"] = "114650",
				["fields"] = {
					{
						["name"] = "Username",
						["value"] = plr.Name,
					},
					{
						["name"] = "Chat",
						["value"] = msg
					}
				}}
			}

		}
		Https:PostAsync(webhook,Https:JSONEncode(data))
	end)
end)

Players.PlayerRemoving:Connect(function(plr)
	local data1 = {
		["embeds"] = {{
			["title"] = "Player Left",
			["color"] = "114650",
			["fields"] = {
				{
					["name"] = "Username",
					["value"] = plr.Name.." has left the game."
				}
			}		
		}}}
	Https:PostAsync(webhook,Https:JSONEncode(data1))
end)
