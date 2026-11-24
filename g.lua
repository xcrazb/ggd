-- ============================================
-- COMBINED GUI: PET SCANNER + AUTO TRADE
-- Auto Trade: Scan Semua Player di Server
-- ============================================

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

-- ============================================
-- HAPUS GUI LAMA
-- ============================================

if CoreGui:FindFirstChild("PetScannerGUI") then
    CoreGui.PetScannerGUI:Destroy()
end
if CoreGui:FindFirstChild("AutoTradeGUI") then
    CoreGui.AutoTradeGUI:Destroy()
end
if CoreGui:FindFirstChild("CombinedPetGUI") then
    CoreGui.CombinedPetGUI:Destroy()
end

-- ============================================
-- MAIN SCREEN GUI
-- ============================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CombinedPetGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- ============================================
-- MAIN FRAME
-- ============================================

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 750, 0, 800)
MainFrame.Position = UDim2.new(0.5, -375, 0.5, -400)
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 12)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(80, 200, 120)
UIStroke.Thickness = 2
UIStroke.Parent = MainFrame

-- ============================================
-- TITLE BAR
-- ============================================

local TitleBar = Instance.new("Frame")
TitleBar.Name = "TitleBar"
TitleBar.Size = UDim2.new(1, 0, 0, 45)
TitleBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
TitleBar.BorderSizePixel = 0
TitleBar.Parent = MainFrame

local TitleCorner = Instance.new("UICorner")
TitleCorner.CornerRadius = UDim.new(0, 12)
TitleCorner.Parent = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "Title"
TitleLabel.Size = UDim2.new(1, -120, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "🐾 PET MANAGER — SCANNER + AUTO TRADE"
TitleLabel.TextColor3 = Color3.fromRGB(80, 200, 120)
TitleLabel.TextSize = 16
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
TitleLabel.Parent = TitleBar

local MinimizeBtn = Instance.new("TextButton")
MinimizeBtn.Name = "MinimizeBtn"
MinimizeBtn.Size = UDim2.new(0, 30, 0, 30)
MinimizeBtn.Position = UDim2.new(1, -75, 0, 8)
MinimizeBtn.BackgroundColor3 = Color3.fromRGB(200, 160, 60)
MinimizeBtn.Text = "—"
MinimizeBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeBtn.TextSize = 18
MinimizeBtn.Font = Enum.Font.GothamBold
MinimizeBtn.BorderSizePixel = 0
MinimizeBtn.Parent = TitleBar

local MinimizeCorner = Instance.new("UICorner")
MinimizeCorner.CornerRadius = UDim.new(0, 8)
MinimizeCorner.Parent = MinimizeBtn

local CloseBtn = Instance.new("TextButton")
CloseBtn.Name = "CloseBtn"
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 8)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.TextSize = 16
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TitleBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- ============================================
-- TAB BAR
-- ============================================

local TabBar = Instance.new("Frame")
TabBar.Name = "TabBar"
TabBar.Size = UDim2.new(1, -20, 0, 40)
TabBar.Position = UDim2.new(0, 10, 0, 52)
TabBar.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
TabBar.BorderSizePixel = 0
TabBar.Parent = MainFrame

local TabBarCorner = Instance.new("UICorner")
TabBarCorner.CornerRadius = UDim.new(0, 8)
TabBarCorner.Parent = TabBar

local TabLayout = Instance.new("UIListLayout")
TabLayout.FillDirection = Enum.FillDirection.Horizontal
TabLayout.Padding = UDim.new(0, 5)
TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
TabLayout.VerticalAlignment = Enum.VerticalAlignment.Center
TabLayout.Parent = TabBar

local TabPadding = Instance.new("UIPadding")
TabPadding.PaddingLeft = UDim.new(0, 5)
TabPadding.PaddingRight = UDim.new(0, 5)
TabPadding.Parent = TabBar

local function createTabButton(name, text, order)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, 200, 0, 30)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(200, 200, 220)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.Parent = TabBar

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    return btn
end

local ScannerTab = createTabButton("ScannerTab", "🐾 PET SCANNER", 1)
local TradeTab = createTabButton("TradeTab", "🔄 AUTO TRADE", 2)

-- ============================================
-- CONTENT CONTAINERS
-- ============================================

local ScannerContainer = Instance.new("Frame")
ScannerContainer.Name = "ScannerContainer"
ScannerContainer.Size = UDim2.new(1, -20, 1, -110)
ScannerContainer.Position = UDim2.new(0, 10, 0, 100)
ScannerContainer.BackgroundTransparency = 1
ScannerContainer.Visible = true
ScannerContainer.Parent = MainFrame

local TradeContainer = Instance.new("Frame")
TradeContainer.Name = "TradeContainer"
TradeContainer.Size = UDim2.new(1, -20, 1, -110)
TradeContainer.Position = UDim2.new(0, 10, 0, 100)
TradeContainer.BackgroundTransparency = 1
TradeContainer.Visible = false
TradeContainer.Parent = MainFrame

-- ============================================
-- TAB SWITCHING
-- ============================================

local function switchTab(tabName)
    if tabName == "scanner" then
        ScannerContainer.Visible = true
        TradeContainer.Visible = false
        ScannerTab.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
        ScannerTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        TradeTab.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        TradeTab.TextColor3 = Color3.fromRGB(200, 200, 220)
    else
        ScannerContainer.Visible = false
        TradeContainer.Visible = true
        TradeTab.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
        TradeTab.TextColor3 = Color3.fromRGB(255, 255, 255)
        ScannerTab.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        ScannerTab.TextColor3 = Color3.fromRGB(200, 200, 220)
    end
end

ScannerTab.MouseButton1Click:Connect(function() switchTab("scanner") end)
TradeTab.MouseButton1Click:Connect(function() switchTab("trade") end)

switchTab("scanner")

-- ============================================
-- ============================================
-- SCANNER CONTAINER CONTENT
-- ============================================
-- ============================================

local ButtonContainer = Instance.new("Frame")
ButtonContainer.Name = "ButtonContainer"
ButtonContainer.Size = UDim2.new(1, 0, 0, 40)
ButtonContainer.Position = UDim2.new(0, 0, 0, 0)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = ScannerContainer

local ButtonLayout = Instance.new("UIListLayout")
ButtonLayout.FillDirection = Enum.FillDirection.Horizontal
ButtonLayout.Padding = UDim.new(0, 8)
ButtonLayout.SortOrder = Enum.SortOrder.LayoutOrder
ButtonLayout.Parent = ButtonContainer

local function createButton(parent, name, text, color, order, width)
    local btn = Instance.new("TextButton")
    btn.Name = name
    btn.Size = UDim2.new(0, width or 145, 1, 0)
    btn.BackgroundColor3 = color
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.BorderSizePixel = 0
    btn.LayoutOrder = order
    btn.Parent = parent

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = btn

    return btn
end

local ScanBtn  = createButton(ButtonContainer, "ScanBtn",  "🔍 SCAN PET",       Color3.fromRGB(80, 200, 120), 1, 220)
local SortBtn  = createButton(ButtonContainer, "SortBtn",  "📊 SORT BY WEIGHT",  Color3.fromRGB(150, 120, 200), 2, 220)
local ClearBtn = createButton(ButtonContainer, "ClearBtn", "🗑 CLEAR",           Color3.fromRGB(200, 80, 80), 3, 220)

-- Stats Bar
local StatsBar = Instance.new("Frame")
StatsBar.Name = "StatsBar"
StatsBar.Size = UDim2.new(1, 0, 0, 55)
StatsBar.Position = UDim2.new(0, 0, 0, 48)
StatsBar.BackgroundColor3 = Color3.fromRGB(35, 35, 50)
StatsBar.BorderSizePixel = 0
StatsBar.Parent = ScannerContainer

local StatsCorner = Instance.new("UICorner")
StatsCorner.CornerRadius = UDim.new(0, 8)
StatsCorner.Parent = StatsBar

local StatsLabel = Instance.new("TextLabel")
StatsLabel.Name = "StatsLabel"
StatsLabel.Size = UDim2.new(1, -20, 1, 0)
StatsLabel.Position = UDim2.new(0, 10, 0, 0)
StatsLabel.BackgroundTransparency = 1
StatsLabel.Text = "Total Pets: 0  |  Unique Types: 0  |  Total Weight: 0kg"
StatsLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
StatsLabel.TextSize = 12
StatsLabel.Font = Enum.Font.GothamMedium
StatsLabel.TextXAlignment = Enum.TextXAlignment.Left
StatsLabel.TextWrapped = true
StatsLabel.Parent = StatsBar

-- Delete Panel
local DeletePanel = Instance.new("Frame")
DeletePanel.Name = "DeletePanel"
DeletePanel.Size = UDim2.new(1, 0, 0, 125)
DeletePanel.Position = UDim2.new(0, 0, 0, 110)
DeletePanel.BackgroundColor3 = Color3.fromRGB(45, 25, 30)
DeletePanel.BorderSizePixel = 0
DeletePanel.Parent = ScannerContainer

local DeletePanelCorner = Instance.new("UICorner")
DeletePanelCorner.CornerRadius = UDim.new(0, 8)
DeletePanelCorner.Parent = DeletePanel

local DeleteStroke = Instance.new("UIStroke")
DeleteStroke.Color = Color3.fromRGB(200, 80, 80)
DeleteStroke.Thickness = 1.5
DeleteStroke.Parent = DeletePanel

local DeleteTitle = Instance.new("TextLabel")
DeleteTitle.Name = "DeleteTitle"
DeleteTitle.Size = UDim2.new(1, -20, 0, 20)
DeleteTitle.Position = UDim2.new(0, 10, 0, 5)
DeleteTitle.BackgroundTransparency = 1
DeleteTitle.Text = "⚠️ AUTO DELETE BY WEIGHT"
DeleteTitle.TextColor3 = Color3.fromRGB(255, 120, 120)
DeleteTitle.TextSize = 12
DeleteTitle.Font = Enum.Font.GothamBold
DeleteTitle.TextXAlignment = Enum.TextXAlignment.Left
DeleteTitle.Parent = DeletePanel

