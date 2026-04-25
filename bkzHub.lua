-- ================================================
--  ADMIN MENU V8 | lopine06 | Touche B pour ouvrir
-- ================================================
task.wait(1) -- attend que Roblox soit prêt

local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
local Debris = game:GetService("Debris")
local HttpService = game:GetService("HttpService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()
local playerGui = player:WaitForChild("PlayerGui")

if playerGui:FindFirstChild("AdminMenu") then playerGui.AdminMenu:Destroy() end

-- ================================================
-- THÈMES
-- ================================================
local Themes = {
	Dark = {
		BG        = Color3.fromRGB(18, 18, 24),
		Panel     = Color3.fromRGB(28, 28, 36),
		Button    = Color3.fromRGB(40, 40, 55),
		ButtonHov = Color3.fromRGB(60, 60, 80),
		Accent    = Color3.fromRGB(100, 80, 255),
		AccentHov = Color3.fromRGB(130, 110, 255),
		Text      = Color3.fromRGB(220, 220, 240),
		SubText   = Color3.fromRGB(140, 140, 170),
		Tab       = Color3.fromRGB(22, 22, 30),
		TabActive = Color3.fromRGB(100, 80, 255),
		Danger    = Color3.fromRGB(220, 60, 80),
		Success   = Color3.fromRGB(60, 200, 120),
		Warn      = Color3.fromRGB(255, 170, 50),
	},
	Light = {
		BG        = Color3.fromRGB(240, 240, 248),
		Panel     = Color3.fromRGB(255, 255, 255),
		Button    = Color3.fromRGB(220, 220, 235),
		ButtonHov = Color3.fromRGB(200, 200, 220),
		Accent    = Color3.fromRGB(100, 80, 255),
		AccentHov = Color3.fromRGB(80, 60, 220),
		Text      = Color3.fromRGB(30, 30, 50),
		SubText   = Color3.fromRGB(100, 100, 130),
		Tab       = Color3.fromRGB(230, 230, 245),
		TabActive = Color3.fromRGB(100, 80, 255),
		Danger    = Color3.fromRGB(200, 40, 60),
		Success   = Color3.fromRGB(40, 170, 90),
		Warn      = Color3.fromRGB(200, 130, 20),
	},
	Cyber = {
		BG        = Color3.fromRGB(5, 12, 20),
		Panel     = Color3.fromRGB(8, 20, 35),
		Button    = Color3.fromRGB(10, 35, 55),
		ButtonHov = Color3.fromRGB(15, 55, 80),
		Accent    = Color3.fromRGB(0, 210, 255),
		AccentHov = Color3.fromRGB(50, 230, 255),
		Text      = Color3.fromRGB(180, 240, 255),
		SubText   = Color3.fromRGB(80, 160, 200),
		Tab       = Color3.fromRGB(6, 16, 28),
		TabActive = Color3.fromRGB(0, 210, 255),
		Danger    = Color3.fromRGB(255, 50, 100),
		Success   = Color3.fromRGB(0, 255, 160),
		Warn      = Color3.fromRGB(255, 200, 0),
	},
	Rouge = {
		BG        = Color3.fromRGB(20, 8, 8),
		Panel     = Color3.fromRGB(35, 12, 12),
		Button    = Color3.fromRGB(55, 18, 18),
		ButtonHov = Color3.fromRGB(80, 28, 28),
		Accent    = Color3.fromRGB(255, 60, 80),
		AccentHov = Color3.fromRGB(255, 90, 110),
		Text      = Color3.fromRGB(255, 220, 220),
		SubText   = Color3.fromRGB(180, 120, 120),
		Tab       = Color3.fromRGB(28, 10, 10),
		TabActive = Color3.fromRGB(255, 60, 80),
		Danger    = Color3.fromRGB(255, 40, 60),
		Success   = Color3.fromRGB(60, 200, 120),
		Warn      = Color3.fromRGB(255, 170, 50),
	},
	Vert = {
		BG        = Color3.fromRGB(6, 18, 10),
		Panel     = Color3.fromRGB(10, 28, 16),
		Button    = Color3.fromRGB(14, 45, 24),
		ButtonHov = Color3.fromRGB(20, 65, 35),
		Accent    = Color3.fromRGB(50, 220, 100),
		AccentHov = Color3.fromRGB(80, 240, 130),
		Text      = Color3.fromRGB(200, 255, 220),
		SubText   = Color3.fromRGB(100, 180, 130),
		Tab       = Color3.fromRGB(8, 22, 13),
		TabActive = Color3.fromRGB(50, 220, 100),
		Danger    = Color3.fromRGB(220, 60, 80),
		Success   = Color3.fromRGB(50, 220, 100),
		Warn      = Color3.fromRGB(255, 200, 50),
	},
}
local currentTheme = Themes.Dark

-- ================================================
-- GUI ROOT
-- ================================================
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "AdminMenu"
gui.Enabled = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.ResetOnSpawn = false

-- Fenêtre principale
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 360, 0, 480)
main.Position = UDim2.new(0.5, -180, 0.5, -240)
main.BackgroundColor3 = currentTheme.BG
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 12)

-- Stroke
local stroke = Instance.new("UIStroke", main)
stroke.Color = currentTheme.Accent
stroke.Thickness = 1.5
stroke.Transparency = 0.5

-- ================================================
-- HEADER
-- ================================================
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = currentTheme.Panel
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

-- Masquer coins bas du header
local headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1, 0, 0, 12)
headerFix.Position = UDim2.new(0, 0, 1, -12)
headerFix.BackgroundColor3 = currentTheme.Panel
headerFix.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Text = "⚡ ADMIN PANEL"
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = currentTheme.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", header)
subtitle.Text = "v8.0  •  " .. player.Name
subtitle.Size = UDim2.new(1, -50, 0, 14)
subtitle.Position = UDim2.new(0, 15, 0, 30)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = currentTheme.SubText
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- Bouton fermer
local closeBtn = Instance.new("TextButton", header)
closeBtn.Text = "🚪"
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -40, 0.5, -15)
closeBtn.BackgroundColor3 = currentTheme.Danger
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 13
closeBtn.BorderSizePixel = 0
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
closeBtn.MouseButton1Click:Connect(function() gui.Enabled = false end)

-- ================================================
-- ONGLETS
-- ================================================
local tabBar = Instance.new("Frame", main)
tabBar.Size = UDim2.new(1, -20, 0, 36)
tabBar.Position = UDim2.new(0, 10, 0, 52)
tabBar.BackgroundColor3 = currentTheme.Tab
tabBar.BorderSizePixel = 0
Instance.new("UICorner", tabBar).CornerRadius = UDim.new(0, 8)
local tabLayout = Instance.new("UIListLayout", tabBar)
tabLayout.FillDirection = Enum.FillDirection.Horizontal
tabLayout.Padding = UDim.new(0, 3)
local tabPad = Instance.new("UIPadding", tabBar)
tabPad.PaddingLeft = UDim.new(0, 3); tabPad.PaddingRight = UDim.new(0, 3)
tabPad.PaddingTop = UDim.new(0, 3); tabPad.PaddingBottom = UDim.new(0, 3)

-- ================================================
-- PAGES
-- ================================================
local tabDefs = {
	{ name = "Player",   icon = "👤" },
	{ name = "Perso",    icon = "⚡" },
	{ name = "ESP",      icon = "👁" },
	{ name = "World",    icon = "🌍" },
	{ name = "Settings", icon = "⚙" },
	{ name = "Autre",    icon = "ℹ" },
}

local pages = {}
local tabBtns = {}
local activeTab = "Player"

for _, def in ipairs(tabDefs) do
	-- Page
	local page = Instance.new("ScrollingFrame", main)
	page.Name = def.name
	page.Size = UDim2.new(1, -20, 1, -102)
	page.Position = UDim2.new(0, 10, 0, 95)
	page.BackgroundTransparency = 1
	page.BorderSizePixel = 0
	page.ScrollBarThickness = 4
	page.ScrollBarImageColor3 = currentTheme.Accent
	page.Visible = (def.name == "Player")
	page.AutomaticCanvasSize = Enum.AutomaticSize.Y
	page.CanvasSize = UDim2.new(0,0,0,0)
	local layout = Instance.new("UIListLayout", page)
	layout.Padding = UDim.new(0, 6)
	layout.SortOrder = Enum.SortOrder.LayoutOrder
	local pad = Instance.new("UIPadding", page)
	pad.PaddingTop = UDim.new(0, 4)
	pages[def.name] = page

	-- Tab bouton (6 onglets → 1/6 de la largeur)
	local tb = Instance.new("TextButton", tabBar)
	tb.Text = def.icon  -- icône seule pour gagner de la place
	tb.Size = UDim2.new(0.1667, -3, 1, 0)
	tb.BackgroundColor3 = (def.name == "Player") and currentTheme.TabActive or currentTheme.Tab
	tb.TextColor3 = (def.name == "Player") and Color3.new(1,1,1) or currentTheme.SubText
	tb.Font = Enum.Font.GothamBold
	tb.TextSize = 16
	tb.BorderSizePixel = 0
	Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)
	-- Nom en petit sous l'icône
	local nameLbl = Instance.new("TextLabel", tb)
	nameLbl.Size = UDim2.new(1, 0, 0, 10)
	nameLbl.Position = UDim2.new(0, 0, 1, -11)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = def.name
	nameLbl.Font = Enum.Font.Gotham
	nameLbl.TextSize = 8
	nameLbl.TextColor3 = currentTheme.SubText
	tb.MouseButton1Click:Connect(function()
		activeTab = def.name
		for n, p in pairs(pages) do p.Visible = (n == def.name) end
		for n, b in pairs(tabBtns) do
			b.BackgroundColor3 = (n == def.name) and currentTheme.TabActive or currentTheme.Tab
			b.TextColor3 = (n == def.name) and Color3.new(1,1,1) or currentTheme.SubText
		end
	end)
	tabBtns[def.name] = tb
end

-- ================================================
-- COMPOSANTS UI HELPERS
-- ================================================
local function createSection(parent, title)
	local lbl = Instance.new("TextLabel", parent)
	lbl.Text = "  " .. string.upper(title)
	lbl.Size = UDim2.new(1, 0, 0, 22)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Accent
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 10
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.LayoutOrder = 0
end

local function createBtn(parent, text, color, order, func)
	color = color or currentTheme.Button
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 38)
	frame.BackgroundColor3 = color
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)
	local stroke2 = Instance.new("UIStroke", frame)
	stroke2.Color = Color3.new(1,1,1)
	stroke2.Transparency = 0.92
	stroke2.Thickness = 1

	local btn = Instance.new("TextButton", frame)
	btn.Text = text
	btn.Size = UDim2.new(1, 0, 1, 0)
	btn.BackgroundTransparency = 1
	btn.TextColor3 = currentTheme.Text
	btn.Font = Enum.Font.GothamSemibold
	btn.TextSize = 13
	btn.BorderSizePixel = 0

	btn.MouseEnter:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.ButtonHov}):Play()
	end)
	btn.MouseLeave:Connect(function()
		TweenService:Create(frame, TweenInfo.new(0.12), {BackgroundColor3 = color}):Play()
	end)
	btn.MouseButton1Click:Connect(func)
	return frame, btn
end

