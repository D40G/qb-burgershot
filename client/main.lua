local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

CreateThread(function()
    while true do
        Wait(0)
        local sleep = true
        if LocalPlayer.state.isLoggedIn then
            local PlayerData = QBCore.Functions.GetPlayerData()
            local pos = GetEntityCoords(PlayerPedId())
            if PlayerData.job.name == 'burgershot' then
                for k, v in pairs(Config.Locations["duty"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 5 then
                        sleep = false
                        DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                        if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                            if PlayerData.job.onduty then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~r~E~w~ - Go off duty")
                            else
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Go on duty")
                            end
                            if IsControlJustReleased(0, 38) then
                                TriggerServerEvent("QBCore:ToggleDuty")
                            end
                        elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                            QBCore.Functions.DrawText3D(v.x, v.y, v.z, "on/off duty")
                        end
                    end
                end

                for k, v in pairs(Config.Locations["pattycooker"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                sleep = 5
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Cook Patties")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:PattyFry")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                sleep = 5
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Cook Patties")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fryer"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ - Fry Sum Fries")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:Fries")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Fry Sum Fries")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["drinks"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Make Drinks")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:DrinkMenu")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Make Drinks")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["fridge"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Fridge")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:OrderMenu")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Open Fridge")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["storage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Open Storage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:Storage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Open Storage")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["craftburger"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Make a Meal")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:Burgers")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Make a Meal")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["cashregister"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Cash Register")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("qb-burgershot:bill")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Cash Register")
                            end
                        end
                    end
                end

                for k, v in pairs(Config.Locations["garage"]) do
                    if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                        if PlayerData.job.onduty then
                            sleep = false
                            DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                            if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Garage")
                                if IsControlJustReleased(0, 38) then
                                    TriggerEvent("garage:BurgerShotGarage")
                                end
                            elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                                QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Garage")
                            end
                        end
                    end
                end
            end

            for k, v in pairs(Config.Locations["tray1"]) do
                if #(pos - vector3(v.x, v.y, v.z)) < 4.5 then
                    sleep = false
                    DrawMarker(27, v.x, v.y, v.z-0.99, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.001, 1.0001, 0.5001, 0, 25, 165, 100, false, true, 2, false, false, false, false) 
                    if #(pos - vector3(v.x, v.y, v.z)) < 1.5 then
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "~g~E~w~ -  Tray")
                        if IsControlJustReleased(0, 38) then
                            TriggerEvent("qb-burgershot:Tray")
                        end
                    elseif #(pos - vector3(v.x, v.y, v.z)) < 2.5 then
                        QBCore.Functions.DrawText3D(v.x, v.y, v.z, "Tray")
                    end
                end
            end
        end

        if sleep then
            Wait(2000)
        end
    end
end)

CreateThread(function()
    BurgerShot = AddBlipForCoord(-1197.32, -897.655, 13.995)
    SetBlipSprite (BurgerShot, 106)
    SetBlipDisplay(BurgerShot, 4)
    SetBlipScale  (BurgerShot, 0.5)
    SetBlipAsShortRange(BurgerShot, true)
    SetBlipColour(BurgerShot, 75)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("BurgerShot")
    EndTextCommandSetBlipName(BurgerShot)
end)

RegisterNetEvent("qb-burgershot:Tray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgertray1")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgertray1", {
        maxweight = 10000,
        slots = 10,
    })
end)

RegisterNetEvent("qb-burgershot:Storage", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage", {
        maxweight = 250000,
        slots = 40,
    })
end)

RegisterNetEvent("qb-burgershot:Storage2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "burgerstorage2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "burgerstorage2", {
        maxweight = 250000,
        slots = 40,
    })
end)

