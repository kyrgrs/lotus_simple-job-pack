local Config = lib.require('config')
local tacoFood = {
    ['beef-taco'] = {
        event = 'lotus_taco:client:makeFood',
        remove = { {ing = 'tortillas', amount = 1}, {ing = 'ground-beef', amount = 1}, {ing = 'taco-tomato', amount = 1}, }
    },
    ['quesadilla'] = {
        event = 'lotus_taco:client:makeFood',
        remove = { {ing = 'tortillas', amount = 1}, {ing = 'cheddar-cheese', amount = 1}, {ing = 'butter', amount = 1},}
    },
    ['chicken-burrito'] = {
        event = 'lotus_taco:client:makeFood',
        remove = { {ing = 'tortillas', amount = 1}, {ing = 'chicken', amount = 1}, {ing = 'lettuce', amount = 1}, }
    },
    ['nachos'] = {
        event = 'lotus_taco:client:makeFood',
        remove = { {ing = 'tortilla-chips', amount = 1}, {ing = 'cheddar-cheese', amount = 1}, }
    },
    ['kurkakola'] = {
        event = 'lotus_taco:client:makeDrink',
        remove = { {ing = 'carbonated-water', amount = 1}, {ing = 'sugar-cubes', amount = 1}, }
    },
}

lib.callback.register('lotus_taco:server:handleFood', function(source, itemName)
    local src = source
    local Player = GetPlayer(src)

    local food = tacoFood[itemName]
    if not food or not istaco(Player) then return end

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

lib.callback.register('lotus_taco:server:removeConsumable', function(source, item, slot)
    local src = source
    local Player = GetPlayer(src)
    RemoveItemFromSlot(Player, item, 1, slot)
end)