local WeightInput = Instance.new("TextBox")
WeightInput.Name = "WeightInput"
WeightInput.Size = UDim2.new(0, 160, 0, 30)
WeightInput.Position = UDim2.new(0, 10, 0, 30)
WeightInput.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
WeightInput.TextColor3 = Color3.fromRGB(255, 255, 255)
WeightInput.PlaceholderText = "Berat minimum (kg)"
WeightInput.PlaceholderColor3 = Color3.fromRGB(120, 120, 140)
WeightInput.Text = ""
WeightInput.TextSize = 12
WeightInput.Font = Enum.Font.GothamMedium
WeightInput.BorderSizePixel = 0
WeightInput.ClearTextOnFocus = false
WeightInput.Parent = DeletePanel

local WeightInputCorner = Instance.new("UICorner")
WeightInputCorner.CornerRadius = UDim.new(0, 6)
WeightInputCorner.Parent = WeightInput

local WeightInfo = Instance.new("TextLabel")
WeightInfo.Name = "WeightInfo"
WeightInfo.Size = UDim2.new(1, -190, 0, 30)
WeightInfo.Position = UDim2.new(0, 180, 0, 30)
WeightInfo.BackgroundTransparency = 1
WeightInfo.Text = "Pet dengan berat < nilai ini akan dihapus."
WeightInfo.TextColor3 = Color3.fromRGB(200, 180, 180)
WeightInfo.TextSize = 11
WeightInfo.Font = Enum.Font.GothamMedium
WeightInfo.TextXAlignment = Enum.TextXAlignment.Left
WeightInfo.TextWrapped = true
WeightInfo.Parent = DeletePanel

local AutoDeleteBtn = Instance.new("TextButton")
AutoDeleteBtn.Name = "AutoDeleteBtn"
AutoDeleteBtn.Size = UDim2.new(0, 230, 0, 28)
AutoDeleteBtn.Position = UDim2.new(0, 10, 0, 64)
AutoDeleteBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
AutoDeleteBtn.Text = "🗑 AUTO DELETE: OFF"
AutoDeleteBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoDeleteBtn.TextSize = 11
AutoDeleteBtn.Font = Enum.Font.GothamBold
AutoDeleteBtn.BorderSizePixel = 0
AutoDeleteBtn.Parent = DeletePanel

local AutoDeleteCorner = Instance.new("UICorner")
AutoDeleteCorner.CornerRadius = UDim.new(0, 6)
AutoDeleteCorner.Parent = AutoDeleteBtn

local DeleteNowBtn = Instance.new("TextButton")
DeleteNowBtn.Name = "DeleteNowBtn"
DeleteNowBtn.Size = UDim2.new(0, 230, 0, 28)
DeleteNowBtn.Position = UDim2.new(0, 250, 0, 64)
DeleteNowBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
DeleteNowBtn.Text = "⚡ DELETE NOW"
DeleteNowBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
DeleteNowBtn.TextSize = 11
DeleteNowBtn.Font = Enum.Font.GothamBold
DeleteNowBtn.BorderSizePixel = 0
DeleteNowBtn.Parent = DeletePanel

local DeleteNowCorner = Instance.new("UICorner")
DeleteNowCorner.CornerRadius = UDim.new(0, 6)
DeleteNowCorner.Parent = DeleteNowBtn

local ProtectLikedBtn = Instance.new("TextButton")
ProtectLikedBtn.Name = "ProtectLikedBtn"
ProtectLikedBtn.Size = UDim2.new(1, -20, 0, 24)
ProtectLikedBtn.Position = UDim2.new(0, 10, 0, 96)
ProtectLikedBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
ProtectLikedBtn.Text = "❤️ PROTECT LIKED: ON"
ProtectLikedBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ProtectLikedBtn.TextSize = 11
ProtectLikedBtn.Font = Enum.Font.GothamBold
ProtectLikedBtn.BorderSizePixel = 0
ProtectLikedBtn.Parent = DeletePanel

local ProtectLikedCorner = Instance.new("UICorner")
ProtectLikedCorner.CornerRadius = UDim.new(0, 6)
ProtectLikedCorner.Parent = ProtectLikedBtn

-- Force Delete Panel
local ForcePanel = Instance.new("Frame")
ForcePanel.Name = "ForcePanel"
ForcePanel.Size = UDim2.new(1, 0, 0, 185)
ForcePanel.Position = UDim2.new(0, 0, 0, 240)
ForcePanel.BackgroundColor3 = Color3.fromRGB(40, 25, 50)
ForcePanel.BorderSizePixel = 0
ForcePanel.Parent = ScannerContainer

local ForcePanelCorner = Instance.new("UICorner")
ForcePanelCorner.CornerRadius = UDim.new(0, 8)
ForcePanelCorner.Parent = ForcePanel

local ForcePanelStroke = Instance.new("UIStroke")
ForcePanelStroke.Color = Color3.fromRGB(180, 80, 200)
ForcePanelStroke.Thickness = 1.5
ForcePanelStroke.Parent = ForcePanel

local ForceTitle = Instance.new("TextLabel")
ForceTitle.Name = "ForceTitle"
ForceTitle.Size = UDim2.new(1, -150, 0, 20)
ForceTitle.Position = UDim2.new(0, 10, 0, 5)
ForceTitle.BackgroundTransparency = 1
ForceTitle.Text = "💀 FORCE DELETE — PILIH JENIS PET"
ForceTitle.TextColor3 = Color3.fromRGB(200, 130, 220)
ForceTitle.TextSize = 11
ForceTitle.Font = Enum.Font.GothamBold
ForceTitle.TextXAlignment = Enum.TextXAlignment.Left
ForceTitle.Parent = ForcePanel

local RefreshForceBtn = Instance.new("TextButton")
RefreshForceBtn.Name = "RefreshForceBtn"
RefreshForceBtn.Size = UDim2.new(0, 65, 0, 20)
RefreshForceBtn.Position = UDim2.new(1, -140, 0, 5)
RefreshForceBtn.BackgroundColor3 = Color3.fromRGB(80, 130, 200)
RefreshForceBtn.Text = "🔄 REFRESH"
RefreshForceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshForceBtn.TextSize = 9
RefreshForceBtn.Font = Enum.Font.GothamBold
RefreshForceBtn.BorderSizePixel = 0
RefreshForceBtn.Parent = ForcePanel

local RefreshForceCorner = Instance.new("UICorner")
RefreshForceCorner.CornerRadius = UDim.new(0, 6)
RefreshForceCorner.Parent = RefreshForceBtn

local ClearForceBtn = Instance.new("TextButton")
ClearForceBtn.Name = "ClearForceBtn"
ClearForceBtn.Size = UDim2.new(0, 65, 0, 20)
ClearForceBtn.Position = UDim2.new(1, -70, 0, 5)
ClearForceBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
ClearForceBtn.Text = "🗑 CLEAR"
ClearForceBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearForceBtn.TextSize = 9
ClearForceBtn.Font = Enum.Font.GothamBold
ClearForceBtn.BorderSizePixel = 0
ClearForceBtn.Parent = ForcePanel

local ClearForceCorner = Instance.new("UICorner")
ClearForceCorner.CornerRadius = UDim.new(0, 6)
ClearForceCorner.Parent = ClearForceBtn

local ForceInfoLabel = Instance.new("TextLabel")
ForceInfoLabel.Name = "ForceInfoLabel"
ForceInfoLabel.Size = UDim2.new(1, -20, 0, 14)
ForceInfoLabel.Position = UDim2.new(0, 10, 0, 26)
ForceInfoLabel.BackgroundTransparency = 1
ForceInfoLabel.Text = "Hanya pet TIDAK equipped & TIDAK liked yang ditampilkan."
ForceInfoLabel.TextColor3 = Color3.fromRGB(200, 150, 220)
ForceInfoLabel.TextSize = 9
ForceInfoLabel.Font = Enum.Font.GothamMedium
ForceInfoLabel.TextXAlignment = Enum.TextXAlignment.Left
ForceInfoLabel.Parent = ForcePanel

local ForceGridFrame = Instance.new("ScrollingFrame")
ForceGridFrame.Name = "ForceGridFrame"
ForceGridFrame.Size = UDim2.new(1, -20, 0, 130)
ForceGridFrame.Position = UDim2.new(0, 10, 0, 44)
ForceGridFrame.BackgroundColor3 = Color3.fromRGB(25, 20, 30)
ForceGridFrame.BorderSizePixel = 0
ForceGridFrame.ScrollBarThickness = 5
ForceGridFrame.ScrollBarImageColor3 = Color3.fromRGB(180, 80, 200)
ForceGridFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ForceGridFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ForceGridFrame.Parent = ForcePanel

local ForceGridCorner = Instance.new("UICorner")
ForceGridCorner.CornerRadius = UDim.new(0, 6)
ForceGridCorner.Parent = ForceGridFrame

local ForceGridLayout = Instance.new("UIGridLayout")
ForceGridLayout.CellSize = UDim2.new(0, 65, 0, 80)
ForceGridLayout.CellPadding = UDim2.new(0, 4, 0, 4)  -- ✅ FIXED: UDim2
ForceGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
ForceGridLayout.Parent = ForceGridFrame

local ForceGridPadding = Instance.new("UIPadding")
ForceGridPadding.PaddingTop = UDim.new(0, 4)
ForceGridPadding.PaddingLeft = UDim.new(0, 4)
ForceGridPadding.PaddingRight = UDim.new(0, 4)
ForceGridPadding.PaddingBottom = UDim.new(0, 4)
ForceGridPadding.Parent = ForceGridFrame

local ForceStatusLabel = Instance.new("TextLabel")
ForceStatusLabel.Name = "ForceStatusLabel"
ForceStatusLabel.Size = UDim2.new(1, -20, 0, 14)
ForceStatusLabel.Position = UDim2.new(0, 10, 1, -18)
ForceStatusLabel.BackgroundTransparency = 1
ForceStatusLabel.Text = "Dipilih: 0 jenis pet"
ForceStatusLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
ForceStatusLabel.TextSize = 9
ForceStatusLabel.Font = Enum.Font.GothamBold
ForceStatusLabel.TextXAlignment = Enum.TextXAlignment.Left
ForceStatusLabel.Parent = ForcePanel

-- Scroll Frame (Hasil Scan)
local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Name = "ScrollFrame"
ScrollFrame.Size = UDim2.new(1, 0, 1, -435)
ScrollFrame.Position = UDim2.new(0, 0, 0, 435)
ScrollFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 6
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(80, 200, 120)
ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
ScrollFrame.Parent = ScannerContainer

local ScrollCorner = Instance.new("UICorner")
ScrollCorner.CornerRadius = UDim.new(0, 8)
ScrollCorner.Parent = ScrollFrame

