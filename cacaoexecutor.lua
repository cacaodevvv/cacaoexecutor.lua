--[[
    CHILI HUB V2 - VISUAL SYSTEM
    By: CACAODEV
    Link: https://raw.githubusercontent.com/cacaodevvv/visual.lua/refs/heads/main/visual.lua
--]]

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

-- CONFIGURACIÓN PRINCIPAL (Asegúrate de que los nombres coincidan en tu Explorer)
local ScreenGui = script:FindFirstAncestorOfClass("ScreenGui")
local MainFrame = ScreenGui:WaitForChild("MainFrame") -- Tu ventana de Executor
local Editor = MainFrame:WaitForChild("Editor") -- Tu TextBox donde escribes el código
local ExecuteBtn = MainFrame:WaitForChild("ExecuteBtn") -- Tu botón de Rayo/Play

-- 1. FUNCIÓN DE NOTIFICACIÓN ESTILO ROLARA
local function NotificarRolara(scriptText)
    local NotifFrame = Instance.new("Frame")
    local UICorner = Instance.new("UICorner")
    local Icon = Instance.new("ImageLabel")
    local Title = Instance.new("TextLabel")
    local Preview = Instance.new("TextLabel")
    local Bar = Instance.new("Frame")

    -- Diseño del Frame
    NotifFrame.Name = "RolaraNotification"
    NotifFrame.Parent = ScreenGui
    NotifFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Position = UDim2.new(1.2, 0, 0.85, 0) -- Empieza afuera
    NotifFrame.Size = UDim2.new(0, 260, 0, 65)
    NotifFrame.ZIndex = 10
    
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = NotifFrame

    -- Icono de Check Verde
    Icon.Parent = NotifFrame
    Icon.BackgroundTransparency = 1
    Icon.Position = UDim2.new(0.05, 0, 0.2, 0)
    Icon.Size = UDim2.new(0, 35, 0, 35)
    Icon.Image = "rbxassetid://11419713314"
    Icon.ImageColor3 = Color3.fromRGB(0, 255, 130)

    -- Título
    Title.Parent = NotifFrame
    Title.BackgroundTransparency = 1
    Title.Position = UDim2.new(0.25, 0, 0.15, 0)
    Title.Size = UDim2.new(0.7, 0, 0.35, 0)
    Title.Font = Enum.Font.GothamBold
    Title.Text = "Code executed"
    Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    Title.TextSize = 16
    Title.TextXAlignment = Enum.TextXAlignment.Left

    -- Preview del Script (Lo que pediste)
    Preview.Parent = NotifFrame
    Preview.BackgroundTransparency = 1
    Preview.Position = UDim2.new(0.25, 0, 0.5, 0)
    Preview.Size = UDim2.new(0.7, 0, 0.3, 0)
    Preview.Font = Enum.Font.Code
    Preview.Text = tostring(scriptText):sub(1, 25) .. "..."
    Preview.TextColor3 = Color3.fromRGB(160, 160, 160)
    Preview.TextSize = 13
    Preview.TextXAlignment = Enum.TextXAlignment.Left

    -- Barra de Progreso Inferior
    Bar.Parent = NotifFrame
    Bar.BackgroundColor3 = Color3.fromRGB(0, 255, 130)
    Bar.BorderSizePixel = 0
    Bar.Position = UDim2.new(0, 0, 0.95, 0)
    Bar.Size = UDim2.new(1, 0, 0, 3)

    -- ANIMACIONES
    -- Entrada
    NotifFrame:TweenPosition(UDim2.new(0.98, -260, 0.85, 0), "Out", "Quart", 0.5, true)
    
    -- Barra vaciándose
    TweenService:Create(Bar, TweenInfo.new(3, Enum.EasingStyle.Linear), {Size = UDim2.new(0, 0, 0, 3)}):Play()

    task.delay(3, function()
        -- Salida
        NotifFrame:TweenPosition(UDim2.new(1.2, 0, 0.85, 0), "In", "Quart", 0.5, true)
        task.wait(0.6)
        NotifFrame:Destroy()
    end)
end

-- 2. LÓGICA DEL BOTÓN EJECUTAR
ExecuteBtn.MouseButton1Click:Connect(function()
    local code = Editor.Text
    
    if code ~= "" and code ~= " " then
        -- Mandamos la notificación estilo Rolara
        NotificarRolara(code)
        
        -- Ejecutamos el código (pcall para que no se crashee tu GUI si el script es basura)
        local success, result = pcall(function()
            assert(loadstring(code))()
        end)
        
        if not success then
            warn("CHILI HUB ERROR: " .. tostring(result))
        end
    else
        warn("Escribe algo en el editor, Joaquín, no mames.")
    end
end)

print("Visual System Loaded - By Cacaodev")
