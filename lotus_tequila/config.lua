return {
    CookDuration = 10000,
    BlipCoords = vec3(-563.18, 285.78, 81.4),
    HungerFill = { -- How much they fill your hunger
        
    },
    ThirstFill = { -- How much they fill your thirst.
        ['lotus_tq_berry_hydrating'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_green_dream'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_island_breeze'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_just_peachy'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_watermelon_dream'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_kiwi_juice'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_orange_juice'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_strawberry_juice'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_banana_juice'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_cocktail'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_coconut_drink'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_island_fantasy'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['lotus_tq_kamikaze'] = {emote = 'bsdrink', amt = math.random(48, 54)},
        ['tq_redhot_daquiri'] = {emote = 'bsdrink', amt = math.random(48, 54)},
    },
    Zones = {
        -- { coords = vec3(-1193.87, -894.41, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_tequila:client:frontTray', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(-563.18, 285.78, 81.4), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'lotus_tequila:client:drinkStation', label = 'Non Alcoholic', job = 'tequila' }, 
        { coords = vec3(-562.7, 289.0, 81.43), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'lotus_tequila:client:makeTequilas', label = 'Alcohols', job = 'tequila' }, 
        -- { coords = vec3(-1201.6, -899.1, 14.0), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'lotus_tequila:client:friesStation', label = 'Make Fries', job = 'tequila' },
        { coords = vec3(-562.86, 287.2, 80.93), radius = 1.35, icon = 'fa-solid fa-box-open', event = 'lotus_tequila:client:ingredientStore', label = 'Ingredients', job = 'tequila', type = 'shop' },
        -- { coords = vec3(-1197.56, -894.29, 14.0), radius = 0.7, icon = 'far fa-clipboard', event = 'lotus_tequila:client:passThrough', label = 'Big Tray', job = 'tequila', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
        -- { coords = vec3(-1195.36, -892.37, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_tequila:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 11,
        items = {
            [1] = { name = 'lotus_tq_banana', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'lotus_tq_caramel', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'lotus_tq_coconut', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'lotus_tq_orange', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'lotus_tq_kiwi', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'lotus_tq_sugar', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'lotus_tq_strawberry', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            [8] = { name = 'lotus_tq_watermelon', price = 0, amount = 500, info = {}, type = 'item', slot = 8, },
            [9] = { name = 'lotus_tq_water', price = 0, amount = 500, info = {}, type = 'item', slot = 9, },
            [10] = { name = 'lotus_tq_tequila', price = 0, amount = 500, info = {}, type = 'item', slot = 10, },
            [11] = { name = 'lotus_tq_daquiri', price = 0, amount = 500, info = {}, type = 'item', slot = 11, },
        }
    },
    Emotes = {
        -- burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        -- bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        -- fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        -- bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}