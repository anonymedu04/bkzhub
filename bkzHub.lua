-- ================================================
--  bkz HUB v3.4 | By bkz | Keys B for open !
-- ================================================
task.wait(1)

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
-- ================================================
local gui = Instance.new("ScreenGui", playerGui)
gui.Name = "AdminMenu"
gui.Enabled = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.DisplayOrder = 999
gui.ResetOnSpawn = false

-- Main window
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
-- ================================================
local header = Instance.new("Frame", main)
header.Size = UDim2.new(1, 0, 0, 48)
header.BackgroundColor3 = currentTheme.Panel
header.BorderSizePixel = 0
Instance.new("UICorner", header).CornerRadius = UDim.new(0, 12)

-- Hide bottom corners of the header
local headerFix = Instance.new("Frame", header)
headerFix.Size = UDim2.new(1, 0, 0, 12)
headerFix.Position = UDim2.new(0, 0, 1, -12)
headerFix.BackgroundColor3 = currentTheme.Panel
headerFix.BorderSizePixel = 0

local title = Instance.new("TextLabel", header)
title.Text = "🌐 bkz HUB"
title.Size = UDim2.new(1, -50, 1, 0)
title.Position = UDim2.new(0, 15, 0, 0)
title.BackgroundTransparency = 1
title.TextColor3 = currentTheme.Text
title.Font = Enum.Font.GothamBold
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left

local subtitle = Instance.new("TextLabel", header)
subtitle.Text = "v3.4  •  " .. player.Name
subtitle.Size = UDim2.new(1, -50, 0, 14)
subtitle.Position = UDim2.new(0, 15, 0, 30)
subtitle.BackgroundTransparency = 1
subtitle.TextColor3 = currentTheme.SubText
subtitle.Font = Enum.Font.Gotham
subtitle.TextSize = 11
subtitle.TextXAlignment = Enum.TextXAlignment.Left

-- Close button
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
-- ================================================
local tabDefs = {
	{ name = "Player",   icon = "👤" },
	{ name = "Personal", icon = "🔒" },
	{ name = "ESP",      icon = "👁" },
	{ name = "World",    icon = "🌍" },
	{ name = "Settings", icon = "⚙" },
	{ name = "Other",    icon = "ℹ" },
}

local pages = {}
local tabBtns = {}
local activeTab = "Player"

for _, def in ipairs(tabDefs) do

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

	local tb = Instance.new("TextButton", tabBar)
	tb.Text = def.icon
	tb.Size = UDim2.new(0.1667, -3, 1, 0)
	tb.BackgroundColor3 = (def.name == "Player") and currentTheme.TabActive or currentTheme.Tab
	tb.TextColor3 = (def.name == "Player") and Color3.new(1,1,1) or currentTheme.SubText
	tb.Font = Enum.Font.GothamBold
	tb.TextSize = 16
	tb.BorderSizePixel = 0
	Instance.new("UICorner", tb).CornerRadius = UDim.new(0, 6)

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
-- ================================================
local function createSection(parent, title, order)
	local lbl = Instance.new("TextLabel", parent)
	lbl.Text = "  " .. string.upper(title)
	lbl.Size = UDim2.new(1, 0, 0, 22)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Accent
	lbl.Font = Enum.Font.GothamBold
	lbl.TextSize = 10
	lbl.TextXAlignment = Enum.TextXAlignment.Left
	lbl.LayoutOrder = order or 0
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
	lbl.Size = UDim2.new(1, -110, 0, 24)
	lbl.Position = UDim2.new(0, 12, 0, 4)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	-- Editable input box
	local inputBox = Instance.new("TextBox", frame)
	inputBox.Size = UDim2.new(0, 56, 0, 20)
	inputBox.Position = UDim2.new(1, -68, 0, 5)
	inputBox.BackgroundColor3 = Color3.fromRGB(40, 40, 55)
	inputBox.BorderSizePixel = 0
	inputBox.TextColor3 = currentTheme.Accent
	inputBox.Font = Enum.Font.GothamBold
	inputBox.TextSize = 12
	inputBox.Text = tostring(default)
	inputBox.ClearTextOnFocus = false
	inputBox.PlaceholderText = tostring(default)
	Instance.new("UICorner", inputBox).CornerRadius = UDim.new(0, 6)

	local track = Instance.new("Frame", frame)
	track.Size = UDim2.new(1, -24, 0, 6)
	track.Position = UDim2.new(0, 12, 0, 42)
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

	local currentVal = default

	local function setVal(val, fromSlider)
		local display = math.floor(val)
		if fromSlider then
			display = math.clamp(display, min, max)
		end
		currentVal = display
		local rel = math.clamp((display - min) / (max - min), 0, 1)
		fill.Size = UDim2.new(rel, 0, 1, 0)
		knob.Position = UDim2.new(rel, -7, 0.5, -7)
		inputBox.Text = tostring(display)
		func(display)
	end

	-- Manual input: type any number, press Enter or lose focus
	inputBox.FocusLost:Connect(function()
		local num = tonumber(inputBox.Text)
		if num then
			setVal(num, false)  -- no clamp for manual input
		else
			inputBox.Text = tostring(currentVal)
		end
	end)

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
		setVal(min + (max - min) * rel, true)
	end

	hitbox.MouseButton1Down:Connect(function() draggingSlider = true end)
	UIS.InputEnded:Connect(function(i) if i.UserInputType == Enum.UserInputType.MouseButton1 then draggingSlider = false end end)
	UIS.InputChanged:Connect(function(i) if draggingSlider and i.UserInputType == Enum.UserInputType.MouseMovement then updateSlider(i) end end)
	hitbox.MouseButton1Down:Connect(function(x,y) updateSlider({Position = Vector3.new(x,y,0)}) end)

	return frame
end

local function createNumberInput(parent, text, default, order, func)
	local frame = Instance.new("Frame", parent)
	frame.Size = UDim2.new(1, 0, 0, 40)
	frame.BackgroundColor3 = currentTheme.Button
	frame.BorderSizePixel = 0
	frame.LayoutOrder = order or 1
	Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

	local lbl = Instance.new("TextLabel", frame)
	lbl.Text = text
	lbl.Size = UDim2.new(1, -90, 1, 0)
	lbl.Position = UDim2.new(0, 12, 0, 0)
	lbl.BackgroundTransparency = 1
	lbl.TextColor3 = currentTheme.Text
	lbl.Font = Enum.Font.GothamSemibold
	lbl.TextSize = 12
	lbl.TextXAlignment = Enum.TextXAlignment.Left

	local box = Instance.new("TextBox", frame)
	box.Size = UDim2.new(0, 72, 0, 26)
	box.Position = UDim2.new(1, -82, 0.5, -13)
	box.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
	box.BorderSizePixel = 0
	box.TextColor3 = currentTheme.Accent
	box.Font = Enum.Font.GothamBold
	box.TextSize = 13
	box.Text = tostring(default)
	box.ClearTextOnFocus = false
	box.PlaceholderText = tostring(default)
	Instance.new("UICorner", box).CornerRadius = UDim.new(0, 6)

	local current = default

	box.Changed:Connect(function(prop)
		if prop == "Text" then
			box.Text = box.Text:gsub("[^%d%-%.]+", "")
		end
	end)

	box.FocusLost:Connect(function()
		local n = tonumber(box.Text)
		if n then
			current = n
			func(n)
		else
			box.Text = tostring(current)
		end
	end)

	return frame
end

-- ================================================

