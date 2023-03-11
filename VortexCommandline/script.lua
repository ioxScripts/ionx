local start = os.clock()
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ioxScripts/ionx/main/VortexCommandline/lib.lua', true))()

local totalcommands = tostring('69 😏') -- Yummy way of counting commands :sob:

local Window = Library:CreateWindow({Name = 'Vortex | '..totalcommands..' Commands',IntroText = 'Vortex\n_________\n\nYour #1 Command line utility script\n_____________________\n\n'..totalcommands..' Commands loaded',IntroIcon = 'rbxassetid://9789474876',IntroBlur = true,IntroBlurIntensity = 15,Theme = Library.Themes.dark,Position = 'top',Draggable = false,Prefix = ';'})


local espLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ioxScripts/ionx/main/Extra/esp.lua'),true))()
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local req = (syn and syn.request) or (http and http.request) or http_request
local http = game:GetService('HttpService')

local plr = game:GetService('Players').LocalPlayer
local TweenService = game:GetService('TweenService')
local Info = TweenInfo.new(.25)
local IONXMouse = plr:GetMouse()
local IONXFLYSPEED = 2
local IONXTWEENSPEED = 2

espLib.options.enabled = false
espLib.options.outOfViewArrows = false
espLib.options.names = true
espLib.options.boxes = false
espLib.options.tracers = false
espLib.options.healthBars = false
espLib.options.healthText = false
espLib.options.chams = false
espLib.options.distance = false
espLib.options.outOfViewArrowsFilled = false
espLib.options.outOfViewArrowsOutline = false

function getResult(t)
    if string.lower(t) == 'true' then
        return true
    else
        return false
    end
end

function CHMS(plr)
	task.spawn(function()
		for i,v in pairs(game:GetService('CoreGui'):GetChildren()) do
			if v.Name == plr.Name..'_CHMS' then
				v:Destroy()
			end
		end
		task.wait()
		if plr.Character and plr.Name ~= game.Players.LocalPlayer.Name and not game:GetService('CoreGui'):FindFirstChild(plr.Name..'_CHMS') then
			local ESPholder = Instance.new("Folder")
			ESPholder.Name = plr.Name..'_CHMS'
			ESPholder.Parent = game:GetService('CoreGui')
			repeat task.wait(1) until plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
			for b,n in pairs (plr.Character:GetChildren()) do
				if (n:IsA("BasePart")) then
					local a = Instance.new("BoxHandleAdornment")
					a.Name = plr.Name
					a.Parent = ESPholder
					a.Adornee = n
					a.AlwaysOnTop = true
					a.ZIndex = 10
					a.Size = n.Size
					a.Transparency = espTransparency
					a.Color = plr.TeamColor
				end
			end
			local addedFunc
			local teamChange
			local CHMSremoved
			addedFunc = plr.CharacterAdded:Connect(function()
				if CHMSenabled then
					ESPholder:Destroy()
					teamChange:Disconnect()
					repeat task.wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
					CHMS(plr)
					addedFunc:Disconnect()
				else
					teamChange:Disconnect()
					addedFunc:Disconnect()
				end
			end)
			teamChange = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
				if CHMSenabled then
					ESPholder:Destroy()
					addedFunc:Disconnect()
					repeat task.wait(1) until getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
					CHMS(plr)
					teamChange:Disconnect()
				else
					teamChange:Disconnect()
				end
			end)
			CHMSremoved = ESPholder.AncestryChanged:Connect(function()
				teamChange:Disconnect()
				addedFunc:Disconnect()
				CHMSremoved:Disconnect()
			end)
		end
	end)
end

function unbang()
    if bangLoop then
		bangLoop = bangLoop:Disconnect()
		bangDied:Disconnect()
		bang:Stop()
		bangAnim:Destroy()
	end
end

function randomString()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

function fixcam()
    workspace.CurrentCamera:remove()
	task.wait(.1)
	repeat task.wait() until plr.Character ~= nil
	workspace.CurrentCamera.CameraSubject = plr.Character:FindFirstChildWhichIsA('Humanoid')
	workspace.CurrentCamera.CameraType = "Custom"
	plr.CameraMinZoomDistance = 0.5
	plr.CameraMaxZoomDistance = 400
	plr.CameraMode = "Classic"
	plr.Character.Head.Anchored = false
end

function isNumber(str)
	if tonumber(str) ~= nil or str == 'inf' then
		return true
	end
end

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function tools(plr)
	if plr:FindFirstChildOfClass("Backpack"):FindFirstChildOfClass('Tool') or plr.Character:FindFirstChildOfClass('Tool') then
		return true
	end
end

function r15(plr)
	if plr.Character:FindFirstChildOfClass('Humanoid').RigType == Enum.HumanoidRigType.R15 then
		return true
	end
end

function getTorso(x)
	x = x or Players.LocalPlayer.Character
	return x:FindFirstChild("Torso") or x:FindFirstChild("UpperTorso") or x:FindFirstChild("LowerTorso") or x:FindFirstChild("HumanoidRootPart")
end

