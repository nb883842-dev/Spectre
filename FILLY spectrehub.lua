-- SERVICES
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local LocalizationService = game:GetService("LocalizationService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- =========================
-- SCREEN GUI
-- =========================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpectreMobileGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = playerGui

-- =========================
-- DRAGGABLE OPENER
-- =========================
local Opener = Instance.new("Frame")
Opener.Size = UDim2.new(0,50,0,50)
Opener.Position = UDim2.new(0,20,0.5,-25)
Opener.BackgroundColor3 = Color3.fromRGB(0,0,0)
Opener.BorderSizePixel = 0
Opener.Parent = ScreenGui

local OpenerCorner = Instance.new("UICorner")
OpenerCorner.CornerRadius = UDim.new(0,10)
OpenerCorner.Parent = Opener

local OpenerStroke = Instance.new("UIStroke")
OpenerStroke.Parent = Opener
OpenerStroke.Color = Color3.fromRGB(255,255,255)
OpenerStroke.Thickness = 1

local OpenerLabel = Instance.new("TextLabel")
OpenerLabel.Parent = Opener
OpenerLabel.Size = UDim2.new(1,0,1,0)
OpenerLabel.BackgroundTransparency = 1
OpenerLabel.Text = "S"
OpenerLabel.TextScaled = true
OpenerLabel.Font = Enum.Font.GothamBlack
OpenerLabel.TextColor3 = Color3.fromRGB(255,255,255)

-- =========================
-- MAIN FRAME
-- =========================
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0,520,0,260)
MainFrame.Position = UDim2.new(0.5,-260,0.5,-130)
MainFrame.BackgroundColor3 = Color3.fromRGB(10,10,10)
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(120,120,120)
MainFrame.Visible = false

-- =========================
-- TOP BAR
-- =========================
local TopBar = Instance.new("Frame")
TopBar.Parent = MainFrame
TopBar.Size = UDim2.new(1,0,0,36)
TopBar.BackgroundColor3 = Color3.fromRGB(0,0,0)
TopBar.BorderSizePixel = 0

local Title = Instance.new("TextLabel")
Title.Parent = TopBar
Title.Size = UDim2.new(1,-40,1,0)
Title.Position = UDim2.new(0,10,0,0)
Title.Text = "Xx SpectreHub xX"
Title.TextColor3 = Color3.fromRGB(255,255,255)
Title.Font = Enum.Font.GothamBold
Title.TextScaled = true
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.BackgroundTransparency = 1

local Close = Instance.new("Frame")
Close.Parent = TopBar
Close.Size = UDim2.new(0,36,1,0)
Close.Position = UDim2.new(1,-36,0,0)
Close.BackgroundColor3 = Color3.fromRGB(0,0,0)
Close.BorderSizePixel = 0

local CloseStroke = Instance.new("UIStroke")
CloseStroke.Parent = Close
CloseStroke.Color = Color3.fromRGB(255,255,255)
CloseStroke.Thickness = 1

local CloseCorner = Instance.new("UICorner")
CloseCorner.Parent = Close
CloseCorner.CornerRadius = UDim.new(0,6)

local CloseLabel = Instance.new("TextLabel")
CloseLabel.Parent = Close
CloseLabel.Size = UDim2.new(1,0,1,0)
CloseLabel.BackgroundTransparency = 1
CloseLabel.Text = "X"
CloseLabel.TextColor3 = Color3.fromRGB(255,255,255)
CloseLabel.Font = Enum.Font.GothamBold
CloseLabel.TextScaled = true

local TitleLine = Instance.new("Frame")
TitleLine.Parent = MainFrame
TitleLine.Size = UDim2.new(1,0,0,1)
TitleLine.Position = UDim2.new(0,0,0,36)
TitleLine.BackgroundColor3 = Color3.fromRGB(255,255,255)
TitleLine.BorderSizePixel = 0

-- =========================
-- SIDEBAR
-- =========================
local Sidebar = Instance.new("Frame")
Sidebar.Parent = MainFrame
Sidebar.Position = UDim2.new(0,0,0,37)
Sidebar.Size = UDim2.new(0,120,1,-37)
Sidebar.BackgroundColor3 = Color3.fromRGB(0,0,0)
Sidebar.BorderSizePixel = 0