-- ================================================
local dragging, dragStart, startPos

local function startDrag(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 then
		dragging = true; dragStart = input.Position; startPos = main.Position
	end
end

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

	-- His departure: whoosh, powerful!
	local snd1 = Instance.new("Sound", hrp)
	snd1.SoundId = "rbxassetid://126099526912322"
	snd1.Volume = 2.5; snd1.PlaybackSpeed = 1.3
	snd1:Play(); Debris:AddItem(snd1, 2)

	-- Afterimage of the original character's ghost
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

	-- Originally a pillar of light
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

	-- Starting rings
	spawnRing(originCFrame, Color3.fromRGB(100, 200, 255), 5)
	spawnRing(originCFrame, Color3.fromRGB(255, 255, 255), 2.5)

	-- Effective TP
	task.wait(0.06)
	hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))

	-- Its arrival impact
	local snd2 = Instance.new("Sound", hrp)
	snd2.SoundId = "rbxassetid://3716468774"
	snd2.Volume = 2; snd2.PlaybackSpeed = 0.85
	snd2:Play(); Debris:AddItem(snd2, 2)

	local arrCF = hrp.CFrame

	-- Shockwave ground arrival
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

	-- Arrival rings (3 layers)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 180), 6)
	spawnRing(arrCF, Color3.fromRGB(100, 200, 255), 3.5)
	spawnRing(arrCF, Color3.fromRGB(255, 255, 255), 1.8)

	-- Central flash arrival
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

		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local sndTP = Instance.new("Sound", hrp)
			sndTP.SoundId = "rbxassetid://126099526912322"
			sndTP.Volume = 1.5; sndTP.PlaybackSpeed = 1.2
			sndTP:Play(); Debris:AddItem(sndTP, 2)

			local sndImpact = Instance.new("Sound", hrp)
			sndImpact.SoundId = "rbxassetid://135938385687045"
			sndImpact.Volume = 1; sndImpact.PlaybackSpeed = 0.9
			task.delay(0.05, function() sndImpact:Play() end)
			Debris:AddItem(sndImpact, 2)
		end
		playInstantTransmissionFX(mouse.Hit.p)
	end
end)

-- ================================================

-- ================================================
createSection(pages.Player, "Targeting", 0)

-- Player search container (input + refresh button)
local searchRow = Instance.new("Frame", pages.Player)
searchRow.Size = UDim2.new(1, 0, 0, 38)
searchRow.BackgroundTransparency = 1
searchRow.BorderSizePixel = 0
searchRow.LayoutOrder = 1

-- Search text field
local ddFrame = Instance.new("Frame", searchRow)
ddFrame.Size = UDim2.new(1, -44, 1, 0)
ddFrame.Position = UDim2.new(0, 0, 0, 0)
ddFrame.BackgroundColor3 = currentTheme.Button
ddFrame.BorderSizePixel = 0
Instance.new("UICorner", ddFrame).CornerRadius = UDim.new(0, 8)

local searchBox = Instance.new("TextBox", ddFrame)
searchBox.PlaceholderText = "  👤  Search for a player..."
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

-- Refresh button
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

-- Results drop-down list
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

-- Select a player and close the list
local function selectPlayer(p)
	targetPlayer = p
	searchBox.Text = p.Name
	searchBox.TextColor3 = currentTheme.Text
	TweenService:Create(ddList, TweenInfo.new(0.15), {Size = UDim2.new(1,0,0,0)}):Play()
	task.wait(0.15); ddList.Visible = false
end

-- Filter and populate the list according to the entered text.
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

-- Open/refresh the full list
local function refreshDD()
	searchBox.Text = ""
	updateDD("")
end

-- Text field events
searchBox:GetPropertyChangedSignal("Text"):Connect(function()
	updateDD(searchBox.Text)
end)