local ScrollLayout = Instance.new("UIListLayout")
ScrollLayout.Padding = UDim.new(0, 6)
ScrollLayout.SortOrder = Enum.SortOrder.LayoutOrder
ScrollLayout.Parent = ScrollFrame

local ScrollPadding = Instance.new("UIPadding")
ScrollPadding.PaddingTop = UDim.new(0, 8)
ScrollPadding.PaddingBottom = UDim.new(0, 8)
ScrollPadding.PaddingLeft = UDim.new(0, 8)
ScrollPadding.PaddingRight = UDim.new(0, 8)
ScrollPadding.Parent = ScrollFrame

-- ============================================
-- ============================================
-- TRADE CONTAINER CONTENT
-- ============================================
-- ============================================

-- Layout vertikal untuk TradeContainer
local TradeLayout = Instance.new("UIListLayout")
TradeLayout.FillDirection = Enum.FillDirection.Vertical
TradeLayout.Padding = UDim.new(0, 6)
TradeLayout.SortOrder = Enum.SortOrder.LayoutOrder
TradeLayout.Parent = TradeContainer

-- ============================================
-- PLAYER LIST PANEL
-- ============================================

local PlayerPanel = Instance.new("Frame")
PlayerPanel.Name = "PlayerPanel"
PlayerPanel.Size = UDim2.new(1, 0, 0, 165)
PlayerPanel.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
PlayerPanel.BorderSizePixel = 0
PlayerPanel.LayoutOrder = 1
PlayerPanel.Parent = TradeContainer

local PlayerPanelCorner = Instance.new("UICorner")
PlayerPanelCorner.CornerRadius = UDim.new(0, 8)
PlayerPanelCorner.Parent = PlayerPanel

local PlayerPanelStroke = Instance.new("UIStroke")
PlayerPanelStroke.Color = Color3.fromRGB(80, 130, 200)
PlayerPanelStroke.Thickness = 1.5
PlayerPanelStroke.Parent = PlayerPanel

local PlayerPanelTitle = Instance.new("TextLabel")
PlayerPanelTitle.Size = UDim2.new(1, -120, 0, 20)
PlayerPanelTitle.Position = UDim2.new(0, 10, 0, 4)
PlayerPanelTitle.BackgroundTransparency = 1
PlayerPanelTitle.Text = "👥 PILIH TARGET PLAYER"
PlayerPanelTitle.TextColor3 = Color3.fromRGB(100, 180, 255)
PlayerPanelTitle.TextSize = 11
PlayerPanelTitle.Font = Enum.Font.GothamBold
PlayerPanelTitle.TextXAlignment = Enum.TextXAlignment.Left
PlayerPanelTitle.Parent = PlayerPanel

local RefreshPlayersBtn = Instance.new("TextButton")
RefreshPlayersBtn.Size = UDim2.new(0, 100, 0, 20)
RefreshPlayersBtn.Position = UDim2.new(1, -110, 0, 4)
RefreshPlayersBtn.BackgroundColor3 = Color3.fromRGB(80, 130, 200)
RefreshPlayersBtn.Text = "🔄 REFRESH"
RefreshPlayersBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
RefreshPlayersBtn.TextSize = 9
RefreshPlayersBtn.Font = Enum.Font.GothamBold
RefreshPlayersBtn.BorderSizePixel = 0
RefreshPlayersBtn.Parent = PlayerPanel

local RefreshPlayersCorner = Instance.new("UICorner")
RefreshPlayersCorner.CornerRadius = UDim.new(0, 6)
RefreshPlayersCorner.Parent = RefreshPlayersBtn

local SelectedPlayerLabel = Instance.new("TextLabel")
SelectedPlayerLabel.Size = UDim2.new(1, -20, 0, 16)
SelectedPlayerLabel.Position = UDim2.new(0, 10, 0, 26)
SelectedPlayerLabel.BackgroundTransparency = 1
SelectedPlayerLabel.Text = "Target: -"
SelectedPlayerLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
SelectedPlayerLabel.TextSize = 10
SelectedPlayerLabel.Font = Enum.Font.GothamBold
SelectedPlayerLabel.TextXAlignment = Enum.TextXAlignment.Left
SelectedPlayerLabel.Parent = PlayerPanel

local PlayerScroll = Instance.new("ScrollingFrame")
PlayerScroll.Size = UDim2.new(1, -20, 0, 115)
PlayerScroll.Position = UDim2.new(0, 10, 0, 44)
PlayerScroll.BackgroundColor3 = Color3.fromRGB(20, 25, 35)
PlayerScroll.BorderSizePixel = 0
PlayerScroll.ScrollBarThickness = 5
PlayerScroll.ScrollBarImageColor3 = Color3.fromRGB(100, 180, 255)
PlayerScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PlayerScroll.AutomaticCanvasSize = Enum.AutomaticSize.XY
PlayerScroll.ScrollingDirection = Enum.ScrollingDirection.X
PlayerScroll.Parent = PlayerPanel

local PlayerScrollCorner = Instance.new("UICorner")
PlayerScrollCorner.CornerRadius = UDim.new(0, 6)
PlayerScrollCorner.Parent = PlayerScroll

local PlayerListLayout = Instance.new("UIListLayout")
PlayerListLayout.FillDirection = Enum.FillDirection.Horizontal
PlayerListLayout.Padding = UDim.new(0, 6)
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
PlayerListLayout.Parent = PlayerScroll

local PlayerScrollPadding = Instance.new("UIPadding")
PlayerScrollPadding.PaddingTop = UDim.new(0, 6)
PlayerScrollPadding.PaddingLeft = UDim.new(0, 6)
PlayerScrollPadding.PaddingRight = UDim.new(0, 6)
PlayerScrollPadding.PaddingBottom = UDim.new(0, 6)
PlayerScrollPadding.Parent = PlayerScroll

-- ============================================
-- PET SELECTION PANEL
-- ============================================

local PetPanel = Instance.new("Frame")
PetPanel.Name = "PetPanel"
PetPanel.Size = UDim2.new(1, 0, 0, 310)
PetPanel.BackgroundColor3 = Color3.fromRGB(30, 35, 45)
PetPanel.BorderSizePixel = 0
PetPanel.LayoutOrder = 2
PetPanel.Parent = TradeContainer

local PetPanelCorner = Instance.new("UICorner")
PetPanelCorner.CornerRadius = UDim.new(0, 8)
PetPanelCorner.Parent = PetPanel

local PetPanelStroke = Instance.new("UIStroke")
PetPanelStroke.Color = Color3.fromRGB(80, 200, 120)
PetPanelStroke.Thickness = 1.5
PetPanelStroke.Parent = PetPanel

local PetPanelTitle = Instance.new("TextLabel")
PetPanelTitle.Size = UDim2.new(1, -240, 0, 20)
PetPanelTitle.Position = UDim2.new(0, 10, 0, 4)
PetPanelTitle.BackgroundTransparency = 1
PetPanelTitle.Text = "🐾 PILIH PET (MAX 8)"
PetPanelTitle.TextColor3 = Color3.fromRGB(80, 200, 120)
PetPanelTitle.TextSize = 11
PetPanelTitle.Font = Enum.Font.GothamBold
PetPanelTitle.TextXAlignment = Enum.TextXAlignment.Left
PetPanelTitle.Parent = PetPanel

local ScanPetBtn = Instance.new("TextButton")
ScanPetBtn.Size = UDim2.new(0, 110, 0, 20)
ScanPetBtn.Position = UDim2.new(1, -120, 0, 4)
ScanPetBtn.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
ScanPetBtn.Text = "🔍 SCAN PET"
ScanPetBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ScanPetBtn.TextSize = 9
ScanPetBtn.Font = Enum.Font.GothamBold
ScanPetBtn.BorderSizePixel = 0
ScanPetBtn.Parent = PetPanel

local ScanCorner = Instance.new("UICorner")
ScanCorner.CornerRadius = UDim.new(0, 6)
ScanCorner.Parent = ScanPetBtn

local ClearSelBtn = Instance.new("TextButton")
ClearSelBtn.Size = UDim2.new(0, 110, 0, 20)
ClearSelBtn.Position = UDim2.new(1, -235, 0, 4)
ClearSelBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
ClearSelBtn.Text = "🗑 CLEAR"
ClearSelBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ClearSelBtn.TextSize = 9
ClearSelBtn.Font = Enum.Font.GothamBold
ClearSelBtn.BorderSizePixel = 0
ClearSelBtn.Parent = PetPanel

local ClearSelCorner = Instance.new("UICorner")
ClearSelCorner.CornerRadius = UDim.new(0, 6)
ClearSelCorner.Parent = ClearSelBtn

local SelectedLabel = Instance.new("TextLabel")
SelectedLabel.Size = UDim2.new(1, -20, 0, 16)
SelectedLabel.Position = UDim2.new(0, 10, 0, 26)
SelectedLabel.BackgroundTransparency = 1
SelectedLabel.Text = "🐾 Dipilih: 0 / 8 pet"
SelectedLabel.TextColor3 = Color3.fromRGB(255, 200, 100)
SelectedLabel.TextSize = 10
SelectedLabel.Font = Enum.Font.GothamBold
SelectedLabel.TextXAlignment = Enum.TextXAlignment.Left
SelectedLabel.Parent = PetPanel

local PetScroll = Instance.new("ScrollingFrame")
PetScroll.Size = UDim2.new(1, -20, 0, 260)
PetScroll.Position = UDim2.new(0, 10, 0, 44)
PetScroll.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
PetScroll.BorderSizePixel = 0
PetScroll.ScrollBarThickness = 6
PetScroll.ScrollBarImageColor3 = Color3.fromRGB(80, 200, 120)
PetScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
PetScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
PetScroll.Parent = PetPanel

local PetScrollCorner = Instance.new("UICorner")
PetScrollCorner.CornerRadius = UDim.new(0, 8)
PetScrollCorner.Parent = PetScroll

local PetGrid = Instance.new("UIGridLayout")
PetGrid.CellSize = UDim2.new(0, 80, 0, 100)
PetGrid.CellPadding = UDim2.new(0, 4, 0, 4)  -- ✅ FIXED: UDim2
PetGrid.SortOrder = Enum.SortOrder.LayoutOrder
PetGrid.Parent = PetScroll