local function SidebarButton(text,index)
    local btn = Instance.new("Frame")
    btn.Parent = Sidebar
    btn.Size = UDim2.new(1,-10,0,30)
    btn.Position = UDim2.new(0,5,0,8 + index*32)
    btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
    btn.BorderSizePixel = 0

    local stroke = Instance.new("UIStroke")
    stroke.Parent = btn
    stroke.Color = Color3.fromRGB(255,255,255)
    stroke.Thickness = 1

    local corner = Instance.new("UICorner")
    corner.Parent = btn
    corner.CornerRadius = UDim.new(0,6)

    local label = Instance.new("TextLabel")
    label.Parent = btn
    label.Size = UDim2.new(1,0,1,0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255,255,255)
    label.Font = Enum.Font.Gotham
    label.TextScaled = true

    return btn
end

local btnHome = SidebarButton("Home",0)
local btnMain = SidebarButton("Main",1)
local btnSpectre = SidebarButton("SpectreScript",2)
local btnOther = SidebarButton("Other",3)
local btnGameHub = SidebarButton("GameHub",4)
local btnInfo = SidebarButton("Information",5)

-- =========================
-- CONTENT AREA
-- =========================
local Content = Instance.new("Frame")
Content.Parent = MainFrame
Content.Position = UDim2.new(0,130,0,46)
Content.Size = UDim2.new(1,-140,1,-56)
Content.BackgroundTransparency = 1

-- =========================
-- TABS
-- =========================
local Tabs = {}
local function CreateTab(name)
    local frame = Instance.new("Frame")
    frame.Parent = Content
    frame.Size = UDim2.new(1,0,1,0)
    frame.BackgroundTransparency = 1
    frame.Visible = false
    Tabs[name] = frame
    return frame
end

CreateTab("Home")
CreateTab("Main")
CreateTab("SpectreScript")
CreateTab("Other")
CreateTab("GameHub")
CreateTab("Information")

-- =========================
-- HOME TAB PLAYER INFO
-- =========================
local homeTab = Tabs["Home"]
local countryMap = {["US"]="United States",["PH"]="Philippines",["IN"]="India",["BD"]="Bangladesh",["GB"]="United Kingdom"}

local PlayerInfoFrame = Instance.new("Frame")
PlayerInfoFrame.Parent = homeTab
PlayerInfoFrame.Size = UDim2.new(0, 300, 0, 180)
PlayerInfoFrame.Position = UDim2.new(0, 10, 0, 10)
PlayerInfoFrame.BackgroundColor3 = Color3.fromRGB(15,15,15)
PlayerInfoFrame.BorderSizePixel = 0

local PlayerInfoStroke = Instance.new("UIStroke")
PlayerInfoStroke.Parent = PlayerInfoFrame
PlayerInfoStroke.Color = Color3.fromRGB(255,255,255)
PlayerInfoStroke.Thickness = 1

local PlayerInfoCorner = Instance.new("UICorner")
PlayerInfoCorner.Parent = PlayerInfoFrame
PlayerInfoCorner.CornerRadius = UDim.new(0,10)

local function CreateLabel(parent, posY)
    local lbl = Instance.new("TextLabel")
    lbl.Parent = parent
    lbl.Size = UDim2.new(1,-10,0,30)
    lbl.Position = UDim2.new(0,5,0,posY)
    lbl.BackgroundTransparency = 1
    lbl.TextColor3 = Color3.fromRGB(255,255,255)
    lbl.Font = Enum.Font.Gotham
    lbl.TextScaled = true
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    return lbl
end

local usernameLabel = CreateLabel(PlayerInfoFrame,5)
local userIdLabel = CreateLabel(PlayerInfoFrame,40)
local accountAgeLabel = CreateLabel(PlayerInfoFrame,75)
local countryLabel = CreateLabel(PlayerInfoFrame,110)