-- Press TAB or Enter → selects the first visible result
searchBox.FocusLost:Connect(function(enterPressed)
	if enterPressed then
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

-- Refresh button
refreshBtn.MouseButton1Click:Connect(function()
	refreshDD()
end)

-- Open the list to focus
searchBox.Focused:Connect(function()
	updateDD(searchBox.Text)
end)

createSection(pages.Player, "Actions", 2)

-- Target player panel information
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
infoName.Text = "No player selected"
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

-- Updates the panel when targetPlayer changes
local _origSelectPlayer = selectPlayer
selectPlayer = function(p)
	_origSelectPlayer(p)
	infoName.Text = "👤  " .. p.Name .. "  (ID: " .. p.UserId .. ")"
	local teamName = p.Team and p.Team.Name or "None"
	infoStats.Text = "🏷  " .. p.Name .. "   🚩 Team: " .. teamName
	local hum = p.Character and p.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		infoHP.Text = "❤  HP: " .. math.floor(hum.Health) .. " / " .. math.floor(hum.MaxHealth)
	else
		infoHP.Text = "❤  HP: N/A"
	end
end

-- HP update live on the panel
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
createBtn(pages.Player, "📍  TP Player to Me", currentTheme.Button, 5, function()
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
createBtn(pages.Player, "🚀  TP Me to Player", currentTheme.Button, 6, function()
	if not (targetPlayer and targetPlayer.Character and player.Character) then return end
	local myHRP = player.Character:FindFirstChild("HumanoidRootPart")
	local theirHRP = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
	if myHRP and theirHRP then
		pcall(function() myHRP.CFrame = theirHRP.CFrame * CFrame.new(2, 2, 0) end)
	end
end)
-- Chat Spy: Listens to the target player's messages via TextChatService or legacy chat
local chatSpyConn = nil
local chatSpyTarget = nil

local function startChatSpy(p)
	if chatSpyConn then chatSpyConn:Disconnect(); chatSpyConn = nil end
	chatSpyTarget = p
	-- Try using TextChatService (new Roblox games)
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
		showNotification("👁  Chat spy disabled", 2)
	else
		if targetPlayer then
			startChatSpy(targetPlayer)
			showNotification("👁  Chat spy active on " .. targetPlayer.Name, 3)
		else
			showNotification("❌  Select a player first", 2)
		end
	end
end)

-- ================================================

-- ================================================
createSection(pages.Personal, "🏃  Movement", 0)

local savedWalkSpeed = 16
local savedJumpPower = 50

local function applyMovement(char)
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	hum.WalkSpeed = savedWalkSpeed
	hum.JumpPower = savedJumpPower
	hum.JumpHeight = savedJumpPower * 0.3
end

player.CharacterAdded:Connect(function(char)
	task.wait(0.3)
	applyMovement(char)
end)

createToggle(pages.Personal, "⚡  Goku TP (F + Mouse)", 1, function(state)
	gokuMode = state
end)

createNumberInput(pages.Personal, "🏃  Walk Speed", 16, 2, function(val)
	savedWalkSpeed = val
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then hum.WalkSpeed = val end
end)

createNumberInput(pages.Personal, "🦘  Jump Height", 50, 3, function(val)
	savedJumpPower = val
	local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
	if hum then
		hum.JumpPower = val
		hum.JumpHeight = val * 0.3
	end
end)

createToggle(pages.Personal, "🧊  Freeze (no move)", 4, function(state)
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then hrp.Anchored = state end
end)
createSection(pages.Personal, "🦅  Fly", 5)

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

createToggle(pages.Personal, "🦅  Fly  (WASD + Space/Ctrl)", 6, function(state)
	flyEnabled = state
	if state then enableFly() else disableFly() end
end)

createNumberInput(pages.Personal, "🦅  Fly Speed", 40, 7, function(val)
	flySpeed = val
end)

createSection(pages.Personal, "👁  Collision & Visual", 8)

createToggle(pages.Personal, "🕶  Noclip (walk through walls)", 9, function(state)
	if state then
		RunService:BindToRenderStep("Noclip", Enum.RenderPriority.Character.Value + 1, function()
			local char = player.Character
			if not char then return end
			for _, part in ipairs(char:GetDescendants()) do
				if part:IsA("BasePart") then part.CanCollide = false end
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

createSection(pages.Personal, "🛡  Survival", 10)

-- God Mode — 3 methods
local godConn = nil
local godMethod = 1

local function applyGodMethod(hum)
	if godMethod == 1 then
		-- Méthode 1 : forcer Health = MaxHealth
		hum.Health = hum.MaxHealth
	elseif godMethod == 2 then
		-- Méthode 2 : MaxHealth high + Health
		hum.MaxHealth = math.huge
		hum.Health = math.huge
	elseif godMethod == 3 then
		-- Méthode 3 : HealthChanged immediate reset
		-- (separate connection managed in the toggle)
	end
end

createToggle(pages.Personal, "🛡  God Mode (invincible)", 11, function(state)
	if godConn then godConn:Disconnect(); godConn = nil end
	if state then
		godConn = RunService.Heartbeat:Connect(function()
			local char = player.Character
			if not char then return end
			local hum = char:FindFirstChildOfClass("Humanoid")
			if hum then
				pcall(applyGodMethod, hum)
				if godMethod == 3 then
					hum:SetAttribute("_godHook", true)
					if not hum:GetAttribute("_godConn") then
						hum:GetAttributeChangedSignal("Health"):Connect(function()
							if hum:GetAttribute("_godHook") then
								hum.Health = hum.MaxHealth
							end
						end)
						hum:SetAttribute("_godConn", true)
					end
				end
			end
		end)
	end
end)

local godMethodBtn = createBtn(pages.Personal, "🔧  God method: 1/3", currentTheme.Button, 12, function()
	godMethod = (godMethod % 3) + 1
	showNotification("🛡  God method: " .. godMethod, 2)
	-- Update button label
	for _, c in ipairs(godMethodBtn:GetChildren()) do
		if c:IsA("TextLabel") or c:IsA("TextButton") then
			c.Text = "🔧  God method: " .. godMethod .. "/3"
		end
	end
end)

-- Infinite Jump
local jumpConn = nil
createToggle(pages.Personal, "🦘  Infinite Jump", 13, function(state)
	if state then
		jumpConn = UIS.JumpRequest:Connect(function()
			local hum = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
			if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
		end)
	else
		if jumpConn then jumpConn:Disconnect(); jumpConn = nil end
	end
end)

createSection(pages.Personal, "🎯  Combat", 14)

-- ================================================

-- ================================================
local aimEnabled   = false
local aimActive    = false
local aimConn      = nil
local aimMode      = "hold"
local aimKey       = "Mouse2"
local aimSmooth    = 0.08
local aimFOV       = 250

-- All possible mouse buttons
local MOUSE_KEYS = {
	{ label = "Right Click  (Mouse2)",   id = "Mouse2"  },
	{ label = "Left Click  (Mouse1)",  id = "Mouse1"  },
	{ label = "Middle Click  (Mouse3)", id = "Mouse3"  },
}

-- All valid Roblo keyboard keys (KeyCode.Name)
local KEYBOARD_KEYS = {
	-- Lettres
	"A","B","C","D","E","F","G","H","I","J","K","L","M",
	"N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
	-- Chiffres rangée du haut
	"Zero","One","Two","Three","Four","Five","Six","Seven","Eight","Nine",
	-- Touches fonction
	"F1","F2","F3","F4","F5","F6","F7","F8","F9","F10","F11","F12",
	-- Modificateurs
	"LeftShift","RightShift","LeftControl","RightControl","LeftAlt","RightAlt",
	-- Navigation
	"Up","Down","Left","Right","Home","End","PageUp","PageDown","Insert","Delete",
	-- Pavé numérique
	"KeypadZero","KeypadOne","KeypadTwo","KeypadThree","KeypadFour",
	"KeypadFive","KeypadSix","KeypadSeven","KeypadEight","KeypadNine",
	"KeypadPlus","KeypadMinus","KeypadAsterisk","KeypadSlash","KeypadPeriod",
	-- Divers
	"Tab","CapsLock","Space","BackSpace","Return","Escape",
	"Minus","Equals","LeftBracket","RightBracket","BackSlash",
	"Semicolon","Quote","Comma","Period","Slash","Backquote",
}

-- Check if an input corresponds to the aim key
local function isAimInput(input, began)
	if aimKey == "Mouse1" then
		return input.UserInputType == Enum.UserInputType.MouseButton1
	elseif aimKey == "Mouse2" then
		return input.UserInputType == Enum.UserInputType.MouseButton2
	elseif aimKey == "Mouse3" then
		return input.UserInputType == Enum.UserInputType.MouseButton3
	else
		return input.UserInputType == Enum.UserInputType.Keyboard
			and input.KeyCode.Name == aimKey
	end
end

-- Find the target in the FOV
local function getTarget()
	local cam   = workspace.CurrentCamera
	local myHRP = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end

	local best, bestScore = nil, math.huge
	local vp = cam.ViewportSize
	local cx, cy = vp.X / 2, vp.Y / 2

	for _, p in ipairs(Players:GetPlayers()) do
		if p ~= player and p.Character then
			local hum  = p.Character:FindFirstChildOfClass("Humanoid")
			local head = p.Character:FindFirstChild("Head")
			if hum and hum.Health > 0 and head then
				local sp, onScreen = cam:WorldToViewportPoint(head.Position)
				if onScreen and sp.Z > 0 then
					local dx = sp.X - cx
					local dy = sp.Y - cy
					local fovDist = math.sqrt(dx*dx + dy*dy)
					if fovDist < aimFOV and fovDist < bestScore then
						bestScore = fovDist
						best = p
					end
				end
			end
		end
	end
	return best
end

-- Aim loop: 3 alternative methods depending on the game
-- Method 1: cam.CFrame direct (works on most games)
-- Method 2: mouse.Move simulation via UserInputService
-- Method 3: HumanoidRootPart CFrame orients towards target (fallback)
local aimMethod = 1   -- méthode active

local function applyAim(head)
	local cam = workspace.CurrentCamera

	if aimMethod == 1 then
		-- Direct cam.CFrame lerp
		local targetCF = CFrame.new(cam.CFrame.Position, head.Position)
		cam.CFrame = cam.CFrame:Lerp(targetCF, aimSmooth)

	elseif aimMethod == 2 then
		-- Via CameraType lock + LookAt
		local prev = cam.CameraType
		cam.CameraType = Enum.CameraType.Scriptable
		local targetCF = CFrame.new(cam.CFrame.Position, head.Position)
		cam.CFrame = cam.CFrame:Lerp(targetCF, aimSmooth)
		cam.CameraType = prev

	elseif aimMethod == 3 then
		-- Rotate from the camera to the target (useful if the camera is blocked)
		local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
		if hrp then
			local dir = (head.Position - hrp.Position) * Vector3.new(1, 0, 1)
			if dir.Magnitude > 0.1 then
				hrp.CFrame = hrp.CFrame:Lerp(
					CFrame.new(hrp.Position, hrp.Position + dir),
					aimSmooth * 2
				)
			end
		end
	end
end

local function startAim()
	if aimConn then return end
	aimConn = RunService.RenderStepped:Connect(function()
		if not aimActive then return end
		local t = getTarget()
		if not (t and t.Character) then return end
		local head = t.Character:FindFirstChild("Head")
		if not head then return end
		pcall(applyAim, head)
	end)
end

local function stopAim()
	if aimConn then aimConn:Disconnect(); aimConn = nil end
	aimActive = false
end

-- Listen InputBegan/Ended
UIS.InputBegan:Connect(function(input, gpe)
	if gpe or not aimEnabled then return end
	if isAimInput(input) then
		if aimMode == "toggle" then
			aimActive = not aimActive
		else
			aimActive = true
		end
	end
end)
UIS.InputEnded:Connect(function(input)
	if aimMode == "hold" and isAimInput(input) then
		aimActive = false
	end
end)

-- ================================================

-- ================================================
createSection(pages.Personal, "🎯  Aim Lock", 100)

-- Declaration BEFORE use
local aimStatusLabel = Instance.new("TextLabel", pages.Personal)
aimStatusLabel.Size  = UDim2.new(1, 0, 0, 18)
aimStatusLabel.BackgroundTransparency = 1
aimStatusLabel.TextColor3 = currentTheme.SubText
aimStatusLabel.Font  = Enum.Font.Gotham
aimStatusLabel.TextSize = 11
aimStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
aimStatusLabel.LayoutOrder = 100
local function updateAimStatus()
	aimStatusLabel.Text = "  Key: " .. aimKey
		.. "   Mode: " .. aimMode
		.. "   Smooth: " .. math.floor(aimSmooth * 100) .. "%"
end
updateAimStatus()

-- Main Toggle
createToggle(pages.Personal, "🎯  Aim Lock ON / OFF", 101, function(state)
	aimEnabled = state
	if state then startAim() else stopAim() end
end)

-- Slider smooth (aiming speed)
createSlider(pages.Personal, "🎚  Smooth (aim speed)", 1, 30, 8, 102, function(val)
	aimSmooth = val / 100
	updateAimStatus()
end)

-- Slider FOV
createNumberInput(pages.Personal, "🔵  FOV (radius pixels)", 250, 103, function(val)
	aimFOV = val
end)

-- Mode Hold / Toggle
createBtn(pages.Personal, "🔄  Mode: " .. aimMode, currentTheme.Button, 104, function(btn)
	aimMode = (aimMode == "hold") and "toggle" or "hold"
	updateAimStatus()
	showNotification("🎯  Mode: " .. aimMode, 2)
end)

local methodNames = {"1 - Direct Cam", "2 - Scriptable Cam", "3 - HRP Orient"}
createBtn(pages.Personal, "🔧  Method: " .. methodNames[aimMethod], currentTheme.Button, 105, function()
	aimMethod = (aimMethod % 3) + 1
	showNotification("🎯  Method: " .. methodNames[aimMethod], 2)
end)

-- Generic dropdown (declared here, used for mouse and keyboard)
local function mkDropdown(parent, label, items, defaultIdx, order, onPick)
	local selIdx = defaultIdx
	local open   = false

	local hdr = Instance.new("Frame", parent)
	hdr.Size = UDim2.new(1,0,0,34)
	hdr.BackgroundColor3 = currentTheme.Button
	hdr.BorderSizePixel  = 0
	hdr.LayoutOrder      = order
	Instance.new("UICorner", hdr).CornerRadius = UDim.new(0, 8)

	local htxt = Instance.new("TextLabel", hdr)
	htxt.Size = UDim2.new(1,-28,1,0)
	htxt.Position = UDim2.new(0,10,0,0)
	htxt.BackgroundTransparency = 1
	htxt.Text = label .. " : " .. items[selIdx]
	htxt.TextColor3 = currentTheme.Text
	htxt.Font = Enum.Font.Gotham; htxt.TextSize = 12
	htxt.TextXAlignment = Enum.TextXAlignment.Left

	local arrw = Instance.new("TextLabel", hdr)
	arrw.Size = UDim2.new(0,24,1,0)
	arrw.Position = UDim2.new(1,-26,0,0)
	arrw.BackgroundTransparency = 1
	arrw.Text = "▾"; arrw.TextColor3 = currentTheme.SubText
	arrw.Font = Enum.Font.GothamBold; arrw.TextSize = 14

	local list = Instance.new("ScrollingFrame", parent)
	list.Size = UDim2.new(1,0,0,0)
	list.CanvasSize = UDim2.new(0,0,0,0)
	list.AutomaticCanvasSize = Enum.AutomaticSize.Y
	list.BackgroundColor3 = currentTheme.Panel
	list.BorderSizePixel  = 0
	list.ScrollBarThickness = 3
	list.ClipsDescendants = true
	list.Visible = false
	list.LayoutOrder = order
	Instance.new("UICorner", list).CornerRadius = UDim.new(0, 8)
	Instance.new("UIListLayout", list).Padding = UDim.new(0, 1)

	for i, item in ipairs(items) do
		local row = Instance.new("TextButton", list)
		row.Size = UDim2.new(1,0,0,26)
		row.BackgroundTransparency = 1
		row.Text = "  " .. item
		row.TextColor3 = currentTheme.Text
		row.Font = Enum.Font.Gotham; row.TextSize = 12
		row.TextXAlignment = Enum.TextXAlignment.Left
		row.BorderSizePixel = 0
		row.MouseEnter:Connect(function() row.BackgroundTransparency = 0.8 end)
		row.MouseLeave:Connect(function() row.BackgroundTransparency = 1 end)
		row.MouseButton1Click:Connect(function()
			selIdx = i
			htxt.Text = label .. " : " .. items[selIdx]
			onPick(items[selIdx])
			open = false
			TweenService:Create(list, TweenInfo.new(0.14), {Size=UDim2.new(1,0,0,0)}):Play()
			task.delay(0.15, function() list.Visible = false end)
		end)
	end

	local hbtn = Instance.new("TextButton", hdr)
	hbtn.Size = UDim2.new(1,0,1,0)
	hbtn.BackgroundTransparency = 1; hbtn.Text = ""
	hbtn.MouseButton1Click:Connect(function()
		open = not open
		list.Visible = true
		local h = open and math.min(#items * 27, 216) or 0
		TweenService:Create(list, TweenInfo.new(0.14), {Size=UDim2.new(1,0,0,h)}):Play()
		if not open then task.delay(0.15, function() list.Visible = false end) end
	end)
end

-- Labels for dropdowns
local MOUSE_LABELS = {}
for _, m in ipairs(MOUSE_KEYS) do table.insert(MOUSE_LABELS, m.label) end

mkDropdown(pages.Personal, "🖱  Mouse", MOUSE_LABELS, 1, 105, function(lbl)
	for _, m in ipairs(MOUSE_KEYS) do
		if m.label == lbl then aimKey = m.id; break end
	end
	updateAimStatus()
end)

mkDropdown(pages.Personal, "⌨  Keyboard", KEYBOARD_KEYS, 1, 106, function(key)
	aimKey = key
	updateAimStatus()
end)

createSection(pages.Personal, "📐  Appearance", 108)

local currentScale = 1.0

local function applyScale(val)
	currentScale = val / 100
	local char = player.Character
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if not hum then return end
	-- Wait for the ValueObjects to be loaded.
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

-- Also applies to respawning
player.CharacterAdded:Connect(function(char)
	task.wait(0.5)
	applyScale(currentScale * 100)
end)

createNumberInput(pages.Personal, "📐  Character Size", 100, 109, function(val)
	applyScale(val)
end)

-- ================================================

-- ================================================
createSection(pages.World, "☀  Environment", 0)

local shader = nil
for _, v in pairs(Lighting:GetChildren()) do if v.Name == "AdminShader" then shader = v; break end end
if not shader then shader = Instance.new("ColorCorrectionEffect", Lighting); shader.Name = "AdminShader"; shader.Enabled = false end

createToggle(pages.World, "🎨  Cinematic Shaders", 1, function(state)
	shader.Enabled = state
	if state then
		shader.Brightness = -0.05; shader.Contrast = 0.08
		shader.Saturation = 0.15; shader.TintColor = Color3.fromRGB(255, 240, 220)
	end
end)

createToggle(pages.World, "🌙  Night Mode", 2, function(state)
	if state then
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=0, Brightness=0.5, Ambient=Color3.fromRGB(20,20,50)}):Play()
	else
		TweenService:Create(Lighting, TweenInfo.new(1.5), {ClockTime=14, Brightness=2, Ambient=Color3.fromRGB(100,100,100)}):Play()
	end
end)

createToggle(pages.World, "🌈  Rainbow Sky", 4, function(state)
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

-- Fog
createSection(pages.World, "🌫  Fog", 4)

createSection(pages.World, "🌫  Fog & Effects", 5)

local function getAtmo()
	local a = Lighting:FindFirstChildOfClass("Atmosphere")
	if not a then a = Instance.new("Atmosphere", Lighting) end
	return a
end

createToggle(pages.World, "🌫  Dense Fog", 5, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.85 or 0.3,
		Offset  = state and 0.1  or 0,
	}):Play()
end)

createToggle(pages.World, "☁  Light Fog", 6, function(state)
	local atmo = getAtmo()
	TweenService:Create(atmo, TweenInfo.new(1.5), {
		Density = state and 0.5 or 0.3,
	}):Play()
end)

-- Rain: ParticleEmitter via rbxassetid known + its ambiance
createToggle(pages.World, "🌧  Rain", 7, function(state)
	RunService:UnbindFromRenderStep("AdminRain")
	local old = workspace:FindFirstChild("AdminRain")
	if old then old:Destroy() end
	if not state then return end

	local rain = Instance.new("Part", workspace)
	rain.Name = "AdminRain"; rain.Anchored = true
	rain.CanCollide = false; rain.Transparency = 1
	rain.Size = Vector3.new(300, 1, 300)

	local ps = Instance.new("ParticleEmitter", rain)
	ps.Texture      = "rbxassetid://11552439884"
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
	snd.SoundId = "rbxassetid://1660819739"
	snd.Volume = 0.7; snd.Looped = true; snd:Play()

	RunService:BindToRenderStep("AdminRain", 1, function()
		local c = player.Character
		if c and c:FindFirstChild("HumanoidRootPart") then
			rain.CFrame = CFrame.new(c.HumanoidRootPart.Position + Vector3.new(0, 40, 0))
		end
	end)
end)

-- Snow: only one instance, correct texture
createToggle(pages.World, "❄  Snow", 8, function(state)
	RunService:UnbindFromRenderStep("AdminSnow")
	local old = workspace:FindFirstChild("AdminSnow")
	if old then old:Destroy() end

	if state then
		local snow = Instance.new("Part", workspace)
		snow.Name = "AdminSnow"; snow.Anchored = true
		snow.CanCollide = false; snow.Transparency = 1
		snow.Size = Vector3.new(200, 1, 200)

		local ps = Instance.new("ParticleEmitter", snow)
		ps.Texture      = "rbxassetid://15528629762"
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

createToggle(pages.World, "🌅  Sunset", 9, function(state)
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

createSection(pages.World, "⏩  Time", 9)

createNumberInput(pages.World, "☀  Time of Day", 14, 10, function(val)
	Lighting.ClockTime = val
end)

createSlider(pages.World, "⏩  Time Speed (x)", 0, 5, 0, 11, function(val)
	RunService:UnbindFromRenderStep("AdminTimeSpeed")
	if val > 0 then
		RunService:BindToRenderStep("AdminTimeSpeed", 1, function(dt)
			Lighting.ClockTime = (Lighting.ClockTime + dt * val) % 24
		end)
	end
end)

createSection(pages.World, "⚙  Physics", 11)

createNumberInput(pages.World, "🌍  Gravity", 196, 12, function(val)
	workspace.Gravity = val
end)
createBtn(pages.World, "↩  Reset Gravity", currentTheme.Button, 13, function()
	workspace.Gravity = 196
end)

createSection(pages.World, "🖥  Performance", 13)

createBtn(pages.World, "🔓  Unlock FPS", currentTheme.Button, 14, function()
	if setfpscap then RunService:BindToRenderStep("FPSUnlock",1,function() setfpscap(0) end) end
end)
createBtn(pages.World, "🔒  Reset FPS (60)", currentTheme.Button, 15, function()
	RunService:UnbindFromRenderStep("FPSUnlock")
	if setfpscap then setfpscap(60) end
end)

-- ================================================

-- ================================================

-- Size stored to avoid the AbsoluteSize+tween bug
local menuW, menuH = 360, 480

local function applyMenuSize(w, h)
	menuW, menuH = w, h
	main.Size = UDim2.new(0, menuW, 0, menuH)
end

-- Central function of theme application
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

createSection(pages.Settings, "🎨  Theme", 0)
createBtn(pages.Settings, "🌑  Dark",  currentTheme.Button, 1, function() applyTheme(Themes.Dark)  end)
createBtn(pages.Settings, "🌕  Light",   currentTheme.Button, 2, function() applyTheme(Themes.Light) end)
createBtn(pages.Settings, "💠  Cyber",   currentTheme.Button, 3, function() applyTheme(Themes.Cyber) end)
createBtn(pages.Settings, "🔴  Red",   currentTheme.Button, 4, function() applyTheme(Themes.Rouge) end)
createBtn(pages.Settings, "🟢  Green",    currentTheme.Button, 5, function() applyTheme(Themes.Vert)  end)

createSection(pages.Settings, "📐  Size", 2)
createBtn(pages.Settings, "➕  Enlarge (+40)", currentTheme.Button, 3, function()
	applyMenuSize(menuW + 40, menuH + 40)
end)
createBtn(pages.Settings, "➖  Reduce (-40)", currentTheme.Button, 4, function()
	applyMenuSize(math.max(280, menuW - 40), math.max(380, menuH - 40))
end)
createBtn(pages.Settings, "↔  +Width Only", currentTheme.Button, 5, function()
	applyMenuSize(menuW + 40, menuH)
end)
createBtn(pages.Settings, "↕  +Height Only", currentTheme.Button, 6, function()
	applyMenuSize(menuW, menuH + 40)
end)
createBtn(pages.Settings, "↩  Reset Size", currentTheme.Button, 7, function()
	applyMenuSize(360, 480)
end)
createSection(pages.Settings, "💾  Configuration", 7)

-- Save/load via writefile/readfile (Roblox executors)
local CONFIG_FILE = "AdminMenu_config.json"

local function getConfig()
	return {
		theme     = (function()
			for name, t in pairs(Themes) do if t == currentTheme then return name end end
			return "Dark"
		end)(),
		menuW     = menuW,
		menuH     = menuH,
		aimKey    = aimKey,
		aimMode   = aimMode,
		flySpeed  = flySpeed,
	}
end

local function applyConfig(cfg)
	if cfg.theme and Themes[cfg.theme] then applyTheme(Themes[cfg.theme]) end
	if cfg.menuW and cfg.menuH then applyMenuSize(cfg.menuW, cfg.menuH) end
	if cfg.aimKey  then aimKey  = cfg.aimKey  end
	if cfg.aimMode then aimMode = cfg.aimMode  end
	if cfg.flySpeed then flySpeed   = cfg.flySpeed end
	updateAimStatus()
end

local function saveConfig()
	if not writefile then
		showNotification("❌  writefile not available", 3); return
	end
	local ok, err = pcall(function()
		local data = game:GetService("HttpService"):JSONEncode(getConfig())
		writefile(CONFIG_FILE, data)
	end)
	if ok then
		showNotification("✅  Config saved!", 3)
	else
		showNotification("❌  Save error: " .. tostring(err), 4)
	end
end

local function loadConfig()
	if not readfile then
		showNotification("❌  readfile not available", 3); return
	end
	local ok, result = pcall(function()
		local raw = readfile(CONFIG_FILE)
		return game:GetService("HttpService"):JSONDecode(raw)
	end)
	if ok and result then
		applyConfig(result)
		showNotification("✅  Config loaded!", 3)
	else
		showNotification("❌  None config trouvée", 3)
	end
end

createBtn(pages.Settings, "💾  Save Config", currentTheme.Success, 20, saveConfig)
createBtn(pages.Settings, "📂  Load Config", currentTheme.Button,  21, loadConfig)
createBtn(pages.Settings, "🗑  Reset Config", currentTheme.Danger, 22, function()
	applyTheme(Themes.Dark)
	applyMenuSize(360, 480)
	aimKey = "Mouse2"; aimMode = "hold"; flySpeed = 40
	updateAimStatus()
	showNotification("↩  Config reset", 2)
end)

createSlider(pages.Settings, "🔲  Menu Opacity", 20, 100, 100, 8, function(val)
	main.BackgroundTransparency = 1 - (val / 100)
end)

createBtn(pages.Settings, "🏠  Recenter Menu", currentTheme.Button, 9, function()
	main.Position = UDim2.new(0.5, -menuW/2, 0.5, -menuH/2)
end)

createSection(pages.Settings, "ℹ  Info", 10)
local infoLbl = Instance.new("TextLabel", pages.Settings)
infoLbl.Text = "🎮  [B]  → Open / Close\n🖱  Drag anywhere → Move\n🌐 bkz HUB v3.4  •  " .. player.Name
infoLbl.Size = UDim2.new(1, 0, 0, 60)
infoLbl.BackgroundTransparency = 1
infoLbl.TextColor3 = currentTheme.SubText
infoLbl.Font = Enum.Font.Gotham
infoLbl.TextSize = 11
infoLbl.TextWrapped = true
infoLbl.TextYAlignment = Enum.TextYAlignment.Top
infoLbl.LayoutOrder = 11

-- ================================================

-- ================================================
local function showNotification(message, duration)
	duration = duration or 4

	-- Toast container
	local toastGui = Instance.new("ScreenGui", playerGui)
	toastGui.Name = "AdminToast"
	toastGui.ResetOnSpawn = false
	toastGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	local toast = Instance.new("Frame", toastGui)
	toast.Size = UDim2.new(0, 280, 0, 54)
	toast.Position = UDim2.new(1, 10, 1, -80)
	toast.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
	toast.BorderSizePixel = 0
	toast.AnchorPoint = Vector2.new(1, 1)
	Instance.new("UICorner", toast).CornerRadius = UDim.new(0, 12)

	-- Accented border
	local toastStroke = Instance.new("UIStroke", toast)
	toastStroke.Color = Color3.fromRGB(100, 80, 255)
	toastStroke.Thickness = 1.5
	toastStroke.Transparency = 0.3

	-- Colorful icon on the left
	local icon = Instance.new("Frame", toast)
	icon.Size = UDim2.new(0, 4, 1, -16)
	icon.Position = UDim2.new(0, 8, 0.5, 0)
	icon.AnchorPoint = Vector2.new(0, 0.5)
	icon.BackgroundColor3 = Color3.fromRGB(100, 80, 255)
	icon.BorderSizePixel = 0
	Instance.new("UICorner", icon).CornerRadius = UDim.new(1, 0)

	-- Text
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

	-- Slide-in from the right
	TweenService:Create(toast, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(1, -16, 1, -80)
	}):Play()

	-- Progress bar
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

	-- Wait, then slide out and destroy
	task.delay(duration, function()
		TweenService:Create(toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			Position = UDim2.new(1, 10, 1, -80)
		}):Play()
		task.wait(0.35)
		toastGui:Destroy()
	end)
end

-- Displays the notification on launch
showNotification("👉𝐁 Press <b>[B]</b> to open the menu", 5)

-- ================================================
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
-- ================================================
local nukeEnabled = false
local nukeConn = nil

local function spawnExplosionFX(pos)
	-- Central fireball
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

	-- Shockwave ring
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

	-- Black smoke
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

	-- His explosion
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if hrp then
		local boom = Instance.new("Sound", hrp)
		boom.SoundId = "rbxassetid://84792688181059"
		boom.Volume = 5; boom.RollOffMaxDistance = 300
		boom:Play(); Debris:AddItem(boom, 3)
	end
end

local function startNuke()
	local char = player.Character
	if not char then return end
	local hrp = char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Physics) end

	-- LinearVelocity (more powerful than BodyVelocity on modern Roblox)
	local att = Instance.new("Attachment", hrp)
	att.Name = "NukeAtt"
	local lv = Instance.new("LinearVelocity", hrp)
	lv.Name = "NukeBV"
	lv.Attachment0 = att
	lv.VectorVelocity = Vector3.new(0, 150, 0)
	lv.MaxForce = math.huge

	-- Rocket sounds (2 layers for a more powerful effect)
	local snd = Instance.new("Sound", hrp)
	snd.Name = "NukeSound"
	snd.SoundId = "rbxassetid://84792688181059"
	snd.Volume = 4; snd.Looped = true; snd:Play()

	local sndBoost = Instance.new("Sound", hrp)
	sndBoost.Name = "NukeBoost"
	sndBoost.SoundId = "rbxassetid://84792688181059"
	sndBoost.Volume = 2.5; sndBoost.Looped = true; sndBoost:Play()

	-- Trail of fire
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
		local bv  = hrp:FindFirstChild("NukeBV");  if bv  then bv:Destroy()  end
		local att = hrp:FindFirstChild("NukeAtt"); if att then att:Destroy() end
		local snd = hrp:FindFirstChild("NukeSound"); if snd then snd:Destroy() end
		local sndB = hrp:FindFirstChild("NukeBoost"); if sndB then sndB:Destroy() end
	end
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then hum:ChangeState(Enum.HumanoidStateType.Freefall) end
	-- Explosion at the point of impact upon landing
	task.spawn(function()
		task.wait(1.2)
		if char and hrp then
			spawnExplosionFX(hrp.Position)
		end
	end)