function breakvelocity(x)
    local BeenASecond, V3 = false, Vector3.new(0, 0, 0)
	delay(1, function()
		BeenASecond = true
	end)
	while not BeenASecond do
		for _, v in ipairs(x.Character:GetDescendants()) do
			if v.IsA(v, "BasePart") then
				v.Velocity, v.RotVelocity = V3, V3
			end
		end
		task.wait()
	end
end

function unfling(x)
    if flingDied then
		flingDied:Disconnect()
	end
	flinging = false
	task.wait(.1)
	local speakerChar = x.Character
	if not speakerChar or not getRoot(speakerChar) then return end
	for i,v in pairs(getRoot(speakerChar):GetChildren()) do
		if v.ClassName == 'BodyAngularVelocity' then
			v:Destroy()
		end
	end
	for _, child in pairs(speakerChar:GetDescendants()) do
		if child.ClassName == "Part" or child.ClassName == "MeshPart" then
			child.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)
		end
	end
end

function toClipboard(String)
	local clipBoard = setclipboard or toclipboard or set_clipboard or (Clipboard and Clipboard.set)
	if clipBoard then
		clipBoard(String)
		Window:CreateNotification('Clipboard','Copied to clipboard',3)
	else
		Window:CreateNotification('Clipboard',"Your exploit doesn't have the ability to use the clipboard",5)
	end
end

Window:AddCommand('goto', {'player'}, 'Teleports you to the player.', function(Arguments, Speaker)
    for _,player in ipairs(game.Players:GetPlayers()) do
        if string.match(string.lower(player.DisplayName), "^"..string.lower(Arguments[1])) or string.match(string.lower(player.Name), "^"..string.lower(Arguments[1])) then
            plr.Character.HumanoidRootPart.CFrame = game:GetService('Players')[player.Name].Character.HumanoidRootPart.CFrame
            breakvelocity(plr)
        end
    end
end)

Window:AddCommand('ws', {'number'}, 'Changes your WalkSpeed.', function(Arguments, Speaker)
    if tonumber(Arguments[1]) then
        plr.Character:FindFirstChild('Humanoid').WalkSpeed = tonumber(Arguments[1])
    else
        Window:CreateNotification('Invalid Number', 'WalkSpeed only accepts numbers.', 5)
    end
end)

Window:AddCommand('jp', {'number'}, 'Changes your JumpPower.', function(Arguments, Speaker)
        if tonumber(Arguments[1]) then
        plr.Character:FindFirstChild('Humanoid').JumpPower = tonumber(Arguments[1])
    else
        Window:CreateNotification('Invalid Number', 'JumpPower only accepts numbers.', 5)
    end
end)

Window:AddCommand('sit', {}, 'Makes your character sit.', function(Arguments, Speaker)
    Speaker.Character:FindFirstChild('Humanoid').Sit = true
end)

Window:AddCommand('say', {'text'}, 'Makes you say something.', function(Arguments, Speaker)
    game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(Arguments[1], 'All');
end)



Window:AddCommand('reset', {}, 'Resets your character.', function(Arguments, Speaker)
    if plr.Character then
        plr.Character.Humanoid.Health = 0
    end
end)

Window:AddCommand('forcereset', {}, 'Force resets your character.', function(Arguments, Speaker)
    if plr.Character then
        plr.Character:Destroy()
    end
end)

Window:AddCommand('spoof', {}, 'Spoofs your username in chat and playerlist. [CS]', function(Arguments, Speaker)
    if plr then
        plr.Name = 'ώ'
        plr.DisplayName = 'ώ'
    end
end)

Window:AddCommand('rejoin', {}, 'Rejoins the same server.', function(Arguments, Speaker)
    local tpservice = game:GetService("TeleportService")
    tpservice:Teleport(game.PlaceId, plr)
end)

Window:AddCommand('hipheight', {'number'}, 'Changes the players hipheight.',function(Arguments, Speaker)
    if tonumber(Arguments[1]) then
        if game:GetService('Players').LocalPlayer.Character then
            game:GetService('Players').LocalPlayer.Character:FindFirstChild('Humanoid').HipHeight = tonumber(Arguments[1])
        end
    end
end)

Window:AddCommand('discord', {}, 'Joins the discord server.', function(Arguments, Speaker)
    if req then
        req({Url = 'http://127.0.0.1:6463/rpc?v=1',Method = 'POST',Headers = {['Content-Type'] = 'application/json',Origin = 'https://discord.com'},Body = http:JSONEncode({cmd = 'INVITE_BROWSER',nonce = http:GenerateGUID(false),args = {code = 'r7xgGc8knZ'}})})
    else
        Window:CreateNotification('Executor Issue', 'http_request is not supported on your executor!', 5)
    end
end)

Window:AddCommand('view', {'player'}, 'View a player.', function(Arguments,Speaker)
    for _,player in ipairs(game.Players:GetPlayers()) do
        if string.match(string.lower(player.DisplayName), "^"..string.lower(Arguments[1])) or string.match(string.lower(player.Name), "^"..string.lower(Arguments[1])) then
            game:GetService('Workspace').CurrentCamera.CameraSubject = game:GetService('Players')[player.Name].Character
        end
    end
end)

