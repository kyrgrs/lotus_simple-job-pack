local tacoZones = {}
local Config = lib.require('config')
local ox_inv = GetResourceState('ox_inventory') == 'started'
local emoteProp

local bs_blip = AddBlipForCoord(Config.BlipCoords)
SetBlipSprite(bs_blip, 79)
SetBlipDisplay(bs_blip, 4)
SetBlipScale(bs_blip, 0.6)
SetBlipAsShortRange(bs_blip, true)
SetBlipColour(bs_blip, 75)
BeginTextCommandSetBlipName('STRING')
AddTextComponentSubstringPlayerName('Taco')
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
        exports['qb-target']:AddCircleZone('tacoZone'..k, v.coords, v.radius,{ 
            name= 'tacoZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        tacoZones[#tacoZones+1] = 'tacoZone'..k
    end
end

function removeJobZones()
    for i = 1, #tacoZones do
        exports['qb-target']:RemoveZone(tacoZones[i])
    end
    table.wipe(tacoZones)
end
    
AddEventHandler('lotus_taco:client:frontTray', function()
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

AddEventHandler('lotus_taco:client:frontTray2', function()
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

AddEventHandler('lotus_taco:client:passThrough', function()
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

AddEventHandler('lotus_taco:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Taco'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'taco', Config.Items)
    end
end)

RegisterNetEvent('lotus_taco:client:Eat', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_taco:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_taco:client:Drink', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_taco:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_taco:client:makeFood', function()
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
        TriggerEvent('lotus_taco:client:cookTacos')
    end
end)

RegisterNetEvent('lotus_taco:client:makeDrink', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('lotus_taco:client:drinkStation')
    end
end)

AddEventHandler('lotus_taco:client:cookTacos', function()
    local taco = 'bs_info'
    local bsMenu = {
        id = taco,
        title = 'Taco Station',
        options = {
            {
                title = 'Beef Taco',
                description = 'Requires: 1x Tortilla | 1x Ground Beef | 1x Taco Tomato',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'beef-taco')
                end,
            },
            {
                title = 'Quesadilla',
                description = 'Requires: 1x Tortilla | 1x Cheddar Cheese | 1x Butter',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'quesadilla')
                end,
            },
            {
                title = 'Chicken Burrito',
                description = 'Requires: 1x Tortilla | 1x Cheddar Cheese | 1x Lettuce',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'chicken-burrito')
                end,
            },
            {
                title = 'Nachos',
                description = 'Requires: 1x Tortilla Chips | 1x Cheddar Cheese',
                icon = 'fa-solid fa-burger',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'nachos')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(taco)
end)

AddEventHandler('lotus_taco:client:drinkStation', function()
    local taco = 'bs_info'
    local bsMenu = {
        id = taco,
        title = 'Drink Station',
        options = {
            {
                title = 'Coke Soda',
                description = 'Requires: 1x carbonated Water | 1x Sugar Cubes',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'kurkakola')
                end,
            },
            -- {
            --     title = 'Water',
            --     description = 'Requires: 1x Water',
            --     icon = 'fa-solid fa-mug-hot',
            --     onSelect = function()
            --         lib.callback.await('lotus_taco:server:handleFood', false, 'water-bottle')
            --     end,
            -- },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(taco)
end)

AddEventHandler('lotus_taco:client:friesStation', function()
    local taco = 'bs_info'
    local bsMenu = {
        id = taco,
        title = 'Fries Station',
        options = {
            {
                title = 'Fries',
                description = 'Requires: 2x Potato',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('lotus_taco:server:handleFood', false, 'burger-fries')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(taco)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)