end

-- Toggle Nuke on the Personal page
createSection(pages.Personal, "💥  Chaos & Fun", 200)
createToggle(pages.Personal, "🚀  NUKE MODE  (propulsion + explosion)", 201, function(state)
	nukeEnabled = state
	if state then startNuke() else stopNuke() end
end)
createBtn(pages.Personal, "💣  Explode in Place", currentTheme.Danger, 202, function()
	local char = player.Character
	local hrp  = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end

	-- Immediate explosion sound (2 layers: impact + bass)
	local boom1 = Instance.new("Sound", hrp)
	boom1.SoundId = "rbxassetid://84792688181059"; boom1.Volume = 5
	boom1.RollOffMaxDistance = 300; boom1:Play()
	Debris:AddItem(boom1, 4)

	local boom2 = Instance.new("Sound", hrp)
	boom2.SoundId = "rbxassetid://3716468774"; boom2.Volume = 3
	boom2.RollOffMaxDistance = 200; boom2:Play()
	Debris:AddItem(boom2, 3)

	spawnExplosionFX(hrp.Position)

	-- Kill the character (via Humanoid)
	local hum = char:FindFirstChildOfClass("Humanoid")
	if hum then
		task.delay(0.1, function()
			hum.Health = 0
		end)
	end
end)
createBtn(pages.Personal, "🔄  Reset Character", currentTheme.Button, 203, function()
	if player.Character then
		local hum = player.Character:FindFirstChildOfClass("Humanoid")
		if hum then hum.Health = 0 end
	end
end)