local PetScrollPadding = Instance.new("UIPadding")
PetScrollPadding.PaddingTop = UDim.new(0, 6)
PetScrollPadding.PaddingLeft = UDim.new(0, 6)
PetScrollPadding.PaddingRight = UDim.new(0, 6)
PetScrollPadding.PaddingBottom = UDim.new(0, 6)
PetScrollPadding.Parent = PetScroll

-- ============================================
-- ACTION PANEL
-- ============================================

local ActionPanel = Instance.new("Frame")
ActionPanel.Name = "ActionPanel"
ActionPanel.Size = UDim2.new(1, 0, 0, 50)
ActionPanel.BackgroundTransparency = 1
ActionPanel.LayoutOrder = 3
ActionPanel.Parent = TradeContainer

local ActionLayout = Instance.new("UIListLayout")
ActionLayout.FillDirection = Enum.FillDirection.Horizontal
ActionLayout.Padding = UDim.new(0, 8)
ActionLayout.SortOrder = Enum.SortOrder.LayoutOrder
ActionLayout.Parent = ActionPanel

local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0.5, -4, 1, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
ToggleBtn.Text = "🔄 AUTO TRADE: OFF"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.TextSize = 13
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.BorderSizePixel = 0
ToggleBtn.LayoutOrder = 1
ToggleBtn.Parent = ActionPanel

local ToggleCorner = Instance.new("UICorner")
ToggleCorner.CornerRadius = UDim.new(0, 8)
ToggleCorner.Parent = ToggleBtn

local StartBtn = Instance.new("TextButton")
StartBtn.Size = UDim2.new(0.5, -4, 1, 0)
StartBtn.BackgroundColor3 = Color3.fromRGB(60, 130, 200)
StartBtn.Text = "📤 KIRIM REQUEST"
StartBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
StartBtn.TextSize = 12
StartBtn.Font = Enum.Font.GothamBold
StartBtn.BorderSizePixel = 0
StartBtn.LayoutOrder = 2
StartBtn.Parent = ActionPanel

local StartCorner = Instance.new("UICorner")
StartCorner.CornerRadius = UDim.new(0, 8)
StartCorner.Parent = StartBtn

-- ============================================
-- STATUS PANEL
-- ============================================

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, 0, 0, 60)
StatusLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 45)
StatusLabel.TextColor3 = Color3.fromRGB(200, 200, 220)
StatusLabel.TextSize = 11
StatusLabel.Font = Enum.Font.GothamMedium
StatusLabel.TextXAlignment = Enum.TextXAlignment.Left
StatusLabel.TextYAlignment = Enum.TextYAlignment.Top
StatusLabel.TextWrapped = true
StatusLabel.Text = "Status: Idle"
StatusLabel.BorderSizePixel = 0
StatusLabel.LayoutOrder = 4
StatusLabel.Parent = TradeContainer

local StatusCorner = Instance.new("UICorner")
StatusCorner.CornerRadius = UDim.new(0, 8)
StatusCorner.Parent = StatusLabel

local StatusPadding = Instance.new("UIPadding")
StatusPadding.PaddingTop = UDim.new(0, 8)
StatusPadding.PaddingLeft = UDim.new(0, 10)
StatusPadding.PaddingRight = UDim.new(0, 10)
StatusPadding.Parent = StatusLabel

-- ============================================
-- MINIMIZE
-- ============================================

local isMinimized = false
local originalSize = UDim2.new(0, 750, 0, 800)
local minimizedSize = UDim2.new(0, 320, 0, 45)

local function setMinimized(state)
    isMinimized = state
    if state then
        TabBar.Visible = false
        ScannerContainer.Visible = false
        TradeContainer.Visible = false

        TweenService:Create(MainFrame,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Size = minimizedSize }):Play()

        MinimizeBtn.Text = "▢"
        TitleLabel.Text = "🐾 PET MANAGER (MIN)"
    else
        TweenService:Create(MainFrame,
            TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
            { Size = originalSize }):Play()

        task.delay(0.25, function()
            TabBar.Visible = true
            if ScannerTab.BackgroundColor3 == Color3.fromRGB(80, 200, 120) then
                ScannerContainer.Visible = true
            else
                TradeContainer.Visible = true
            end
        end)

        MinimizeBtn.Text = "—"
        TitleLabel.Text = "🐾 PET MANAGER — SCANNER + AUTO TRADE"
    end
end

MinimizeBtn.MouseButton1Click:Connect(function()
    setMinimized(not isMinimized)
end)

-- ============================================
-- ============================================
-- MODULES & REMOTES
-- ============================================
-- ============================================

local petAgeUtils = nil
pcall(function()
    petAgeUtils = require(
        game:GetService("ReplicatedStorage").TS.utils["pet-age.utils"]
    )
end)

local inventoryStateModule = nil
pcall(function()
    local playerScripts = LocalPlayer:WaitForChild("PlayerScripts", 5)
    inventoryStateModule = require(
        playerScripts.TS.ui.features.toolbar["inventory.state"]
    )
end)

local playerDataModule = nil
pcall(function()
    playerDataModule = require(
        game:GetService("ReplicatedStorage").TS.state["player-data"]
    )
end)

local container = ReplicatedStorage
    :WaitForChild("rbxts_include")
    :WaitForChild("node_modules")
    :WaitForChild("@rbxts")
    :WaitForChild("remo")
    :WaitForChild("src")
    :WaitForChild("container")

local deleteRemote = container:FindFirstChild("inventory.deleteItems")
local sendRequestRemote = container:FindFirstChild("trading.sendRequest")
local acceptRequestRemote = container:FindFirstChild("trading.acceptRequest")
local addItemRemote = container:FindFirstChild("trading.addItem")
local acceptTradeRemote = container:FindFirstChild("trading.acceptTrade")
local tradeCreatedRemote = container:FindFirstChild("trading.tradeCreated")
local tradeRequestReceivedRemote = container:FindFirstChild("trading.tradeRequestReceived")

print("[CombinedGUI] Modules & Remotes loaded")

-- ============================================
-- ============================================
-- SCANNER LOGIC
-- ============================================
-- ============================================

local forceDeleteList = {}
local uniquePetsCache = {}
local scanResults = {}
local sortByWeight = false
local protectLiked = true
local autoDeleteEnabled = false

local function getRawPlayerData()
    if not playerDataModule then return nil end
    local data = nil
    pcall(function()
        data = playerDataModule.getPlayerDataById(tostring(LocalPlayer.UserId))
    end)
    if not data then
        pcall(function()
            data = playerDataModule.getPlayerData()
        end)
    end
    return data
end

local function calculateWeight(petData)
    if not petAgeUtils or not petData then return nil end
    local success, weight = pcall(function()
        return petAgeUtils.calculatePetWeight(petData)
    end)
    if success and weight then return weight end
    return nil
end

local function formatWeight(weight)
    if not weight then return "N/A" end
    if petAgeUtils then
        local success, formatted = pcall(function()
            return petAgeUtils.formatPetWeight(weight)
        end)
        if success and formatted then return formatted end
    end
    if weight < 1000 then
        return string.format("%.2fkg", weight)
    else
        return string.format("%.2ft", weight / 1000)
    end
end

local function getPetAge(petData)
    if not petAgeUtils or not petData then return nil end
    local success, age = pcall(function()
        return petAgeUtils.getPetAgeFromData(petData)
    end)
    return success and age or nil
end

local function getMaxAge(petData)
    if not petAgeUtils or not petData then return nil end
    local success, maxAge = pcall(function()
        return petAgeUtils.getMaxAge(petData)
    end)
    return success and maxAge or nil
end

local function isPetLiked(petData)
    if not petData then return false end
    if petData.liked == true then return true end
    if petData.favorite == true then return true end
    if petData.favorited == true then return true end
    if petData.locked == true then return true end
    return false
end