local function createToggle(parent, text, order, func)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 38)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -56, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 13
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local track = Instance.new("Frame", frame)
	track.Size = UDim2.new(0, 40, 0, 22)
	track.Position = UDim2.new(1, -50, 0.5, -11)
	track.BackgroundColor3 = Color3.fromRGB(70,70,90)
	track.BorderSizePixel = 0
	Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

	local knob = Instance.new("Frame", track)
	knob.Size = UDim2.new(0, 16, 0, 16)
	knob.Position = UDim2.new(0, 3, 0.5, -8)
	knob.BackgroundColor3 = Color3.new(1,1,1)
	knob.BorderSizePixel = 0
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local state = false
	local hitbox = Instance.new("TextButton", frame)
	hitbox.Size = UDim2.new(1, 0, 1, 0)
	hitbox.BackgroundTransparency = 1
	hitbox.Text = ""

	hitbox.MouseButton1Click:Connect(function()
		state = not state
		TweenService:Create(track, TweenInfo.new(0.2), {BackgroundColor3 = state and currentTheme.Accent or Color3.fromRGB(70,70,90)}):Play()
		TweenService:Create(knob, TweenInfo.new(0.2), {Position = state and UDim2.new(1,-19,0.5,-8) or UDim2.new(0,3,0.5,-8)}):Play()
		func(state)
	end)
	return frame
end

local function createSlider(parent, text, min, max, default, order, func)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 58)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -50, 0, 24)
	lbl.Position = UDim2.new(0, 12, 0, 4)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local valLbl = Instance.new("TextLabel", frame)
	valLbl.Text = tostring(default)
	valLbl.Size = UDim2.new(0, 40, 0, 24)
	valLbl.Position = UDim2.new(1, -50, 0, 4)
	valLbl.BackgroundTransparency = 1
	valLbl.TextColor3 = currentTheme.Accent
	valLbl.Font = Enum.Font.GothamBold
	valLbl.TextSize = 12
	valLbl.TextXAlignment = Enum.TextXAlignment.Right

	local track = Instance.new("Frame", frame)
	track.Size = UDim2.new(1, -24, 0, 6)
	track.Position = UDim2.new(0, 12, 0, 36)
	track.BackgroundColor3 = Color3.fromRGB(55,55,75)
	track.BorderSizePixel = 0
	Instance.new("UICorner", track).CornerRadius = UDim.new(1, 0)

	local fill = Instance.new("Frame", track)
	local pct = (default - min) / (max - min)
	fill.Size = UDim2.new(pct, 0, 1, 0)
	fill.BackgroundColor3 = currentTheme.Accent
	fill.BorderSizePixel = 0
	Instance.new("UICorner", fill).CornerRadius = UDim.new(1, 0)

	local knob = Instance.new("Frame", track)
	knob.Size = UDim2.new(0, 14, 0, 14)
	knob.Position = UDim2.new(pct, -7, 0.5, -7)
	knob.BackgroundColor3 = Color3.new(1,1,1)
	knob.BorderSizePixel = 0
	Instance.new("UICorner", knob).CornerRadius = UDim.new(1, 0)

	local draggingSlider = false
	local hitbox = Instance.new("TextButton", track)
	hitbox.Size = UDim2.new(1, 0, 0, 20)
	hitbox.Position = UDim2.new(0, 0, 0.5, -10)
	hitbox.BackgroundTransparency = 1
	hitbox.Text = ""

	local function updateSlider(input)
		local trackPos = track.AbsolutePosition.X
		local trackSize = track.AbsoluteSize.X
		local rel = math.clamp((input.Position.X - trackPos) / trackSize, 0, 1)
		local val = math.floor(min + (max - min) * rel)
		fill.Size = UDim2.new(rel, 0, 1, 0)
		knob.Position = UDim2.new(rel, -7, 0.5, -7)
		valLbl.Text = tostring(val)
		func(val)
	end

	hitbox.MouseButton1Down:Connect(function() draggingSlider = true end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end end)
	UIS.InputChanged:Connect(function(i) if draggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(i) end end)
	hitbox.MouseButton1Down:Connect(function(x,y) updateSlider({Position = Vector3.new(x,y,0)}) end)

	return frame
end

-- ================================================
-- DRAG (menu entier, zones non-interactives)
-- ================================================
local dragging, dragStart, startPos

local function startDrag(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true; dragStart = input.Position; startPos = main.Position
	end
end

-- Zone de drag transparente derrière tout le contenu
local dragZone = Instance.new("TextButton", main)
dragZone.Size = UDim2.new(1, 0, 1, 0)
dragZone.BackgroundTransparency = 1
dragZone.Text = ""
dragZone.ZIndex = 0
dragZone.InputBegan:Connect(startDrag)

header.InputBegan:Connect(startDrag)

UIS.InputChanged:Connect(function(input)
	if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
		local delta = input.Position - dragStart
		main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
end)
UIS.InputEnded:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
-- ================================================
-- GOKU TP
-- ================================================
local gokuMode = false

local function spawnRing(cframe, color, size)
	local ring = Instance.new("Part", workspace)
	ring.Shape = Enum.PartType.Cylinder
	ring.Size = Vector3.new(0.3, size, size)
	ring.CFrame = cframe * CFrame.Angles(0, 0, math.pi/2)
	ring.Color = color
	ring.Material = Enum.Material.Neon
	ring.Anchored = true; ring.CanCollide = false; ring.CastShadow = false
	ring.Transparency = 0.1
	TweenService:Create(ring, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.05, size * 3, size * 3),
		Transparency = 1
	}):Play()
	Debris:AddItem(ring, 0.55)
end

local function playInstantTransmissionFX(position)
	local char = player.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return end
	local hrp = char.HumanoidRootPart
	local originCFrame = hrp.CFrame

	-- Son départ : whoosh puissant
	local snd1 = Instance.new("Sound", hrp)
	snd1.SoundId = "rbxassetid://126099526912322"
	snd1.Volume = 2.5; snd1.PlaybackSpeed = 1.3
	snd1:Play(); Debris:AddItem(snd1, 2)

	-- Afterimage fantôme du perso à l'origine
	for _, part in ipairs(char:GetDescendants()) do
		if part:IsA("BasePart") then
			local ghost = Instance.new("Part", workspace)
			ghost.Size = part.Size
			ghost.CFrame = part.CFrame
			ghost.Anchored = true; ghost.CanCollide = false; ghost.CastShadow = false
			ghost.Material = Enum.Material.Neon
			ghost.Color = Color3.fromRGB(120, 210, 255)
			ghost.Transparency = 0.3
			TweenService:Create(ghost, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {Transparency = 1}):Play()
			Debris:AddItem(ghost, 0.45)
		end
	end

	-- Pilier de lumière à l'origine
	local pillar = Instance.new("Part", workspace)
	pillar.Size = Vector3.new(2.5, 40, 2.5)
	pillar.CFrame = originCFrame * CFrame.new(0, 20, 0)
	pillar.Color = Color3.fromRGB(150, 220, 255)
	pillar.Material = Enum.Material.Neon
	pillar.Anchored = true; pillar.CanCollide = false; pillar.Transparency = 0.2
	TweenService:Create(pillar, TweenInfo.new(0.45, Enum.EasingStyle.Quad), {
		Transparency = 1, Size = Vector3.new(7, 40, 7)
	}):Play()
	Debris:AddItem(pillar, 0.5)

	-- Anneaux départ
	spawnRing(originCFrame, Color3.fromRGB(100, 200, 255), 5)
	spawnRing(originCFrame, Color3.fromRGB(255, 255, 255), 2.5)

	-- TP effectif
	task.wait(0.06)
	hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))

	-- Son impact arrivée
	local snd2 = Instance.new("Sound", hrp)
	snd2.SoundId = "rbxassetid://135938385687045"
	snd2.Volume = 2; snd2.PlaybackSpeed = 0.85
	snd2:Play(); Debris:AddItem(snd2, 2)

	local arrCF = hrp.CFrame

	-- Shockwave sol arrivée
	local wave = Instance.new("Part", workspace)
	wave.Shape = Enum.PartType.Cylinder
	wave.Size = Vector3.new(0.2, 2, 2)
	wave.CFrame = arrCF * CFrame.new(0,-3,0) * CFrame.Angles(0,0,math.pi/2)
	wave.Color = Color3.fromRGB(200, 240, 255)
	wave.Material = Enum.Material.Neon
	wave.Anchored = true; wave.CanCollide = false
	TweenService:Create(wave, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.05, 25, 25), Transparency = 1
	}):Play()
	Debris:AddItem(wave, 0.55)

	-- Anneaux arrivée (3 couches)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 180), 6)
	spawnRing(arrCF, Color3.fromRGB(100, 200, 255), 3.5)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 255), 1.8)

	-- Éclat central arrivée
	local burst = Instance.new("Part", workspace)
	burst.Shape = Enum.PartType.Ball
	burst.Size = Vector3.new(3, 3, 3)
	burst.CFrame = arrCF
	burst.Color = Color3.fromRGB(230, 250, 255)
	burst.Material = Enum.Material.Neon
	burst.Anchored = true; burst.CanCollide = false
	TweenService:Create(burst, TweenInfo.new(0.4, Enum.EasingStyle.Quad), {
		Size = Vector3.new(14, 14, 14), Transparency = 1
	}):Play()
	Debris:AddItem(burst, 0.45)
end

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and gokuMode and input.KeyCode == Enum.KeyCode.F then
		-- Son de téléportation (whoosh + impact)
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local sndTP = Instance.new("Sound", hrp)
			sndTP.SoundId = "rbxassetid://126099526912322"  -- whoosh téléportation
			sndTP.Volume = 1.5; sndTP.PlaybackSpeed = 1.2
			sndTP:Play(); Debris:AddItem(sndTP, 2)

			local sndImpact = Instance.new("Sound", hrp)
			sndImpact.SoundId = "rbxassetid://135938385687045"  -- impact arrivée
			sndImpact.Volume = 1; sndImpact.PlaybackSpeed = 0.9
			task.delay(0.05, function() sndImpact:Play() end)
			Debris:AddItem(sndImpact, 2)
		end
		playInstantTransmissionFX(mouse.Hit.p)
	end
end)

-- ================================================
-- PAGE PLAYER
-- ================================================
createSection(pages.Player, "Ciblage")

-- Conteneur recherche joueur (input + bouton refresh)
local searchRow = Instance.new("Frame", pages.Player)
searchRow.Size = UDim2.new(1, 0, 0, 38)
searchRow.BackgroundTransparency = 1
searchRow.BorderSizePixel = 0
searchRow.LayoutOrder = 1

-- Champ texte de recherche
local ddFrame = Instance.new("Frame", searchRow)
ddFrame.Size = UDim2.new(1, -44, 1, 0)
ddFrame.Position = UDim2.new(0, 0, 0, 0)
ddFrame.BackgroundColor3 = currentTheme.Button
ddFrame.BorderSizePixel = 0
Instance.new("UICorner", ddFrame).CornerRadius = UDim.new(0, 8)

local searchBox = Instance.new("TextBox", ddFrame)
searchBox.PlaceholderText = "  👤  Rechercher un joueur..."
searchBox.Text = ""
searchBox.Size = UDim2.new(1, -10, 1, 0)
searchBox.Position = UDim2.new(0, 10, 0, 0)
searchBox.BackgroundTransparency = 1
searchBox.TextColor3 = currentTheme.Text
searchBox.PlaceholderColor3 = currentTheme.SubText
searchBox.Font = Enum.Font.Gotham
searchBox.TextSize = 12
searchBox.TextXAlignment = Enum.TextXAlignment.Left
searchBox.ClearTextOnFocus = false

