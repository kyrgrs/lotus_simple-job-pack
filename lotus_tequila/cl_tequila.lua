local tequilaZones = {}
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
AddTextComponentSubstringPlayerName('Tequila')
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
        exports['qb-target']:AddCircleZone('tequilaZone'..k, v.coords, v.radius,{ 
            name= 'tequilaZone'..k, 
            debugPoly = false, 
            useZ=true, 
        }, {
            options = {
                { event = v.event, icon = v.icon, label = v.label, job = v.job, },
            },
            distance = 1.5
        })
        tequilaZones[#tequilaZones+1] = 'tequilaZone'..k
    end
end

function removeJobZones()
    for i = 1, #tequilaZones do
        exports['qb-target']:RemoveZone(tequilaZones[i])
    end
    table.wipe(tequilaZones)
end
    
AddEventHandler('lotus_tequila:client:frontTray', function()
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

AddEventHandler('lotus_tequila:client:frontTray2', function()
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

AddEventHandler('lotus_tequila:client:passThrough', function()
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

AddEventHandler('lotus_tequila:client:ingredientStore', function()
    if ox_inv then
        exports.ox_inventory:openInventory('shop', { id = 1, type = 'Ingredients - Tequila'})
    else
        TriggerServerEvent('inventory:server:OpenInventory', 'shop', 'tequila', Config.Items)
    end
end)

RegisterNetEvent('lotus_tequila:client:Eat', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_tequila:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_tequila:client:Drink', function(itemName, itemSlot, emote)
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
        lib.callback.await('lotus_tequila:server:removeConsumable', false, itemName, itemSlot)
    else
        toggleEmotes(false)
    end
end)

RegisterNetEvent('lotus_tequila:client:makeFood', function()
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
        TriggerEvent('lotus_tequila:client:makeTequilas')
    end
end)

RegisterNetEvent('lotus_tequila:client:makeDrink', function()
    if GetInvokingResource() then return end
    if lib.progressCircle({
        duration = Config.CookDuration,
        position = 'bottom',
        label = 'Making Drinks..',
        useWhileDead = true,
        canCancel = false,
        disable = { move = false, car = false, mouse = false, combat = true, },
    }) then
        TriggerEvent('lotus_tequila:client:drinkStation')
    end
end)

AddEventHandler('lotus_tequila:client:makeTequilas', function()
    local tequila = 'bs_info'
    local bsMenu = {
        id = tequila,
        title = 'Alcohols',
        options = {
            {
                title = 'Cocktail',
                description = 'Requires: 1x Water | 1x Strawberry | 1x Sugar | 1x Tequila',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_cocktail')
                end,
            },
            {
                title = 'Coconut Drink',
                description = 'Requires: 1x Water | 1x Coconut | 1x Sugar | 1x Tequila',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_coconut_drink')
                end,
            },
            {
                title = 'Island Fantasy',
                description = 'Requires: 1x Water | 1x Orange | 1x Sugar | 1x Tequila',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_island_fantasy')
                end,
            },
            {
                title = 'Kamikaze',
                description = 'Requires: 1x Water | 1x Sugar | 1x Tequila',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_kamikaze')
                end,
            },
            {
                title = 'Red Hot Daquiri',
                description = 'Requires: 1x Water | 1x Watermelon | 1x Sugar | 1x Daquiri',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_redhot_daquiri')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(tequila)
end)

AddEventHandler('lotus_tequila:client:drinkStation', function()
    local tequila = 'bs_info'
    local bsMenu = {
        id = tequila,
        title = 'Non Alcoholic',
        options = {
            {
                title = 'Berry Hydrating',
                description = 'Requires: 1x Water | 1x Sugar | 1x Strawberry',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_berry_hydrating')
                end,
            },
            {
                title = 'Green Dream',
                description = 'Requires: 1x Water | 1x Sugar | 1x Kiwi',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_green_dream')
                end,
            },
            {
                title = 'Island Breeze',
                description = 'Requires: 1x Water | 1x Sugar | 1x Strawberry',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_island_breeze')
                end,
            },
            {
                title = 'Just Peachy',
                description = 'Requires: 1x Water | 1x Sugar | 1x Caramel',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_just_peachy')
                end,
            },
            {
                title = 'Watermelon Dream',
                description = 'Requires: 1x Water | 1x Sugar | 1x Watermelon',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_watermelon_dream')
                end,
            },
            {
                title = 'Kiwi Jucie',
                description = 'Requires: 1x Kiwi',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_kiwi_juice')
                end,
            },
            {
                title = 'Orange Jucie',
                description = 'Requires: 1x Orange',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_orange_juice')
                end,
            },
            {
                title = 'Strawberry Jucie',
                description = 'Requires: 1x Strawberry',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_strawberry_juice')
                end,
            },
            {
                title = 'Banana Jucie',
                description = 'Requires: 1x Banana',
                icon = 'fa-solid fa-mug-hot',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'lotus_tq_banana_juice')
                end,
            },
            -- {
            --     title = 'Water',
            --     description = 'Requires: 1x Water',
            --     icon = 'fa-solid fa-mug-hot',
            --     onSelect = function()
            --         lib.callback.await('lotus_tequila:server:handleFood', false, 'water-bottle')
            --     end,
            -- },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(tequila)
end)

AddEventHandler('lotus_tequila:client:friesStation', function()
    local tequila = 'bs_info'
    local bsMenu = {
        id = tequila,
        title = 'Fries Station',
        options = {
            {
                title = 'Fries',
                description = 'Requires: 2x Potato',
                icon = 'fa-solid fa-fire-burner',
                onSelect = function()
                    lib.callback.await('lotus_tequila:server:handleFood', false, 'burger-fries')
                end,
            },
        }
    }
    lib.registerContext(bsMenu)
    lib.showContext(tequila)
end)

AddEventHandler('onResourceStop', function(resourceName) 
    if GetCurrentResourceName() == resourceName then
        removeJobZones()
    end 
end)