local function deleteMultiplePets(itemIds)
    if not deleteRemote then return 0 end
    if #itemIds == 0 then return 0 end

    local args = { {} }
    for _, id in ipairs(itemIds) do
        table.insert(args[1], {
            toolType = "pet",
            itemId = id
        })
    end

    local success, err = pcall(function()
        deleteRemote:FireServer(unpack(args))
    end)

    if success then
        print("[PetScanner] Deleted", #itemIds, "pets")
        return #itemIds
    else
        warn("[PetScanner] Gagal delete:", err)
        return 0
    end
end

local function collectAllPetTypes()
    local rawPlayerData = getRawPlayerData()
    if not rawPlayerData or not rawPlayerData.inventory or not rawPlayerData.inventory.pets then
        return {}
    end

    local rawPets = rawPlayerData.inventory.pets

    local equippedSet = {}
    if rawPlayerData.equippedPets then
        for _, equippedId in ipairs(rawPlayerData.equippedPets) do
            equippedSet[equippedId] = true
        end
    end

    local types = {}
    local stackedData = nil
    pcall(function()
        if inventoryStateModule then
            stackedData = inventoryStateModule.inventoryStackedData()
        end
    end)

    local iconMap = {}
    if stackedData then
        for _, itemData in pairs(stackedData) do
            if itemData.toolType and tostring(itemData.toolType):lower():find("pet") then
                iconMap[itemData.itemName] = itemData.icon
            end
        end
    end

    for petId, petData in pairs(rawPets) do
        local petType = petData.petType
        if petType then
            if equippedSet[petId] then
                -- skip
            elseif isPetLiked(petData) then
                -- skip
            else
                if not types[petType] then
                    types[petType] = {
                        icon = iconMap[petType] or "",
                        count = 0,
                        mutations = {}
                    }
                end
                types[petType].count = types[petType].count + 1
                if petData.mutation then
                    types[petType].mutations[petData.mutation] = true
                end
                if iconMap[petType] then
                    types[petType].icon = iconMap[petType]
                end
            end
        end
    end

    return types
end

local function updateForceStatus()
    local count = 0
    local totalPets = 0
    for petName, _ in pairs(forceDeleteList) do
        count = count + 1
        if uniquePetsCache[petName] then
            totalPets = totalPets + (uniquePetsCache[petName].count or 0)
        end
    end
    ForceStatusLabel.Text = string.format(
        "Dipilih: %d jenis pet (%d pet total akan dihapus)",
        count, totalPets
    )
end

local function refreshForceGrid()
    for _, child in ipairs(ForceGridFrame:GetChildren()) do
        if child:IsA("TextButton") then
            child:Destroy()
        end
    end

    local types = collectAllPetTypes()
    uniquePetsCache = types

    for petName, _ in pairs(forceDeleteList) do
        if not types[petName] then
            forceDeleteList[petName] = nil
        end
    end

    local sortedNames = {}
    for name, _ in pairs(types) do
        table.insert(sortedNames, name)
    end
    table.sort(sortedNames)

    local order = 0
    for _, petName in ipairs(sortedNames) do
        local data = types[petName]
        order = order + 1

        local isSelected = forceDeleteList[petName] == true

        local petBtn = Instance.new("TextButton")
        petBtn.Name = "PetBtn_" .. petName
        petBtn.Size = UDim2.new(0, 65, 0, 80)
        petBtn.BackgroundColor3 = isSelected
            and Color3.fromRGB(90, 40, 110)
            or Color3.fromRGB(35, 30, 45)
        petBtn.Text = ""
        petBtn.BorderSizePixel = 0
        petBtn.LayoutOrder = order
        petBtn.Parent = ForceGridFrame

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = petBtn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = isSelected
            and Color3.fromRGB(220, 120, 240)
            or Color3.fromRGB(80, 60, 100)
        btnStroke.Thickness = isSelected and 2 or 1
        btnStroke.Parent = petBtn

        local iconFrame = Instance.new("Frame")
        iconFrame.Size = UDim2.new(0, 45, 0, 45)
        iconFrame.Position = UDim2.new(0.5, -22, 0, 4)
        iconFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        iconFrame.BorderSizePixel = 0
        iconFrame.Parent = petBtn

        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 4)
        iconCorner.Parent = iconFrame

        local iconImg = Instance.new("ImageLabel")
        iconImg.Size = UDim2.new(1, -4, 1, -4)
        iconImg.Position = UDim2.new(0, 2, 0, 2)
        iconImg.BackgroundTransparency = 1
        iconImg.Image = data.icon or ""
        iconImg.Parent = iconFrame

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -4, 0, 12)
        nameLbl.Position = UDim2.new(0, 2, 0, 51)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = petName
        nameLbl.TextColor3 = isSelected
            and Color3.fromRGB(220, 150, 255)
            or Color3.fromRGB(200, 200, 220)
        nameLbl.TextSize = 8
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.Parent = petBtn

        local countLbl = Instance.new("TextLabel")
        countLbl.Size = UDim2.new(1, -4, 0, 10)
        countLbl.Position = UDim2.new(0, 2, 0, 64)
        countLbl.BackgroundTransparency = 1
        countLbl.Text = "x" .. tostring(data.count)
        countLbl.TextColor3 = Color3.fromRGB(180, 180, 200)
        countLbl.TextSize = 8
        countLbl.Font = Enum.Font.GothamMedium
        countLbl.Parent = petBtn

        if isSelected then
            local badge = Instance.new("TextLabel")
            badge.Size = UDim2.new(0, 14, 0, 14)
            badge.Position = UDim2.new(1, -16, 0, 2)
            badge.BackgroundColor3 = Color3.fromRGB(220, 120, 240)
            badge.Text = "✓"
            badge.TextColor3 = Color3.fromRGB(255, 255, 255)
            badge.TextSize = 10
            badge.Font = Enum.Font.GothamBold
            badge.BorderSizePixel = 0
            badge.Parent = petBtn

            local bc = Instance.new("UICorner")
            bc.CornerRadius = UDim.new(0, 7)
            bc.Parent = badge
        end

        petBtn.MouseButton1Click:Connect(function()
            if forceDeleteList[petName] then
                forceDeleteList[petName] = nil
            else
                forceDeleteList[petName] = true
            end
            refreshForceGrid()
            updateForceStatus()
            if #scanResults > 0 then scanPets() end
        end)
    end

    updateForceStatus()

    if #sortedNames == 0 then
        local emptyLbl = Instance.new("TextLabel")
        emptyLbl.Name = "EmptyLabel"
        emptyLbl.Size = UDim2.new(1, -20, 1, -20)
        emptyLbl.Position = UDim2.new(0, 10, 0, 10)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = "✨ Tidak ada pet yang bisa di-force delete.\n(Semua pet sedang di-equip atau di-like)"
        emptyLbl.TextColor3 = Color3.fromRGB(180, 180, 200)
        emptyLbl.TextSize = 11
        emptyLbl.Font = Enum.Font.GothamMedium
        emptyLbl.TextWrapped = true
        emptyLbl.Parent = ForceGridFrame
    end
end

local function createPetEntry(petData, index)
    local entry = Instance.new("Frame")
    entry.Name = "PetEntry_" .. index
    entry.Size = UDim2.new(1, -10, 0, 90)
    entry.BackgroundColor3 = petData.isForceDelete
        and Color3.fromRGB(50, 25, 60)
        or (petData.isLiked
            and Color3.fromRGB(45, 40, 20)
            or Color3.fromRGB(30, 30, 45))
    entry.BorderSizePixel = 0
    entry.LayoutOrder = index
    entry.Parent = ScrollFrame

    local entryCorner = Instance.new("UICorner")
    entryCorner.CornerRadius = UDim.new(0, 6)
    entryCorner.Parent = entry

    if petData.isForceDelete then
        local hl = Instance.new("UIStroke")
        hl.Color = Color3.fromRGB(200, 100, 220)
        hl.Thickness = 2
        hl.Parent = entry
    elseif petData.isLiked and protectLiked then
        local hl = Instance.new("UIStroke")
        hl.Color = Color3.fromRGB(255, 80, 120)
        hl.Thickness = 2
        hl.Parent = entry
    elseif petData.belowThreshold then
        local hl = Instance.new("UIStroke")
        hl.Color = Color3.fromRGB(255, 80, 80)
        hl.Thickness = 2
        hl.Parent = entry
    end

    local rankBadge = Instance.new("TextLabel")
    rankBadge.Name = "RankBadge"
    rankBadge.Size = UDim2.new(0, 22, 0, 22)
    rankBadge.Position = UDim2.new(0, 5, 0, 5)
    if petData.isForceDelete then
        rankBadge.BackgroundColor3 = Color3.fromRGB(200, 100, 220)
    elseif petData.isLiked and protectLiked then
        rankBadge.BackgroundColor3 = Color3.fromRGB(255, 80, 120)
    elseif petData.belowThreshold then
        rankBadge.BackgroundColor3 = Color3.fromRGB(200, 60, 60)
    else
        rankBadge.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
    end
    rankBadge.Text = tostring(index)
    rankBadge.TextColor3 = Color3.fromRGB(255, 255, 255)
    rankBadge.TextSize = 11
    rankBadge.Font = Enum.Font.GothamBold
    rankBadge.BorderSizePixel = 0
    rankBadge.Parent = entry

    local rankCorner = Instance.new("UICorner")
    rankCorner.CornerRadius = UDim.new(0, 11)
    rankCorner.Parent = rankBadge

    local IconFrame = Instance.new("Frame")
    IconFrame.Name = "IconFrame"
    IconFrame.Size = UDim2.new(0, 55, 0, 55)
    IconFrame.Position = UDim2.new(0, 32, 0, 15)
    IconFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    IconFrame.BorderSizePixel = 0
    IconFrame.Parent = entry

    local iconCorner = Instance.new("UICorner")
    iconCorner.CornerRadius = UDim.new(0, 6)
    iconCorner.Parent = IconFrame

    local IconImage = Instance.new("ImageLabel")
    IconImage.Name = "Icon"
    IconImage.Size = UDim2.new(1, -8, 1, -8)
    IconImage.Position = UDim2.new(0, 4, 0, 4)
    IconImage.BackgroundTransparency = 1
    IconImage.Image = petData.icon or ""
    IconImage.Parent = IconFrame

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Name = "NameLabel"
    NameLabel.Size = UDim2.new(1, -110, 0, 20)
    NameLabel.Position = UDim2.new(0, 100, 0, 8)
    NameLabel.BackgroundTransparency = 1
    local prefix = "🐾 "
    if petData.isForceDelete then prefix = "💀 "
    elseif petData.isLiked then prefix = "❤️ " end
    NameLabel.Text = prefix .. (petData.displayName or petData.itemName or "Unknown")
    NameLabel.TextColor3 = petData.isForceDelete
        and Color3.fromRGB(200, 130, 220)
        or (petData.isLiked
            and Color3.fromRGB(255, 120, 160)
            or (petData.belowThreshold
                and Color3.fromRGB(255, 120, 120)
                or Color3.fromRGB(80, 200, 120)))
    NameLabel.TextSize = 14
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = entry

    local DetailLabel1 = Instance.new("TextLabel")
    DetailLabel1.Name = "DetailLabel1"
    DetailLabel1.Size = UDim2.new(1, -110, 0, 14)
    DetailLabel1.Position = UDim2.new(0, 100, 0, 28)
    DetailLabel1.BackgroundTransparency = 1
    DetailLabel1.Text = string.format(
        "Type: %s  |  Count: %d  |  Mutation: %s",
        petData.itemName or "?",
        petData.count or 1,
        petData.mutation or "None"
    )
    DetailLabel1.TextColor3 = Color3.fromRGB(180, 180, 200)
    DetailLabel1.TextSize = 11
    DetailLabel1.Font = Enum.Font.GothamMedium
    DetailLabel1.TextXAlignment = Enum.TextXAlignment.Left
    DetailLabel1.Parent = entry

    local DetailLabel2 = Instance.new("TextLabel")
    DetailLabel2.Name = "DetailLabel2"
    DetailLabel2.Size = UDim2.new(1, -110, 0, 14)
    DetailLabel2.Position = UDim2.new(0, 100, 0, 44)
    DetailLabel2.BackgroundTransparency = 1
    DetailLabel2.Text = string.format(
        "⚖️ Weight: %s  |  Size: %s  |  Age: %s/%s",
        petData.weight or "N/A",
        petData.size or "?",
        petData.age or "?",
        petData.maxAge or "?"
    )
    DetailLabel2.TextColor3 = Color3.fromRGB(255, 200, 100)
    DetailLabel2.TextSize = 11
    DetailLabel2.Font = Enum.Font.GothamBold
    DetailLabel2.TextXAlignment = Enum.TextXAlignment.Left
    DetailLabel2.Parent = entry

    if petData.nickname and petData.nickname ~= "" then
        local NicknameLabel = Instance.new("TextLabel")
        NicknameLabel.Name = "NicknameLabel"
        NicknameLabel.Size = UDim2.new(1, -110, 0, 14)
        NicknameLabel.Position = UDim2.new(0, 100, 0, 62)
        NicknameLabel.BackgroundTransparency = 1
        NicknameLabel.Text = "📛 " .. petData.nickname
        NicknameLabel.TextColor3 = Color3.fromRGB(200, 150, 255)
        NicknameLabel.TextSize = 10
        NicknameLabel.Font = Enum.Font.GothamMedium
        NicknameLabel.TextXAlignment = Enum.TextXAlignment.Left
        NicknameLabel.Parent = entry
    end

    return entry