Window:AddCommand('unview', {}, 'Unview a player.', function(Arguments,Speaker)
    game:GetService('Workspace').CurrentCamera.CameraSubject = plr.Character
end)

Window:AddCommand('antiafk', {}, 'Prevents you from getting idle kicked.', function(Arguments,Speaker)
    local GC = getconnections or get_signal_cons
	if GC then
		for i,v in pairs(GC(plr.Idled)) do
			if v["Disable"] then
				v["Disable"](v)
			elseif v["Disconnect"] then
				v["Disconnect"](v)
			end
		end
	else
		plr.Idled:Connect(function()
			local VirtualUser = game:GetService("VirtualUser")
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
	end
	Window:CreateNotification('Success', 'Anti-AFK is now enabled', 5)
end)

Window:AddCommand('freezeanims', {}, 'Freezes your animations.', function(Arguments,Speaker)
	local Humanoid = plr.Character:FindFirstChildOfClass("Humanoid") or plr.Character:FindFirstChildOfClass("AnimationController")
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _, v in pairs(ActiveTracks) do
		v:AdjustSpeed(0)
	end
end)

Window:AddCommand('unfreezeanims', {}, 'Unfreezes your animations.', function(Arguments,Speaker)
	local Humanoid = plr.Character:FindFirstChildOfClass("Humanoid") or plr.Character:FindFirstChildOfClass("AnimationController")
	local ActiveTracks = Humanoid:GetPlayingAnimationTracks()
	for _, v in pairs(ActiveTracks) do
		v:AdjustSpeed(1)
	end
end)

Window:AddCommand('headthrow', {}, 'Throws your head [R6]', function(Arguments,Speaker)
    	if not r15(Speaker) then
		local AnimationId = "35154961"
		local Anim = Instance.new("Animation")
		Anim.AnimationId = "rbxassetid://"..AnimationId
		local k = plr.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(Anim)
		k:Play(0)
		k:AdjustSpeed(1)
	else
		Window:CreateNotification('R6 Required','This command requires the r6 rig type',5)
	end
end)

Window:AddCommand('tppos', {'x','y','z'}, 'Teleports you to selected coordinates.', function(Arguments,Speaker)
    if #Arguments < 3 then 
        Window:CreateNotification('Argument Error','Not enough arguments passed.',5)
        return nil
    end
	local tpX,tpY,tpZ = tonumber(Arguments[1]),tonumber(Arguments[2]),tonumber(Arguments[3])
	local char = plr.Character
	if char and getRoot(char) then
		getRoot(char).CFrame = CFrame.new(tpX,tpY,tpZ)
		breakvelocity(plr)
	end
end)

Window:AddCommand('tptool', {}, 'Gives you a teleport tool.', function(Arguments,Speaker)
    local TpTool = Instance.new("Tool")
	TpTool.Name = "Teleport Tool"
	TpTool.RequiresHandle = false
	TpTool.Parent = Speaker.Backpack
	TpTool.Activated:Connect(function()
		local Char = Speaker.Character or workspace:FindFirstChild(Speaker.Name)
		local HRP = Char and Char:FindFirstChild("HumanoidRootPart")
		if not Char or not HRP then
			return warn("Failed to find HumanoidRootPart")
		end
		HRP.CFrame = CFrame.new(IONXMouse.Hit.X, IONXMouse.Hit.Y + 3, IONXMouse.Hit.Z, select(4, HRP.CFrame:components()))
	end)
end)

Window:AddCommand('console', {}, 'Brings back the original developer console.', function(Arguments,Speaker)
    Window:CreateNotification("Loading",'Hold on a second',3)
	local _, str = pcall(function()
		return game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/console.lua", true)
	end)

	local s, e = loadstring(str)
	if typeof(s) ~= "function" then
		return
	end

	local success, message = pcall(s)
	if (not success) then
		if printconsole then
			printconsole(message)
		elseif printoutput then
			printoutput(message)
		end
	end
	task.wait(1)
	Window:CreateNotification('Console','Press F9 to open the console',5)
end)

Window:AddCommand('remotespy', {}, 'View all remotes being fired.', function(Arguments,Speaker)
    Window:CreateNotification("Loading",'Hold on a second',3)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/infyiff/backup/main/SimpleSpyV3/main.lua"))()
end)

Window:AddCommand('audiospy', {}, 'View all audio playing.', function(Arguments,Speaker)
    Window:CreateNotification("Loading",'Hold on a second',3)
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/infyiff/backup/main/audiologger.lua'),true))()
end)

Window:AddCommand('fullbright', {}, 'Makes the game bright.', function(Arguments,Speaker)
    game:GetService('Lighting').Brightness = 2
	game:GetService('Lighting').ClockTime = 14
	game:GetService('Lighting').FogEnd = 100000
	game:GetService('Lighting').GlobalShadows = false
	game:GetService('Lighting').OutdoorAmbient = Color3.fromRGB(128, 128, 128)
end)

Window:AddCommand('blockhead', {}, 'Makes your head a block', function(Arguments, Speaker)
    plr.Character.Head:FindFirstChildOfClass("SpecialMesh"):Destroy()
end)

Window:AddCommand('enableshiftlock', {}, 'Enables shiftlock in any game.', function(Arguments, Speaker)
    Speaker.DevEnableMouseLock = true
	Window:CreateNotification('Shiftlock','Shift lock is now available',3)
end)

Window:AddCommand('firstperson', {}, 'Locks you into firstperson.', function(Arguments, Speaker)
    Speaker.CameraMode = "LockFirstPerson"
end)

Window:AddCommand('thirdperson', {}, 'Enables third person.', function(Arguments, Speaker)
    Speaker.CameraMode = "Classic"
end)

Window:AddCommand('btools', {}, 'Gives you btools', function(Arguments, Speaker)
    	for i = 1, 4 do
		local Tool = Instance.new("HopperBin")
		Tool.BinType = i
		Tool.Name = randomString()
		Tool.Parent = Speaker:FindFirstChildOfClass("Backpack")
	end
end)

Window:AddCommand('hatspin', {}, 'Spins your hats.', function(Arguments, Speaker)
    Window:CreateNotification('Hatspin','Spinning Hats.',3)
    task.wait(.5)
	for _,v in pairs(Speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
		local keep = Instance.new("BodyPosition") keep.Name = randomString() keep.Parent = v.Handle
		local spin = Instance.new("BodyAngularVelocity") spin.Name = randomString() spin.Parent = v.Handle
		v.Handle:FindFirstChildOfClass("Weld"):Destroy()
		if args[1] then
			spin.AngularVelocity = Vector3.new(0, args[1], 0)
			spin.MaxTorque = Vector3.new(0, args[1] * 2, 0)
		else
			spin.AngularVelocity = Vector3.new(0, 100, 0)
			spin.MaxTorque = Vector3.new(0, 200, 0)
		end
		keep.P = 30000
		keep.D = 50
		spinhats = RunService.Stepped:Connect(function()
			pcall(function()
				keep.Position = plr.Character.Head.Position
			end)
		end)
	end
end)

Window:AddCommand('unhatspin', {}, 'Stops spinning your hats.', function(Arguments, Speaker)
    if spinhats then
		spinhats:Disconnect()
	end
	for _,v in pairs(Speaker.Character:FindFirstChildOfClass('Humanoid'):GetAccessories()) do
		v.Parent = workspace
		for i,c in pairs(v.Handle) do
			if c:IsA("BodyPosition") or c:IsA("BodyAngularVelocity") then
				c:Destroy()
			end
		end
		task.wait()
		v.Parent = Speaker.Character
	end
end)

Window:AddCommand('spin', {'speed'}, 'Spins your character.', function(Arguments, Speaker)
    local spinSpeed = 20
	if Arguments[1] and isNumber(Arguments[1]) then
		spinSpeed = Arguments[1]
	end
	for i,v in pairs(getRoot(Speaker.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "Spinning"
	Spin.Parent = getRoot(Speaker.Character)
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0,spinSpeed,0)
end)


Window:AddCommand('unspin', {}, 'Stops spinning your character.', function(Arguments, Speaker)
    for i,v in pairs(getRoot(Speaker.Character):GetChildren()) do
		if v.Name == "Spinning" then
			v:Destroy()
		end
	end
end)

invisRunning = false
Window:AddCommand('invisible', {}, 'Makes you invisible.', function(Arguments, Speaker)
    if invisRunning then return end
	invisRunning = true
	-- Full credit to AmokahFox @V3rmillion
	local Player = Speaker
	repeat task.wait(.1) until Player.Character
	local Character = Player.Character
	Character.Archivable = true
	local IsInvis = false
	local IsRunning = true
	local InvisibleCharacter = Character:Clone()
	InvisibleCharacter.Parent = Lighting
	local Void = workspace.FallenPartsDestroyHeight
	InvisibleCharacter.Name = ""
	local CF

	local invisFix = game:GetService('RunService').Stepped:Connect(function()
		pcall(function()
			local IsInteger
			if tostring(Void):find'-' then
				IsInteger = true
			else
				IsInteger = false
			end
			local Pos = Player.Character.HumanoidRootPart.Position
			local Pos_String = tostring(Pos)
			local Pos_Seperate = Pos_String:split(', ')
			local X = tonumber(Pos_Seperate[1])
			local Y = tonumber(Pos_Seperate[2])
			local Z = tonumber(Pos_Seperate[3])
			if IsInteger == true then
				if Y <= Void then
					Respawn()
				end
			elseif IsInteger == false then
				if Y >= Void then
					Respawn()
				end
			end
		end)
	end)

	for i,v in pairs(InvisibleCharacter:GetDescendants())do
		if v:IsA("BasePart") then
			if v.Name == "HumanoidRootPart" then
				v.Transparency = 1
			else
				v.Transparency = .5
			end
		end
	end

	function Respawn()
		IsRunning = false
		if IsInvis == true then
			pcall(function()
				Player.Character = Character
				task.wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				IsInvis = false
				InvisibleCharacter.Parent = nil
				invisRunning = false
			end)
		elseif IsInvis == false then
			pcall(function()
				Player.Character = Character
				task.wait()
				Character.Parent = workspace
				Character:FindFirstChildWhichIsA'Humanoid':Destroy()
				TurnVisible()
			end)
		end
	end

	local invisDied
	invisDied = InvisibleCharacter:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
		Respawn()
		invisDied:Disconnect()
	end)

	if IsInvis == true then return end
	IsInvis = true
	CF = workspace.CurrentCamera.CFrame
	local CF_1 = Player.Character.HumanoidRootPart.CFrame
	Character:MoveTo(Vector3.new(0,math.pi*1000000,0))
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	task.wait(.2)
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	InvisibleCharacter = InvisibleCharacter
	Character.Parent = Lighting
	InvisibleCharacter.Parent = workspace
	InvisibleCharacter.HumanoidRootPart.CFrame = CF_1
	Player.Character = InvisibleCharacter
	fixcam()
	Player.Character.Animate.Disabled = true
	Player.Character.Animate.Disabled = false

	function TurnVisible()
		if IsInvis == false then return end
		invisFix:Disconnect()
		invisDied:Disconnect()
		CF = workspace.CurrentCamera.CFrame
		Character = Character
		local CF_1 = Player.Character.HumanoidRootPart.CFrame
		Character.HumanoidRootPart.CFrame = CF_1
		InvisibleCharacter:Destroy()
		Player.Character = Character
		Character.Parent = workspace
		IsInvis = false
		Player.Character.Animate.Disabled = true
		Player.Character.Animate.Disabled = false
		invisDied = Character:FindFirstChildOfClass'Humanoid'.Died:Connect(function()
			Respawn()
			invisDied:Disconnect()
		end)
		invisRunning = false
	end
	Window:CreateNotification('Invisible','You now appear invisible to other players',5)
end)

Window:AddCommand('visible', {}, 'Makes you visible.', function(Arguments,Speaker)
    TurnVisible()
end)

Window:AddCommand('fixcam', {}, 'Fixes your camera.', function(Arguments,Speaker)
    fixcam()
end)

Window:AddCommand('noclipcam', {}, 'Makes your camera noclip through objects.', function(Arguments,Speaker)
    local sc = (debug and debug.setconstant) or setconstant
	local gc = (debug and debug.getconstants) or getconstants
	if not sc or not getgc or not gc then
		return Window:CreateNotification('Incompatible Exploit', 'Your exploit does not support this command (missing setconstant or getconstants or getgc)',5)
	end
	local pop = Speaker.PlayerScripts.PlayerModule.CameraModule.ZoomController.Popper
	for _, v in pairs(getgc()) do
		if type(v) == 'function' and getfenv(v).script == pop then
			for i, v1 in pairs(gc(v)) do
				if tonumber(v1) == .25 then
					sc(v, i, 0)
				elseif tonumber(v1) == 0 then
					sc(v, i, .25)
				end
			end
		end
	end
end)


Window:AddCommand('lockworkspace', {}, 'Locks the workspace.', function(Arguments,Speaker)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = true
		end
	end
end)

Window:AddCommand('unlockworkspace', {}, 'Unlocks the workspace.', function(Arguments,Speaker)
	for i,v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Locked = false
		end
	end
end)

Window:AddCommand('f3x', {}, 'Gives you F3X Building Tools', function(Arguments, Speaker)
    loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end)

Window:AddCommand('age', {'player'}, 'Tells you the age of the player.', function(Arguments, Speaker)
    for _,player in ipairs(game.Players:GetPlayers()) do
        if string.match(string.lower(player.DisplayName), "^"..string.lower(Arguments[1])) or string.match(string.lower(player.Name), "^"..string.lower(Arguments[1])) then
            Window:CreateNotification('Players Age',tostring(player.DisplayName..'\'s account is '..player.AccountAge))
        end
    end
end)

function sFLY(vfly)
	repeat task.wait() until plr and plr.Character and getRoot(plr.Character) and plr.Character:FindFirstChildOfClass("Humanoid")
	repeat task.wait() until IONXMouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot(plr.Character)
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)
		task.spawn(function()
			repeat task.wait()
				if not vfly and plr.Character:FindFirstChildOfClass('Humanoid') then
					plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if plr.Character:FindFirstChildOfClass('Humanoid') then
				plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
			end
		end)
	end
	flyKeyDown = IONXMouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or IONXFLYSPEED)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or IONXFLYSPEED)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or IONXFLYSPEED)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or IONXFLYSPEED)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or IONXFLYSPEED)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or IONXFLYSPEED)*2
		end
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = IONXMouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if plr.Character:FindFirstChildOfClass('Humanoid') then
		plr.Character:FindFirstChildOfClass('Humanoid').PlatformStand = false
	end
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