-- Bouton Refresh
local refreshFrame = Instance.new("Frame", searchRow)
refreshFrame.Size = UDim2.new(0, 38, 1, 0)
refreshFrame.Position = UDim2.new(1, -38, 0, 0)
refreshFrame.BackgroundColor3 = currentTheme.Accent
refreshFrame.BorderSizePixel = 0
Instance.new("UICorner", refreshFrame).CornerRadius = UDim.new(0, 8)

local refreshBtn = Instance.new("TextButton", refreshFrame)
refreshBtn.Text = "🔄"
refreshBtn.Size = UDim2.new(1, 0, 1, 0)
refreshBtn.BackgroundTransparency = 1
refreshBtn.TextColor3 = Color3.new(1,1,1)
refreshBtn.Font = Enum.Font.GothamBold
refreshBtn.TextSize = 16

refreshBtn.MouseEnter:Connect(function()
	TweenService:Create(refreshFrame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.AccentHov}):Play()
end)
refreshBtn.MouseLeave:Connect(function()
	TweenService:Create(refreshFrame, TweenInfo.new(0.12), {BackgroundColor3 = currentTheme.Accent}):Play()
end)

-- Liste déroulante résultats
local ddList = Instance.new("ScrollingFrame", pages.Player)
ddList.Size = UDim2.new(1, 0, 0, 0)
ddList.BackgroundColor3 = currentTheme.Panel
ddList.BorderSizePixel = 0
ddList.ScrollBarThickness = 3
ddList.Visible = false
ddList.LayoutOrder = 2
ddList.AutomaticCanvasSize = Enum.AutomaticSize.Y
ddList.CanvasSize = UDim2.new(0,0,0,0)
Instance.new("UICorner", ddList).CornerRadius = UDim.new(0, 8)
Instance.new("UIListLayout", ddList).Padding = UDim.new(0, 2)

local targetPlayer = nil

-- Sélectionne un joueur et ferme la liste
local function selectPlayer(p)
	targetPlayer = p
	searchBox.Text = p.Name
	searchBox.TextColor3 = currentTheme.Text
	TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,0)}):Play()
	task.wait(0.15); ddList.Visible = false
end

-- Filtre et peuple la liste selon le texte saisi
local function updateDD(filter)
	filter = filter and filter:lower() or ""
	for _, c in pairs(ddList:GetChildren()) do if c:IsA("TextButton") then c:Destroy() end end
	local results = {}
	for _, p in pairs(Players:GetPlayers()) do
		if filter == "" or p.Name:lower():find(filter, 1, true) then
			table.insert(results, p)
		end
	end
	for _, p in ipairs(results) do
		local pb = Instance.new("TextButton", ddList)
		pb.Text = "  " .. p.Name
		pb.Size = UDim2.new(1, 0, 0, 30)
		pb.BackgroundColor3 = Color3.fromRGB(0,0,0)
		pb.BackgroundTransparency = 1
		pb.TextColor3 = currentTheme.Text
		pb.Font = Enum.Font.Gotham
		pb.TextSize = 12
		pb.TextXAlignment = Enum.TextXAlignment.Left
		pb.MouseEnter:Connect(function() pb.BackgroundTransparency = 0.8 end)
		pb.MouseLeave:Connect(function() pb.BackgroundTransparency = 1 end)
		pb.MouseButton1Click:Connect(function() selectPlayer(p) end)
	end
	local h = math.min(#results * 32, 130)
	ddList.Visible = h > 0
	if h > 0 then
		TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,h)}):Play()
	end
end

-- Ouvre/refresh la liste complète
local function refreshDD()
	searchBox.Text = ""
	updateDD("")
end

-- Événements champ texte
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	updateDD(searchBox.Text)
end)

-- TAB ou Entrée → sélectionne le premier résultat visible
searchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
		for _, c in pairs(ddList:GetChildren()) do
			if c:IsA("TextButton") then
				-- trouve le joueur correspondant
				local name = c.Text:gsub("^%s+", "")
				local p = Players:FindFirstChild(name)
				if p then selectPlayer(p) end
				return
			end
		end
	end
end)

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	if input.KeyCode == Enum.KeyCode.Tab and searchBox:IsFocused() then
		for _, c in pairs(ddList:GetChildren()) do
			if c:IsA("TextButton") then
				local name = c.Text:gsub("^%s+", "")
				local p = Players:FindFirstChild(name)
				if p then selectPlayer(p) end
				return
			end
		end
	end
end)

-- Bouton refresh
refreshBtn.MouseButton1Click:Connect(function()
	refreshDD()
end)

-- Ouvre la liste au focus
searchBox.Focused:Connect(function()
	updateDD(searchBox.Text)
end)

createSection(pages.Player, "Actions")

-- Info panel joueur cible
local infoPanel = Instance.new("Frame", pages.Player)
infoPanel.Size = UDim2.new(1, 0, 0, 60)
infoPanel.BackgroundColor3 = currentTheme.Panel
infoPanel.BorderSizePixel = 0
infoPanel.LayoutOrder = 2
Instance.new("UICorner", infoPanel).CornerRadius = UDim.new(0, 8)
local infoPad = Instance.new("UIPadding", infoPanel)
infoPad.PaddingLeft = UDim.new(0, 10)
infoPad.PaddingTop = UDim.new(0, 6)

local infoName = Instance.new("TextLabel", infoPanel)
infoName.Text = "Aucun joueur sélectionné"
infoName.Size = UDim2.new(1, -10, 0, 20)
infoName.BackgroundTransparency = 1
infoName.TextColor3 = currentTheme.Text
infoName.Font = Enum.Font.GothamBold
infoName.TextSize = 12
infoName.TextXAlignment = Enum.TextXAlignment.Left

local infoStats = Instance.new("TextLabel", infoPanel)
infoStats.Text = ""
infoStats.Size = UDim2.new(1, -10, 0, 16)
infoStats.Position = UDim2.new(0, 0, 0, 22)
infoStats.BackgroundTransparency = 1
infoStats.TextColor3 = currentTheme.SubText
infoStats.Font = Enum.Font.Gotham
infoStats.TextSize = 10
infoStats.TextXAlignment = Enum.TextXAlignment.Left

local infoHP = Instance.new("TextLabel", infoPanel)
infoHP.Text = ""
infoHP.Size = UDim2.new(1, -10, 0, 16)
infoHP.Position = UDim2.new(0, 0, 0, 38)
infoHP.BackgroundTransparency = 1
infoHP.TextColor3 = Color3.fromRGB(80, 220, 80)
infoHP.Font = Enum.Font.Gotham
infoHP.TextSize = 10
infoHP.TextXAlignment = Enum.TextXAlignment.Left

-- Met à jour le panel quand targetPlayer change
local _origSelectPlayer = selectPlayer
selectPlayer = function(p)
	_origSelectPlayer(p)
	infoName.Text = "👤  " .. p.Name .. "  (ID: " .. p.UserId .. ")"
	local teamName = p.Team and p.Team.Name or "Aucune"
	infoStats.Text = "🏷  " .. (p.DisplayName ~= p.Name and p.DisplayName or p.Name) .. "   🚩 Équipe: " .. teamName
	local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
	else
		infoHP.Text = "❤  HP: N/A"
	end
end

-- Update HP en live sur le panel
RunService.Heartbeat:Connect(function()
	if targetPlayer and targetPlayer.Character then
		local hum = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
		if hum then
			infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
		end
	end
end)

createBtn(pages.Player, "🎥  Spectate", currentTheme.Button, 3, function()
	if targetPlayer and targetPlayer.Character then
		workspace.CurrentCamera.CameraSubject = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
	end
end)
createBtn(pages.Player, "⏹  Stop Spectate", currentTheme.Button, 4, function()
	if player.Character then workspace.CurrentCamera.CameraSubject = player.Character:FindFirstChildOfClass("Humanoid") end
end)
createBtn(pages.Player, "📍  TP joueur vers moi", currentTheme.Button, 5, function()
	if not (targetPlayer and targetPlayer.Character and player.Character) then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	local theirHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP and theirHRP then
		local wasAnchored = theirHRP.Anchored
		theirHRP.Anchored = false
		pcall(function() theirHRP.CFrame = myHRP.CFrame * CFrame.new(2, 0, 0) end)
		task.wait(0.05)
		theirHRP.Anchored = wasAnchored
	end
end)
createBtn(pages.Player, "🚀  Me TP vers le joueur", currentTheme.Button, 6, function()
	if not (targetPlayer and targetPlayer.Character and player.Character) then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	local theirHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP and theirHRP then
		pcall(function() myHRP.CFrame = theirHRP.CFrame * CFrame.new(2, 2, 0) end)
	end
end)
-- Chat Spy : écoute les messages du joueur cible via TextChatService ou legacy chat
local chatSpyConn = nil
local chatSpyTarget = nil

local function startChatSpy(p)
	if chatSpyConn then chatSpyConn:Disconnect(); chatSpyConn = nil end
	chatSpyTarget = p
	-- Tente d'utiliser TextChatService (nouveaux jeux Roblox)
	local TCS = game:GetService("TextChatService")
	if TCS and TCS.MessageReceived then
		chatSpyConn = TCS.MessageReceived:Connect(function(msg)
			if msg.TextSource and msg.TextSource.UserId == p.UserId then
				showNotification("💬  " .. p.Name .. " : " .. msg.Text, 5)
			end
		end)
	end
end

createBtn(pages.Player, "💬  Chat Spy ON/OFF", currentTheme.Button, 7, function()
	if chatSpyConn then
		chatSpyConn:Disconnect(); chatSpyConn = nil
		showNotification("👁  Chat spy désactivé", 2)
	else
		if targetPlayer then
			startChatSpy(targetPlayer)
			showNotification("👁  Chat spy actif sur " .. targetPlayer.Name, 3)
		else
			showNotification("❌  Sélectionne un joueur d'abord", 2)
		end
	end
end)

-- ================================================
-- PAGE PERSO
-- ================================================
createSection(pages.Perso, "🏃  Mouvement")

createToggle(pages.Perso, "⚡  Goku TP (F + souris)", 1, function(state)
	gokuMode = state
end)

createSlider(pages.Perso, "🏃  Vitesse de marche", 16, 150, 16, 2, function(val)
	if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
		player.Character.Humanoid.WalkSpeed = val
	end
end)

createSlider(pages.Perso, "🦘  Puissance de saut", 7, 200, 50, 3, function(val)
	if player.Character and player.Character:FindFirstChildOfClass("Humanoid") then
		player.Character.Humanoid.JumpPower = val
	end
end)

createToggle(pages.Perso, "🧊  Freeze (immobile)", 4, function(state)
	if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
		player.Character.HumanoidRootPart.Anchored = state
	end
end)
createSection(pages.Perso, "🦅  Vol")

local flyEnabled = false
local flyBodyVel, flyBodyGyro
local flySpeed = 40

local function enableFly()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	hum:ChangeState(Enum.HumanoidStateType.Physics)

	flyBodyVel = Instance.new("BodyVelocity", hrp)
	flyBodyVel.Velocity = Vector3.zero
	flyBodyVel.MaxForce = Vector3.new(1e5, 1e5, 1e5)

	flyBodyGyro = Instance.new("BodyGyro", hrp)
	flyBodyGyro.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
	flyBodyGyro.P = 1e4
	flyBodyGyro.D = 100

	RunService:BindToRenderStep("Fly", Enum.RenderPriority.Character.Value + 1, function()
		if not flyEnabled then return end
		local cam = workspace.CurrentCamera

		local dir = Vector3.zero
		if UIS:IsKeyDown(Enum.KeyCode.W) then dir = dir + cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.S) then dir = dir - cam.CFrame.LookVector end
		if UIS:IsKeyDown(Enum.KeyCode.A) then dir = dir - cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.D) then dir = dir + cam.CFrame.RightVector end
		if UIS:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0,1,0) end
		if UIS:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0,1,0) end

		if dir.Magnitude > 0 then dir = dir.Unit end

		flyBodyVel.Velocity = dir * flySpeed
		flyBodyGyro.CFrame = cam.CFrame
	end)