end

local function getThreshold()
    local text = WeightInput.Text
    if not text or text == "" then return nil end
    return tonumber(text)
end

function scanPets()
    for _, child in ipairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    scanResults = {}

    if not petAgeUtils or not inventoryStateModule then
        local errLabel = Instance.new("TextLabel")
        errLabel.Size = UDim2.new(1, -20, 0, 60)
        errLabel.Position = UDim2.new(0, 10, 0, 10)
        errLabel.BackgroundTransparency = 1
        errLabel.Text = "❌ Gagal mengakses module"
        errLabel.TextColor3 = Color3.fromRGB(255, 100, 100)
        errLabel.TextSize = 14
        errLabel.Font = Enum.Font.GothamMedium
        errLabel.TextWrapped = true
        errLabel.Parent = ScrollFrame
        return
    end

    local rawPlayerData = getRawPlayerData()
    local rawPets = {}
    if rawPlayerData and rawPlayerData.inventory and rawPlayerData.inventory.pets then
        rawPets = rawPlayerData.inventory.pets
    end

    local equippedSet = {}
    if rawPlayerData and rawPlayerData.equippedPets then
        for _, equippedId in ipairs(rawPlayerData.equippedPets) do
            equippedSet[equippedId] = true
        end
    end

    local stackedData = nil
    pcall(function()
        stackedData = inventoryStateModule.inventoryStackedData()
    end)

    if not stackedData then return end

    local petCount = 0
    local likedCount = 0
    local forceCount = 0
    local uniqueTypes = {}
    local totalWeight = 0
    local index = 0
    local threshold = getThreshold()

    for stackKey, itemData in pairs(stackedData) do
        local isPet = false
        if itemData.toolType then
            local tt = tostring(itemData.toolType):lower()
            if tt:find("pet") then isPet = true end
        end

        if isPet then
            local petId = nil
            if itemData.items and itemData.items[1] then
                petId = itemData.items[1].id
            end

            local rawPetData = nil
            if petId and rawPets[petId] then
                rawPetData = rawPets[petId]
            elseif itemData.items and itemData.items[1] then
                rawPetData = itemData.items[1].data
            end

            local weight = nil
            local weightStr = "N/A"
            local age = nil
            local maxAge = nil
            local size = "?"

            if rawPetData then
                weight = calculateWeight(rawPetData)
                weightStr = formatWeight(weight)
                age = getPetAge(rawPetData)
                maxAge = getMaxAge(rawPetData)
                size = rawPetData.size or "?"
            end

            if weight then
                totalWeight = totalWeight + (weight * (itemData.count or 1))
            end

            petCount = petCount + (itemData.count or 1)
            uniqueTypes[itemData.itemName] = true

            local mutation = "None"
            if rawPetData and rawPetData.mutation then
                mutation = rawPetData.mutation
            end

            local liked = isPetLiked(rawPetData)
            if liked then likedCount = likedCount + (itemData.count or 1) end

            local forceDelete = forceDeleteList[itemData.itemName] == true
            if forceDelete then forceCount = forceCount + (itemData.count or 1) end

            local belowThreshold = false
            if threshold and weight and weight < threshold then
                belowThreshold = true
            end

            index = index + 1

            local itemIds = {}
            if itemData.items then
                for _, item in ipairs(itemData.items) do
                    table.insert(itemIds, item.id)
                end
            end

            table.insert(scanResults, {
                displayName = itemData.displayName,
                itemName = itemData.itemName,
                count = itemData.count,
                mutation = mutation,
                nickname = rawPetData and rawPetData.nickname or itemData.nickname,
                icon = itemData.icon,
                stackKey = stackKey,
                weight = weightStr,
                weightValue = weight or 0,
                size = tostring(size),
                age = age and tostring(age) or "?",
                maxAge = maxAge and tostring(maxAge) or "?",
                belowThreshold = belowThreshold,
                isLiked = liked,
                isForceDelete = forceDelete,
                itemIds = itemIds
            })
        end
    end

    if sortByWeight then
        table.sort(scanResults, function(a, b)
            return (a.weightValue or 0) > (b.weightValue or 0)
        end)
    end

    for i, petEntry in ipairs(scanResults) do
        createPetEntry(petEntry, i)
    end

    local uniqueCount = 0
    for _ in pairs(uniqueTypes) do uniqueCount = uniqueCount + 1 end

    local statsText = string.format(
        "Total: %d  |  Types: %d  |  Weight: %s  |  ❤️: %d  |  💀: %d",
        petCount, uniqueCount, formatWeight(totalWeight), likedCount, forceCount
    )
    if threshold then
        statsText = statsText .. string.format("  |  Threshold: %s", formatWeight(threshold))
    end
    StatsLabel.Text = statsText

    if index == 0 then
        local noLabel = Instance.new("TextLabel")
        noLabel.Size = UDim2.new(1, -20, 0, 40)
        noLabel.Position = UDim2.new(0, 10, 0, 10)
        noLabel.BackgroundTransparency = 1
        noLabel.Text = "📭 Tidak ada pet ditemukan."
        noLabel.TextColor3 = Color3.fromRGB(180, 180, 200)
        noLabel.TextSize = 14
        noLabel.Font = Enum.Font.GothamMedium
        noLabel.Parent = ScrollFrame
    end
end

