-- NH - Context --
RegisterNetEvent('nh-context:Burgers', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "| Available Burgers |",
            isMenuHeader = true
        },
        {
            header = "• Moneyshot Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "moneyshot"
            }
        },
        {
            header = "• Meat Free Burger",
            txt = "Bun , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "meatfree"
            }
        },
        {
            header = "• Bleeder Burger",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "bleeder"
            }
        },
        {
            header = "• The Heart Stopper",
            txt = "Bun , Cooked Patty , Tomato , Lettuce",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "heartstopper"
            }
        },
        {
            header = "• Torpedo Roll",
            txt = "Bun , Cooked Meat",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "torpedo"
            }
        },
        {
            header = "• Murder Meal",
            txt = "The Heart Stopper, Fries and SoftDrink",
            params = {
                event = "qb-burgershot:CreateMeal",
                args = "murdermeal"
            }
        },
        {
            header = "Close (ESC)",
            params = {
                event = exports['qb-menu']:closeMenu()
            }
        }
    })
end)


RegisterNetEvent('nh-context:OrderMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "| Fridge |",
            isMenuHeader = true
        },
        {
            header = "• Order Items",
            txt = "Order New Ingredients!",
            params = {
                event = "qb-burgershot:shop"
            }
        },
        {
            header = "• Open Fridge",
            txt = "See what you have in storage",
            params = {
                event = "qb-burgershot:Storage2"
            }
        },
        {
            header = "Close (ESC)",
            params = {
                event = exports['qb-menu']:closeMenu()
            }
        },
    })
end)

RegisterNetEvent('nh-context:DrinkMenu', function(data)
    exports['qb-menu']:openMenu({
        {
            header = "| Drink Menu |",
            isMenuHeader = true
        },
        {
            header = "• Soft Drink",
            txt = "Soda Syrup",
            params = {
                event = "qb-burgershot:Drink",
                args = "softdrink"
            }
        },
        {
            header = "• Milkshake",
            txt = "Milkshake Formula",
            params = {
                event = "qb-burgershot:Drink",
                args = "milkshake"
            }
        },
        {
            header = "Close (ESC)",
            params = {
                event = exports['qb-menu']:closeMenu()
            }
        },
    })
end)


-- Till Stuff --
RegisterNetEvent("qb-burgershot:bill")
AddEventHandler("qb-burgershot:bill", function()
    local bill = exports["qb-input"]:ShowInput({
        header = "Create Receipt",
        submitText = "Bill Player",
        inputs = {
            {
                text = "Player ID",
                name = "playerid",
                type = "number",
                isRequired = true
            },
            {
                text = "Bill Amount ($)",
                name = "billprice",
                type = "number",
                isRequired = true
            }
        }
    })
    if bill then
        if not bill.playerid or not bill.billprice then
            return
        else
            TriggerServerEvent("qb-burgershot:bill:player", bill.playerid, bill.billprice)
        end
    end
end)

