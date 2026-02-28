-- Load library VexoraLib
local VexoraLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/kirsiaball-dev/Vexora/refs/heads/main/UI/VexoraLib.lua"))()

-- Membuat window utama
local Window = VexoraLib:CreateWindow({
    Title = "Vexora Hub",
    Description = "Example",
    ["Tab Width"] = 100,
    SizeUi = UDim2.fromOffset(530, 320)
})

-- Tab pertama: Beranda
local HomeTab = Window:CreateTab({
    Name = "Beranda",
    Icon = VexoraLib.Icons.menu
})

-- Section Informasi
local InfoSection = HomeTab:AddSection("Info", true)

-- Paragraph singkat
InfoSection:AddParagraph({
    Title = "VexoraLib Mini",
    Content = "Versi ringkas dengan ukuran layar lebih kecil."
})

InfoSection:AddSeperator({ Title = "Aksi" })
InfoSection:AddLine()

-- Section Kontrol
local ControlSection = HomeTab:AddSection("Kontrol", true)

-- Button
ControlSection:AddButton({
    Title = "Klik",
    Content = "Tombol aksi",
    Icon = VexoraLib.Icons.mouse,
    Callback = function()
        VexoraLib:SetNotification({
            Title = "Info",
            Description = "Tombol ditekan!",
            Time = 0.3,
            Delay = 2
        })
    end
})

-- Toggle
ControlSection:AddToggle({
    Title = "Mode Aktif",
    Content = "Nyalakan fitur",
    Default = false,
    Callback = function(value)
        print("Toggle:", value)
    end
})

-- Slider
ControlSection:AddSlider({
    Title = "Kecepatan",
    Content = "0-100",
    Increment = 1,
    Min = 0,
    Max = 100,
    Default = 50,
    Callback = function(value)
        print("Slider:", value)
    end
})

-- Tab kedua: Pengaturan
local SettingsTab = Window:CreateTab({
    Name = "Setelan",
    Icon = VexoraLib.Icons.settings
})

local SettingsSection = SettingsTab:AddSection("Pengaturan", true)

-- Dropdown single
SettingsSection:AddDropdown({
    Title = "Warna",
    Content = "Pilih warna",
    Multi = false,
    Options = {"Merah", "Hijau", "Biru"},
    Default = {"Merah"},
    Callback = function(selected)
        print("Warna:", table.concat(selected, ", "))
    end
})

-- Input
SettingsSection:AddInput({
    Title = "Nama",
    Content = "Masukkan nama",
    Default = "User",
    Callback = function(value)
        print("Nama:", value)
    end
})

-- Notifikasi sambutan
task.wait(0.5)
VexoraLib:SetNotification({
    Title = "Vexora Hub",
    Description = "Loaded",
    Content = "UI siap digunakan!",
    Time = 0.3,
    Delay = 3
})
