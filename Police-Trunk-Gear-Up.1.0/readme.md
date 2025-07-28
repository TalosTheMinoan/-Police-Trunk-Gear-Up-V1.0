# 🚓 Police Trunk Armory [ESX]

- Press **E** behind any police vehicle to gear up  
- Works with **all vehicles**, no clipping or weird animations  
- Trunk opens + realistic **sound** + smooth **animation**  
- Gives weapons + **full armor**  
- Cooldown between uses with time-based Greeklish notifications  
- **Police job only** (ESX)

---

## 🆕 What's New in v1.0

- ✅ Universal vehicle support — no more clipping into trunks
- 🔊 Added trunk opening sound effect
- 🧍 Smooth animation when grabbing gear
- 🔄 Cooldown system with dynamic time messages (localized)
- 🌍 Multilingual support (EN, GR, FR, DE)
- 🚓 Works with any police-classified vehicle
- 🛡️ Armor auto-applied when equipping gear

---

## 📥 Install

1. Drop the folder inside your `resources/`
2. Add this to your `server.cfg`:
   ```
   start police-trunk-armory
   ```

---

## ⚙️ Customize (`client.lua`)

- **Vehicle types**:
  ```lua
  policeCars = { "police", "police2", "police3", "fbi", "sheriff" }
  ```

- **Weapons to give**:
  ```lua
  weaponList = { "WEAPON_PISTOL", "WEAPON_CARBINERIFLE", "WEAPON_STUNGUN" }
  ```

- **Armor settings**:
  ```lua
  SetPedArmour(playerPed, 100)
  ```

- **Positioning (no clipping)**:
  ```lua
  GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -2.2, 0.0)
  ```

- **Animation**:
  ```lua
  TaskPlayAnim(...)
  ```

- **Cooldown & translations** (check `locales/*.lua`):
  - Greeklish, English, French, and German support included  
  - Cooldown with how much time left in the message:
    > `"Prepei na perimeneis {time}s prin ksana pareis eksoplismo!"`

---

## 🌍 Translations

Includes:
- `en.lua` 🇺🇸
- `gr.lua` 🇬🇷 *(Greeklish)*
- `fr.lua` 🇫🇷
- `de.lua` 🇩🇪

Modify or add more inside the `locales/` folder.

---

## 👤 Credits

Made with 💙 by **Kyriakos @ Talos**  
Custom-built for immersive police roleplay.