end

local function disableFly()
	RunService:UnbindFromRenderStep("Fly")
	if flyBodyVel then flyBodyVel:Destroy(); flyBodyVel = nil end
	if flyBodyGyro then flyBodyGyro:Destroy(); flyBodyGyro = nil end
	local char = player.Character
	if char then
		local hum = char:FindFirstChildOfClass("Humanoid")
		if hum then hum:ChangeState(Enum.HumanoidStateType.GettingUp) end
	end
end

createToggle(pages.Perso, "🦅  Fly  (WASD + Space/Ctrl)", 5, function(state)
	flyEnabled = state
	if state then enableFly() else disableFly() end
end)

createSlider(pages.Perso, "🦅  Vitesse du fly", 10, 900, 40, 6, function(val)
	flySpeed = val
end)

createSection(pages.Perso, "👁  Collision & Visuel")

createToggle(pages.Perso, "🕶  Noclip (traverser les murs)", 5, function(state)
	if state then
		RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value + 1, function()
			local char = player.Character
			if not char then return end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
					part.CanCollide = false
				end
			end
			local hrp = char:FindFirstChild("HumanoidRootPart")
			if hrp then hrp.CanCollide = false end
		end)
	else
		RunService:UnbindFromRenderStep("Noclip")
		local char = player.Character
		if char then
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = true end
			end
		end
	end
end)

createSection(pages.Perso, "🛡  Survie")

-- God Mode
local godConn = nil
createToggle(pages.Perso, "🛡  God Mode (invincible)", 6, function(state)
	if state then
		godConn = RunService.Heartbeat:Connect(function()
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum.Health = hum.MaxHealth end
		end)
	else
		if godConn then godConn:Disconnect(); godConn = nil end
	end
end)

-- Infinite Jump
local jumpConn = nil
createToggle(pages.Perso, "🦘  Infinite Jump", 7, function(state)
	if state then
		jumpConn = UIS.JumpRequest:Connect(function()
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
		end)
	else
		if jumpConn then jumpConn:Disconnect(); jumpConn = nil end
	end
end)

createSection(pages.Perso, "🎯  Combat")

-- ================================================
-- AIM LOCK — système complet
-- ================================================
local aimLockEnabled  = false   -- feature activée
local aimLockActive   = false   -- actuellement en train de viser
local aimLockConn     = nil
local aimLockMode     = "hold"  -- "hold" ou "toggle"
local aimLockKey      = "Mouse2" -- touche par défaut = clic droit
local aimBindingMode  = false   -- attend une touche

-- Trouve le joueur visible le plus proche
local function getAimTarget()
	local cam = workspace.CurrentCamera
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end
	local closest, closestDist = nil, math.huge
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local head = p.Character:FindFirstChild("Head")
			local hrp  = p.Character:FindFirstChild("HumanoidRootPart")
			local tgt  = head or hrp
			if tgt then
				-- FOV check (angle par rapport au centre écran)
				local screenPos, onScreen = cam:WorldToViewportPoint(tgt.Position)
				local vp = cam.ViewportSize
				local dx = screenPos.X - vp.X / 2
				local dy = screenPos.Y - vp.Y / 2
				local fovDist = math.sqrt(dx*dx + dy*dy)
				local worldDist = (tgt.Position - myHRP.Position).Magnitude
				-- Pondération : FOV prioritaire, distance secondaire
				local score = fovDist + worldDist * 0.5
				if onScreen and fovDist < 300 and score < closestDist then
					closestDist = score
					closest = p
				end
			end
		end
	end
	return closest
end

local function startAimLoop()
	if aimLockConn then return end
	aimLockConn = RunService.RenderStepped:Connect(function()
		if not aimLockActive then return end
		local t = getAimTarget()
		if not t or not t.Character then return end
		local head = t.Character:FindFirstChild("Head") or t.Character:FindFirstChild("HumanoidRootPart")
		if not head then return end
		local cam = workspace.CurrentCamera
		local dir = (head.Position - cam.CFrame.Position).Unit
		-- Smooth aim (lerp)
		local targetCF = CFrame.new(cam.CFrame.Position, cam.CFrame.Position + dir)
		cam.CFrame = cam.CFrame:Lerp(targetCF, 0.25)
	end)
end

local function stopAimLoop()
	if aimLockConn then aimLockConn:Disconnect(); aimLockConn = nil end
	aimLockActive = false
end

-- Gestion entrée clavier/souris pour activer l'aimlock
local function isAimKey(input)
	if aimLockKey == "Mouse2" then
		return input.UserInputType == Enum.UserInputType.MouseButton2
	elseif aimLockKey == "Mouse1" then
		return input.UserInputType == Enum.UserInputType.MouseButton1
	elseif aimLockKey == "Mouse3" then
		return input.UserInputType == Enum.UserInputType.MouseButton3
	elseif Enum.KeyCode[aimLockKey] then
		return input.KeyCode == Enum.KeyCode[aimLockKey]
	end
	return false
end

UIS.InputBegan:Connect(function(input, gpe)
	if gpe then return end
	-- Mode rebind : capture la prochaine touche
	if aimBindingMode then
		if input.UserInputType == Enum.UserInputType.MouseButton2 then
			aimLockKey = "Mouse2"
		elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
			aimLockKey = "Mouse1"
		elseif input.KeyCode ~= Enum.KeyCode.Unknown then
			aimLockKey = input.KeyCode.Name
		end
		aimBindingMode = false
		showNotification("🎯  Touche aim : " .. aimLockKey, 2)
		return
	end
	if not aimLockEnabled then return end
	if isAimKey(input) then
		if aimLockMode == "hold" then
			aimLockActive = true
		else -- toggle
			aimLockActive = not aimLockActive
		end
	end
end)

UIS.InputEnded:Connect(function(input)
	if aimLockMode == "hold" and isAimKey(input) then
		aimLockActive = false
	end
end)

-- ================================================
-- UI AIM LOCK (section dans Perso)
-- ================================================
createSection(pages.Perso, "🎯  Aim Lock")

-- Label déclaré EN PREMIER pour que refreshAimLabel fonctionne
local aimKeyLabel = Instance.new("TextLabel", pages.Perso)
aimKeyLabel.Size = UDim2.new(1, 0, 0, 20)
aimKeyLabel.BackgroundTransparency = 1
aimKeyLabel.TextColor3 = currentTheme.SubText
aimKeyLabel.Font = Enum.Font.Gotham; aimKeyLabel.TextSize = 11
aimKeyLabel.Text = "  Touche : " .. aimLockKey .. "  |  Mode : " .. aimLockMode
aimKeyLabel.TextXAlignment = Enum.TextXAlignment.Left
aimKeyLabel.LayoutOrder = 8

local function refreshAimLabel()
	aimKeyLabel.Text = "  Touche : " .. aimLockKey .. "  |  Mode : " .. aimLockMode
end

-- Toggle ON/OFF
createToggle(pages.Perso, "🎯  Aim Lock ON/OFF", 9, function(state)
	aimLockEnabled = state
	if state then startAimLoop() else stopAimLoop() end
end)

-- Dropdown générique
local function createDropdown(parent, label, options, defaultIdx, order, onChange)
	local selectedIdx = defaultIdx
	local open = false

	local headerF = Instance.new("Frame", parent)
	headerF.Size = UDim2.new(1, 0, 0, 34)
	headerF.BackgroundColor3 = currentTheme.Button
	headerF.BorderSizePixel = 0
	headerF.LayoutOrder = order
	Instance.new("UICorner", headerF).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", headerF)
	lbl.Size = UDim2.new(1, -34, 1, 0)
	lbl.Position = UDim2.new(0, 10, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = label .. " : " .. options[selectedIdx]
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.Gotham; lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local arrow = Instance.new("TextLabel", headerF)
	arrow.Size = UDim2.new(0, 24, 1, 0)
	arrow.Position = UDim2.new(1, -28, 0, 0)
	arrow.BackgroundTransparency = 1
	arrow.Text = "▾"; arrow.TextColor3 = currentTheme.SubText
	arrow.Font = Enum.Font.GothamBold; arrow.TextSize = 14

	local listF = Instance.new("ScrollingFrame", parent)
	listF.Size = UDim2.new(1, 0, 0, 0)
	listF.CanvasSize = UDim2.new(0, 0, 0, 0)
	listF.AutomaticCanvasSize = Enum.AutomaticSize.Y
	listF.BackgroundColor3 = currentTheme.Panel
	listF.BorderSizePixel = 0
	listF.ScrollBarThickness = 3
	listF.ClipsDescendants = true
	listF.Visible = false
	listF.LayoutOrder = order
	Instance.new("UICorner", listF).CornerRadius = UDim.new(0, 8)
	Instance.new("UIListLayout", listF).Padding = UDim.new(0, 1)

	for i, opt in ipairs(options) do
		local row = Instance.new("TextButton", listF)
		row.Size = UDim2.new(1, 0, 0, 28)
		row.BackgroundTransparency = 1
		row.Text = "  " .. opt
		row.TextColor3 = currentTheme.Text
		row.Font = Enum.Font.Gotham; row.TextSize = 12
		row.TextXAlignment = Enum.TextXAlignment.Left
		row.BorderSizePixel = 0
		row.MouseEnter:Connect(function() row.BackgroundTransparency = 0.85 end)
		row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
		row.MouseButton1Click:Connect(function()
			selectedIdx = i
			lbl.Text = label .. " : " .. options[selectedIdx]
			onChange(options[selectedIdx])
			open = false
			TweenService:Create(listF, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,0)}):Play()
			task.delay(0.16, function() listF.Visible = false end)
		end)
	end

	local headerBtn = Instance.new("TextButton", headerF)
	headerBtn.Size = UDim2.new(1, 0, 1, 0)
	headerBtn.BackgroundTransparency = 1; headerBtn.Text = ""
	headerBtn.MouseButton1Click:Connect(function()
		open = not open
		listF.Visible = true
		local h = open and math.min(#options * 29, 200) or 0
		TweenService:Create(listF, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,h)}):Play()
		if not open then task.delay(0.16, function() listF.Visible = false end) end
	end)
end

-- Souris — toutes les options
local MOUSE_OPTIONS = {
	"Mouse2  —  Clic droit",
	"Mouse1  —  Clic gauche",
	"Mouse3  —  Clic molette",
}
local function mouseOptToKey(opt)
	if opt:find("Mouse2") then return "Mouse2"
	elseif opt:find("Mouse1") then return "Mouse1"
	else return "Mouse3" end
end

-- Clavier — liste complète
local KEY_OPTIONS = {
	-- Lettres courantes
	"E","R","T","Y","U","G","H","J","K","L",
	"X","C","V","B","N","M","Z","Q",
	-- Modificateurs
	"LeftAlt","RightAlt",
	"LeftShift","RightShift",
	"LeftControl","RightControl",
	-- Touches fonction
	"F1","F2","F3","F4","F5","F6","F7","F8",
	-- Chiffres
	"One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Zero",
	-- Pavé numérique
	"KeypadOne","KeypadTwo","KeypadThree","KeypadFour","KeypadFive",
	-- Autres
	"Tab","CapsLock","Space","BackSpace","Delete",
	"Insert","Home","End","PageUp","PageDown",
	"Up","Down","Left","Right",
	"Comma","Period","Semicolon","Quote","Slash","BackSlash",
	"Minus","Equals","LeftBracket","RightBracket",
}