-- ================================================
-- ================================================
local espState = {
	boxes     = false,
	names     = false,
	health    = false,
	distance  = false,
	tracers   = false,
	snaplines = false,
	headDots  = false,
	skeletons = false,
	chams     = false,
	healthBar = false,
	items     = false,
}
local espObjects = {}
local espConn    = nil
local espItemObjs = {}

local ESP_COLOR_ALLY  = Color3.fromRGB(50, 200, 100)
local ESP_COLOR_ENEMY = Color3.fromRGB(255, 60, 60)

-- Cleans ESP from a player
local function clearESPFor(p)
	if espObjects[p] then
		for _, obj in ipairs(espObjects[p]) do
			if obj and obj.Parent then obj:Destroy() end
		end
		espObjects[p] = nil
	end
end

-- Helper billboard compact
local function mkBB(parent, name, w, h, offsetY, maxDist)
	local bb = Instance.new("BillboardGui", parent)
	bb.Name = name; bb.AlwaysOnTop = true
	bb.Size = UDim2.new(0, w, 0, h)
	bb.StudsOffset = Vector3.new(0, offsetY, 0)
	bb.MaxDistance = maxDist or 600
	bb.LightInfluence = 0
	return bb
end

-- Compact label helper
local function mkLbl(parent, txt, size, color)
	local l = Instance.new("TextLabel", parent)
	l.Size = UDim2.new(1,0,1,0)
	l.BackgroundTransparency = 1
	l.Text = txt
	l.TextColor3 = color or Color3.new(1,1,1)
	l.Font = Enum.Font.GothamBold
	l.TextSize = size or 10
	l.TextStrokeTransparency = 0.15
	l.TextStrokeColor3 = Color3.new(0,0,0)
	l.TextScaled = false
	return l
