local abbreviations  = {
	"K", -- 4 digits 
	"M", -- 7 eigits
	"B", -- 10 digits
	"T", -- 13 digits
	"Q", -- 16 digits
	"Qi", -- 19 digits
	"S", -- 22 digits
	"Sx", -- 25 digits
	"Sp", -- 25 digits
	"Oc", -- 28 digits
	"N", -- 31 digits
	"De", -- 34 digits
	"Un", -- 37 digits
	"Tr", -- 40 digits
}

local maxValue = 1000

function Abbreviate(value)
	local cut = maxValue
	if value  < cut then
		return value 
	else
		local inStr = tostring(math.floor(value ))
		if inStr:lower() == "inf" or inStr:find("nan") then
			return inStr
		end
		local length, str
		local isExp, strEnd = inStr:find("e%+")
		if isExp then
			length = inStr:sub(strEnd + 1) + 1
			str = tostring(inStr:sub(1, isExp - 1) * 100):sub(1, 3)
		else
			length = #inStr
			str = inStr:sub(1, 3)
		end
		local div, rem = math.floor(length / 3), length % 3
		if rem == 0 then
			div = div - 1
		end
		if div > #abbreviations  then
			print("div", div, "greater than suff", #abbreviations )
			str = inStr
		else
			if rem == 1 then
				str = tostring(tonumber(str) / 100)
			elseif rem == 2 then
				str = tostring(tonumber(str) / 10)
			end
			local suff = abbreviations [div]
			if suff == "O" then
				str = str .. " " .. suff
			else
				str = str .. suff
			end
		end
		return str
	end
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local Diamondtracker = Instance.new("ScreenGui")
local GUI = Instance.new("TextLabel")
local text = Instance.new("TextLabel")
local diamonds = Instance.new("TextLabel")
local Discord = Instance.new("TextLabel")
local copy = Instance.new("TextButton")
local back = Instance.new("Frame")

--Properties:

Diamondtracker.Name = "Diamond tracker"
Diamondtracker.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
Diamondtracker.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

GUI.Name = "GUI"
GUI.Parent = Diamondtracker
GUI.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
GUI.BorderSizePixel = 0
GUI.Position = UDim2.new(0.2116258, 0, 0.192019954, 0)
GUI.Size = UDim2.new(0, 280, 0, 20)
GUI.ZIndex = 99
GUI.Font = Enum.Font.FredokaOne
GUI.Text = "Diamond tracker v2"
GUI.TextColor3 = Color3.fromRGB(255, 255, 255)
GUI.TextSize = 14.000

text.Name = "text"
text.Parent = GUI
text.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
text.BackgroundTransparency = 1.000
text.Position = UDim2.new(-0.00265991688, 0, 0.966957569, 0)
text.Size = UDim2.new(0, 280, 0, 20)
text.Font = Enum.Font.GothamBold
text.Text = "Diamonds earned since execution:"
text.TextColor3 = Color3.fromRGB(255, 255, 255)
text.TextSize = 17.000

diamonds.Name = "diamonds"
diamonds.Parent = GUI
diamonds.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
diamonds.BackgroundTransparency = 1.000
diamonds.Position = UDim2.new(-0.00265991688, 0, 1.94189525, 0)
diamonds.Size = UDim2.new(0, 280, 0, 14)
diamonds.Font = Enum.Font.GothamBold
diamonds.Text = "0"
diamonds.TextColor3 = Color3.fromRGB(255, 255, 255)
diamonds.TextScaled = true
diamonds.TextSize = 17.000
diamonds.TextWrapped = true

Discord.Name = "Discord"
Discord.Parent = GUI
Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Discord.BackgroundTransparency = 1.000
Discord.Position = UDim2.new(-0.00265993387, 0, 2.71059871, 0)
Discord.Size = UDim2.new(0, 107, 0, 20)
Discord.Font = Enum.Font.Gotham
Discord.Text = "meowo#7778"
Discord.TextColor3 = Color3.fromRGB(255, 255, 255)
Discord.TextSize = 17.000
Discord.TextXAlignment = Enum.TextXAlignment.Left

copy.Name = "copy"
copy.Parent = GUI
copy.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
copy.BorderSizePixel = 0
copy.Position = UDim2.new(0.380238771, 0, 2.71059871, 0)
copy.Size = UDim2.new(0, 44, 0, 20)
copy.Font = Enum.Font.Gotham
copy.Text = "Copy!"
copy.TextColor3 = Color3.fromRGB(255, 255, 255)
copy.TextSize = 14.000

back.Name = "back"
back.Parent = GUI
back.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
back.BorderSizePixel = 0
back.Position = UDim2.new(0, 0, 0.992019653, 0)
back.Size = UDim2.new(0, 280, 0, 54)
back.ZIndex = -1111

-- Scripts:

local function NRMTKYJ_fake_script() -- GUI.Smooth GUI Dragging 
	local script = Instance.new('LocalScript', GUI)

	local UserInputService = game:GetService("UserInputService")
	local runService = (game:GetService("RunService"));
	
	local gui = script.Parent
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	function Lerp(a, b, m)
		return a + (b - a) * m
	end;
	
	local lastMousePos
	local lastGoalPos
	local DRAG_SPEED = (8); -- // The speed of the UI darg.
	function Update(dt)
		if not (startPos) then return end;
		if not (dragging) and (lastGoalPos) then
			gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
			return 
		end;
	
		local delta = (lastMousePos - UserInputService:GetMouseLocation())
		local xGoal = (startPos.X.Offset - delta.X);
		local yGoal = (startPos.Y.Offset - delta.Y);
		lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
		gui.Position = UDim2.new(startPos.X.Scale, Lerp(gui.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(gui.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
	end;
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
			lastMousePos = UserInputService:GetMouseLocation()
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	runService.Heartbeat:Connect(Update)
end
coroutine.wrap(NRMTKYJ_fake_script)()
local function NMVIDMW_fake_script() -- copy.LocalScript 
	local script = Instance.new('LocalScript', copy)

	script.Parent.MouseButton1Click:Connect(function()
		setclipboard(script.Parent.Parent.Discord.Text)
	end)
end
coroutine.wrap(NMVIDMW_fake_script)()
local function DUYEJPG_fake_script() -- Diamondtracker.v2 
	local script = Instance.new('LocalScript', Diamondtracker)

	-- diamond tracker v2
	
	local diamonds = 0
	local olddiamonds = game:GetService('Players').LocalPlayer.leaderstats.Diamonds.Value
	
	while wait() do
		diamonds = game:GetService('Players').LocalPlayer.leaderstats.Diamonds.Value
		script.Parent.GUI.diamonds.Text = Abbreviate(diamonds - olddiamonds)
	end
end
coroutine.wrap(DUYEJPG_fake_script)()
