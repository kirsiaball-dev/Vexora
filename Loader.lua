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
    if g == 9363735110 then return "a9f3c7d6e2b41f5a8c9d0e3b7a6c1d4f"
    elseif g == 3647333358 then return "a3e99a8c1a465fc973e7aa0dda0e220c"
    elseif g == 9509842868 then return "50ba70185011d66f3ed97e4e7f50bd11"
    else return nil end
end

local function getGameName()
    local g = game.GameId
    if g == 9363735110 then return "Escape Tsunami For Brainrot"
    elseif g == 3647333358 then return "Evade"
    elseif g == 9509842868 then return "Garden Horizons"
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

    local mainUrl = "https://triplesixxx-xyz.vercel.app/api/" .. scriptId .. "/loader.lua"
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
