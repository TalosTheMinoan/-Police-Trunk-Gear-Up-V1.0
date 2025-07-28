# 🚓 Police Trunk Armory V1.0 [ESX]

Press **E** behind police vehicles to gear up.

- Trunk opens + sound + animation  
- Police job only (ESX)  
- Anti-clipping system (no more getting inside the trunk)  
- Cooldown system with time shown  
- Localized: English, Greeklish, French, German  

## 🆕 What's new in v1.0

- ✅ Works on **every vehicle**, no more clipping inside trunks  
- 🌐 Added **full translations**: `en`, `gr` (Greeklish), `fr`, `de`  
- ⏳ Cooldown feature to prevent spamming (You can turn it on or of in config.lua)  
- 🔧 Full configuration via `config.lua` (no need to edit `client.lua`)  
- 💾 Easy to add new vehicles with unique loadouts

## 📥 Install

1. Drop in your `resources/` folder  
2. Add `start police-trunk-armory` to your `server.cfg`

## ⚙️ Customize (`config.lua`)

- **Language setting**:
  ```lua
  Config.Locale = 'en'

- **Cooldown system**:

1. Config.EnableCooldown = true
2. Config.CooldownTime = 60


- **Vehicle-specific gear**:
Config.PoliceVehicles = {
    ["police"] = {
        weapons = { "WEAPON_CARBINERIFLE", "WEAPON_NIGHTSTICK" },
        armor = 100
    },
    ["fbi"] = {
        weapons = { "WEAPON_PISTOL", "WEAPON_STUNGUN" },
        armor = 75
    },
    ["blazex5"] = {
        weapons = { "WEAPON_CARBINERIFLE", "WEAPON_PISTOL", "WEAPON_STUNGUN" },
        armor = 100
    },
    ["18raptor"] = {
        weapons = { "WEAPON_CARBINERIFLE", "WEAPON_PISTOL", "WEAPON_STUNGUN" },
        armor = 100
    },
    ["police2"] = {
        weapons = { "WEAPON_PISTOL" },
        armor = 50
    }
}


- **🌍 Translations**:
Includes multi-language support via locales/*.lua:

en.lua – English

gr.lua – Greek (Greeklish)

fr.lua – French

de.lua – German



## Credits


Made  by Kyriakos @ Talos

Idea for per-vehicle gear system by **Hasidu**

## Upcoming Features :
🛠 Upcoming Feature: Add a menu to select specific gear items from the trunk — idea by **hasidu**