Window:AddCommand('fly', {}, 'Allows you to fly.', function(Arguments, Speaker)
	NOFLY()
	task.wait()
	sFLY()
	if args[1] and isNumber(args[1]) then
		IONXFLYSPEED = args[1]
	end
end)

Window:AddCommand('unfly', {}, 'Stops flying.', function(Arguments, Speaker)
	NOFLY()
end)

Window:AddCommand('flyspeed', {'number'}, 'Changes the fly speed', function(Arguments, Speaker)
    local speed = Arguments[1] or 2
	if isNumber(speed) then
		IONXFLYSPEED = speed
	end
end)

Floating = false
floatName = randomString()
Window:AddCommand('float', {}, 'Allows you to float', function(Arguments, Speaker)
    Floating = true
	local pchar = Speaker.Character
	if pchar and not pchar:FindFirstChild(floatName) then
		task.spawn(function()
			local Float = Instance.new('Part')
			Float.Name = floatName
			Float.Parent = pchar
			Float.Transparency = 1
			Float.Size = Vector3.new(2,0.2,1.5)
			Float.Anchored = true
			local FloatValue = -3.1
			Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
			Window:CreateNotification('Float','Float Enabled (Q = down & E = up)',5)
			qUp = IONXMouse.KeyUp:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue + 0.5
				end
			end)
			eUp = IONXMouse.KeyUp:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue - 0.5
				end
			end)
			qDown = IONXMouse.KeyDown:Connect(function(KEY)
				if KEY == 'q' then
					FloatValue = FloatValue - 0.5
				end
			end)
			eDown = IONXMouse.KeyDown:Connect(function(KEY)
				if KEY == 'e' then
					FloatValue = FloatValue + 0.5
				end
			end)
			floatDied = Speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
				FloatingFunc:Disconnect()
				Float:Destroy()
				qUp:Disconnect()
				eUp:Disconnect()
				qDown:Disconnect()
				eDown:Disconnect()
				floatDied:Disconnect()
			end)
			local function FloatPadLoop()
				if pchar:FindFirstChild(floatName) and getRoot(pchar) then
					Float.CFrame = getRoot(pchar).CFrame * CFrame.new(0,FloatValue,0)
				else
					FloatingFunc:Disconnect()
					Float:Destroy()
					qUp:Disconnect()
					eUp:Disconnect()
					qDown:Disconnect()
					eDown:Disconnect()
					floatDied:Disconnect()
				end
			end			
			FloatingFunc = game:GetService('RunService').Heartbeat:Connect(FloatPadLoop)
		end)
	end
