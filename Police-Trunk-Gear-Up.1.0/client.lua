local ESX = nil
local cooldowns = {}

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


local _L = function(key)
    return Locales[Config.Locale] and Locales[Config.Locale][key] or key
end

local localeFile = ('locales/%s.lua'):format(Config.Locale)
local success = LoadResourceFile(GetCurrentResourceName(), localeFile)
if success then
    assert(load(success))()
else
    print("[WARNING] Locale file not found for: " .. Config.Locale)
end

local function drawTextScreen(text)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextScale(0.35, 0.35)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.5, 0.9)
end

local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(10) end
end

local function playTrunkSound(vehicle, open)
    local soundName = open and "Trunk_Open" or "Trunk_Close"
    local coords = GetEntityCoords(vehicle)
    PlaySoundFromCoord(-1, soundName, coords.x, coords.y, coords.z, "DLC_HEIST_HACKING_SNAKE_SOUNDS", false, 0, false)
end

local function getCooldownTimeLeft()
    local serverId = GetPlayerServerId(PlayerId())
    local lastUsed = cooldowns[serverId] or 0
    local elapsed = GetGameTimer() - lastUsed
    local remaining = (Config.CooldownTime * 1000) - elapsed
    return math.ceil(remaining / 1000)
end

local function isCooldownActive()
    if not Config.EnableCooldown then return false end
    local serverId = GetPlayerServerId(PlayerId())
    local lastUsed = cooldowns[serverId] or 0
    return (GetGameTimer() - lastUsed) < (Config.CooldownTime * 1000)
end

local function setCooldown()
    if not Config.EnableCooldown then return end
    local serverId = GetPlayerServerId(PlayerId())
    cooldowns[serverId] = GetGameTimer()
end

Citizen.CreateThread(function()
    while true do
        Wait(0)

        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local found = false

        if ESX and ESX.GetPlayerData() then
            local playerJob = ESX.GetPlayerData().job and ESX.GetPlayerData().job.name or ""
            if playerJob ~= 'police' then
                Wait(1000)
                goto continue
            end
        else
            Wait(1000)
            goto continue
        end

        for _, vehicle in ipairs(GetGamePool("CVehicle")) do
            if DoesEntityExist(vehicle) then
                local vehModel = GetEntityModel(vehicle)
                local modelName = GetDisplayNameFromVehicleModel(vehModel):lower()

                if Config.PoliceVehicles[modelName] then
                    local trunkOffset = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -2.5, 0.0)
                    local dist = #(pos - trunkOffset)

                    if dist < 2.0 then
                        found = true
                        drawTextScreen(_L("press_e_to_search"))

                        if IsControlJustReleased(0, 38) then
                            if isCooldownActive() then
                                local timeLeft = getCooldownTimeLeft()
                                ESX.ShowNotification(_L("cooldown_active") .. " (" .. timeLeft .. "s)")
                            else
     
                                local heading = GetEntityHeading(vehicle)
                                local behind = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, -2.8, 0.0)


                                SetEntityCoordsNoOffset(playerPed, behind.x, behind.y, behind.z)
                                SetEntityHeading(playerPed, heading)

      
                                SetVehicleDoorOpen(vehicle, 5, false, false)
                                playTrunkSound(vehicle, true)

                                loadAnimDict("amb@prop_human_bum_bin@base")
                                TaskPlayAnim(playerPed, "amb@prop_human_bum_bin@base", "base", 8.0, -8.0, -1, 1, 0, false, false, false)

                                Wait(3000)
                                ClearPedTasks(playerPed)

                                local loadout = Config.PoliceVehicles[modelName]
                                for _, weapon in ipairs(loadout.weapons) do
                                    GiveWeaponToPed(playerPed, GetHashKey(weapon), 250, false, false)
                                end
                                SetPedArmour(playerPed, loadout.armor)

                                SetVehicleDoorShut(vehicle, 5, false)
                                playTrunkSound(vehicle, false)

                                ESX.ShowNotification(_L("equipped"))
                                setCooldown()
                            end
                        end
                    end
                end
            end
        end

        if not found then
            Wait(500)
        end

        ::continue::
    end
end)