local function deletePetsBelowThreshold()
    local threshold = getThreshold()
    if not threshold and next(forceDeleteList) == nil then
        warn("[PetScanner] Threshold & Force List kosong!")
        return 0
    end

    scanPets()

    local idsToDelete = {}
    local skippedLiked = 0
    local forceDeleted = 0

    for _, pet in ipairs(scanResults) do
        if pet.itemIds and #pet.itemIds > 0 then
            if pet.isForceDelete then
                for _, id in ipairs(pet.itemIds) do
                    table.insert(idsToDelete, id)
                end
                forceDeleted = forceDeleted + #pet.itemIds
            elseif threshold and pet.belowThreshold then
                if protectLiked and pet.isLiked then
                    skippedLiked = skippedLiked + #pet.itemIds
                else
                    for _, id in ipairs(pet.itemIds) do
                        table.insert(idsToDelete, id)
                    end
                end
            end
        end
    end

    if skippedLiked > 0 then print("[PetScanner] ❤️ Skip", skippedLiked, "liked") end
    if forceDeleted > 0 then print("[PetScanner] 💀 Force delete", forceDeleted) end

    if #idsToDelete == 0 then
        print("[PetScanner] Tidak ada pet untuk dihapus.")
        return 0
    end

    local BATCH_SIZE = 50
    local totalDeleted = 0
    for i = 1, #idsToDelete, BATCH_SIZE do
        local batch = {}
        for j = i, math.min(i + BATCH_SIZE - 1, #idsToDelete) do
            table.insert(batch, idsToDelete[j])
        end
        local deleted = deleteMultiplePets(batch)
        totalDeleted = totalDeleted + deleted
        task.wait(0.3)
    end

    print("[PetScanner] Total deleted:", totalDeleted)
    return totalDeleted
end

-- Scanner Buttons
ScanBtn.MouseButton1Click:Connect(function()
    ScanBtn.Text = "⏳ SCANNING..."
    task.wait(0.1)
    scanPets()
    ScanBtn.Text = "🔍 SCAN PET"
end)

SortBtn.MouseButton1Click:Connect(function()
    sortByWeight = not sortByWeight
    if sortByWeight then
        SortBtn.Text = "📊 SORT: ON"
        SortBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
    else
        SortBtn.Text = "📊 SORT BY WEIGHT"
        SortBtn.BackgroundColor3 = Color3.fromRGB(150, 120, 200)
    end
    if #scanResults > 0 then scanPets() end
end)

ClearBtn.MouseButton1Click:Connect(function()
    for _, child in ipairs(ScrollFrame:GetChildren()) do
        if child:IsA("Frame") then
            child:Destroy()
        end
    end
    scanResults = {}
    StatsLabel.Text = "Total Pets: 0  |  Unique Types: 0  |  Total Weight: 0kg"
end)

AutoDeleteBtn.MouseButton1Click:Connect(function()
    autoDeleteEnabled = not autoDeleteEnabled
    if autoDeleteEnabled then
        AutoDeleteBtn.Text = "🗑 AUTO DELETE: ON"
        AutoDeleteBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
    else
        AutoDeleteBtn.Text = "🗑 AUTO DELETE: OFF"
        AutoDeleteBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
    end
end)

DeleteNowBtn.MouseButton1Click:Connect(function()
    local threshold = getThreshold()
    if not threshold and next(forceDeleteList) == nil then
        DeleteNowBtn.Text = "❌ ISI BERAT / PILIH PET"
        task.delay(1.5, function()
            DeleteNowBtn.Text = "⚡ DELETE NOW"
        end)
        return
    end

    DeleteNowBtn.Text = "⚠️ KONFIRMASI?"
    task.wait(2)
    if DeleteNowBtn.Text ~= "⚠️ KONFIRMASI?" then return end

    DeleteNowBtn.Text = "⏳ DELETING..."
    local deleted = deletePetsBelowThreshold()
    DeleteNowBtn.Text = string.format("✅ DELETED %d", deleted)
    task.delay(2, function()
        DeleteNowBtn.Text = "⚡ DELETE NOW"
        scanPets()
    end)
end)

ProtectLikedBtn.MouseButton1Click:Connect(function()
    protectLiked = not protectLiked
    if protectLiked then
        ProtectLikedBtn.Text = "❤️ PROTECT LIKED: ON"
        ProtectLikedBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
    else
        ProtectLikedBtn.Text = "⚠️ PROTECT LIKED: OFF"
        ProtectLikedBtn.BackgroundColor3 = Color3.fromRGB(200, 80, 80)
    end
    if #scanResults > 0 then scanPets() end
end)

RefreshForceBtn.MouseButton1Click:Connect(function()
    RefreshForceBtn.Text = "⏳..."
    task.wait(0.1)
    refreshForceGrid()
    RefreshForceBtn.Text = "🔄 REFRESH"
end)

ClearForceBtn.MouseButton1Click:Connect(function()
    forceDeleteList = {}
    refreshForceGrid()
    if #scanResults > 0 then scanPets() end
end)

task.spawn(function()
    while task.wait(1) do
        if autoDeleteEnabled and ScreenGui.Parent then
            local threshold = getThreshold()
            if threshold or next(forceDeleteList) ~= nil then
                pcall(function()
                    deletePetsBelowThreshold()
                end)
            end
        end
    end
end)

-- ============================================
-- ============================================
-- AUTO TRADE LOGIC (SCAN ALL PLAYERS)
-- ============================================
-- ============================================

local MAX_TRADE = 8
local autoTradeEnabled = false
local selectedPlayerName = ""
local tradeId = nil
local allPets = {}
local selectedPets = {}
local TRADE_COOLDOWN = 10

-- Find player
local function findPlayerByName(name)
    if not name or name == "" then return nil end
    local exact = Players:FindFirstChild(name)
    if exact then return exact end
    local lowerName = name:lower()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.Name:lower() == lowerName then return player end
    end
    for _, player in ipairs(Players:GetPlayers()) do
        if player.DisplayName:lower() == lowerName then return player end
    end
    return nil
end

-- ⭐ Render daftar semua player di server
local playerButtons = {}

local function renderPlayerList()
    print("[AutoTrade] renderPlayerList() called")

    for _, btn in ipairs(playerButtons) do
        if btn and btn.Parent then
            btn:Destroy()
        end
    end
    playerButtons = {}

    local allPlayers = Players:GetPlayers()
    local otherPlayers = {}
    for _, p in ipairs(allPlayers) do
        if p ~= LocalPlayer then
            table.insert(otherPlayers, p)
        end
    end

    print("[AutoTrade] Found", #otherPlayers, "other players")

    if #otherPlayers == 0 then
        local emptyLbl = Instance.new("TextLabel")
        emptyLbl.Size = UDim2.new(0, 400, 1, -12)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = "📭 Tidak ada player lain di server. Tunggu player lain join."
        emptyLbl.TextColor3 = Color3.fromRGB(180, 180, 200)
        emptyLbl.TextSize = 11
        emptyLbl.Font = Enum.Font.GothamMedium
        emptyLbl.TextWrapped = true
        emptyLbl.Parent = PlayerScroll
        table.insert(playerButtons, emptyLbl)
        return
    end

    for i, player in ipairs(otherPlayers) do
        local isSelected = (selectedPlayerName == player.Name)

        local pBtn = Instance.new("TextButton")
        pBtn.Name = "PlayerBtn_" .. player.Name
        pBtn.Size = UDim2.new(0, 120, 0, 95)
        pBtn.BackgroundColor3 = isSelected
            and Color3.fromRGB(30, 80, 120)
            or Color3.fromRGB(40, 45, 60)
        pBtn.Text = ""
        pBtn.BorderSizePixel = 0
        pBtn.LayoutOrder = i
        pBtn.Parent = PlayerScroll

        local pCorner = Instance.new("UICorner")
        pCorner.CornerRadius = UDim.new(0, 6)
        pCorner.Parent = pBtn

        local pStroke = Instance.new("UIStroke")
        pStroke.Color = isSelected
            and Color3.fromRGB(100, 180, 255)
            or Color3.fromRGB(70, 70, 90)
        pStroke.Thickness = isSelected and 2 or 1
        pStroke.Parent = pBtn

        -- Avatar
        local avatarFrame = Instance.new("Frame")
        avatarFrame.Size = UDim2.new(0, 44, 0, 44)
        avatarFrame.Position = UDim2.new(0.5, -22, 0, 4)
        avatarFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 70)
        avatarFrame.BorderSizePixel = 0
        avatarFrame.Parent = pBtn

        local avCorner = Instance.new("UICorner")
        avCorner.CornerRadius = UDim.new(0, 22)
        avCorner.Parent = avatarFrame

        local avatarImg = Instance.new("ImageLabel")
        avatarImg.Size = UDim2.new(1, -4, 1, -4)
        avatarImg.Position = UDim2.new(0, 2, 0, 2)
        avatarImg.BackgroundTransparency = 1
        pcall(function()
            avatarImg.Image = Players:GetUserThumbnailAsync(
                player.UserId,
                Enum.ThumbnailType.HeadShot,
                Enum.ThumbnailSize.Size100x100
            )
        end)
        avatarImg.Parent = avatarFrame

        local avImgCorner = Instance.new("UICorner")
        avImgCorner.CornerRadius = UDim.new(0, 22)
        avImgCorner.Parent = avatarImg

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -4, 0, 14)
        nameLbl.Position = UDim2.new(0, 2, 0, 52)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = player.Name
        nameLbl.TextColor3 = isSelected
            and Color3.fromRGB(150, 220, 255)
            or Color3.fromRGB(220, 220, 240)
        nameLbl.TextSize = 9
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.Parent = pBtn

        local dispLbl = Instance.new("TextLabel")
        dispLbl.Size = UDim2.new(1, -4, 0, 12)
        dispLbl.Position = UDim2.new(0, 2, 0, 68)
        dispLbl.BackgroundTransparency = 1
        dispLbl.Text = player.DisplayName
        dispLbl.TextColor3 = Color3.fromRGB(160, 160, 180)
        dispLbl.TextSize = 8
        dispLbl.Font = Enum.Font.GothamMedium
        dispLbl.TextTruncate = Enum.TextTruncate.AtEnd
        dispLbl.Parent = pBtn

        if isSelected then
            local badge = Instance.new("TextLabel")
            badge.Size = UDim2.new(0, 16, 0, 16)
            badge.Position = UDim2.new(1, -18, 0, 2)
            badge.BackgroundColor3 = Color3.fromRGB(100, 180, 255)
            badge.Text = "✓"
            badge.TextColor3 = Color3.fromRGB(255, 255, 255)
            badge.TextSize = 10
            badge.Font = Enum.Font.GothamBold
            badge.BorderSizePixel = 0
            badge.Parent = pBtn

            local bc = Instance.new("UICorner")
            bc.CornerRadius = UDim.new(0, 8)
            bc.Parent = badge
        end

        pBtn.MouseButton1Click:Connect(function()
            print("[AutoTrade] Player clicked:", player.Name)
            if selectedPlayerName == player.Name then
                selectedPlayerName = ""
                SelectedPlayerLabel.Text = "Target: -"
                updateTradeStatus("Target cleared")
            else
                selectedPlayerName = player.Name
                SelectedPlayerLabel.Text = "Target: " .. player.Name .. " (" .. player.DisplayName .. ")"
                updateTradeStatus("Target: " .. player.Name)
            end
            renderPlayerList()
        end)

        table.insert(playerButtons, pBtn)
    end
end

-- Scan pets for trade
local function scanTradePets()
    allPets = {}
    if not inventoryStateModule then return end
    local stackedData = nil
    pcall(function()
        stackedData = inventoryStateModule.inventoryStackedData()
    end)
    if not stackedData then return end

    local petTypes = {}
    for stackKey, itemData in pairs(stackedData) do
        if itemData.toolType and tostring(itemData.toolType):lower():find("pet") then
            local petName = itemData.itemName or "Unknown"
            local count = itemData.count or 1
            local icon = itemData.icon or ""
            if not petTypes[petName] then
                petTypes[petName] = {
                    name = petName,
                    count = 0,
                    icon = icon,
                    itemIds = {}
                }
            end
            petTypes[petName].count = petTypes[petName].count + count
            petTypes[petName].icon = icon
            if itemData.items then
                for _, item in ipairs(itemData.items) do
                    if item.id then
                        table.insert(petTypes[petName].itemIds, item.id)
                    end
                end
            end
        end
    end

    for name, data in pairs(petTypes) do
        table.insert(allPets, data)
    end
    table.sort(allPets, function(a, b)
        return a.name < b.name
    end)
end

local function countSelected()
    local count = 0
    for _ in pairs(selectedPets) do count = count + 1 end
    return count
end

local function updateTradeStatus(text)
    local names = {}
    for petName, _ in pairs(selectedPets) do
        table.insert(names, petName)
    end
    local selectedText = #names > 0 and table.concat(names, ", ") or "-"
    StatusLabel.Text = string.format(
        "Status: %s\n\nTrade ID: %s\nTarget: %s\nDipilih: %s",
        text, tradeId or "-",
        selectedPlayerName ~= "" and selectedPlayerName or "-",
        selectedText
    )
end

local tradePetButtons = {}