createDropdown(pages.Perso, "🖱  Touche souris", MOUSE_OPTIONS, 1, 10, function(opt)
	aimLockKey = mouseOptToKey(opt)
	refreshAimLabel()
	showNotification("🎯  Aim : " .. aimLockKey, 2)
end)

createDropdown(pages.Perso, "⌨  Touche clavier", KEY_OPTIONS, 1, 11, function(opt)
	aimLockKey = opt
	refreshAimLabel()
	showNotification("🎯  Aim : " .. aimLockKey, 2)
end)

createBtn(pages.Perso, "🔄  Mode Hold / Toggle", currentTheme.Button, 12, function()
	aimLockMode = (aimLockMode == "hold") and "toggle" or "hold"
	refreshAimLabel()
	showNotification("🎯  Mode : " .. aimLockMode, 2)
end)

createSection(pages.Perso, "📐  Apparence")

local currentScale = 1.0

local function applyScale(val)
	currentScale = val / 100
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	-- Attendre que les ValueObjects soient chargés
	local function setScale()
		local bd = hum:FindFirstChild("BodyDepthScale")
		local bh = hum:FindFirstChild("BodyHeightScale")
		local bw = hum:FindFirstChild("BodyWidthScale")
		local hs = hum:FindFirstChild("HeadScale")
		if bd then bd.Value = currentScale end
		if bh then bh.Value = currentScale end
		if bw then bw.Value = currentScale end
		if hs then hs.Value = currentScale end
	end
	setScale()
end

-- Applique aussi au respawn
player.CharacterAdded:Connect(function(char)
	task.wait(0.5)
	applyScale(currentScale * 100)
end)

createSlider(pages.Perso, "📐  Taille du personnage", 50, 200, 100, 9, function(val)
	applyScale(val)
end)

-- ================================================
-- PAGE WORLD
-- ================================================
createSection(pages.World, "☀  Environnement")

local shader = nil
for _, v in pairs(Lighting:GetChildren()) do if v.Name == "AdminShader" then shader = v; break end end
if not shader then shader = Instance.new("ColorCorrectionEffect", Lighting); shader.Name = "AdminShader"; shader.Enabled = false end

createToggle(pages.World, "🎨  Shaders cinématiques", 1, function(state)
	shader.Enabled = state
	if state then
		shader.Brightness = -0.05; shader.Contrast = 0.08
		shader.Saturation = 0.15; shader.TintColor = Color3.fromRGB(255, 240, 220)
	end
end)

createToggle(pages.World, "🌙  Mode nuit", 2, function(state)
	if state then
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=0, Brightness=0.5, Ambient=Color3.fromRGB(20,20,50)}):Play()
	else
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=14, Brightness=2, Ambient=Color3.fromRGB(100,100,100)}):Play()
	end
end)

createSlider(pages.World, "☀  Heure du jour", 0, 24, 14, 3, function(val)
	Lighting.ClockTime = val
end)

createToggle(pages.World, "🌈  Ciel Rainbow", 4, function(state)
	if state then
		local hue = 0
		RunService:BindToRenderStep("RainbowSky", 1, function()
			hue = (hue + 0.001) % 1
			Lighting.Ambient = Color3.fromHSV(hue, 0.6, 0.9)
			Lighting.OutdoorAmbient = Color3.fromHSV((hue+0.3)%1, 0.5, 0.8)
		end)
	else
		RunService:UnbindFromRenderStep("RainbowSky")
		Lighting.Ambient = Color3.fromRGB(100,100,100)
		Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
	end
end)

-- Brouillard
createSection(pages.World, "🌫  Météo")

createSection(pages.World, "🌫  Météo & Effets")

local function getAtmo()
	local a = Lighting:FindFirstChildOfClass("Atmosphere")
	if not a then a = Instance.new("Atmosphere", Lighting) end
	return a
end

createToggle(pages.World, "🌫  Brouillard dense", 5, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.85 or 0.3,
		Offset  = state and 0.1  or 0,
	}):Play()
end)

createToggle(pages.World, "☁  Brouillard léger", 6, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.5 or 0.3,
	}):Play()
end)

-- Pluie : ParticleEmitter via rbxassetid connu + son ambiance
createToggle(pages.World, "🌧  Pluie", 7, function(state)
	RunService:UnbindFromRenderStep("AdminRain")
	local old = workspace:FindFirstChild("AdminRain")
	if old then old:Destroy() end
	if not state then return end

	local rain = Instance.new("Part", workspace)
	rain.Name = "AdminRain"; rain.Anchored = true
	rain.CanCollide = false; rain.Transparency = 1
	rain.Size = Vector3.new(300, 1, 300)

	local ps = Instance.new("ParticleEmitter", rain)
	ps.Texture      = "rbxassetid://3125510843"   -- goutte de pluie
	ps.Rate         = 800
	ps.Lifetime     = NumberRange.new(0.8, 1.4)
	ps.Speed        = NumberRange.new(80, 100)
	ps.SpreadAngle  = Vector2.new(3, 3)
	ps.Size         = NumberSequence.new(0.06)
	ps.Color        = ColorSequence.new(Color3.fromRGB(180, 210, 255))
	ps.Rotation     = NumberRange.new(90, 90)
	ps.RotSpeed     = NumberRange.new(0, 0)
	ps.LightEmission = 0

	local snd = Instance.new("Sound", rain)
	snd.SoundId = "rbxassetid://1660819739"   -- ambiance pluie
	snd.Volume = 0.7; snd.Looped = true; snd:Play()

	RunService:BindToRenderStep("AdminRain", 1, function()
		local c = player.Character
		if c and c:FindFirstChild("HumanoidRootPart") then
			rain.CFrame = CFrame.new(c.HumanoidRootPart.Position + Vector3.new(0, 40, 0))
		end
	end)
end)

-- Neige : une seule instance, texture correcte
createToggle(pages.World, "❄  Neige", 8, function(state)
	RunService:UnbindFromRenderStep("AdminSnow")
	local old = workspace:FindFirstChild("AdminSnow")
	if old then old:Destroy() end

	if state then
		local snow = Instance.new("Part", workspace)
		snow.Name = "AdminSnow"; snow.Anchored = true
		snow.CanCollide = false; snow.Transparency = 1
		snow.Size = Vector3.new(200, 1, 200)

		local ps = Instance.new("ParticleEmitter", snow)
		ps.Texture      = "rbxassetid://2344870656"   -- flocon de neige
		ps.Rate         = 300
		ps.Lifetime     = NumberRange.new(3, 5)
		ps.Speed        = NumberRange.new(10, 20)
		ps.SpreadAngle  = Vector2.new(25, 25)
		ps.Size         = NumberSequence.new({
			NumberSequenceKeypoint.new(0, 0.25),
			NumberSequenceKeypoint.new(1, 0.05),
		})
		ps.Color        = ColorSequence.new(Color3.fromRGB(220, 235, 255))
		ps.Rotation     = NumberRange.new(0, 360)
		ps.RotSpeed     = NumberRange.new(-30, 30)
		ps.LightEmission = 0.2

		TweenService:Create(Lighting, TweenInfo.new(2), {
			Ambient = Color3.fromRGB(160, 180, 210),
			OutdoorAmbient = Color3.fromRGB(180, 200, 230),
		}):Play()

		RunService:BindToRenderStep("AdminSnow", 1, function()
			local c = player.Character
			if c and c:FindFirstChild("HumanoidRootPart") then
				snow.CFrame = CFrame.new(c.HumanoidRootPart.Position + Vector3.new(0, 30, 0))
			end
		end)
	else
		TweenService:Create(Lighting, TweenInfo.new(1.5), {
			Ambient = Color3.fromRGB(100,100,100),
			OutdoorAmbient = Color3.fromRGB(128,128,128),
		}):Play()
	end
end)

createToggle(pages.World, "🌅  Coucher de soleil", 9, function(state)
	if state then
		TweenService:Create(Lighting, TweenInfo.new(2), {
			ClockTime = 18, Brightness = 1.2,
			Ambient = Color3.fromRGB(80,30,10),
			OutdoorAmbient = Color3.fromRGB(180,80,30),
		}):Play()
		shader.Enabled = true
		shader.TintColor = Color3.fromRGB(255,180,120)
		shader.Saturation = 0.3
	else
		shader.Enabled = false
		TweenService:Create(Lighting, TweenInfo.new(1.5), {
			Brightness = 2,
			Ambient = Color3.fromRGB(100,100,100),
			OutdoorAmbient = Color3.fromRGB(128,128,128),
		}):Play()
	end
end)

createSection(pages.World, "⏩  Temps")

createSlider(pages.World, "☀  Heure du jour", 0, 24, 14, 10, function(val)
	Lighting.ClockTime = val
end)

createSlider(pages.World, "⏩  Vitesse du temps (x)", 0, 5, 0, 11, function(val)
	RunService:UnbindFromRenderStep("AdminTimeSpeed")
	if val > 0 then
		RunService:BindToRenderStep("AdminTimeSpeed", 1, function(dt)
			Lighting.ClockTime = (Lighting.ClockTime + dt * val) % 24
		end)
	end
end)

createSection(pages.World, "⚙  Physique")

createSlider(pages.World, "🌍  Gravité", 0, 300, 196, 12, function(val)
	workspace.Gravity = val
end)
createBtn(pages.World, "↩  Reset gravité", currentTheme.Button, 13, function()
	workspace.Gravity = 196
end)

createSection(pages.World, "🖥  Performance")

createBtn(pages.World, "🔓  Unlock FPS", currentTheme.Button, 14, function()
	if setfpscap then RunService:BindToRenderStep("FPSUnlock",1,function() setfpscap(0) end) end
end)
createBtn(pages.World, "🔒  Reset FPS (60)", currentTheme.Button, 15, function()
	RunService:UnbindFromRenderStep("FPSUnlock")
	if setfpscap then setfpscap(60) end
end)

-- ================================================
-- PAGE SETTINGS
-- ================================================

-- Taille stockée pour éviter le bug AbsoluteSize+tween
local menuW, menuH = 360, 480

local function applyMenuSize(w, h)
	menuW, menuH = w, h
	main.Size = UDim2.new(0, menuW, 0, menuH)
end

-- Fonction centrale d'application du thème
local function applyTheme(t)
	currentTheme = t
	main.BackgroundColor3 = t.BG
	stroke.Color = t.Accent
	header.BackgroundColor3 = t.Panel
	headerFix.BackgroundColor3 = t.Panel
	title.TextColor3 = t.Text
	subtitle.TextColor3 = t.SubText
	tabBar.BackgroundColor3 = t.Tab
	for name, btn in pairs(tabBtns) do
		btn.BackgroundColor3 = (name == activeTab) and t.TabActive or t.Tab
		btn.TextColor3 = (name == activeTab) and Color3.new(1,1,1) or t.SubText
	end
end

createSection(pages.Settings, "🎨  Thème")
createBtn(pages.Settings, "🌑  Sombre",  currentTheme.Button, 1, function() applyTheme(Themes.Dark)  end)
createBtn(pages.Settings, "🌕  Clair",   currentTheme.Button, 2, function() applyTheme(Themes.Light) end)
createBtn(pages.Settings, "💠  Cyber",   currentTheme.Button, 3, function() applyTheme(Themes.Cyber) end)
createBtn(pages.Settings, "🔴  Rouge",   currentTheme.Button, 4, function() applyTheme(Themes.Rouge) end)
createBtn(pages.Settings, "🟢  Vert",    currentTheme.Button, 5, function() applyTheme(Themes.Vert)  end)

