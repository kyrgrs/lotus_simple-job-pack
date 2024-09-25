local Config = lib.require('config')
local popeyesFood = {
    ['lotus_pj_chicken_sandwich'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_chicken_breast', amount = 1}, {ing = 'lotus_pj_sandwich_bread', amount = 1}, {ing = 'lotus_pj_lettuce', amount = 1}, {ing = 'lotus_pj_mayonaise', amount = 1}, }
    },
    ['lotus_pj_fried_chicken'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_chicken_pieces', amount = 1}, {ing = 'lotus_pj_flour', amount = 1}, {ing = 'lotus_pj_oil', amount = 1}, {ing = 'lotus_pj_spicemix', amount = 1},}
    },
    ['lotus_pj_popcorn_chicken'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_chicken_pieces', amount = 1}, {ing = 'lotus_pj_flour', amount = 1}, {ing = 'lotus_pj_oil', amount = 1}, {ing = 'lotus_pj_spicemix', amount = 1}, }
    },
    ['lotus_pj_chicken_tenders'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_chicken_breast', amount = 1}, {ing = 'lotus_pj_flour', amount = 1}, {ing = 'lotus_pj_oil', amount = 1}, {ing = 'lotus_pj_spicemix', amount = 1}, }
    },
    ['lotus_pj_coleslaw'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_cabbage', amount = 1}, {ing = 'lotus_pj_carrot', amount = 1}, {ing = 'lotus_pj_mayonaise', amount = 1}, {ing = 'lotus_pj_vinegar', amount = 1}, }
    },
    ['lotus_pj_redbeans_rice'] = {
        event = 'lotus_popeyes:client:makeFood',
        remove = { {ing = 'lotus_pj_redbeans', amount = 1}, {ing = 'lotus_pj_rice', amount = 1}, {ing = 'lotus_pj_broth', amount = 1}, {ing = 'lotus_pj_spicemix', amount = 1}, }
    },
    --drinks
    ['lotus_pj_cherry_coke'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_cherry_coke_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_coke'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_coke_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_diet_dew'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_diet_dew_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_drpepper'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_drpepper_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_fanta_grape'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_fanta_grape_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_fanta'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_fanta_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_fanta_pineapple'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_fanta_pineapple_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_redbull'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_redbull_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
    ['lotus_pj_redbull_sugarfree'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_redbull_sugarfree_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, }
    },
    ['lotus_pj_sprite'] = {
        event = 'lotus_popeyes:client:makeDrink',
        remove = { {ing = 'lotus_pj_sprite_flavour', amount = 1}, {ing = 'lotus_pj_carbonated_water', amount = 1}, {ing = 'lotus_pj_sugar', amount = 1}, }
    },
}

lib.callback.register('lotus_popeyes:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = popeyesFood[itemName]
    if not food or not ispopeyes(Player) then return end

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

lib.callback.register('lotus_popeyes:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)