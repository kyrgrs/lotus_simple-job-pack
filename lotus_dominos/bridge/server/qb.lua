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

function isdominos(Player)
    return Player.PlayerData.job.name == 'dominos'
end

if ox_inv then
    for i = 1, #Config.Zones do
        local v = Config.Zones[i]
        if v.type == 'stash' then
            exports.ox_inventory:RegisterStash(v.stashLabel, v.stashLabel, v.slots, v.weight, false)
        elseif v.type == 'shop' then
            exports.ox_inventory:RegisterShop('Ingredients - Dominos', {
                name = 'Ingredients - Dominos',
                inventory = {
                    { name = 'lotus_dj_dough', price = 0 },
                    { name = 'lotus_dj_tomato_sauce', price = 0 },
                    { name = 'lotus_dj_cheese', price = 0 },
                    { name = 'lotus_dj_pepperoni', price = 0 },
                    { name = 'lotus_dj_oregano', price = 0 },
                    { name = 'lotus_dj_bbq_sauce', price = 0 },
                    { name = 'lotus_dj_chicken', price = 0 },
                    { name = 'lotus_dj_basil', price = 0 },
                    { name = 'lotus_dj_carbonated_water', price = 0 },
                    { name = 'lotus_dj_sugar', price = 0 },
                    { name = 'lotus_dj_cherry_coke_flavour', price = 0 },
                    { name = 'lotus_dj_coke_flavour', price = 0 },
                    { name = 'lotus_dj_diet_dew_flavour', price = 0 },
                    { name = 'lotus_dj_drpepper_flavour', price = 0 },
                    { name = 'lotus_dj_fanta_grape_flavour', price = 0 },
                    { name = 'lotus_dj_fanta_flavour', price = 0 },
                    { name = 'lotus_dj_fanta_pineapple_flavour', price = 0 },
                    { name = 'lotus_dj_redbull_flavour', price = 0 },
                    { name = 'lotus_dj_redbull_sugarfree_flavour', price = 0 },
                    { name = 'lotus_dj_sprite_flavour', price = 0 },
                },
            })
        end
    end
    for k,v in pairs(Config.HungerFill) do
        exports(k, function(event, item, inventory, slot, data)
            if event == 'usingItem' then
                TriggerClientEvent('lotus_dominos:client:Eat', inventory.id, k, slot, v.emote)
            end
        end)
    end
    for k,v in pairs(Config.ThirstFill) do
        exports(k, function(event, item, inventory, slot, data)
            if event == 'usingItem' then
                TriggerClientEvent('lotus_dominos:client:Drink', inventory.id, k, slot, v.emote)
            end
        end)
    end
else
    for k,v in pairs(Config.HungerFill) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent('lotus_dominos:client:Eat', source, k, item.slot, v.emote)
        end)
    end
    for k,v in pairs(Config.ThirstFill) do
        QBCore.Functions.CreateUseableItem(k, function(source, item)
            TriggerClientEvent('lotus_dominos:client:Drink', source, k, item.slot, v.emote)
        end)
    end
end