if not game:IsLoaded() then repeat task.wait() until game:IsLoaded() end


local plr = game.Players.LocalPlayer

local TypeDescriptions = {
	['STARTUP'] = 'Hello '..plr.DisplayName..'!',
	['CMDLINE'] = 'Vortex Command line is a user interface that allows the player to simply run commands on them self.',
	['DECK'] = 'Coming soon.\nCheck back soon!'

}

local Scripts = {
	['CMDLINE'] = 'https://raw.githubusercontent.com/ioxScripts/ionx/main/VortexCommandline/script.lua',
	['DECK'] = nil
	
}

local selected = nil

local VortexScriptLoader = Instance.new("ScreenGui")
local Main = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local Close = Instance.new("TextButton")
local Content = Instance.new("Frame")
local ScriptsList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local VortexCMD = Instance.new("TextButton")
local Deck = Instance.new("TextButton")
local Script = Instance.new("Frame")
local ScriptName = Instance.new("TextLabel")
local Description = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local DescriptionScroll = Instance.new("ScrollingFrame")
local DescText = Instance.new("TextLabel")
local Execute = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")

--Properties:

VortexScriptLoader.Name = "VortexScriptLoader"
VortexScriptLoader.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
VortexScriptLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Main.Name = "Main"
Main.Parent = VortexScriptLoader
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0.5, 0, 0.5, 0)
Main.Size = UDim2.new(0, 536, 0, 264)

Title.Name = "Title"
Title.Parent = Main
Title.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Title.BorderSizePixel = 0
Title.Size = UDim2.new(1, 0, 0, 30)
Title.Font = Enum.Font.SourceSans
Title.Text = "<font color=\"rgb(255, 0, 0)\"><b>V</b></font>ortex"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.RichText = true
Title.TextSize = 30.000
Title.TextWrapped = true

Close.Name = "Close"
Close.Parent = Title
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.899999976, 0, 0, 0)
Close.Size = UDim2.new(0.100000001, 0, 0, 30)
Close.Font = Enum.Font.SourceSans
Close.Text = "<font color=\"rgb(255, 0, 0)\"><b>X</b></font>"
Close.TextColor3 = Color3.fromRGB(0, 0, 0)
Close.RichText = true
Close.TextSize = 30.000
Close.TextWrapped = true
Close.MouseButton1Down:Connect(function()
	local tween = game:GetService('TweenService'):Create(Main, TweenInfo.new(.1), {Size = UDim2.fromOffset(0,0)})
	tween:Play()
	tween.Completed:Wait()
	VortexScriptLoader:Destroy()
end)

Content.Name = "Content"
Content.Parent = Main
Content.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Content.BackgroundTransparency = 1.000
Content.Position = UDim2.new(0, 0, 0, 30)
Content.Size = UDim2.new(1, 0, 1, -30)

ScriptsList.Name = "ScriptsList"
ScriptsList.Parent = Content
ScriptsList.Active = true
ScriptsList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptsList.BackgroundTransparency = 1.000
ScriptsList.BorderSizePixel = 0
ScriptsList.Size = UDim2.new(0.400000006, 0, 1, 0)
ScriptsList.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
ScriptsList.ScrollBarThickness = 6
ScriptsList.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"

UIListLayout.Parent = ScriptsList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0.0199999996, 0)

VortexCMD.Name = "VortexCMD"
VortexCMD.Parent = ScriptsList
VortexCMD.RichText = true
VortexCMD.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
VortexCMD.BorderSizePixel = 0
VortexCMD.Size = UDim2.new(1, 0, 0, 30)
VortexCMD.Font = Enum.Font.SourceSans
VortexCMD.Text = "<font color=\"rgb(255, 0, 0)\"><b>V</b></font>ortex Commands"
VortexCMD.TextColor3 = Color3.fromRGB(255, 255, 255)
VortexCMD.TextSize = 30.000