--Meal Creations
RegisterNetEvent("qb-burgershot:MurderMeal", function()
    local randomToy = math.random(1,10)
    --remove box
    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-murdermeal", 1)
    --add items from box
    TriggerServerEvent('QBCore:Server:AddItem', "burger-heartstopper", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
    TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 1)

    if randomToy < 4 then
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    elseif randomToy == 4 then
        TriggerServerEvent('QBCore:Server:AddItem', "burger-toy1", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy1"], "add")
    elseif randomToy < 10 and randomToy > 4 then
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    elseif randomToy == 10 then
        TriggerServerEvent('QBCore:Server:AddItem', "burger-toy2", 1)
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-toy2"], "add")
    else
        QBCore.Functions.Notify("No toy in Box Looool", "error")
    end
end)

RegisterNetEvent("qb-burgershot:CreateMeal", function(meal)
    if meal == "moneyshot" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making Moneyshot Burger..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-moneyshot", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-moneyshot"], "add")
                    QBCore.Functions.Notify("You made a MoneyShot Burger", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
            end
        end)
    elseif meal == "meatfree" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMeatfree', function(HasItems)
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making A Meat Free Burger..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-meatfree", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-meatfree"], "add")
                    QBCore.Functions.Notify("You made a Meat Free Burger", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                    QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
            end
        end)
    elseif meal == "bleeder" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making Bleeder Burger..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-bleeder", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-bleeder"], "add")
                    QBCore.Functions.Notify("You made a Bleeder Burger", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                    QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
            end
        end)
    elseif meal == "heartstopper" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientBurger', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making Heartstopper Burger..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-lettuce", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-tomato", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-heartstopper", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-heartstopper"], "add")
                    QBCore.Functions.Notify("You made a Heart Stopper", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                    QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
            end
        end)
    elseif meal == "torpedo" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientTorpedo', function(HasItems)  
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making a Torpedo..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-meat", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-bun", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-torpedo", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-torpedo"], "add")
                    QBCore.Functions.Notify("You made a Torpedo Roll", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                    QBCore.Functions.Notify("You dont have the ingredients to make this", "error")
            end
        end)
    elseif meal == "murdermeal" then
        QBCore.Functions.TriggerCallback('qb-burgershot:server:get:ingredientMurderMeal', function(HasItems)
            if HasItems then
                QBCore.Functions.Progressbar("pickup_sla", "Making A Murder Meal..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "mp_common",
                    anim = "givetake1_a",
                    flags = 8,
                }, {}, {}, function() -- Done
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-fries", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-heartstopper", 1)
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-softdrink", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-murdermeal", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-murdermeal"], "add")
                    QBCore.Functions.Notify("You made a A Murder Meal", "success")
                end, function()
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
            else
                    QBCore.Functions.Notify("You dont have the items to make this", "error")
            end
        end)
    end
end)

RegisterNetEvent("qb-burgershot:Drink", function(type)
    if type == "softdrink" then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Progressbar("pickup", "Filling a cup with soda..", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function()
                    ClearPedTasks(PlayerPedId())
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-sodasyrup", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-softdrink", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-softdrink"], "add")
                    QBCore.Functions.Notify("You made a Soda", "success")
                end)
            else
                QBCore.Functions.Notify("You don't have any soda syrup..", "error")
            end
        end, 'burger-sodasyrup')
    elseif type == "milkshake" then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Progressbar("pickup", "Making a Milkshake...", 4000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function()
                    TriggerServerEvent('QBCore:Server:RemoveItem', "burger-mshakeformula", 1)
                    TriggerServerEvent('QBCore:Server:AddItem', "burger-mshake", 1)
                    TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-mshake"], "add")
                    QBCore.Functions.Notify("You made a Milkshake", "success")
                end)
            else
                QBCore.Functions.Notify("You don't have any Milkshake Formula..", "error")
            end
        end, 'burger-mshakeformula')
    end
end)

RegisterNetEvent("qb-burgershot:Fries", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            TriggerServerEvent('QBCore:Server:RemoveItem', "burger-potato", 1)
            QBCore.Functions.Progressbar("pickup", "Frying the fries..", 4000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },{
                animDict = "amb@prop_human_bbq@male@base",
                anim = "base",
                flags = 8,
            }, {
                model = "prop_cs_fork",
                bone = 28422,
                coords = vector3(-0.005, 0.00, 0.00),
                rotation = vector3(175.0, 160.0, 0.0),
            }, {}, function()
                ClearPedTasks(PlayerPedId())
                TriggerServerEvent('QBCore:Server:AddItem', "burger-fries", 4)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-fries"], "add")
                QBCore.Functions.Notify("You made 4 fries", "success")
            end)
        else
            QBCore.Functions.Notify("You don't have any potatoes..", "error")
        end
    end, 'burger-potato')
end)

RegisterNetEvent("qb-burgershot:PattyFry", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            QBCore.Functions.Progressbar("pickup", "Cooking the Patty..", 10000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                task = "PROP_HUMAN_BBQ"
            }, {}, {}, function()
                TriggerServerEvent('QBCore:Server:RemoveItem', "burger-raw", 1)
                TriggerServerEvent('QBCore:Server:AddItem', "burger-meat", 1)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["burger-meat"], "add")
                QBCore.Functions.Notify("You cooked the meat", "success")
                ClearPedTasksImmediately(PlayerPedId())
            end)
        else
            QBCore.Functions.Notify("You don't have any raw patties..", "error")
        end
    end, 'burger-raw')
end)

RegisterNetEvent("qb-burgershot:shop", function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Items)
end)