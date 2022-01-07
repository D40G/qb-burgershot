local QBCore = exports['qb-core']:GetCoreObject()

PlayerData = {}

RegisterNetEvent('qb-burgershot:garage', function(bs)
    local vehicle = bs.vehicle
    local coords = carCoords
    local PlayerData = QBCore.Functions.GetPlayerData()
    if PlayerData.job.name == "burgershot" then
        QBCore.Functions.SpawnVehicle(vehicle, function(veh)
            SetVehicleNumberPlateText(veh, "BURGER"..tostring(math.random(00, 99)))
            exports['LegacyFuel']:SetFuel(veh, 100.0)
            SetEntityHeading(veh, coords.w)
            TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(veh))
            SetVehicleEngineOn(veh, true, true)
        end, coords, true)
    else
        QBCore.Functions.Notify('You are not an employee of BurgerShot.', 'error')
    end
end)

RegisterNetEvent('qb-burgershot:storecar', function()
    QBCore.Functions.Notify('Work Vehicle Stored!')
    local car = GetVehiclePedIsIn(PlayerPedId(),true)
    TaskLeaveVehicle(PlayerPedId(), car, 64)
    Citizen.Wait(2500)
    QBCore.Functions.DeleteVehicle(car)
end)

RegisterNetEvent('garage:BurgerShotGarage', function(coords)
    carCoords = coords
    exports['qb-menu']:openMenu({
        {
            header = "BurgerShot Garage",
            isMenuHeader = true
        },
        {
            header = "BurgerShot Vehicle",
            txt = "Grab the BurgerShot Vehicle",
            params = {
                event = "qb-burgershot:garage",
                args = {
                    vehicle = 'stalion2',
                }
            }
        },
        {
            header = "• Store Vehicle",
            txt = "Store Vehicle Inside Garage",
            params = {
                event = "qb-burgershot:storecar",
            }
        },
        {
            header = "Close (ESC)",
            params = {
                event = exports['qb-menu']:closeMenu(),
            }
        },
    })
end)