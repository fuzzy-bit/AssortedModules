-- 6/28/2020
-- Name: VibrationModule
-- Description: Module to give short vibration jolts to a gamepad.
-- By: SignorOmbra




--DEFINE MODULE--
local VibrationModule = {}



--DEFINE SERVICES--
local HapticService = game:GetService("HapticService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")



--CLIENTSIDE LOAD CHECK--
function VibrationModule:CheckClient(Submodule)
	if not Submodule then
		if not RunService:IsClient() then
			warn("VibrationModule loaded on server, aborting...")
			
			return nil
		else
			print("VibrationModule loaded successfully!")
		end
	elseif Submodule then
		if not RunService:IsClient() then
			warn("VibrationModule" .. "." .. Submodule .. "loaded on server, aborting...")
			
			return nil
		else
			print("VibrationModule" .. "." .. Submodule .. " loaded successfully!")
		end
	end
end

VibrationModule:CheckClient()



--DEFINE VARIABLES--
local Debounce = false

local Player = Players.LocalPlayer



--DEFINE FUNCTIONS--
function VibrationModule:LargeJolt(JoltTime)
	if JoltTime then
		local Character = Player.Character
		
		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid then
				spawn(function()
					if not Debounce then
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, 1)
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 1)
						Debounce = true
						
						wait(JoltTime)
						
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, 0)
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
						Debounce = false
					end
				end)
				
				return
			end
		end
	else
		warn("JoltTime missing!")
	end
end

function VibrationModule:MediumJolt(JoltTime)
	if JoltTime then
		local Character = Player.Character
		
		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid then
				spawn(function()
					if not Debounce then
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, 1)
						Debounce = true
						
						wait(JoltTime)
						
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Large, 0)
						Debounce = false
					end
				end)
				
				return
			end
		end
	else
		warn("JoltTime missing!")
	end
end

function VibrationModule:SmallJolt(JoltTime)
	if JoltTime then
		local Character = Player.Character
		
		if Character then
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			
			if Humanoid then
				spawn(function()
					if not Debounce then
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 1)
						Debounce = true
						
						wait(JoltTime)
						
						HapticService:SetMotor(Enum.UserInputType.Gamepad1, Enum.VibrationMotor.Small, 0)
						Debounce = false
					end
				end)
				
				return
			end
		end
	else
		warn("JoltTime missing!")
	end
end



--RETURN MODULE--
return VibrationModule