end)


Window:AddCommand('unfloat', {}, 'Stops floating.', function(Arguments, Speaker)
    Floating = false
	local pchar = Speaker.Character
	Window:CreateNotification('Float','Float Disabled',3)
	if pchar:FindFirstChild(floatName) then
		pchar:FindFirstChild(floatName):Destroy()
	end
	if floatDied then
		FloatingFunc:Disconnect()
		qUp:Disconnect()
		eUp:Disconnect()
		qDown:Disconnect()
		eDown:Disconnect()
		floatDied:Disconnect()
	end
end)

Window:AddCommand('swim', {}, 'Allows you to swim in the air.', function(Arguments, Speaker)
    if not swimming and Speaker and Speaker.Character and Speaker.Character:FindFirstChildWhichIsA("Humanoid") then
		oldgrav = workspace.Gravity
		workspace.Gravity = 0
		local swimDied = function()
			workspace.Gravity = oldgrav
			swimming = false
		end
		local Humanoid = Speaker.Character:FindFirstChildWhichIsA("Humanoid")
		gravReset = Humanoid.Died:Connect(swimDied)
		local enums = Enum.HumanoidStateType:GetEnumItems()
		table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
		for i, v in pairs(enums) do
			Humanoid:SetStateEnabled(v, false)
		end
		Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
		swimbeat = RunService.Heartbeat:Connect(function()
			pcall(function()
				Speaker.Character.HumanoidRootPart.Velocity = ((Humanoid.MoveDirection ~= Vector3.new() or UserInputService:IsKeyDown(Enum.KeyCode.Space)) and Speaker.Character.HumanoidRootPart.Velocity or Vector3.new())
			end)
		end)
		swimming = true
	end
end)

