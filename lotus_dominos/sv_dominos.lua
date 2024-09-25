local Config = lib.require('config')
local dominosFood = {
    ['lotus_dj_pepperoni_pizza'] = {
        event = 'lotus_dominos:client:makeFood',
        remove = { {ing = 'lotus_dj_dough', amount = 1}, {ing = 'lotus_dj_tomato_sauce', amount = 1}, {ing = 'lotus_dj_cheese', amount = 1}, {ing = 'lotus_dj_pepperoni', amount = 1}, }
    },
    ['lotus_dj_cheese_pizza'] = {
        event = 'lotus_dominos:client:makeFood',
        remove = { {ing = 'lotus_dj_dough', amount = 1}, {ing = 'lotus_dj_tomato_sauce', amount = 1}, {ing = 'lotus_dj_cheese', amount = 1}, {ing = 'lotus_dj_oregano', amount = 1}, }
    },
    ['lotus_dj_bbq_chicken_pizza'] = {
        event = 'lotus_dominos:client:makeFood',
        remove = { {ing = 'lotus_dj_dough', amount = 1}, {ing = 'lotus_dj_bbq_sauce', amount = 1}, {ing = 'lotus_dj_cheese', amount = 1}, {ing = 'lotus_dj_chicken', amount = 1}, }
    },
    ['lotus_dj_margeritha_pizza'] = {
        event = 'lotus_dominos:client:makeFood',
        remove = { {ing = 'lotus_dj_dough', amount = 1}, {ing = 'lotus_dj_tomato_sauce', amount = 1}, {ing = 'lotus_dj_cheese', amount = 1}, {ing = 'lotus_dj_basil', amount = 1}, }
    },
    ['lotus_dj_pepperoni_calzone'] = {
        event = 'lotus_dominos:client:makeFood',
        remove = { {ing = 'lotus_dj_dough', amount = 1}, {ing = 'lotus_dj_tomato_sauce', amount = 1}, {ing = 'lotus_dj_cheese', amount = 1}, {ing = 'lotus_dj_pepperoni', amount = 1}, }
    },
    --drinks
    ['lotus_dj_cherry_coke'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_cherry_coke_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_coke'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_coke_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_diet_dew'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_diet_dew_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_drpepper'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_drpepper_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_fanta_grape'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_fanta_grape_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_fanta'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_fanta_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_fanta_pineapple'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_fanta_pineapple_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_redbull'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_redbull_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
    ['lotus_dj_redbull_sugarfree'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_redbull_sugarfree_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, }
    },
    ['lotus_dj_sprite'] = {
        event = 'lotus_dominos:client:makeDrink',
        remove = { {ing = 'lotus_dj_sprite_flavour', amount = 1}, {ing = 'lotus_dj_carbonated_water', amount = 1}, {ing = 'lotus_dj_sugar', amount = 1}, }
    },
}

lib.callback.register('lotus_dominos:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = dominosFood[itemName]
    if not food or not isdominos(Player) then return end

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

lib.callback.register('lotus_dominos:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)