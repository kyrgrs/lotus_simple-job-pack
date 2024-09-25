return {
    CookDuration = 10000,
    BlipCoords = vec3(183.88, -1449.09, 28.25),
    HungerFill = { -- How much they fill your hunger
        
    },
    ThirstFill = { -- How much they fill your thirst.
        
    },
    Zones = {
        --{ coords = vec3(174.93, -1446.58, 28.41), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_popeyes:client:frontTray', label = 'Bill', type = 'stash', stashLabel = 'BS_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(183.88, -1449.09, 28.25), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'lotus_popeyes:client:drinkStation', label = 'Make Drinks', job = 'popeyes' }, 
        { coords = vec3(186.4, -1452.07, 28.13), radius = 0.9, icon = 'fa-solid fa-burger', event = 'lotus_popeyes:client:cookpopeyess', label = 'Make Foods', job = 'popeyes' }, 
        { coords = vec3(182.97, -1455.29, 28.66), radius = 1.35, icon = 'fa-solid fa-box-open', event = 'lotus_popeyes:client:ingredientStore', label = 'Ingredients', job = 'popeyes', type = 'shop' },
        -- { coords = vec3(-1197.56, -894.29, 14.0), radius = 0.7, icon = 'far fa-clipboard', event = 'lotus_popeyes:client:passThrough', label = 'Big Tray', job = 'popeyes', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
        -- { coords = vec3(-1195.36, -892.37, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_popeyes:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 11,
        items = {
            [1] = { name = 'lotus_pj_chicken_breast', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'lotus_pj_sandwich_bread', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'lotus_pj_lettuce', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'lotus_pj_mayonaise', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'lotus_pj_chicken_pieces', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'lotus_pj_flour', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'lotus_pj_oil', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            [8] = { name = 'lotus_pj_spicemix', price = 0, amount = 500, info = {}, type = 'item', slot = 8, },
            [9] = { name = 'lotus_pj_cabbage', price = 0, amount = 500, info = {}, type = 'item', slot = 9, },
            [10] = { name = 'lotus_pj_carrot', price = 0, amount = 500, info = {}, type = 'item', slot = 10, },
            [11] = { name = 'lotus_pj_vinegar', price = 0, amount = 500, info = {}, type = 'item', slot = 11, },
            [12] = { name = 'lotus_pj_redbeans', price = 0, amount = 500, info = {}, type = 'item', slot = 12, },
            [13] = { name = 'lotus_pj_rice', price = 0, amount = 500, info = {}, type = 'item', slot = 13, },
            [14] = { name = 'lotus_pj_broth', price = 0, amount = 500, info = {}, type = 'item', slot = 14, },
            [15] = { name = 'lotus_pj_carbonated_water', price = 0, amount = 500, info = {}, type = 'item', slot = 15, },
            [16] = { name = 'lotus_pj_sugar', price = 0, amount = 500, info = {}, type = 'item', slot = 16, },
            [17] = { name = 'lotus_pj_cherry_coke_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 17, },
            [18] = { name = 'lotus_pj_coke_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 18, },
            [19] = { name = 'lotus_pj_diet_dew_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 19, },
            [20] = { name = 'lotus_pj_drpepper_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 20, },
            [21] = { name = 'lotus_pj_fanta_grape_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 21, },
            [22] = { name = 'lotus_pj_fanta_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 22, },
            [23] = { name = 'lotus_pj_fanta_pineapple_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 23, },
            [24] = { name = 'lotus_pj_redbull_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 25, },
            [25] = { name = 'lotus_pj_redbull_sugarfree_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 25, },
            [26] = { name = 'lotus_pj_sprite_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 26, },
        }
    },
    Emotes = {
        -- burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        -- bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        -- fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        -- bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}