createSection(pages.Settings, "📐  Taille")
createBtn(pages.Settings, "➕  Agrandir (+40)", currentTheme.Button, 3, function()
	applyMenuSize(menuW + 40, menuH + 40)
end)
createBtn(pages.Settings, "➖  Réduire (-40)", currentTheme.Button, 4, function()
	applyMenuSize(math.max(280, menuW - 40), math.max(380, menuH - 40))
end)
createBtn(pages.Settings, "↔  +Largeur seulement", currentTheme.Button, 5, function()
	applyMenuSize(menuW + 40, menuH)
end)
createBtn(pages.Settings, "↕  +Hauteur seulement", currentTheme.Button, 6, function()
	applyMenuSize(menuW, menuH + 40)
end)
createBtn(pages.Settings, "↩  Reset taille", currentTheme.Button, 7, function()
	applyMenuSize(360, 480)
end)
createSection(pages.Settings, "💾  Configuration")

-- Sauvegarde / chargement via writefile/readfile (exécuteurs Roblox)
local CONFIG_FILE = "AdminMenu_config.json"

local function getConfig()
	return {
		theme     = (function()
			for name, t in pairs(Themes) do if t == currentTheme then return name end end
			return "Dark"
		end)(),
		menuW     = menuW,
		menuH     = menuH,
		aimKey    = aimLockKey,
		aimMode   = aimLockMode,
		flySpeed  = flySpeed,
	}
end

local function applyConfig(cfg)
	if cfg.theme and Themes[cfg.theme] then applyTheme(Themes[cfg.theme]) end
	if cfg.menuW and cfg.menuH then applyMenuSize(cfg.menuW, cfg.menuH) end
	if cfg.aimKey  then aimLockKey  = cfg.aimKey  end
	if cfg.aimMode then aimLockMode = cfg.aimMode  end
	if cfg.flySpeed then flySpeed   = cfg.flySpeed end
	refreshAimLabel()
end

local function saveConfig()
	if not writefile then
		showNotification("❌  writefile non disponible", 3); return
	end
	local ok, err = pcall(function()
		local data = game:GetService("HttpService"):JSONEncode(getConfig())
		writefile(CONFIG_FILE, data)
	end)
	if ok then
		showNotification("✅  Config sauvegardée !", 3)
	else
		showNotification("❌  Erreur sauvegarde : " .. tostring(err), 4)
	end
end

local function loadConfig()
	if not readfile then
		showNotification("❌  readfile non disponible", 3); return
	end
	local ok, result = pcall(function()
		local raw = readfile(CONFIG_FILE)
		return game:GetService("HttpService"):JSONDecode(raw)
	end)
	if ok and result then
		applyConfig(result)
		showNotification("✅  Config chargée !", 3)
	else
		showNotification("❌  Aucune config trouvée", 3)
	end
end

createBtn(pages.Settings, "💾  Sauvegarder la config", currentTheme.Success, 20, saveConfig)
createBtn(pages.Settings, "📂  Charger la config", currentTheme.Button,  21, loadConfig)
createBtn(pages.Settings, "🗑  Reset config", currentTheme.Danger, 22, function()
	applyTheme(Themes.Dark)
	applyMenuSize(360, 480)
	aimLockKey = "Mouse2"; aimLockMode = "hold"; flySpeed = 40
	refreshAimLabel()
	showNotification("↩  Config réinitialisée", 2)
end)

createSlider(pages.Settings, "🔲  Opacité du menu", 20, 100, 100, 8, function(val)
	main.BackgroundTransparency = 1 - (val / 100)
end)

createBtn(pages.Settings, "🏠  Recentrer le menu", currentTheme.Button, 9, function()
	main.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
end)

createSection(pages.Settings, "ℹ  Info")
local infoLbl = Instance.new("TextLabel", pages.Settings)
infoLbl.Text = "🎮  [B]  → Ouvrir / Fermer\n🖱  Glisser n'importe où  → Déplacer\n⚡  Admin Menu  v6.0  •  " .. player.Name
infoLbl.Size = UDim2.new(1, 0, 0, 60)
infoLbl.BackgroundTransparency = 1
infoLbl.TextColor3 = currentTheme.SubText
infoLbl.Font = Enum.Font.Gotham
infoLbl.TextSize = 11
infoLbl.TextWrapped = true
infoLbl.TextYAlignment = Enum.TextYAlignment.Top
infoLbl.LayoutOrder = 10

-- ================================================
-- NOTIFICATION TOAST
-- ================================================
local function showNotification(message, duration)
	duration = duration or 4

	-- Conteneur toast
	local toastGui = Instance.new("ScreenGui", playerGui)
	toastGui.Name = "AdminToast"
	toastGui.ResetOnSpawn = false
	toastGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local toast = Instance.new("Frame", toastGui)
	toast.Size = UDim2.new(0, 280, 0, 54)
	toast.Position = UDim2.new(1, 10, 1, -80) -- hors écran à droite
	toast.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	toast.BorderSizePixel = 0
	toast.AnchorPoint = Vector2.new(1, 1)
	Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 12)

	-- Bordure accentuée
	local toastStroke = Instance.new("UIStroke", toast)
	toastStroke.Color = Color3.fromRGB(100, 80, 255)
	toastStroke.Thickness = 1.5
	toastStroke.Transparency = 0.3

	-- Icône colorée à gauche
	local icon = Instance.new("Frame", toast)
	icon.Size = UDim2.new(0, 4, 1, -16)
	icon.Position = UDim2.new(0, 8, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	icon.BorderSizePixel = 0
	Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

	-- Texte
	local toastLabel = Instance.new("TextLabel", toast)
	toastLabel.Text = message
	toastLabel.Size = UDim2.new(1, -26, 1, 0)
	toastLabel.Position = UDim2.new(0, 22, 0, 0)
	toastLabel.BackgroundTransparency = 1
	toastLabel.TextColor3 = Color3.fromRGB(220, 220, 240)
	toastLabel.Font = Enum.Font.GothamSemibold
	toastLabel.TextSize = 13
	toastLabel.TextXAlignment = Enum.TextXAlignment.Left
	toastLabel.TextWrapped = true
	toastLabel.RichText = true

	-- Slide-in depuis la droite
	TweenService:Create(toast, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -16, 1, -80)
	}):Play()

	-- Barre de progression
	local progress = Instance.new("Frame", toast)
	progress.Size = UDim2.new(1, 0, 0, 3)
	progress.Position = UDim2.new(0, 0, 1, -3)
	progress.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	progress.BorderSizePixel = 0
	local progressCorner = Instance.new("UICorner", progress)
	progressCorner.CornerRadius = UDim.new(0, 12)

	TweenService:Create(progress, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
		Size = UDim2.new(0, 0, 0, 3)
	}):Play()

	-- Attendre puis slide-out et détruire
	task.delay(duration, function()
		TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 10, 1, -80)
		}):Play()
		task.wait(0.35)
		toastGui:Destroy()
	end)
end

-- Affiche la notif au lancement
showNotification("⚡  Appuie sur  <b>[B]</b>  pour ouvrir le menu", 5)

-- ================================================
-- ANIMATION OUVERTURE
-- ================================================
local function openMenu()
	gui.Enabled = true
	main.Size = UDim2.new(0, menuW, 0, 0)
	main.BackgroundTransparency = 0.3
	TweenService:Create(main, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Size = UDim2.new(0, menuW, 0, menuH),
		BackgroundTransparency = 0
	}):Play()
end

local function closeMenu()
	TweenService:Create(main, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
		Size = UDim2.new(0, menuW, 0, 0),
		BackgroundTransparency = 0.3
	}):Play()
	task.wait(0.15)
	gui.Enabled = false
	main.Size = UDim2.new(0, menuW, 0, menuH)
	main.BackgroundTransparency = 0
end

closeBtn.MouseButton1Click:Connect(function()
	closeMenu()
end)

UIS.InputBegan:Connect(function(input, gpe)
	if not gpe and input.KeyCode == Enum.KeyCode.B then
		if gui.Enabled then closeMenu() else openMenu() end
	end
end)

-- ================================================
-- NUKE MODE — fusée + explosion impact
-- ================================================
local nukeEnabled = false
local nukeConn = nil

local function spawnExplosionFX(pos)
	-- Boule de feu centrale
	local ball = Instance.new("Part", workspace)
	ball.Shape = Enum.PartType.Ball
	ball.Size = Vector3.new(2,2,2)
	ball.CFrame = CFrame.new(pos)
	ball.Color = Color3.fromRGB(255, 120, 10)
	ball.Material = Enum.Material.Neon
	ball.Anchored = true; ball.CanCollide = false
	TweenService:Create(ball, TweenInfo.new(0.6, Enum.EasingStyle.Quad), {
		Size = Vector3.new(35,35,35), Transparency = 1
	}):Play()
	Debris:AddItem(ball, 0.65)

	-- Anneau d'onde de choc
	local ring = Instance.new("Part", workspace)
	ring.Size = Vector3.new(2, 0.5, 2)
	ring.CFrame = CFrame.new(pos)
	ring.Color = Color3.fromRGB(255, 220, 80)
	ring.Material = Enum.Material.Neon
	ring.Anchored = true; ring.CanCollide = false
	ring.Shape = Enum.PartType.Cylinder
	TweenService:Create(ring, TweenInfo.new(0.7, Enum.EasingStyle.Quad), {
		Size = Vector3.new(0.3, 60, 60), Transparency = 1
	}):Play()
	Debris:AddItem(ring, 0.75)

	-- Fumée noire
	for i = 1, 8 do
		local smoke = Instance.new("Part", workspace)
		smoke.Shape = Enum.PartType.Ball
		smoke.Size = Vector3.new(1,1,1)
		smoke.CFrame = CFrame.new(pos + Vector3.new(math.random(-3,3), math.random(0,2), math.random(-3,3)))
		smoke.Color = Color3.fromRGB(30, 30, 30)
		smoke.Material = Enum.Material.SmoothPlastic
		smoke.Anchored = true; smoke.CanCollide = false
		TweenService:Create(smoke, TweenInfo.new(1.5, Enum.EasingStyle.Quad), {
			Size = Vector3.new(math.random(8,18), math.random(8,18), math.random(8,18)),
			Transparency = 1,
			CFrame = smoke.CFrame * CFrame.new(0, math.random(5,15), 0)
		}):Play()
		Debris:AddItem(smoke, 1.6)
	end

	-- Son explosion
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		local boom = Instance.new("Sound", hrp)
		boom.SoundId = "rbxassetid://84792688181059"
		boom.Volume = 0; boom.RollOffMaxDistance = 200
		boom:Play(); Debris:AddItem(boom, 1)
	end
end

