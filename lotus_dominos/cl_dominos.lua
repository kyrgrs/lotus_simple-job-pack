local dominosZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp

local bs_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(bs_blip, 355)
SetBlipDisplay(bs_blip, 4)
SetBlipScale(bs_blip, 0.6)
SetBlipAsShortRange(bs_blip, true)
SetBlipColour(bs_blip, 75)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Dominos')
EndTextCommandSetBlipName(bs_blip)

local function toggleEmotes(bool, emote)
    if bool then
        local doEmote = Config.Emotes[emote]
        lib.requestAnimDict(doEmote.dict)
        lib.requestModel(doEmote.prop)
        if doEmote.prop then
            emoteProp = CreateObject(doEmote.prop, 0.0, 0.0, 0.0, true, true, false)
            AttachEntityToEntity(emoteProp, cache.ped, GetPedBoneIndex(cache.ped, doEmote.bone), doEmote.coords.x, doEmote.coords.y, doEmote.coords.z, doEmote.rot.x, doEmote.rot.y, doEmote.rot.z, true, true, false, true, 1, true)
        end
        TaskPlayAnim(cache.ped, doEmote.dict, doEmote.anim, 8.0, 8.0, -1, 49, 0, 0, 0, 0)
        RemoveAnimDict(doEmote.dict)
        SetModelAsNoLongerNeeded(doEmote.prop)
    else
        ClearPedTasks(cache.ped)
        if emoteProp and DoesEntityExist(emoteProp) then 
            DetachEntity(emoteProp, true, false) 
            DeleteEntity(emoteProp)
            emoteProp = nil
        end
    end
end

function createJobZones()
    for k, v in pairs(Config.Zones) do
        exports['qb-target']:AddCircleZone('dominosZone'..k, v.coords, v.radius,{ 
            name= 'dominosZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        dominosZones[#dominosZones+1] = 'dominosZone'..k
    end
end

function removeJobZones()
    for i = 1, #dominosZones do
        exports['qb-target']:RemoveZone(dominosZones[i])
    end
    table.wipe(dominosZones)
end
    
AddEventHandler('lotus_dominos:client:frontTray', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_1'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_1')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_1', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('lotus_dominos:client:frontTray2', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Front_Tray_2'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Front_Tray_2')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Front_Tray_2', {
            maxweight = 75000,
            slots = 10,
        })
    end
end)

AddEventHandler('lotus_dominos:client:passThrough', function()
    if ox_inv then
        exports.ox_inventory:openInventory('stash', { id = 'BS_Big_Tray'})
    else
        TriggerEvent('inventory:client:SetCurrentStash', 'BS_Big_Tray')
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', 'BS_Big_Tray', {
            maxweight = 150000,
            slots = 20,
        })
    end
end)

AddEventHandler('lotus_dominos:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Dominos'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'dominos', Config.Items)
    end
end)

RegisterNetEvent('lotus_dominos:client:Eat', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Munching..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('hunger', itemName)
        lib.callback.await('lotus_dominos:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_dominos:client:Drink', function(itemName, itemSlot, emote)
    if GetInvokingResource() then return end
    toggleEmotes(true, emote)
    if lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        label = 'Drinking..',
        useWhileDead = true,
        canCancel = true,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        handleStatus('thirst', itemName)
        lib.callback.await('lotus_dominos:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_dominos:client:makeFood', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making food..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        toggleEmotes(false)
        TriggerEvent('lotus_dominos:client:cookdominoss')
    end
end)

RegisterNetEvent('lotus_dominos:client:makeDrink', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('lotus_dominos:client:drinkStation')
    end
end)

AddEventHandler('lotus_dominos:client:cookdominoss', function()
    local dominos = 'bs_info'
    local bsMenu = {
        id = dominos,
        title = 'Food Station',
        options = {
            {
                title = 'Pepperoni Pizza',
                description = 'Requires: 1x Dough | 1x Tomato Sauce | 1x Cheese | 1x Pepperoni',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_pepperoni_pizza')
                end,
            },
            {
                title = 'Cheese Pizza',
                description = 'Requires: 1x Dough | 1x Tomato Sauce | 1x Cheese | 1x Oregano',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_cheese_pizza')
                end,
            },
            {
                title = 'BBQ Chicken Pizza',
                description = 'Requires: 1x Dough | 1x BBQ Sauce | 1x Cheese | 1x Chicken',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_bbq_chicken_pizza')
                end,
            },
            {
                title = 'Margeritha Pizza',
                description = 'Requires: 1x Dough | 1x Tomato Sauce | 1x Cheese | 1x Basil',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_margeritha_pizza')
                end,
            },
            {
                title = 'Pepperoni Calzone',
                description = 'Requires: 1x Dough | 1x Tomato Sauce | 1x Cheese | 1x Pepperoni',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_coleslaw')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(dominos)
end)

AddEventHandler('lotus_dominos:client:drinkStation', function()
    local dominos = 'bs_info'
    local bsMenu = {
        id = dominos,
        title = 'Drink Station',
        options = {
            {
                title = 'Coca Cola Cherry',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Coca Cola Cherry Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_cherry_coke')
                end,
            },
            {
                title = 'Coke',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Coke Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_coke')
                end,
            },
            {
                title = 'Diet MTN Dew',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Diet MTN Dew Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_diet_dew')
                end,
            },
            {
                title = 'Dr Pepper',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Dr Pepper Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_drpepper')
                end,
            },
            {
                title = 'Fanta Grape',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Grape Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_fanta_grape')
                end,
            },
            {
                title = 'Fanta',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_fanta')
                end,
            },
            {
                title = 'Fanta Pineapple',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Pineapple Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_fanta_pineapple')
                end,
            },
            {
                title = 'Mountain Dew',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Mountain Dew Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_mountain_dew')
                end,
            },
            {
                title = 'Redbull',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Redbull Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_redbull')
                end,
            },
            {
                title = 'Redbull Sugar Free',
                description = 'Requires: 1x Carbonated Water | 1x Redbull Sugar Free Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_redbull_sugarfree')
                end,
            },
            {
                title = 'Sprite',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Sprite Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_dominos:server:handleFood', false, 'lotus_dj_sprite')
                end,
            },
            -- {
            --     title = 'Water',
            --     description = 'Requires: 1x Water',
            --     icon = 'fa-solid fa-mug-hot',
            --     onSelect = function()
            --         lib.callback.await('lotus_dominos:server:handleFood', false, 'water-bottle')
            --     end,
            -- },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(dominos)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)