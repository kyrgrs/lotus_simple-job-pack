if GetResourceState('qb-core') ~= 'started' then return end

local QBCore = exports['qb-core']:GetCoreObject()
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'

function GetPlayer(id)
    return QBCore.Functions.GetPlayer(id)
end

function DoNotification(src, text, nType)
    TriggerClientEvent('QBCore:Notify', src, text, nType)
end

function GetPlyIdentifier(Player)
    return Player.PlayerData.citizenid
end

function GetCharacterName(Player)
    return Player.PlayerData.charinfo.firstname.. ' ' ..Player.PlayerData.charinfo.lastname
end

function itemCount(Player, item, amount)
    local count = 0
    if ox_inv then 
        count = exports.ox_inventory:GetItemCount(Player.PlayerData.source, item)
    else
        for slot, data in pairs(Player.PlayerData.items) do -- Apparently qb only counts the amount from the first slot so I gotta do this.
            if data.name == item then
                count += data.amount
            end
        end
    end
    return count >= amount
end

function AddItem(Player, item, amount)
    if ox_inv then
        exports.ox_inventory:AddItem(Player.PlayerData.source, item, amount)
    else
        Player.Functions.AddItem(item, amount, false)
        TriggerClientEvent("inventory:client:ItemBox", Player.PlayerData.source, QBCore.Shared.Items[item], "add", amount)
    end
end

function RemoveItem(Player, item, amount)
    if ox_inv then
        exports.ox_inventory:RemoveItem(Player.PlayerData.source, item, amount)
    else
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent("inventory:client:ItemBox", Player.PlayerData.source, QBCore.Shared.Items[item], "remove", amount)
    end
end

function RemoveItemFromSlot(Player, item, amount, slot)
    if ox_inv then
        exports.ox_inventory:RemoveItem(Player.PlayerData.source, item, amount, nil, slot)
    else
        Player.Functions.RemoveItem(item, amount, slot)
        TriggerClientEvent("inventory:client:ItemBox", Player.PlayerData.source, QBCore.Shared.Items[item], "remove", amount)
    end
end

function ispopeyes(Player)
    return Player.PlayerData.job.name == 'popeyes'
end

if ox_inv then
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
else
    for k,v in pairs(Config.HungerFill) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent('lotus_popeyes:client:Eat', source, k, item.slot, v.emote)
        end)
    end
    for k,v in pairs(Config.ThirstFill) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent('lotus_popeyes:client:Drink', source, k, item.slot, v.emote)
        end)
    end
end