end

local function buildESPFor(p)
	clearESPFor(p)
	local char = p.Character
	if not char or p == player then return end

	local hum = char:FindFirstChildOfClass("Humanoid")
	local hrp = char:FindFirstChild("HumanoidRootPart")
	local head = char:FindFirstChild("Head")
	if not hrp then return end

	local isAlly = player.Team ~= nil and p.Team == player.Team
	local color  = isAlly and ESP_COLOR_ALLY or ESP_COLOR_ENEMY
	local objs   = {}

	-- CHAMS (Native Roblox Highlighter — works everywhere)
	if espState.chams then
		-- Remove old highlight if present
		local old = char:FindFirstChild("ESP_Highlight")
		if old then old:Destroy() end
		local hl = Instance.new("Highlight", char)
		hl.Name = "ESP_Highlight"
		hl.FillColor = color
		hl.OutlineColor = color
		hl.FillTransparency = 0.7
		hl.OutlineTransparency = 0
		hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		table.insert(objs, hl)
	end

	-- BOX (SelectionBox)
	if espState.boxes then
		local box = Instance.new("SelectionBox", workspace)
		box.Adornee = char
		box.Color3 = color
		box.LineThickness = 0.04
		box.SurfaceColor3 = color
		box.SurfaceTransparency = 0.9
		table.insert(objs, box)
	end

	-- HEAD DOT
	if espState.headDots and head then
		local bb = mkBB(head, "ESP_HeadDot", 10, 10, 0.5, 500)
		local dot = Instance.new("Frame", bb)
		dot.Size = UDim2.new(1,0,1,0)
		dot.BackgroundColor3 = color
		dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
		local st = Instance.new("UIStroke", dot)
		st.Color = Color3.new(1,1,1); st.Thickness = 1
		table.insert(objs, bb)
	end

	-- NAME (compact, small)
	if espState.names then
		local bb = mkBB(hrp, "ESP_Name", 100, 16, 3.2, 500)
		local lbl = mkLbl(bb, p.Name, 9, color)
		lbl.Text = (isAlly and "[A] " or "[E] ") .. p.Name
		table.insert(objs, bb)
	end

	-- HEALTH text
	if espState.health and hum then
		local bb = mkBB(hrp, "ESP_HP", 80, 12, 2.6, 400)
		local lbl = mkLbl(bb, math.floor(hum.Health) .. "hp", 8,
			Color3.fromRGB(80 + math.floor(175*(1 - hum.Health/math.max(hum.MaxHealth,1))),
			200 - math.floor(150*(1 - hum.Health/math.max(hum.MaxHealth,1))), 50))
		hum.HealthChanged:Connect(function(h)
			local pct = math.clamp(h/math.max(hum.MaxHealth,1),0,1)
			lbl.Text = math.floor(h) .. "hp"
			lbl.TextColor3 = Color3.fromRGB(80+math.floor(175*(1-pct)), 200-math.floor(150*(1-pct)), 50)
		end)
		table.insert(objs, bb)
	end

	-- HEALTH BAR (vertical, thin)
	if espState.healthBar and hum then
		local bb = mkBB(hrp, "ESP_Bar", 4, 50, 0, 400)
		bb.StudsOffset = Vector3.new(-1.2, 0, 0)
		local bg = Instance.new("Frame", bb)
		bg.Size = UDim2.new(1,0,1,0)
		bg.BackgroundColor3 = Color3.fromRGB(25,25,25)
		bg.BackgroundTransparency = 0.2
		bg.BorderSizePixel = 0
		Instance.new("UICorner", bg).CornerRadius = UDim.new(1,0)
		local fill = Instance.new("Frame", bg)
		fill.AnchorPoint = Vector2.new(0,1)
		fill.Position = UDim2.new(0,0,1,0)
		local p0 = math.clamp(hum.Health/math.max(hum.MaxHealth,1),0,1)
		fill.Size = UDim2.new(1,0,p0,0)
		fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-p0)), math.floor(220*p0+35), 40)
		fill.BorderSizePixel = 0
		Instance.new("UICorner", fill).CornerRadius = UDim.new(1,0)
		hum.HealthChanged:Connect(function(h)
			local pct = math.clamp(h/math.max(hum.MaxHealth,1),0,1)
			fill.Size = UDim2.new(1,0,pct,0)
			fill.BackgroundColor3 = Color3.fromRGB(math.floor(255*(1-pct)), math.floor(220*pct+35), 40)
		end)
		table.insert(objs, bb)
	end

	-- DISTANCE
	if espState.distance then
		local bb = mkBB(hrp, "ESP_Dist", 60, 10, 2.1, 1000)
		mkLbl(bb, "?m", 8, Color3.fromRGB(180,180,255))
		table.insert(objs, bb)
	end

	-- TRACER (point at the foot)
	if espState.tracers then
		local bb = mkBB(hrp, "ESP_Tracer", 6, 6, -3, 600)
		local dot = Instance.new("Frame", bb)
		dot.Size = UDim2.new(1,0,1,0)
		dot.BackgroundColor3 = color; dot.BorderSizePixel = 0
		Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0)
		table.insert(objs, bb)
	end

	-- SKELETON (Beams) — works on R6 and R15
	if espState.skeletons then
		local JOINTS_R15 = {
			{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
			{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},
			{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},
			{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"},
			{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},
		}
		local JOINTS_R6 = {
			{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},
			{"Torso","Left Leg"},{"Torso","Right Leg"},
		}
		local joints = char:FindFirstChild("UpperTorso") and JOINTS_R15 or JOINTS_R6
		for _, pair in ipairs(joints) do
			local a = char:FindFirstChild(pair[1])
			local b = char:FindFirstChild(pair[2])
			if a and b then
				local att0 = Instance.new("Attachment", a)
				local att1 = Instance.new("Attachment", b)
				local beam = Instance.new("Beam", workspace)
				beam.Attachment0 = att0; beam.Attachment1 = att1
				beam.Color = ColorSequence.new(color)
				beam.Width0 = 0.05; beam.Width1 = 0.05
				beam.FaceCamera = true
				beam.Transparency = NumberSequence.new(0.1)
				beam.LightEmission = 0.3
				table.insert(objs, att0); table.insert(objs, att1); table.insert(objs, beam)
			end
		end
	end

	espObjects[p] = objs
end

-- ================================================
-- ================================================
local function refreshItemESP()
	-- Clean old
	for inst, bb in pairs(espItemObjs) do
		if bb and bb.Parent then bb:Destroy() end
	end
	espItemObjs = {}

	if not espState.items then return end

	-- Scanner workspace for Tools and Parts named "Handle"
	for _, obj in ipairs(workspace:GetDescendants()) do
		if obj:IsA("Tool") and not obj.Parent:IsA("Model") then
			-- Tool placed on the ground
			local handle = obj:FindFirstChild("Handle")
			if handle and handle:IsA("BasePart") then
				local bb = mkBB(handle, "ESP_Item", 120, 14, 0.5, 300)
				bb.AlwaysOnTop = true
				mkLbl(bb, "🔫 " .. obj.Name, 8, Color3.fromRGB(255, 200, 50))
				espItemObjs[obj] = bb
			end
		end
	end
end

-- Refresh ESP items periodically
task.spawn(function()
	while true do
		task.wait(3)
		if espState.items then refreshItemESP() end
	end
end)

-- Updates distance every second
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

-- Rebuilds the entire ESP when a state changes
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

-- Helper dropdown color ESP
local function createColorDropdown(parent, label, order, defaultColor, onChange)
	local colors = {
		{"Red",    Color3.fromRGB(255,60,60)},
		{"Orange", Color3.fromRGB(255,140,30)},
		{"Yellow", Color3.fromRGB(255,220,50)},
		{"Green",  Color3.fromRGB(50,220,100)},
		{"Cyan",   Color3.fromRGB(0,210,255)},
		{"Blue",   Color3.fromRGB(80,160,255)},
		{"Purple", Color3.fromRGB(180,80,255)},
		{"White",  Color3.fromRGB(240,240,240)},
		{"Pink",   Color3.fromRGB(255,100,180)},
	}
	local selected = defaultColor
	local open = false

	-- Main button
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

	-- Drop-down list
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

-- UI ESP in pages.ESP
createSection(pages.ESP, "⚡  Shortcuts", -1)
createBtn(pages.ESP, "⚡  Enable All", currentTheme.Accent, 0, function()
	for k in pairs(espState) do espState[k] = true end
	refreshAllESP()
end)
createBtn(pages.ESP, "❌  Disable All", currentTheme.Danger, 1, function()
	for k in pairs(espState) do espState[k] = false end
	for _, p in ipairs(Players:GetPlayers()) do clearESPFor(p) end
end)

createSection(pages.ESP, "👤  Player Display", 1)
createToggle(pages.ESP, "📦  Boxes", 2, function(s) toggleESP("boxes", s) end)
createToggle(pages.ESP, "🏷  Names + Team Tag", 3, function(s) toggleESP("names", s) end)
createToggle(pages.ESP, "❤  Health (text)", 4, function(s) toggleESP("health", s) end)
createToggle(pages.ESP, "📊  Health Bar", 5, function(s) toggleESP("healthBar", s) end)
createToggle(pages.ESP, "📏  Distance", 6, function(s) toggleESP("distance", s) end)

createSection(pages.ESP, "🎨  Advanced Visual", 6)
createToggle(pages.ESP, "🔴  Head Dots", 7, function(s) toggleESP("headDots", s) end)
createToggle(pages.ESP, "💀  Skeleton", 8, function(s) toggleESP("skeletons", s) end)
createToggle(pages.ESP, "🔆  Chams (Highlight)", 9, function(s) toggleESP("chams", s) end)
createToggle(pages.ESP, "🎯  Tracers", 10, function(s) toggleESP("tracers", s) end)
createToggle(pages.ESP, "🔫  Snaplines", 11, function(s) toggleESP("snaplines", s) end)

createSection(pages.ESP, "🗺  Ground Items", 13)
createToggle(pages.ESP, "🔫  ESP Weapons / Tools", 14, function(s)
	espState.items = s
	refreshItemESP()
end)

createSection(pages.ESP, "🎨  Colors", 19)
createColorDropdown(pages.ESP, "🔴  Enemy Color", 20,
	Color3.fromRGB(255,60,60),
	function(c) ESP_COLOR_ENEMY = c; refreshAllESP() end
)
createColorDropdown(pages.ESP, "🔵  Ally Color", 21,
	Color3.fromRGB(80,160,255),
	function(c) ESP_COLOR_ALLY = c; refreshAllESP() end
)

-- OTHER PAGE — Credits
-- ================================================
createSection(pages.Other, "👑  Credits", 0)

local credits = {
	{"👑  Owner","bkz"},
	{"🤝  Contributor","All people use menu thx you !"},
}

for i, entry in ipairs(credits) do
	local row = Instance.new("Frame", pages.Other)
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

createSection(pages.Other, "ℹ  Version", 98)
local verLabel = Instance.new("TextLabel", pages.Other)
verLabel.Size = UDim2.new(1, 0, 0, 40)
verLabel.BackgroundTransparency = 1
verLabel.Text = "🌐 bkz HUB  v3.4\n👉𝐁 Press [B] to open/close"
verLabel.TextColor3 = currentTheme.SubText
verLabel.Font = Enum.Font.Gotham
verLabel.TextSize = 11
verLabel.TextWrapped = true
verLabel.LayoutOrder = 99
	-- ESP initialized by startESP() below


-- Start the ESP loop
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

-- Auto-load config at startup
task.spawn(function()
	task.wait(0.5)
	if readfile then
		local ok, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(readfile("AdminMenu_config.json"))
		end)
		if ok and result then
			applyConfig(result)
			showNotification("📂 Config loaded automatically!", 3)
		end
	end
end)
