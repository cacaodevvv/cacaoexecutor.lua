local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Exploit Hub | Custom Script",
   LoadingTitle = "Cargando Configuración...",
   LoadingSubtitle = "Developed by CacaoDev",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "CacaoDevScripts",
      FileName = "HubConfig"
   }
})

-- SECCIÓN 1: SAB
local TabSAB = Window:CreateTab("SAB", 4483362458)

TabSAB:CreateSection("Opciones de Trade & Troll")

TabSAB:CreateToggle({
   Name = "Freeze Trade",
   CurrentValue = false,
   Flag = "SAB_Freeze",
   Callback = function(Value)
      -- Lógica de congelar
      print("Freeze Trade SAB:", Value)
   end,
})

TabSAB:CreateButton({
   Name = "Force Trade",
   Callback = function()
      print("Intentando Force Trade en SAB...")
   end,
})

TabSAB:CreateButton({
   Name = "Force Brainrots",
   Callback = function()
      print("Ejecutando Force Brainrots...")
   end,
})

-- SECCIÓN 2: MM2
local TabMM2 = Window:CreateTab("MM2", 4483362458)

TabMM2:CreateSection("Murder Mystery 2 Utilities")

TabMM2:CreateToggle({
   Name = "Freeze Trade",
   CurrentValue = false,
   Flag = "MM2_Freeze",
   Callback = function(Value)
      print("Freeze Trade MM2:", Value)
   end,
})

TabMM2:CreateButton({
   Name = "Force Guns",
   Callback = function()
      print("Force Guns Activado")
   end,
})

Rayfield:LoadConfiguration()