local function CountryCodeToFlag(code)
    if not code then return "" end
    local flag = ""
    for i = 1,#code do
        local c = code:sub(i,i):upper()
        flag = flag .. utf8.char(127397 + string.byte(c))
    end
    return flag
end

local function UpdatePlayerInfo()
    usernameLabel.Text = "Username: "..player.Name
    userIdLabel.Text = "UserId: "..player.UserId
    accountAgeLabel.Text = "Account Age: "..math.floor(player.AccountAge).." days"
    local success, countryCode = pcall(function() return LocalizationService:GetCountryRegionForPlayerAsync(player) end)
    if success then
        local countryName = countryMap[countryCode] or "Unknown"
        local flag = CountryCodeToFlag(countryCode)
        countryLabel.Text = "Country: "..flag.." "..countryName
    else
        countryLabel.Text = "Country: Unknown"
    end
end

UpdatePlayerInfo()
RunService.RenderStepped:Connect(UpdatePlayerInfo)

-- =========================
-- INFORMATION TAB
-- =========================
local infoTab = Tabs["Information"]
local infoText = Instance.new("TextLabel")
infoText.Parent = infoTab
infoText.Size = UDim2.new(1,-20,1,-20)
infoText.Position = UDim2.new(0,10,0,10)
infoText.BackgroundTransparency = 1
infoText.TextColor3 = Color3.fromRGB(255,255,255)
infoText.Font = Enum.Font.Gotham
infoText.TextScaled = true
infoText.TextWrapped = true
infoText.TextXAlignment = Enum.TextXAlignment.Left
infoText.TextYAlignment = Enum.TextYAlignment.Top
infoText.Text = "Created in Tuesday, December 30, 2025, Created due to Ghosthub adding a Key And Inspired by the script Ghosthub"

