local MusicModule = {}



--DEFINE SERVICES--
local TweenService = game:GetService("TweenService")
local MarketplaceService = game:GetService("MarketplaceService")



--CHECK EXISTANCE OF OBJECTS--
if not script:FindFirstChild("Resources") then
	error("No 'Resources' folder!")
elseif script:FindFirstChild("Resources") and not script:FindFirstChild("Resources"):FindFirstChild("MusicList") then
	error("No 'MusicList' folder!")
end

if not workspace:FindFirstChild("Music") then
	local PlaybackObject = Instance.new("Sound")
	PlaybackObject.Parent = workspace
	PlaybackObject.Name = "Music"
end



--LOCAL VARIABLES--
local Resources = script.Resources
local Music = workspace.Music
local MusicList = Resources.MusicList

local LastSong = nil
local NewSong = nil



--FUNCTIONS--
function MusicModule:PlayRandomSong()
	local Songs = MusicList:GetChildren()
	if #Songs >= 2 then
		repeat NewSong = Songs[math.random(1, #Songs)] until NewSong ~= LastSong and NewSong:IsA("Sound")
		
		LastSong = NewSong
		
		Music.SoundId = NewSong.SoundId
		Music.PlaybackSpeed = NewSong.PlaybackSpeed
	
		if NewSong:FindFirstChild("StartTime") then
			script.Music.TimePosition = NewSong.StartTime.Value
		end
		
		if Music.Playing then
			Music:Stop()
		end
		
		Music:Play()
		
		local SoundId = string.sub(NewSong.SoundId, 14)
		local Asset = MarketplaceService:GetProductInfo(SoundId)
		
		return Music
	else
		error("MusicList must have two or more songs!")
	end
end

function MusicModule:StopSong()
	Music:Stop()
end



return MusicModule
