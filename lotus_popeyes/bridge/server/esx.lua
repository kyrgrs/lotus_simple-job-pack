if GetResourceState('es_extended') ~= 'started' then return end

local ESX = exports['es_extended']:getSharedObject()
local Config = lib.require('config')

function GetPlayer(id)
    return ESX.GetPlayerFromId(id)
end

function DoNotification(src, text, nType)
    TriggerClientEvent('esx:showNotification', src, text, nType)
end

function GetPlyIdentifier(xPlayer)
    return xPlayer.identifier
end

function GetCharacterName(xPlayer)
    return xPlayer.getName()
end

function itemCount(xPlayer, item, amount)
    local count = exports.ox_inventory:GetItemCount(xPlayer.source, item)
    return count >= amount
end

function AddItem(xPlayer, item, amount)
    exports.ox_inventory:AddItem(xPlayer.source, item, amount)
end

function RemoveItem(xPlayer, item, amount)
    exports.ox_inventory:RemoveItem(xPlayer.source, item, amount)
end

function RemoveItemFromSlot(xPlayer, item, amount, slot)
    exports.ox_inventory:RemoveItem(xPlayer.source, item, amount, nil, slot)
end

function ispopeyes(xPlayer)
    return xPlayer.job.name == 'popeyes'
end

for i = 1, #Config.Zones do
    local v = Config.Zones[i]
    if v.type == 'stash' then
        exports.ox_inventory:RegisterStash(v.stashLabel, v.stashLabel, v.slots, v.weight, false)
    elseif v.type == 'shop' then
        exports.ox_inventory:RegisterShop('Ingredients - Popeyes', {
            name = 'Ingredients - Popeyes',
            inventory = {
                { name = 'lotus_pj_chicken_breast', price = 0 },
                { name = 'lotus_pj_sandwich_bread', price = 0 },
                { name = 'lotus_pj_lettuce', price = 0 },
                { name = 'lotus_pj_mayonaise', price = 0 },
                { name = 'lotus_pj_chicken_pieces', price = 0 },
                { name = 'lotus_pj_flour', price = 0 },
                { name = 'lotus_pj_oil', price = 0 },
                { name = 'lotus_pj_spicemix', price = 0 },
                { name = 'lotus_pj_cabbage', price = 0 },
                { name = 'lotus_pj_carrot', price = 0 },
                { name = 'lotus_pj_vinegar', price = 0 },
                { name = 'lotus_pj_redbeans', price = 0 },
                { name = 'lotus_pj_rice', price = 0 },
                { name = 'lotus_pj_broth', price = 0 },
                { name = 'lotus_pj_carbonated_water', price = 0 },
                { name = 'lotus_pj_sugar', price = 0 },
                { name = 'lotus_pj_cherry_coke_flavour', price = 0 },
                { name = 'lotus_pj_coke_flavour', price = 0 },
                { name = 'lotus_pj_diet_dew_flavour', price = 0 },
                { name = 'lotus_pj_drpepper_flavour', price = 0 },
                { name = 'lotus_pj_fanta_grape_flavour', price = 0 },
                { name = 'lotus_pj_fanta_flavour', price = 0 },
                { name = 'lotus_pj_fanta_pineapple_flavour', price = 0 },
                { name = 'lotus_pj_redbull_flavour', price = 0 },
                { name = 'lotus_pj_redbull_sugarfree_flavour', price = 0 },
                { name = 'lotus_pj_sprite_flavour', price = 0 },
            },
        })
    end
end

for k,v in pairs(Config.HungerFill) do
    exports(k, function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            TriggerClientEvent('lotus_popeyes:client:Eat', inventory.id, k, slot, v.emote)
        end
    end)
end

for k,v in pairs(Config.ThirstFill) do
    exports(k, function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            TriggerClientEvent('lotus_popeyes:client:Drink', inventory.id, k, slot, v.emote)
        end
    end)
end