local function startNuke()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end

	local bv = Instance.new("BodyVelocity", hrp)
	bv.Name = "NukeBV"
	bv.Velocity = Vector3.new(0, 200, 0)
	bv.MaxForce = Vector3.new(0, 1e6, 0)

	-- Sons fusée (2 couches pour un effet plus puissant)
	local snd = Instance.new("Sound", hrp)
	snd.Name = "NukeSound"
	snd.SoundId = "rbxassetid://580125779"   -- rocket puissant
	snd.Volume = 4; snd.Looped = true; snd:Play()

	local sndBoost = Instance.new("Sound", hrp)
	sndBoost.Name = "NukeBoost"
	sndBoost.SoundId = "rbxassetid://14457824"  -- thruster grave
	sndBoost.Volume = 2.5; sndBoost.Looped = true; sndBoost:Play()

	-- Traînée de feu
	nukeConn = RunService.Heartbeat:Connect(function()
		local c = player.Character
		if not c then return end
		local h = c:FindFirstChild("HumanoidRootPart")
		if not h then return end
		local flame = Instance.new("Part", workspace)
		flame.Shape = Enum.PartType.Ball
		flame.Size = Vector3.new(math.random(1,3), math.random(1,3), math.random(1,3))
		flame.CFrame = h.CFrame * CFrame.new((math.random()-0.5)*2, -3, (math.random()-0.5)*2)
		flame.Color = math.random() > 0.4
			and Color3.fromRGB(255, math.random(80,160), 10)
			or  Color3.fromRGB(255, 220, 50)
		flame.Material = Enum.Material.Neon
		flame.Anchored = true; flame.CanCollide = false
		TweenService:Create(flame, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
			Size = Vector3.new(6,6,6), Transparency = 1,
			CFrame = flame.CFrame * CFrame.new(0,-4,0)
		}):Play()
		Debris:AddItem(flame, 0.35)
	end)
end

local function stopNuke()
	if nukeConn then nukeConn:Disconnect(); nukeConn = nil end
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if hrp then
		local bv = hrp:FindFirstChild("NukeBV"); if bv then bv:Destroy() end
		local snd = hrp:FindFirstChild("NukeSound"); if snd then snd:Destroy() end
		local sndB = hrp:FindFirstChild("NukeBoost"); if sndB then sndB:Destroy() end
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Freefall) end
	-- Explosion au point d'impact quand on atterrit
	task.spawn(function()
		task.wait(1.2)
		if char and hrp then
			spawnExplosionFX(hrp.Position)
		end
	end)
end

-- Toggle Nuke dans la page Perso
createSection(pages.Perso, "💥  Chaos & Fun")
createToggle(pages.Perso, "🚀  NUKE MODE  (propulsion + explosion)", 10, function(state)
	nukeEnabled = state
	if state then startNuke() else stopNuke() end
end)
createBtn(pages.Perso, "💣  Explosion sur place", currentTheme.Danger, 11, function()
	local char = player.Character
	local hrp  = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- Son d'explosion immédiat (2 couches : impact + basse)
	local boom1 = Instance.new("Sound", hrp)
	boom1.SoundId = "rbxassetid://138680390593747"; boom1.Volume = 5
	boom1.RollOffMaxDistance = 300; boom1:Play()
	Debris:AddItem(boom1, 4)

	local boom2 = Instance.new("Sound", hrp)
	boom2.SoundId = "rbxassetid://84792688181059"; boom2.Volume = 3  -- basse explosion
	boom2.RollOffMaxDistance = 200; boom2:Play()
	Debris:AddItem(boom2, 3)

	spawnExplosionFX(hrp.Position)

	-- Tuer le perso (via Humanoid)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		task.delay(0.1, function()
			hum.Health = 0
		end)
	end
end)
createBtn(pages.Perso, "🔄  Reset personnage", currentTheme.Button, 12, function()
	if player.Character then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum.Health = 0 end
	end
end)

-- ================================================
-- PAGE ESP
-- ================================================
local espState = {
	boxes       = false,
	names       = false,
	health      = false,
	distance    = false,
	tracers     = false,
	headDots    = false,
	skeletons   = false,
	chams       = false,
	healthBar   = false,
	snaplines   = false,
}
local espObjects = {}  -- { [player] = { parts... } }
local espConn = nil

local ESP_COLOR_ALLY   = Color3.fromRGB(50, 200, 100)
local ESP_COLOR_ENEMY  = Color3.fromRGB(255, 60, 60)
local ESP_TRACER_COLOR = Color3.fromRGB(255, 255, 50)

-- Nettoie tous les objets ESP d'un joueur
local function clearESPFor(p)
	if espObjects[p] then
		for _, obj in ipairs(espObjects[p]) do
			if obj and obj.Parent then obj:Destroy() end
		end
		espObjects[p] = nil
	end
end

