local Config = lib.require('config')
local tequilaFood = {
    ['lotus_tq_berry_hydrating'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_strawberry', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, }
    },
    ['lotus_tq_green_dream'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_kiwi', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1},}
    },
    ['lotus_tq_island_breeze'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_strawberry', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, }
    },
    ['lotus_tq_just_peachy'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_caramel', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, }
    },
    ['lotus_tq_watermelon_dream'] = {
        event = 'lotus_tequila:client:makeDrink',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_watermelon', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, }
    },
    ['lotus_tq_kiwi_juice'] = {
        event = 'lotus_tequila:client:makeDrink',
        remove = { {ing = 'lotus_tq_kiwi', amount = 1}, }
    },
    ['lotus_tq_orange_juice'] = {
        event = 'lotus_tequila:client:makeDrink',
        remove = { {ing = 'lotus_tq_orange', amount = 1}, }
    },
    ['lotus_tq_strawberry_juice'] = {
        event = 'lotus_tequila:client:makeDrink',
        remove = { {ing = 'lotus_tq_strawberry', amount = 1}, }
    },
    ['lotus_tq_banana_juice'] = {
        event = 'lotus_tequila:client:makeDrink',
        remove = { {ing = 'lotus_tq_banana', amount = 1}, }
    },
    -- alcohol
    ['lotus_tq_cocktail'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_strawberry', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, {ing = 'lotus_tq_tequila', amount = 1}, }
    },
    ['lotus_tq_coconut_drink'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_coconut', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, {ing = 'lotus_tq_tequila', amount = 1}, }
    },
    ['lotus_tq_island_fantasy'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_orange', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, {ing = 'lotus_tq_tequila', amount = 1}, }
    },
    ['lotus_tq_kamikaze'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, {ing = 'lotus_tq_tequila', amount = 1}, }
    },
    ['lotus_tq_redhot_daquiri'] = {
        event = 'lotus_tequila:client:makeFood',
        remove = { {ing = 'lotus_tq_water', amount = 1}, {ing = 'lotus_tq_watermelon', amount = 1}, {ing = 'lotus_tq_sugar', amount = 1}, {ing = 'lotus_tq_daquiri', amount = 1}, }
    },
}

lib.callback.register('lotus_tequila:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = tequilaFood[itemName]
    if not food or not istequila(Player) then return end

    local canMake = true
    for _, ingredient in pairs(food.remove) do
        if not itemCount(Player, ingredient.ing, ingredient.amount) then
            canMake = false
            break
        end
    end

    if not canMake then
        return DoNotification(src, 'You don\'t have all the required ingredients.', 'error')
    end

    for _, ingredient in pairs(food.remove) do
        RemoveItem(Player, ingredient.ing, ingredient.amount)
    end
    TriggerClientEvent(food.event, src)
    SetTimeout(Config.CookDuration, function() AddItem(Player, itemName, 1) end)
end)

lib.callback.register('lotus_tequila:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)