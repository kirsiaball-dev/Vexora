repeat wait() until game:IsLoaded() and game:FindFirstChild("CoreGui")

local function Notify(props)
    local title = props.Title or "Notification"
    local content = props.Content or ""
    local duration = props.Duration or 5
    local accentColor = Color3.fromRGB(20, 35, 70)
    local bgColor = Color3.fromRGB(0, 0, 0)
    local textColor = Color3.new(1, 1, 1)

    local screenGui = Instance.new("ScreenGui")
    screenGui.Parent = game:GetService("CoreGui")
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.Name = "VexoraNotification"

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 300, 0, 80)
    frame.Position = UDim2.new(1, -320, 0, 20)
    frame.BackgroundColor3 = bgColor
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.ClipsDescendants = true
    frame.Parent = screenGui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 8)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = accentColor
    stroke.Thickness = 2
    stroke.Parent = frame

    local titleBar = Instance.new("Frame")
    titleBar.Size = UDim2.new(1, 0, 0, 25)
    titleBar.BackgroundColor3 = accentColor
    titleBar.BorderSizePixel = 0
    titleBar.Parent = frame

    local titleCorner = Instance.new("UICorner")
    titleCorner.CornerRadius = UDim.new(0, 8)
    titleCorner.Parent = titleBar
    titleBar.ClipsDescendants = true

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -10, 1, 0)
    titleLabel.Position = UDim2.new(0, 10, 0, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = title
    titleLabel.TextColor3 = textColor
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = 16
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = titleBar

    local contentLabel = Instance.new("TextLabel")
    contentLabel.Size = UDim2.new(1, -20, 0, 30)
    contentLabel.Position = UDim2.new(0, 10, 0, 35)
    contentLabel.BackgroundTransparency = 1
    contentLabel.Text = content
    contentLabel.TextColor3 = textColor
    contentLabel.Font = Enum.Font.Gotham
    contentLabel.TextSize = 14
    contentLabel.TextWrapped = true
    contentLabel.TextXAlignment = Enum.TextXAlignment.Left
    contentLabel.Parent = frame

    local closeBtn = Instance.new("TextButton")
    closeBtn.Size = UDim2.new(0, 20, 0, 20)
    closeBtn.Position = UDim2.new(1, -25, 0, 2.5)
    closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    closeBtn.Text = "X"
    closeBtn.TextColor3 = textColor
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextSize = 14
    closeBtn.AutoButtonColor = false
    closeBtn.Parent = titleBar

    local closeCorner = Instance.new("UICorner")
    closeCorner.CornerRadius = UDim.new(0, 4)
    closeCorner.Parent = closeBtn

    closeBtn.MouseButton1Click:Connect(function()
        screenGui:Destroy()
    end)

    frame.Position = UDim2.new(1, 20, 0, 20)
    frame:TweenPosition(UDim2.new(1, -320, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)

    task.delay(duration, function()
        if screenGui and screenGui.Parent then
            frame:TweenPosition(UDim2.new(1, 20, 0, 20), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.3, true)
            task.wait(0.3)
            screenGui:Destroy()
        end
    end)
end

local function getScriptId()
    local g = game.GameId
    if g == 9363735110 then return "65c66a87b33565a9dea1a54b798b6b2a"
    elseif g == 7018190066 then return "a3e99a8c1a465fc973e7aa0dda0e220c"
    elseif g == 6325068386 then return "50ba70185011d66f3ed97e4e7f50bd11"
    elseif g == 4777817887 then return "6f48a7a95292a0885256d242900d81fb"
    elseif g == 994732206 then return "1ba7f8bc6888d119d65cdafbe3d78527"
    elseif g == 4658598196 then return "5698b5c40f0217c268e673ef5e7b6581"
    elseif g == 6331902150 then return "811768c852543782f63839177a263d53"
    elseif g == 7709344486 then return "36bb351f4d722c58af15efcb417b67da"
    elseif g == 6701277882 then return "378a78843196b1ded89499cbbf6e4bf9"
    elseif g == 7750955984 then return "3e8b8150efb71ad27504e3efbadd5f8a"
    elseif g == 7326934954 then return "c76b60f068204916e984f1c8ff73e435"
    else return nil end
end

local function getGameName()
    local g = game.GameId
    if g == 9363735110 then return "Escape Tsunami For Brainrot"
    elseif g == 7018190066 then return "Dead Rails"
    elseif g == 6325068386 then return "Blue Lock Rivals"
    elseif g == 4777817887 then return "Blade Ball"
    elseif g == 7436755782 then return "Grow a Garden"
    elseif g == 994732206 then return "Blox Fruit"
    elseif g == 4658598196 then return "Attack On Titan Revolution"
    elseif g == 6331902150 then return "Forsaken"
    elseif g == 7709344486 then return "Steal a Brainrot"
    elseif g == 6701277882 then return "Fish It"
    elseif g == 7750955984 then return "Hunty Zombie" 
    elseif g == 7326934954 then return "99 Night in The Forest"
    elseif g == 8316902627 then return "Plants Vs Brainrots"
    else return "Unknown Game"
    end
end

local scriptId = getScriptId()
local gameName = getGameName()

if scriptId then
    Notify({
        Title = "Vexora Hub",
        Content = gameName .. " script loaded!",
        Duration = 10
    })

    local mainUrl = "https://vss.pandadevelopment.net/virtual/file/" .. scriptId
    local success, result = pcall(function()
        return loadstring(game:HttpGet(mainUrl))()
    end)

    if not success then
        Notify({
            Title = "Vexora Hub",
            Content = "Failed to load script: " .. tostring(result),
            Duration = 8
        })
    end

    task.wait(5)
    Notify({
        Title = "Vexora Hub",
        Content = "Join our Discord for updates!",
        Duration = 5
    })
else
    Notify({
        Title = "Vexora Hub",
        Content = "Game not supported!",
        Duration = 8
    })
end