-- =========================
-- MAIN TAB SCRIPTS TABLE
-- =========================
local mainScripts = {
    {Name="Inf Jump", Code='loadstring(game:HttpGet("https://pastefy.app/Yub5N7Xs/raw"))()'},
    {Name="Walkspeed", Code='loadstring(game:HttpGet("https://pastefy.app/Uo8ECEnR/raw"))()'},
    {Name="Jump Power", Code='loadstring(game:HttpGet("https://pastefy.app/rwjw9lvq/raw"))()'},
    {Name="Rejoin", Code='loadstring(game:HttpGet("https://pastefy.app/TNc7kd6e/raw"))()'},
    {Name="Anti AFK", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/evxncodes/mainroblox/main/anti-afk", true))()'},
    {Name="Anti Lag", Code='loadstring(game:HttpGet("https://pastefy.app/nDORd4jk/raw"))()'},
    {Name="Anti Kick", Code='loadstring(game:HttpGet("https://pastefy.app/3v88pb4M/raw"))()'},
    {Name="Anti Ban", Code='loadstring(game:HttpGet("https://pastefy.app/9hDSfrdK/raw"))()'},
    {Name="Night", Code='loadstring(game:HttpGet("https://pastefy.app/0M8wi3S3/raw"))()'},
    {Name="Day", Code='loadstring(game:HttpGet("https://pastefy.app/HLXTNAkt/raw"))()'},
    {Name="Equip Tools", Code='loadstring(game:HttpGet("https://pastefy.app/bX4o4R7Y/raw"))()'},
    {Name="Unequip Tools", Code='loadstring(game:HttpGet("https://pastefy.app/4WXvZDNC/raw"))()'},
    {Name="Drop Tools", Code='loadstring(game:HttpGet("https://pastefy.app/qzoUsv0S/raw"))()'},
    {Name="Check Health", Code='loadstring(game:HttpGet("https://pastefy.app/W3h3JZwZ/raw"))()'},
    {Name="Show Invisible", Code='loadstring(game:HttpGet("https://pastefy.app/hIEGibOY/raw"))()'},
    {Name="Hide Invisible", Code='loadstring(game:HttpGet("https://pastefy.app/mGOBI8nd/raw"))()'},
    {Name="Reset", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Reset/refs/heads/main/Reset"))()'},
    {Name="Goto Camera", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Goto-cam/refs/heads/main/Goto%20Cam"))()'},
    {Name="On X-ray", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/x-ray%20ON"))()'},
    {Name="Off X-ray", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/X-ray%20Off"))()'},
    {Name="Disable Chat", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Disable%20Chat"))()'},
    {Name="Enable Chat", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Enable%20Chat"))()'},
    {Name="Check Account", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Check%20account"))()'},
    {Name="Invite Friends", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Invite%20friends"))()'},
    {Name="Leave", Code='game:Shutdown()'},
    {Name="Spawn Part", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Spawn%20Part"))()'},
    {Name="Noclip", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Enable%20Noclip"))()'},
    {Name="Unclip", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Disable%20Noclip"))()'},
    {Name="Disable Jump", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Disable%20Jump"))()'},
    {Name="Enable Jump", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Enable%20Jump"))()'},
    {Name="Disable Control", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Disable%20Control"))()'},
    {Name="Enable Control", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Enable%20Control"))()'},
    {Name="Serverhop", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Serverhop"))()'},
    {Name="Super Zoom", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Super%20zoom"))()'},
    {Name="Full Brightness", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Full%20brightness"))()'},
    {Name="Enable Dark Fog", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Dark%20fog"))()'},
    {Name="Disable Dark Fog", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Dark%20Fog%20Off"))()'},
    {Name="Sit Character", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Sit"))()'},
    {Name="Count Players", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Count%20Players"))()'},
    {Name="Freeze", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Freeze"))()'},
    {Name="Unfreeze", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Unfreeze"))()'},
    {Name="Fix Camera", Code='loadstring(game:HttpGet("https://raw.githubusercontent.com/nb883842-dev/Spectre/refs/heads/main/Fix%20camera"))()'},
}

-- To add a new script, just add another line like:
-- {Name="New Script Name", Code='loadstring(game:HttpGet("URL_TO_SCRIPT"))()'},

-- =========================
-- PAGINATION VARIABLES
-- =========================
local gridRows, gridColumns, padding = 4,6,8
local buttonsPerPage = gridRows * gridColumns
local currentPage = 1
local pageButtons = {}

-- =========================
-- DRAW PAGE FUNCTION (FULL FIXED)
local function DrawPage(page)
    -- destroy old buttons
    for _,btn in pairs(pageButtons) do btn:Destroy() end
    pageButtons = {}

    local startIdx = (page-1)*buttonsPerPage + 1
    local endIdx = math.min(startIdx + buttonsPerPage - 1, #mainScripts)

    -- calculate buttonWidth, buttonHeight
    local totalWidth, totalHeight = Tabs["Main"].AbsoluteSize.X, Tabs["Main"].AbsoluteSize.Y - 50
    local buttonWidth = (totalWidth-(gridColumns+1)*padding)/gridColumns
    local buttonHeight = (totalHeight-(gridRows+1)*padding)/gridRows

    -- create buttons in a grid
    for idx=startIdx,endIdx do
        local row = math.floor((idx-startIdx)/gridColumns)
        local col = (idx-startIdx)%gridColumns

        local btn = Instance.new("Frame")
        btn.Parent = Tabs["Main"]
        btn.Size = UDim2.new(0, buttonWidth, 0, buttonHeight)
        btn.Position = UDim2.new(0, padding+col*(buttonWidth+padding), 0, padding+row*(buttonHeight+padding))
        btn.BackgroundColor3 = Color3.fromRGB(15,15,15)
        btn.BorderSizePixel = 0

        local stroke = Instance.new("UIStroke")
        stroke.Parent = btn
        stroke.Color = Color3.fromRGB(255,255,255)
        stroke.Thickness = 1

        local corner = Instance.new("UICorner")
        corner.Parent = btn
        corner.CornerRadius = UDim.new(0,8)

        local label = Instance.new("TextLabel")
        label.Parent = btn
        label.Size = UDim2.new(1,0,1,0)
        label.BackgroundTransparency = 1
        label.Text = mainScripts[idx].Name
        label.TextColor3 = Color3.fromRGB(255,255,255)
        label.Font = Enum.Font.Gotham
        label.TextScaled = true

        btn.InputBegan:Connect(function(input)
            if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
                local code = mainScripts[idx].Code
                if code~="-- Work in Progress" then
                    loadstring(code)()
                end
            end
        end)

        table.insert(pageButtons, btn)
    end

    -- Next Button with border fix
    local NextButtonFrame = Instance.new("Frame")
    NextButtonFrame.Parent = Tabs["Main"]
    NextButtonFrame.Size = UDim2.new(0, 100, 0, 40)
    NextButtonFrame.Position = UDim2.new(1, -110, 1, -50)
    NextButtonFrame.BackgroundColor3 = Color3.fromRGB(20,20,20)
    NextButtonFrame.BorderSizePixel = 0

    local nextStroke = Instance.new("UIStroke")
    nextStroke.Parent = NextButtonFrame
    nextStroke.Color = Color3.fromRGB(255,255,255)
    nextStroke.Thickness = 2

    local nextCorner = Instance.new("UICorner")
    nextCorner.Parent = NextButtonFrame
    nextCorner.CornerRadius = UDim.new(0,6)

    local NextButton = Instance.new("TextButton")
    NextButton.Parent = NextButtonFrame
    NextButton.Size = UDim2.new(1,0,1,0)
    NextButton.Position = UDim2.new(0,0,0,0)
    NextButton.BackgroundTransparency = 1
    NextButton.BorderSizePixel = 0
    NextButton.Font = Enum.Font.GothamBold
    NextButton.Text = "Next"
    NextButton.TextColor3 = Color3.fromRGB(255,255,255)
    NextButton.TextScaled = true

    NextButton.MouseButton1Click:Connect(function()
        currentPage = currentPage + 1
        if (currentPage - 1) * buttonsPerPage + 1 > #mainScripts then
            currentPage = 1
        end
        DrawPage(currentPage)
    end)

    table.insert(pageButtons, NextButtonFrame) -- so it gets destroyed when switching pages
end

-- =========================
-- INITIAL DRAW
DrawPage(currentPage)

-- =========================
-- SWITCH TAB FUNCTION
local function SwitchTab(tabName)
    for name,frame in pairs(Tabs) do
        frame.Visible = (name==tabName)
    end
end
SwitchTab("Home")

-- =========================
-- SIDEBAR CLICK EVENTS
local function SidebarClick(btn,tabName)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
            SwitchTab(tabName)
        end
    end)
end

SidebarClick(btnHome,"Home")
SidebarClick(btnMain,"Main")
SidebarClick(btnSpectre,"SpectreScript")
SidebarClick(btnOther,"Other")
SidebarClick(btnGameHub,"GameHub")
SidebarClick(btnInfo,"Information")

-- =========================
-- TOGGLE MAIN FRAME
Opener.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        MainFrame.Visible = not MainFrame.Visible
    end
end)

Close.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.MouseButton1 or input.UserInputType==Enum.UserInputType.Touch then
        MainFrame.Visible = false
    end
end)

-- =========================
-- DRAG OPENER
local dragging=false
local dragStart,startPos
local dragInput

local function updateDrag(input)
    if not startPos or not dragStart then return end
    if not input.Position then return end

    local delta = input.Position - dragStart
    local targetPos = UDim2.new(
        startPos.X.Scale,
        startPos.X.Offset + delta.X,
        startPos.Y.Scale,
        startPos.Y.Offset + delta.Y
    )
    Opener.Position = Opener.Position:Lerp(targetPos, 0.3)
end

Opener.InputBegan:Connect(function(input)
    if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=input.Position
        startPos=Opener.Position
        dragInput=input
    end
end)

Opener.InputEnded:Connect(function(input)
    if input==dragInput then dragging=false dragInput=nil end
end)

UserInputService.InputChanged:Connect(function(input)
    if dragging and input==dragInput then
        if input.UserInputType==Enum.UserInputType.Touch or input.UserInputType==Enum.UserInputType.MouseMovement then
            updateDrag(input)
        end
    end
end)

RunService.RenderStepped:Connect(function()
    if dragging and dragInput then updateDrag(dragInput) end
end)