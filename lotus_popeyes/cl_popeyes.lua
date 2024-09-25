local popeyesZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp

local bs_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(bs_blip, 267)
SetBlipDisplay(bs_blip, 4)
SetBlipScale(bs_blip, 0.6)
SetBlipAsShortRange(bs_blip, true)
SetBlipColour(bs_blip, 75)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Popeyes')
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
        exports['qb-target']:AddCircleZone('popeyesZone'..k, v.coords, v.radius,{ 
            name= 'popeyesZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        popeyesZones[#popeyesZones+1] = 'popeyesZone'..k
    end
end

function removeJobZones()
    for i = 1, #popeyesZones do
        exports['qb-target']:RemoveZone(popeyesZones[i])
    end
    table.wipe(popeyesZones)
end
    
AddEventHandler('lotus_popeyes:client:frontTray', function()
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

AddEventHandler('lotus_popeyes:client:frontTray2', function()
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

AddEventHandler('lotus_popeyes:client:passThrough', function()
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

AddEventHandler('lotus_popeyes:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Popeyes'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'popeyes', Config.Items)
    end
end)

RegisterNetEvent('lotus_popeyes:client:Eat', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_popeyes:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_popeyes:client:Drink', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_popeyes:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_popeyes:client:makeFood', function()
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
        TriggerEvent('lotus_popeyes:client:cookpopeyess')
    end
end)

RegisterNetEvent('lotus_popeyes:client:makeDrink', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('lotus_popeyes:client:drinkStation')
    end
end)

AddEventHandler('lotus_popeyes:client:cookpopeyess', function()
    local popeyes = 'bs_info'
    local bsMenu = {
        id = popeyes,
        title = 'Food Station',
        options = {
            {
                title = 'Chicken Sandwich',
                description = 'Requires: 1x Chicken Breast | 1x Sandwich Bread | 1x Lettuce | 1x Mayonaise',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_chicken_sandwich')
                end,
            },
            {
                title = 'Fried Chicken',
                description = 'Requires: 1x Chicken Pieces | 1x Flour | 1x Oil | 1x Spicemix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_fried_chicken')
                end,
            },
            {
                title = 'Popcorn Chicken',
                description = 'Requires: 1x Chicken Pieces | 1x Flour | 1x Oil | 1x Spicemix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_popcorn_chicken')
                end,
            },
            {
                title = 'Chicken Tenders',
                description = 'Requires: 1x Chicken Breast | 1x Flour | 1x Oil | 1x Spicemix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_chicken_tenders')
                end,
            },
            {
                title = 'Coleslaw',
                description = 'Requires: 1x Cabbage | 1x Carrot | 1x Mayonaise | 1x Vinegar',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_coleslaw')
                end,
            },
            {
                title = 'Red Beans and Rice',
                description = 'Requires: 1x Red Beans | 1x Rice | 1x Broth | 1x Spicemix',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_redbeans_rice')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(popeyes)
end)

AddEventHandler('lotus_popeyes:client:drinkStation', function()
    local popeyes = 'bs_info'
    local bsMenu = {
        id = popeyes,
        title = 'Drink Station',
        options = {
            {
                title = 'Coca Cola Cherry',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Coca Cola Cherry Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_cherry_coke')
                end,
            },
            {
                title = 'Coke',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Coke Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_coke')
                end,
            },
            {
                title = 'Diet MTN Dew',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Diet MTN Dew Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_diet_dew')
                end,
            },
            {
                title = 'Dr Pepper',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Dr Pepper Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_drpepper')
                end,
            },
            {
                title = 'Fanta Grape',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Grape Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_fanta_grape')
                end,
            },
            {
                title = 'Fanta',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_fanta')
                end,
            },
            {
                title = 'Fanta Pineapple',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Fanta Pineapple Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_fanta_pineapple')
                end,
            },
            {
                title = 'Mountain Dew',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Mountain Dew Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_mountain_dew')
                end,
            },
            {
                title = 'Redbull',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Redbull Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_redbull')
                end,
            },
            {
                title = 'Redbull Sugar Free',
                description = 'Requires: 1x Carbonated Water | 1x Redbull Sugar Free Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_redbull_sugarfree')
                end,
            },
            {
                title = 'Sprite',
                description = 'Requires: 1x Carbonated Water | 1x Sugar | 1x Sprite Flavour',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_popeyes:server:handleFood', false, 'lotus_pj_sprite')
                end,
            },
            -- {
            --     title = 'Water',
            --     description = 'Requires: 1x Water',
            --     icon = 'fa-solid fa-mug-hot',
            --     onSelect = function()
            --         lib.callback.await('lotus_popeyes:server:handleFood', false, 'water-bottle')
            --     end,
            -- },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(popeyes)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)