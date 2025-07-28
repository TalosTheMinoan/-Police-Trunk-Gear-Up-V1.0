Config = {}

-- Language setting
Config.Locale = 'en' -- Set your language here (e.g. 'en' for English, 'gr' for Greek, 'de' for German)

-- Cooldown system
Config.EnableCooldown = true
Config.CooldownTime = 60 -- cooldown time in seconds


Config.PoliceVehicles = {
    ["police"] = {
        weapons = {
            "WEAPON_CARBINERIFLE",
            "WEAPON_NIGHTSTICK"
        },
        armor = 100
    },
    ["fbi"] = {
        weapons = {
            "WEAPON_PISTOL",
            "WEAPON_STUNGUN"
        },
        armor = 75
    },
    ["police2"] = {
        weapons = {
            "WEAPON_PISTOL"
        },
        armor = 50
    }
}