Window:AddCommand('unswim', {}, 'Stops you swimming in the air.', function(Arguments, Speaker)
    if Speaker and Speaker.Character and Speaker.Character:FindFirstChildWhichIsA("Humanoid") then
		workspace.Gravity = oldgrav
		swimming = false
		if gravReset then
			gravReset:Disconnect()
		end
		if swimbeat ~= nil then
			swimbeat:Disconnect()
			swimbeat = nil
		end
		local Humanoid = Speaker.Character:FindFirstChildWhichIsA("Humanoid")
		local enums = Enum.HumanoidStateType:GetEnumItems()
		table.remove(enums, table.find(enums, Enum.HumanoidStateType.None))
		for i, v in pairs(enums) do
			Humanoid:SetStateEnabled(v, true)
		end
	end
end)

Window:AddCommand('tweengoto', {'player'}, 'Tweens to a player.', function(Arguments, Speaker)
    for _,player in ipairs(game.Players:GetPlayers()) do
        if string.match(string.lower(player.DisplayName), "^"..string.lower(Arguments[1])) or string.match(string.lower(player.Name), "^"..string.lower(Arguments[1])) then
            game:GetService('TweenService'):Create(getRoot(Speaker.Character), TweenInfo.new(IONXTWEENSPEED, Enum.EasingStyle.Linear), {CFrame = game:GetService('Players')[player.Name].Character.HumanoidRootPart.CFrame}):Play()
        end
    end
end)