-- Construit l'ESP pour un joueur selon les états actifs
local function buildESPFor(p)
	clearESPFor(p)
	local char = p.Character
	if not char or p == player then return end

	local objs = {}

	-- Team check : allié = bleu, ennemi = rouge (couleurs modifiables)
	local isAlly = (player.Team ~= nil) and (p.Team == player.Team)
	local color  = isAlly and ESP_COLOR_ALLY or ESP_COLOR_ENEMY

	local hum = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- 1. CHAMS (Highlight) — toujours en dessous des autres éléments
	if espState.chams then
		local hl = Instance.new("Highlight", char)
		hl.Name = "ESP_Highlight"
		hl.FillColor       = color
		hl.OutlineColor    = color
		hl.FillTransparency    = isAlly and 0.75 or 0.6
		hl.OutlineTransparency = 0
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		table.insert(objs, hl)
	end

	-- 2. SELECTION BOX (box 3D autour du perso entier)
	if espState.boxes then
		local box = Instance.new("SelectionBox", workspace)
		box.Adornee        = char
		box.Color3         = color
		box.LineThickness  = 0.05
		box.SurfaceColor3  = color
		box.SurfaceTransparency = isAlly and 0.92 or 0.85
		table.insert(objs, box)
	end

	-- 3. HEAD DOT (cercle sur la tête)
	if espState.headDots then
		local head = char:FindFirstChild("Head")
		if head then
			local bb = Instance.new("BillboardGui", head)
			bb.Name = "ESP_HeadDot"; bb.AlwaysOnTop = true
			bb.Size = UDim2.new(0, 16, 0, 16)
			bb.StudsOffset = Vector3.new(0, 0.6, 0)
			bb.MaxDistance = 800
			local dot = Instance.new("Frame", bb)
			dot.Size = UDim2.new(1,0,1,0)
			dot.BackgroundColor3 = color
			dot.BorderSizePixel = 0
			Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
			-- contour blanc
			local stroke = Instance.new("UIStroke", dot)
			stroke.Color = Color3.new(1,1,1); stroke.Thickness = 1.5
			table.insert(objs, bb)
		end
	end

	-- 4. NAMETAG (nom + tag allié/ennemi)
	if espState.names then
		local bb = Instance.new("BillboardGui", hrp)
		bb.Name = "ESP_Name"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 140, 0, 24)
		bb.StudsOffset = Vector3.new(0, 3.6, 0)
		bb.MaxDistance = 800

		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = Color3.fromRGB(0,0,0)
		bg.BackgroundTransparency = 0.45
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(0, 4)

		local lbl = Instance.new("TextLabel", bg)
		lbl.Size = UDim2.new(1,-4,1,0)
		lbl.Position = UDim2.new(0,2,0,0)
		lbl.BackgroundTransparency = 1
		lbl.Text = (isAlly and "🔵 " or "🔴 ") .. p.Name
		lbl.TextColor3 = color
		lbl.Font = Enum.Font.GothamBold
		lbl.TextSize = 12
		lbl.TextStrokeTransparency = 0.2
		lbl.TextStrokeColor3 = Color3.new(0,0,0)
		table.insert(objs, bb)
	end

	-- 5. SANTÉ (texte)
	if espState.health and hum then
		local bb = Instance.new("BillboardGui", hrp)
		bb.Name = "ESP_HP"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 90, 0, 16)
		bb.StudsOffset = Vector3.new(0, 2.9, 0)
		bb.MaxDistance = 600
		local lbl = Instance.new("TextLabel", bb)
		lbl.Size = UDim2.new(1,0,1,0)
		lbl.BackgroundTransparency = 1
		lbl.Text = "❤ " .. math.floor(hum.Health) .. "/" .. math.floor(hum.MaxHealth)
		local pct0 = hum.Health / math.max(hum.MaxHealth, 1)
		lbl.TextColor3 = Color3.fromRGB(math.floor(255*(1-pct0)), math.floor(200*pct0+55), 50)
		lbl.Font = Enum.Font.GothamBold; lbl.TextSize = 11
		lbl.TextStrokeTransparency = 0.3; lbl.TextStrokeColor3 = Color3.new(0,0,0)
		hum.HealthChanged:Connect(function(h)
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			lbl.Text = "❤ " .. math.floor(h) .. "/" .. math.floor(hum.MaxHealth)
			lbl.TextColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(200*pct+55), 50)
		end)
		table.insert(objs, bb)
	end

	-- 6. BARRE DE SANTÉ verticale
	if espState.healthBar and hum then
		local bb = Instance.new("BillboardGui", hrp)
		bb.Name = "ESP_HealthBar"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 6, 0, 64)
		bb.StudsOffset = Vector3.new(-1.6, 0, 0)
		bb.MaxDistance = 600
		-- Fond sombre
		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = Color3.fromRGB(20,20,20)
		bg.BackgroundTransparency = 0.3
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(1,0)
		-- Fill
		local fill = Instance.new("Frame", bg)
		fill.AnchorPoint = Vector2.new(0,1)
		fill.Position = UDim2.new(0,0,1,0)
		local pct0 = math.clamp(hum.Health / math.max(hum.MaxHealth,1), 0, 1)
		fill.Size = UDim2.new(1,0, pct0, 0)
		fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct0)), math.floor(220*pct0+35), 50)
		fill.BorderSizePixel = 0
		Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)
		hum.HealthChanged:Connect(function(h)
			local pct = math.clamp(h / math.max(hum.MaxHealth,1), 0, 1)
			TweenService:Create(fill, TweenInfo.new(0.15), {
				Size = UDim2.new(1,0,pct,0),
				BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(220*pct+35), 50),
			}):Play()
		end)
		table.insert(objs, bb)
	end

	-- 7. DISTANCE
	if espState.distance then
		local bb = Instance.new("BillboardGui", hrp)
		bb.Name = "ESP_Dist"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 80, 0, 14)
		bb.StudsOffset = Vector3.new(0, 2.3, 0)
		bb.MaxDistance = 1000
		local lbl = Instance.new("TextLabel", bb)
		lbl.Size = UDim2.new(1,0,1,0)
		lbl.BackgroundTransparency = 1
		lbl.Text = "?m"
		lbl.TextColor3 = Color3.fromRGB(200,200,255)
		lbl.Font = Enum.Font.Gotham; lbl.TextSize = 10
		lbl.TextStrokeTransparency = 0.4; lbl.TextStrokeColor3 = Color3.new(0,0,0)
		table.insert(objs, bb)
	end

	-- 8. TRACER (point au pied)
	if espState.tracers then
		local bb = Instance.new("BillboardGui", hrp)
		bb.Name = "ESP_Tracer"; bb.AlwaysOnTop = true
		bb.Size = UDim2.new(0, 8, 0, 8)
		bb.StudsOffset = Vector3.new(0, -3, 0)
		bb.MaxDistance = 800
		local dot = Instance.new("Frame", bb)
		dot.Size = UDim2.new(1,0,1,0)
		dot.BackgroundColor3 = color
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
		table.insert(objs, bb)
	end

	-- 9. SQUELETTE (Beams entre joints)
	if espState.skeletons then
		local JOINTS = {
			{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
			{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
			{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
			{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
			{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
		}
		for _, pair in ipairs(JOINTS) do
			local a = char:FindFirstChild(pair[1])
			local b = char:FindFirstChild(pair[2])
			if a and b then
				local att0 = Instance.new("Attachment", a)
				local att1 = Instance.new("Attachment", b)
				local beam = Instance.new("Beam", a)
				beam.Attachment0 = att0; beam.Attachment1 = att1
				beam.Color = ColorSequence.new(color)
				beam.Width0 = 0.06; beam.Width1 = 0.06
				beam.FaceCamera = true
				beam.Transparency = NumberSequence.new(0.15)
				beam.LightEmission = 0.4
				table.insert(objs, att0); table.insert(objs, att1); table.insert(objs, beam)
			end
		end
	end

	espObjects[p] = objs
end

-- Met à jour distance chaque seconde
local function updateDistances()
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end
	for p, objs in pairs(espObjects) do
		if p.Character then
			local hrp = p.Character:FindFirstChild("HumanoidRootPart")
			if hrp then
				local dist = math.floor((hrp.Position - myHRP.Position).Magnitude)
				for _, obj in ipairs(objs) do
					if obj:IsA("BillboardGui") and obj.Name == "ESP_Dist" then
						local lbl = obj:FindFirstChildOfClass("TextLabel")
						if lbl then lbl.Text = dist .. "m" end
					end
				end
			end
		end
	end
end

-- Reconstruit tout l'ESP quand un état change
local function refreshAllESP()
	for _, p in ipairs(Players:GetPlayers()) do
		buildESPFor(p)
	end
end

-- ================================================

local function toggleESP(key, state)
	espState[key] = state
	refreshAllESP()
end

-- Helper dropdown couleur ESP
local function createColorDropdown(parent, label, order, defaultColor, onChange)
	local colors = {
		{"Rouge",  Color3.fromRGB(255,60,60)},
		{"Orange", Color3.fromRGB(255,140,30)},
		{"Jaune",  Color3.fromRGB(255,220,50)},
		{"Vert",   Color3.fromRGB(50,220,100)},
		{"Cyan",   Color3.fromRGB(0,210,255)},
		{"Bleu",   Color3.fromRGB(80,160,255)},
		{"Violet", Color3.fromRGB(180,80,255)},
		{"Blanc",  Color3.fromRGB(240,240,240)},
		{"Rose",   Color3.fromRGB(255,100,180)},
	}
	local selected = defaultColor
	local open = false

	-- Bouton principal
	local headerF = Instance.new("Frame", parent)
	headerF.Size = UDim2.new(1,0,0,34)
	headerF.BackgroundColor3 = currentTheme.Button
	headerF.BorderSizePixel = 0
	headerF.LayoutOrder = order
	Instance.new("UICorner", headerF).CornerRadius = UDim.new(0,8)

	local swatch = Instance.new("Frame", headerF)
	swatch.Size = UDim2.new(0,14,0,14)
	swatch.Position = UDim2.new(0,10,0.5,-7)
	swatch.BackgroundColor3 = selected
	swatch.BorderSizePixel = 0
	Instance.new("UICorner", swatch).CornerRadius = UDim.new(1,0)

	local lbl = Instance.new("TextLabel", headerF)
	lbl.Size = UDim2.new(1,-60,1,0)
	lbl.Position = UDim2.new(0,30,0,0)
	lbl.BackgroundTransparency = 1
	lbl.Text = label
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.Gotham; lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local arrow = Instance.new("TextLabel", headerF)
	arrow.Size = UDim2.new(0,24,1,0)
	arrow.Position = UDim2.new(1,-28,0,0)
	arrow.BackgroundTransparency = 1
	arrow.Text = "▾"; arrow.TextColor3 = currentTheme.SubText
	arrow.Font = Enum.Font.GothamBold; arrow.TextSize = 13

	-- Liste déroulante
	local listF = Instance.new("Frame", parent)
	listF.Size = UDim2.new(1,0,0,0)
	listF.BackgroundColor3 = currentTheme.Panel
	listF.BorderSizePixel = 0
	listF.ClipsDescendants = true
	listF.LayoutOrder = order
	Instance.new("UICorner", listF).CornerRadius = UDim.new(0,8)
	local ll = Instance.new("UIListLayout", listF)
	ll.Padding = UDim.new(0,2)

	for _, pair in ipairs(colors) do
		local cname, cval = pair[1], pair[2]
		local row = Instance.new("TextButton", listF)
		row.Size = UDim2.new(1,0,0,28)
		row.BackgroundTransparency = 1
		row.Text = ""
		row.BorderSizePixel = 0

		local dot = Instance.new("Frame", row)
		dot.Size = UDim2.new(0,12,0,12)
		dot.Position = UDim2.new(0,10,0.5,-6)
		dot.BackgroundColor3 = cval
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)

		local rl = Instance.new("TextLabel", row)
		rl.Size = UDim2.new(1,-30,1,0)
		rl.Position = UDim2.new(0,28,0,0)
		rl.BackgroundTransparency = 1
		rl.Text = cname
		rl.TextColor3 = currentTheme.Text
		rl.Font = Enum.Font.Gotham; rl.TextSize = 11
		rl.TextXAlignment = Enum.TextXAlignment.Left

		row.MouseEnter:Connect(function() row.BackgroundTransparency = 0.8 end)
		row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
		row.MouseButton1Click:Connect(function()
			selected = cval
			swatch.BackgroundColor3 = cval
			onChange(cval)
			open = false
			TweenService:Create(listF, TweenInfo.new(0.15), {Size=UDim2.new(1,0,0,0)}):Play()
			task.wait(0.15); listF.Visible = false
		end)
	end

	local headerBtn = Instance.new("TextButton", headerF)
	headerBtn.Size = UDim2.new(1,0,1,0)
	headerBtn.BackgroundTransparency = 1
	headerBtn.Text = ""
	headerBtn.MouseButton1Click:Connect(function()
		open = not open
		listF.Visible = true
		local h = open and (#colors * 30 + 4) or 0
		TweenService:Create(listF, TweenInfo.new(0.15), {Size=UDim2.new(1,0,0,h)}):Play()
		if not open then task.wait(0.15); listF.Visible = false end
	end)
end

-- UI ESP dans pages.ESP
createSection(pages.ESP, "⚡  Raccourcis")
createBtn(pages.ESP, "⚡  Tout activer", currentTheme.Accent, 0, function()
	for k in pairs(espState) do espState[k] = true end
	refreshAllESP()
end)
createBtn(pages.ESP, "❌  Tout désactiver", currentTheme.Danger, 1, function()
	for k in pairs(espState) do espState[k] = false end
	for _, p in ipairs(Players:GetPlayers()) do clearESPFor(p) end
end)

createSection(pages.ESP, "👤  Affichage joueurs")
createToggle(pages.ESP, "📦  Boxes", 2, function(s) toggleESP("boxes", s) end)
createToggle(pages.ESP, "🏷  Noms + tag équipe", 3, function(s) toggleESP("names", s) end)
createToggle(pages.ESP, "❤  Santé (texte)", 4, function(s) toggleESP("health", s) end)
createToggle(pages.ESP, "📊  Barre de santé", 5, function(s) toggleESP("healthBar", s) end)
createToggle(pages.ESP, "📏  Distance", 6, function(s) toggleESP("distance", s) end)

createSection(pages.ESP, "🎨  Visuel avancé")
createToggle(pages.ESP, "🔴  Head Dots", 7, function(s) toggleESP("headDots", s) end)
createToggle(pages.ESP, "💀  Squelette", 8, function(s) toggleESP("skeletons", s) end)
createToggle(pages.ESP, "🔆  Chams (Highlight)", 9, function(s) toggleESP("chams", s) end)
createToggle(pages.ESP, "🎯  Tracers", 10, function(s) toggleESP("tracers", s) end)
createToggle(pages.ESP, "🔫  Snaplines", 11, function(s) toggleESP("snaplines", s) end)

createSection(pages.ESP, "🎨  Couleurs")
createColorDropdown(pages.ESP, "🔴  Couleur Ennemis", 20,
	Color3.fromRGB(255,60,60),
	function(c) ESP_COLOR_ENEMY = c; refreshAllESP() end
)
createColorDropdown(pages.ESP, "🔵  Couleur Alliés", 21,
	Color3.fromRGB(80,160,255),
	function(c) ESP_COLOR_ALLY = c; refreshAllESP() end
)

-- PAGE AUTRE — Crédits
-- ================================================
createSection(pages.Autre, "👑  Crédits")

local credits = {
	{"👑  Owner",       "lopine06"},
	{"🤝  Contributeur","Toutes les personnes qui utilisent le menu"},
}

for i, entry in ipairs(credits) do
	local row = Instance.new("Frame", pages.Autre)
	row.Size = UDim2.new(1, 0, 0, 44)
	row.BackgroundColor3 = currentTheme.Panel
	row.BorderSizePixel = 0
	row.LayoutOrder = i
	Instance.new("UICorner", row).CornerRadius = UDim.new(0, 8)

	local pad = Instance.new("UIPadding", row)
	pad.PaddingLeft = UDim.new(0, 10)

	local role = Instance.new("TextLabel", row)
	role.Size = UDim2.new(1, -10, 0, 18)
	role.Position = UDim2.new(0, 0, 0, 5)
	role.BackgroundTransparency = 1
	role.Text = entry[1]
	role.TextColor3 = currentTheme.Accent
	role.Font = Enum.Font.GothamBold
	role.TextSize = 11
	role.TextXAlignment = Enum.TextXAlignment.Left

	local nameLbl = Instance.new("TextLabel", row)
	nameLbl.Size = UDim2.new(1, -10, 0, 16)
	nameLbl.Position = UDim2.new(0, 0, 0, 22)
	nameLbl.BackgroundTransparency = 1
	nameLbl.Text = entry[2]
	nameLbl.TextColor3 = currentTheme.Text
	nameLbl.Font = Enum.Font.Gotham
	nameLbl.TextSize = 12
	nameLbl.TextXAlignment = Enum.TextXAlignment.Left
	nameLbl.TextWrapped = true
end

createSection(pages.Autre, "ℹ  Version")
local verLabel = Instance.new("TextLabel", pages.Autre)
verLabel.Size = UDim2.new(1, 0, 0, 40)
verLabel.BackgroundTransparency = 1
verLabel.Text = "⚡  Admin Menu  v8.0\n🔑  Touche [B] pour ouvrir/fermer"
verLabel.TextColor3 = currentTheme.SubText
verLabel.Font = Enum.Font.Gotham
verLabel.TextSize = 11
verLabel.TextWrapped = true
verLabel.LayoutOrder = 99
	-- Écoute arrivée/départ de persos
	Players.PlayerAdded:Connect(function(p)
		p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
	end)
	Players.PlayerRemoving:Connect(function(p) clearESPFor(p) end)

	-- Loop update distance
	task.spawn(function()
		while true do
			task.wait(0.5)
			if espState.distance then updateDistances() end
		end
	end)

	-- Rebuild si perso respawn
	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player then
			p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
			buildESPFor(p)
		end
	end


-- Démarre la boucle ESP
local function startESP()
	Players.PlayerAdded:Connect(function(p)
		p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
	end)
	Players.PlayerRemoving:Connect(function(p) clearESPFor(p) end)

	task.spawn(function()
		while true do
			task.wait(0.5)
			if espState.distance then updateDistances() end
		end
	end)

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player then
			p.CharacterAdded:Connect(function() task.wait(1); buildESPFor(p) end)
			buildESPFor(p)
		end
	end
end

startESP()

-- Auto-load config au démarrage
task.spawn(function()
	task.wait(0.5)
	if readfile then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("AdminMenu_config.json"))
		end)
		if ok and result then
			applyConfig(result)
			showNotification("📂  Config chargée automatiquement !", 3)
		end
	end
end)