local function renderTradePetList()
    for _, btn in ipairs(tradePetButtons) do btn:Destroy() end
    tradePetButtons = {}

    if #allPets == 0 then
        local emptyLbl = Instance.new("TextLabel")
        emptyLbl.Size = UDim2.new(1, -20, 0, 40)
        emptyLbl.Position = UDim2.new(0, 10, 0, 10)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Text = "📭 Klik 🔍 SCAN PET"
        emptyLbl.TextColor3 = Color3.fromRGB(180, 180, 200)
        emptyLbl.TextSize = 12
        emptyLbl.Font = Enum.Font.GothamMedium
        emptyLbl.Parent = PetScroll
        table.insert(tradePetButtons, emptyLbl)
        return
    end

    for i, pet in ipairs(allPets) do
        local isSelected = selectedPets[pet.name] ~= nil
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0, 80, 0, 100)
        btn.BackgroundColor3 = isSelected and Color3.fromRGB(30, 80, 50) or Color3.fromRGB(35, 35, 50)
        btn.Text = ""
        btn.BorderSizePixel = 0
        btn.LayoutOrder = i
        btn.Parent = PetScroll

        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 6)
        btnCorner.Parent = btn

        local btnStroke = Instance.new("UIStroke")
        btnStroke.Color = isSelected and Color3.fromRGB(80, 255, 120) or Color3.fromRGB(60, 60, 80)
        btnStroke.Thickness = isSelected and 2 or 1
        btnStroke.Parent = btn

        local iconFrame = Instance.new("Frame")
        iconFrame.Size = UDim2.new(0, 60, 0, 60)
        iconFrame.Position = UDim2.new(0.5, -30, 0, 5)
        iconFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
        iconFrame.BorderSizePixel = 0
        iconFrame.Parent = btn

        local iconCorner = Instance.new("UICorner")
        iconCorner.CornerRadius = UDim.new(0, 4)
        iconCorner.Parent = iconFrame

        local iconImg = Instance.new("ImageLabel")
        iconImg.Size = UDim2.new(1, -4, 1, -4)
        iconImg.Position = UDim2.new(0, 2, 0, 2)
        iconImg.BackgroundTransparency = 1
        iconImg.Image = pet.icon
        iconImg.Parent = iconFrame

        local nameLbl = Instance.new("TextLabel")
        nameLbl.Size = UDim2.new(1, -4, 0, 14)
        nameLbl.Position = UDim2.new(0, 2, 0, 68)
        nameLbl.BackgroundTransparency = 1
        nameLbl.Text = pet.name
        nameLbl.TextColor3 = isSelected and Color3.fromRGB(150, 255, 180) or Color3.fromRGB(200, 200, 220)
        nameLbl.TextSize = 9
        nameLbl.Font = Enum.Font.GothamBold
        nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
        nameLbl.Parent = btn

        local countLbl = Instance.new("TextLabel")
        countLbl.Size = UDim2.new(1, -4, 0, 12)
        countLbl.Position = UDim2.new(0, 2, 0, 83)
        countLbl.BackgroundTransparency = 1
        countLbl.Text = "x" .. tostring(pet.count)
        countLbl.TextColor3 = Color3.fromRGB(180, 180, 200)
        countLbl.TextSize = 9
        countLbl.Font = Enum.Font.GothamMedium
        countLbl.Parent = btn

        if isSelected then
            local badge = Instance.new("TextLabel")
            badge.Size = UDim2.new(0, 18, 0, 18)
            badge.Position = UDim2.new(1, -20, 0, 2)
            badge.BackgroundColor3 = Color3.fromRGB(80, 200, 120)
            badge.Text = "✓"
            badge.TextColor3 = Color3.fromRGB(255, 255, 255)
            badge.TextSize = 12
            badge.Font = Enum.Font.GothamBold
            badge.BorderSizePixel = 0
            badge.Parent = btn
            local bc = Instance.new("UICorner")
            bc.CornerRadius = UDim.new(0, 9)
            bc.Parent = badge
        end

        btn.MouseButton1Click:Connect(function()
            if selectedPets[pet.name] then
                selectedPets[pet.name] = nil
            else
                if countSelected() >= MAX_TRADE then
                    updateTradeStatus("⚠️ Max " .. MAX_TRADE .. " pet!")
                    return
                end
                selectedPets[pet.name] = {
                    name = pet.name,
                    itemIds = pet.itemIds,
                    count = pet.count
                }
            end
            SelectedLabel.Text = "🐾 Dipilih: " .. countSelected() .. " / " .. MAX_TRADE .. " pet"
            renderTradePetList()
        end)

        table.insert(tradePetButtons, btn)
    end
end

local function updateSelectedPetsStock()
    scanTradePets()

    local petMap = {}
    for _, pet in ipairs(allPets) do
        petMap[pet.name] = pet
    end

    local removed = {}
    for petName, petData in pairs(selectedPets) do
        if petMap[petName] then
            selectedPets[petName].itemIds = petMap[petName].itemIds
            selectedPets[petName].count = petMap[petName].count
        else
            removed[petName] = true
        end
    end

    for petName, _ in pairs(removed) do
        selectedPets[petName] = nil
        print("[AutoTrade] Pet habis, dihapus:", petName)
    end

    SelectedLabel.Text = "🐾 Dipilih: " .. countSelected() .. " / " .. MAX_TRADE .. " pet"
    renderTradePetList()
    updateTradeStatus("Stock updated")
end

local function startTrade()
    if selectedPlayerName == "" then
        updateTradeStatus("❌ Pilih player dulu!")
        return
    end
    local target = findPlayerByName(selectedPlayerName)
    if target and sendRequestRemote then
        sendRequestRemote:FireServer(target)
        updateTradeStatus("📤 Request terkirim ke " .. target.Name)
        print("[AutoTrade] Request sent to:", target.Name)
    else
        updateTradeStatus("❌ Target tidak ditemukan / sudah keluar server!")
    end
end

-- Hook tradeCreated
if tradeCreatedRemote then
    tradeCreatedRemote.OnClientEvent:Connect(function(tid, partnerId, partnerName)
        print("[AutoTrade] tradeCreated:", tid, partnerName)
        tradeId = tid

        if autoTradeEnabled then
            updateTradeStatus("Trade created! Adding items...")

            task.spawn(function()
                task.wait(0.5)

                updateSelectedPetsStock()

                local allItemIds = {}
                for petName, petData in pairs(selectedPets) do
                    for _, id in ipairs(petData.itemIds) do
                        table.insert(allItemIds, id)
                    end
                end

                if #allItemIds == 0 then
                    updateTradeStatus("❌ Stock habis!")
                    autoTradeEnabled = false
                    ToggleBtn.Text = "🔄 AUTO TRADE: OFF"
                    ToggleBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
                    return
                end

                local added = 0
                for _, itemId in ipairs(allItemIds) do
                    if added >= MAX_TRADE then break end
                    if addItemRemote then
                        addItemRemote:FireServer(tid, {
                            itemType = "pet",
                            itemId = itemId
                        })
                    end
                    added = added + 1
                    task.wait(0.3)
                end

                updateTradeStatus("Added " .. added .. " items. Waiting...")
                task.wait(2)

                if acceptTradeRemote then
                    acceptTradeRemote:FireServer(tid)
                end
                updateTradeStatus("✅ Trade completed! Restarting in " .. TRADE_COOLDOWN .. "s...")

                task.wait(TRADE_COOLDOWN)

                updateSelectedPetsStock()

                local totalStock = 0
                for petName, petData in pairs(selectedPets) do
                    totalStock = totalStock + #petData.itemIds
                end

                if totalStock == 0 then
                    updateTradeStatus("❌ Stock habis! Auto trade OFF.")
                    autoTradeEnabled = false
                    ToggleBtn.Text = "🔄 AUTO TRADE: OFF"
                    ToggleBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
                    return
                end

                if autoTradeEnabled then
                    updateTradeStatus("🔄 Restarting... (stock: " .. totalStock .. ")")
                    task.wait(0.5)
                    startTrade()
                end
            end)
        end
    end)
end

-- Hook tradeRequestReceived
if tradeRequestReceivedRemote then
    tradeRequestReceivedRemote.OnClientEvent:Connect(function(tid, senderName, senderId)
        print("[AutoTrade] Request received from:", senderName)
        if autoTradeEnabled then
            if senderName == selectedPlayerName then
                task.wait(0.3)
                if acceptRequestRemote then
                    acceptRequestRemote:FireServer(tid)
                end
                task.wait(1)

                updateSelectedPetsStock()

                local allItemIds = {}
                for petName, petData in pairs(selectedPets) do
                    for _, id in ipairs(petData.itemIds) do
                        table.insert(allItemIds, id)
                    end
                end

                local added = 0
                for _, itemId in ipairs(allItemIds) do
                    if added >= MAX_TRADE then break end
                    if addItemRemote then
                        addItemRemote:FireServer(tid, {
                            itemType = "pet",
                            itemId = itemId
                        })
                    end
                    added = added + 1
                    task.wait(0.3)
                end

                task.wait(2)
                if acceptTradeRemote then
                    acceptTradeRemote:FireServer(tid)
                end
            end
        end
    end)
end

-- Trade Buttons
ScanPetBtn.MouseButton1Click:Connect(function()
    ScanPetBtn.Text = "⏳..."
    task.wait(0.1)
    scanTradePets()
    renderTradePetList()
    ScanPetBtn.Text = "🔍 SCAN PET"
    updateTradeStatus("Scanned " .. #allPets .. " pet types")
end)

RefreshPlayersBtn.MouseButton1Click:Connect(function()
    RefreshPlayersBtn.Text = "⏳..."
    task.wait(0.1)
    renderPlayerList()
    RefreshPlayersBtn.Text = "🔄 REFRESH"
end)

ToggleBtn.MouseButton1Click:Connect(function()
    autoTradeEnabled = not autoTradeEnabled

    if autoTradeEnabled then
        if selectedPlayerName == "" then
            autoTradeEnabled = false
            updateTradeStatus("❌ Pilih player dulu!")
            return
        end

        if countSelected() == 0 then
            autoTradeEnabled = false
            updateTradeStatus("❌ Pilih pet dulu!")
            return
        end

        ToggleBtn.Text = "🔄 AUTO TRADE: ON"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(100, 180, 100)
        updateTradeStatus("Menunggu request...")

        task.spawn(function()
            task.wait(0.5)
            startTrade()
        end)
    else
        ToggleBtn.Text = "🔄 AUTO TRADE: OFF"
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(150, 60, 60)
        updateTradeStatus("Idle")
    end
end)

StartBtn.MouseButton1Click:Connect(function()
    if selectedPlayerName == "" then
        updateTradeStatus("❌ Pilih player dulu!")
        return
    end
    if countSelected() == 0 then
        updateTradeStatus("❌ Pilih pet dulu!")
        return
    end
    startTrade()
end)

ClearSelBtn.MouseButton1Click:Connect(function()
    selectedPets = {}
    SelectedLabel.Text = "🐾 Dipilih: 0 / " .. MAX_TRADE .. " pet"
    renderTradePetList()
    updateTradeStatus("Cleared")
end)

-- Auto refresh player list saat ada yang join/leave
Players.PlayerAdded:Connect(function()
    task.wait(1)
    if ScreenGui.Parent then
        pcall(renderPlayerList)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    if selectedPlayerName == player.Name then
        selectedPlayerName = ""
        SelectedPlayerLabel.Text = "Target: -"
    end
    task.wait(0.5)
    if ScreenGui.Parent then
        pcall(renderPlayerList)
    end
end)

-- ============================================
-- ============================================
-- INIT
-- ============================================
-- ============================================

task.wait(1)

-- Render player list dulu
pcall(renderPlayerList)

-- Scan scanner
pcall(refreshForceGrid)
pcall(scanPets)

-- Update status
updateTradeStatus("Idle")
pcall(renderTradePetList)
pcall(renderPlayerList)

-- Auto refresh force grid
task.spawn(function()
    while task.wait(5) do
        if ScreenGui.Parent then
            pcall(refreshForceGrid)
        end
    end
end)

-- Auto refresh player list setiap 3 detik (fallback)
task.spawn(function()
    while task.wait(3) do
        if ScreenGui.Parent then
            pcall(renderPlayerList)
        end
    end
end)

print("[CombinedGUI] ✅ Loaded — Scanner + Auto Trade (Scan All Players)!")