Window:AddCommand('tweenspeed', {'number'}, 'Sets the tween speed.', function(Arguments, Speaker)
    IONXTWEENSPEED = tonumber(Arguments[1])
end)

Window:AddCommand('fullscreen', {}, 'Fullscreens your game.', function(Arguments, Speaker)
    game:GetService('GuiService'):ToggleFullscreen()
end)

Window:AddCommand('theme', {'New Theme'}, 'Changes The Theme. [light/dark]', function(Arguments, Speaker)
    Window:ChangeTheme(Arguments[1])
end)

Window:AddCommand('load', {'http link'}, 'Loads any loadstring', function(Arguments, Speaker)
    local s,e = pcall(function()
        loadstring(game:HttpGet(tostring(Arguments[1]), true))()
    end)
    if not s and e then
        Window:CreateNotification('Loadstring error', 'There was an error loading the string',5)
    end
end)

Window:AddCommand('noclip', {}, 'Go through objects.', function(Arguments, Speaker)
    Clip = false
	task.wait(0.1)
	local function NoclipLoop()
		if Clip == false and Speaker.Character ~= nil then
			for _, child in pairs(Speaker.Character:GetDescendants()) do
				if child:IsA("BasePart") and child.CanCollide == true and child.Name ~= floatName then
					child.CanCollide = false
				end
			end
		end
	end
	Noclipping = game:GetService('RunService').Stepped:Connect(NoclipLoop)
end)

Window:AddCommand('clip', {}, 'Stop going through objects.', function(Arguments, Speaker)
    if Noclipping then
		Noclipping:Disconnect()
	end
	Clip = true
end)

Window:AddCommand('chams', {}, 'See players through walls.', function(Arguments, Speaker)
    CHMSenabled = true
	for i,v in pairs(game:GetService('Players'):GetChildren()) do
		if v.ClassName == "Player" and v.Name ~= Speaker.Name then
			CHMS(v)
		end
	end
end)

Window:AddCommand('nochams', {}, 'Disable chams.', function(Arguments, Speaker)
    CHMSenabled = false
	for i,v in pairs(game:GetService('Players'):GetChildren()) do
		local chmsplr = v
		for i,c in pairs(game:GetService('CoreGui'):GetChildren()) do
			if c.Name == chmsplr.Name..'_CHMS' then
				c:Destroy()
			end
		end
	end
end)

Window:AddCommand('bang', {'player'}, 'Bangs the selected user', function(Arguments, Speaker)
    unbang()
    task.wait()
    for _,player in ipairs(game.Players:GetPlayers()) do
        if string.match(string.lower(player.DisplayName), "^"..string.lower(Arguments[1])) or string.match(string.lower(player.Name), "^"..string.lower(Arguments[1])) then
            bangAnim = Instance.new("Animation")
            if not r15(Speaker) then
                bangAnim.AnimationId = "rbxassetid://148840371"
            else
                bangAnim.AnimationId = "rbxassetid://5918726674"
            end
            bang = Speaker.Character:FindFirstChildOfClass('Humanoid'):LoadAnimation(bangAnim)
            bang:Play(.1, 1, 1)
            bang:AdjustSpeed(3)
		
            local bangplr = player.Name
            local bangOffet = CFrame.new(0, 0, 1.1)
            bangLoop = game:GetService('RunService').Stepped:Connect(function()
                pcall(function()
                    local otherRoot = getTorso(game.Players[bangplr].Character)
                    getRoot(game.Players.LocalPlayer.Character).CFrame = otherRoot.CFrame * bangOffet
                end)
            end)
            bangDied = Speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(function()
                bangLoop = bangLoop:Disconnect()
                bang:Stop()
                bangAnim:Destroy()
                bangDied:Disconnect()
		    end)
        end
    end
end)

Window:AddCommand('unbang', {}, 'Unbangs the player.', function(Arguments, Speaker)
    unbang()
end)

Window:AddCommand('breakvelocity', {}, 'Breaks all movement velocity for a second.', function(Arguments, Speaker)
    breakvelocity()
end)

flinging = false
Window:AddCommand('fling', {}, 'Allows you to fling players.', function(Arguments, Speaker)
    flinging = false
	for _, child in pairs(Speaker.Character:GetDescendants()) do
		if child:IsA("BasePart") then
			child.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)
		end
	end
	task.wait(.1)
	local bambam = Instance.new("BodyAngularVelocity")
	bambam.Name = randomString()
	bambam.Parent = getRoot(Speaker.Character)
	bambam.AngularVelocity = Vector3.new(0,99999,0)
	bambam.MaxTorque = Vector3.new(0,math.huge,0)
	bambam.P = math.huge
	local Char = Speaker.Character:GetChildren()
	for i, v in next, Char do
		if v:IsA("BasePart") then
			v.CanCollide = false
			v.Massless = true
			v.Velocity = Vector3.new(0, 0, 0)
		end
	end
	flinging = true
	local function flingDiedF()
		unfling(plr)
	end
	flingDied = Speaker.Character:FindFirstChildOfClass('Humanoid').Died:Connect(flingDiedF)
	repeat
		bambam.AngularVelocity = Vector3.new(0,99999,0)
		task.wait(.2)
		bambam.AngularVelocity = Vector3.new(0,0,0)
		task.task.wait(.1)
	until flinging == false
