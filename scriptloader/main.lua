-- Tables & Variables:
local selectedScript = nil
local Descriptions = {
	[1] = 'Vortex Command line is a user interface that allows the player to simply run commands on them self.',
	[2] = 'Coming soon.'
}

-- Instances:

local VortexScriptLoader = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local UICorner = Instance.new("UICorner")
local List = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local VortexCommandline = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local Deck = Instance.new("TextButton")
local UICorner_3 = Instance.new("UICorner")
local Description = Instance.new("TextLabel")
local UICorner_4 = Instance.new("UICorner")
local Run = Instance.new("TextButton")
local UICorner_5 = Instance.new("UICorner")
local Quit = Instance.new("TextButton")
local UICorner_6 = Instance.new("UICorner")

--Properties:

VortexScriptLoader.Name = "VortexScriptLoader"
VortexScriptLoader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
VortexScriptLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = VortexScriptLoader
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0., 0, 0, 0)


Title.Name = "Title"
Title.Parent = Main
Title.AnchorPoint = Vector2.new(0.5, 0.5)
Title.BackgroundColor3 = Color3.fromRGB(29, 29, 29)
Title.BorderSizePixel = 0
Title.Position = UDim2.new(0.5, 0, 0.0500000007, 0)
Title.Size = UDim2.new(1, 0, 0.100000001, 0)
Title.Font = Enum.Font.Unknown
Title.Text = "Vortex V1"
Title.TextColor3 = Color3.fromRGB(166, 12, 255)
Title.TextScaled = true
Title.TextSize = 14.000
Title.TextWrapped = true
Title.TextXAlignment = Enum.TextXAlignment.Left

UICorner.CornerRadius = UDim.new(0.100000001, 0)
UICorner.Parent = Main

List.Name = "List"
List.Parent = Main
List.Active = true
List.AnchorPoint = Vector2.new(0.5, 0.5)
List.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
List.BackgroundTransparency = 1.000
List.BorderSizePixel = 0
List.Position = UDim2.new(0.25, 0, 0.550000012, 0)
List.Size = UDim2.new(0.400000006, 0, 0.800000012, 0)
List.ScrollBarThickness = 4

UIListLayout.Parent = List
UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.00999999978, 0)

VortexCommandline.Name = "VortexCommandline"
VortexCommandline.Parent = List
VortexCommandline.AnchorPoint = Vector2.new(0.5, 0.5)
VortexCommandline.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
VortexCommandline.Size = UDim2.new(0.899999976, 0, 0.0700000003, 0)
VortexCommandline.Font = Enum.Font.Nunito
VortexCommandline.Text = "Vortex Command line"
VortexCommandline.TextColor3 = Color3.fromRGB(255, 255, 255)
VortexCommandline.TextScaled = true
VortexCommandline.TextSize = 20.000
VortexCommandline.TextWrapped = true

UICorner_2.CornerRadius = UDim.new(0.200000003, 0)
UICorner_2.Parent = VortexCommandline

Deck.Name = "Deck"
Deck.Parent = List
Deck.AnchorPoint = Vector2.new(0.5, 0.5)
Deck.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Deck.Size = UDim2.new(0.899999976, 0, 0.0700000003, 0)
Deck.Font = Enum.Font.Nunito
Deck.Text = "Deck (Coming Soon)"
Deck.TextColor3 = Color3.fromRGB(255, 255, 255)
Deck.TextScaled = true
Deck.TextSize = 20.000
Deck.TextWrapped = true

UICorner_3.CornerRadius = UDim.new(0.200000003, 0)
UICorner_3.Parent = Deck

Description.Name = "Description"
Description.Parent = Main
Description.AnchorPoint = Vector2.new(0.5, 0.5)
Description.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Description.Position = UDim2.new(0.725000024, 0, 0.400000006, 0)
Description.Size = UDim2.new(0.400000006, 0, 0.5, 0)
Description.Font = Enum.Font.Nunito
Description.Text = ""
Description.TextColor3 = Color3.fromRGB(255, 255, 255)
Description.TextScaled = true
Description.TextSize = 14.000
Description.TextWrapped = true

UICorner_4.CornerRadius = UDim.new(0.100000001, 0)
UICorner_4.Parent = Description

Run.Name = "Run"
Run.Parent = Main
Run.AnchorPoint = Vector2.new(0.5, 0.5)
Run.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Run.Position = UDim2.new(0.850000024, 0, 0.800000012, 0)
Run.Size = UDim2.new(0.25, 0, 0.150000006, 0)
Run.Font = Enum.Font.Nunito
Run.Text = "Execute"
Run.TextColor3 = Color3.fromRGB(255, 255, 255)
Run.TextScaled = true
Run.TextSize = 14.000
Run.TextWrapped = true

UICorner_5.CornerRadius = UDim.new(0.25, 0)
UICorner_5.Parent = Run

Quit.Name = "Quit"
Quit.Parent = Main
Quit.AnchorPoint = Vector2.new(0.5, 0.5)
Quit.BackgroundColor3 = Color3.fromRGB(38, 38, 38)
Quit.Position = UDim2.new(0.579999983, 0, 0.800000012, 0)
Quit.Size = UDim2.new(0.25, 0, 0.150000006, 0)
Quit.Font = Enum.Font.Nunito
Quit.Text = "Quit"
Quit.TextColor3 = Color3.fromRGB(255, 255, 255)
Quit.TextScaled = true
Quit.TextSize = 14.000
Quit.TextWrapped = true
Quit.MouseButton1Down:Connect(function()
	local quit = game:GetService('TweenService'):Create(Main, TweenInfo.new(.15, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 0)})
	quit:Play()
	quit.Completed:Wait()
	VortexScriptLoader:Destroy()
end)

UICorner_6.CornerRadius = UDim.new(0.25, 0)
UICorner_6.Parent = Quit

VortexCommandline.MouseButton1Down:Connect(function()
	Description.Text = Descriptions[1]
	selectedScript = 'VortexCMD'
end)



Deck.MouseButton1Down:Connect(function()
	Description.Text = Descriptions[2]
	selectedScript = 'Deck'
end)

Run.MouseButton1Down:Connect(function()
	loadscript(selectedScript)
end)


function loadscript(sp)
	if sp == 'VortexCMD' then
		loadstring(game:HttpGet('https://raw.githubusercontent.com/BloxIT8/ionx/main/VortexCommandline/script.lua', true))()
	elseif sp == 'Deck' then
		warn('[VORTEX]: Script not accessable yet.')
	end
end


game:GetService('TweenService'):Create(Main, TweenInfo.new(.15, Enum.EasingStyle.Linear), {Size = UDim2.new(0.25, 0, 0.300000012, 0)}):Play()