Deck.Name = "Deck"
Deck.RichText = true
Deck.Parent = ScriptsList
Deck.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Deck.BorderSizePixel = 0
Deck.Size = UDim2.new(1, 0, 0, 30)
Deck.Font = Enum.Font.SourceSans
Deck.Text = "<font color=\"rgb(255, 0, 0)\"><b>D</b></font>eck"
Deck.TextColor3 = Color3.fromRGB(255, 255, 255)
Deck.TextSize = 30.000

Script.Name = "Script"
Script.Parent = Content
Script.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Script.BackgroundTransparency = 1.000
Script.Position = UDim2.new(0.400000006, 0, 0, 0)
Script.Size = UDim2.new(0.600000024, 0, 1, 0)

ScriptName.Name = "ScriptName"
ScriptName.Parent = Script
ScriptName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.BackgroundTransparency = 1.000
ScriptName.Size = UDim2.new(1, 0, 0, 30)
ScriptName.Font = Enum.Font.Ubuntu
ScriptName.RichText = true
ScriptName.Text = ''
ScriptName.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptName.TextSize = 25.000

Description.Name = "Description"
Description.Parent = Script
Description.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Description.Position = UDim2.new(0, 5, 0, 35)
Description.Size = UDim2.new(1, -10, 1, -80)

UICorner.CornerRadius = UDim.new(0, 15)
UICorner.Parent = Description

DescriptionScroll.Name = "DescriptionScroll"
DescriptionScroll.Parent = Description
DescriptionScroll.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
DescriptionScroll.BackgroundTransparency = 1.000
DescriptionScroll.Selectable = false
DescriptionScroll.Size = UDim2.new(1, 0, 1, 0)
DescriptionScroll.CanvasSize = UDim2.new(0, 0, 1, 0)
DescriptionScroll.ScrollBarThickness = 6

DescText.Name = "DescText"
DescText.Parent = DescriptionScroll
DescText.AnchorPoint = Vector2.new(0.5, 0.5)
DescText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
DescText.BackgroundTransparency = 1.000
DescText.BorderSizePixel = 0
DescText.Position = UDim2.new(0.5, 0, 0.5, 0)
DescText.Size = UDim2.new(1, 0, 1, 0)
DescText.Font = Enum.Font.SourceSans
DescText.RichText = true
DescText.Text = TypeDescriptions['STARTUP']
DescText.TextColor3 = Color3.fromRGB(255, 255, 255)
DescText.TextSize = 25.000
DescText.TextWrapped = true

Execute.Name = "Execute"
Execute.Parent = Script
Execute.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Execute.Position = UDim2.new(0, 10, 1, -40)
Execute.Size = UDim2.new(0.400000006, 0, 0, 30)
Execute.Font = Enum.Font.SourceSans
Execute.RichText = true
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(113, 255, 88)
Execute.TextScaled = true
Execute.TextSize = 14.000
Execute.TextWrapped = true

UICorner_2.Parent = Execute

VortexCMD.MouseButton1Down:Connect(function()
	selected = 'CMDLINE'
	DescText.Text = TypeDescriptions['CMDLINE']
	ScriptName.Text = 'Vortex Commands'
end)

Deck.MouseButton1Down:Connect(function()
	selected = 'DECK'
	DescText.Text = TypeDescriptions['DECK']
	ScriptName.Text = 'Deck'
end)

Execute.MouseButton1Down:Connect(function()
	if selected ~= nil then
		DescText.Text = 'Attempting to execute: '..tostring(selected)
		local tween = game:GetService('TweenService'):Create(Main, TweenInfo.new(.1), {Size = UDim2.fromOffset(0,0)})
		tween:Play()
		tween.Completed:Wait()
		VortexScriptLoader:Destroy()
		loadstring(game:HttpGet(Scripts[selected], true))()
	else
		DescText.Text = 'Select a script before attempting to execute!'
	end
end)

local UserInputService = game:GetService("UserInputService")

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

Title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = Main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

Title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