end)

Window:AddCommand('unfling', {}, 'Stops flinging.', function(Arguments, Speaker)
    unfling(plr)
end)



Window:AddCommand('calculate', {'number', 'operator', 'number'}, 'Calculates a math problem.', function(Arguments, Speaker)
    local calculation = 0
    if Arguments[2] == '+' then
        calculation = tonumber(Arguments[1]) + tonumber(Arguments[3])
    elseif Arguments[2] == '-' then
        calculation = tonumber(Arguments[1]) - tonumber(Arguments[3])
    elseif Arguments[2] == '/' then
        calculation = tonumber(Arguments[1]) / tonumber(Arguments[3])
    elseif Arguments[2] == '^' then
        calculation = tonumber(Arguments[1]) ^ tonumber(Arguments[3])
    elseif Arguments[2] == '*' or Arguments[2] == 'x' then
        calculation = tonumber(Arguments[1]) * tonumber(Arguments[3])
    elseif Arguments[2] == '%' then
        calculation = tonumber(Arguments[1]) % tonumber(Arguments[3])
    else
        Window:CreateNotification('Calculation', 'Error Calculating.\nUnsupported operator')
    end
    Window:CreateNotification('Calculation', 'The result is: '..tostring(calculation),6)
end)

autogrammar_running = false
Window:AddCommand('autogrammar', {}, 'Corrects your grammar when you type.', function(Arguments, Speaker)
    if autogrammar_running then return nil end
    local OldNameCall = nil
    OldNameCall = hookmetamethod(game:GetService("ReplicatedStorage"):WaitForChild("DefaultChatSystemChatEvents"):WaitForChild("SayMessageRequest"), "__namecall", function(Self, ...)
        local Args = {...}
        local NamecallMethod = getnamecallmethod()

        if not checkcaller() and NamecallMethod == "FireServer" and Self.Name == 'SayMessageRequest' then
            local splittext = string.split(Args[1], ' ')
            local getfirst_letter = string.sub(Args[1],1,1)
        
            for i = 1, #splittext do
                if splittext[i] == 'i' then
                    splittext[i] = 'I'
                end
                if i == #splittext then
                    splittext[i] = splittext[i]..'.'
                end 
            end
            Args[1] = table.concat(splittext, ' ')
        end
    return OldNameCall(Self, unpack(Args))
end)
    Window:CreateNotification('Auto Grammar', 'Success\nRejoin to disable.',5)
    autogrammar_running = true
end)

Window:AddCommand('explorer', {}, 'Opens up DEX explorer.', function(Arguments, Speaker)
    Window:CreateNotification('Loading', 'Hold on a second.',3)
    loadstring(game:HttpGet("https://raw.githubusercontent.com/peyton2465/Dex/master/out.lua"))()
end)

Window:AddCommand('esp', {}, 'Enables ESP.', function(Arguments, Speaker)
    Window:CreateNotification('ESP', 'Requires a brain to use, check the discord to learn how to configure your esp to your likings. (using config command)',8)
    espLib:Load()
    espLib.options.enabled = true
end)

Window:AddCommand('unesp', {}, 'Disables ESP.', function(Arguments, Speaker)
    espLib:Unload()
    espLib.options.enabled = false
end)

Window:AddCommand('kick', {'reason'}, 'Kick yourself.', function(Arguments, Speaker)
    plr:Kick(Arguments[1])
end)

Window:AddCommand('shutdown', {}, 'Force shutdown roblox.', function(Arguments, Speaker)
    game:shutdown()
end)

Window:AddCommand('config', {'cmd','property','true/false'}, 'Configure commands.', function(Arguments, Speaker)
    if string.lower(Arguments[1]) == 'esp' then
        if string.lower(Arguments[2]) == 'names' then
            espLib.options.names = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'outofviewarrows' then
            espLib.options.outOfViewArrows = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'boxes' then
            espLib.options.boxes = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'tracers' then
            espLib.options.tracers = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'healthbars' then
            espLib.options.healthBars = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'healthtext' then
            espLib.options.healthText = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'chams' then
            espLib.options.chams = getResult(Arguments[3])
        elseif string.lower(Arguments[2]) == 'distance' then
            espLib.options.distance = getResult(Arguments[3])
        end
    end
end)


game:GetService('Players').LocalPlayer.OnTeleport:Connect(function(State)
	if State == Enum.TeleportState.Started then
		if queueteleport then
			queueteleport("loadstring(game:HttpGet(\"https://raw.githubusercontent.com/ioxScripts/ionx/main/scriptloader/main.lua\"))()")
		end
	end
end)


Window:CreateNotification('Success','Loaded Vortex in '..math.floor((os.clock() - start) + 0.5)..' seconds',1.5)
