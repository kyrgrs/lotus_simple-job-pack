return {
    CookDuration = 10000,
    BlipCoords = vec3(545.82, 121.67, 95.49),
    HungerFill = { -- How much they fill your hunger
        
    },
    ThirstFill = { -- How much they fill your thirst.
        
    },
    Zones = {
        --{ coords = vec3(174.93, -1446.58, 28.41), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_dominos:client:frontTray', label = 'Bill', type = 'stash', stashLabel = 'BS_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(548.98, 113.89, 95.82), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'lotus_dominos:client:drinkStation', label = 'Make Drinks', job = 'dominos' }, 
        { coords = vec3(545.82, 121.67, 95.49), radius = 0.9, icon = 'fa-solid fa-burger', event = 'lotus_dominos:client:cookdominoss', label = 'Make Foods', job = 'dominos' }, 
        { coords = vec3(549.06, 115.15, 96.28), radius = 1.35, icon = 'fa-solid fa-box-open', event = 'lotus_dominos:client:ingredientStore', label = 'Ingredients', job = 'dominos', type = 'shop' },
        -- { coords = vec3(-1197.56, -894.29, 14.0), radius = 0.7, icon = 'far fa-clipboard', event = 'lotus_dominos:client:passThrough', label = 'Big Tray', job = 'dominos', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
        -- { coords = vec3(-1195.36, -892.37, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_dominos:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 20,
        items = {
            [1] = { name = 'lotus_dj_dough', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'lotus_dj_tomato_sauce', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'lotus_dj_cheese', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'lotus_dj_pepperoni', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'lotus_dj_oregano', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'lotus_dj_bbq_sauce', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'lotus_dj_chicken', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            [8] = { name = 'lotus_dj_basil', price = 0, amount = 500, info = {}, type = 'item', slot = 8, },
            [9] = { name = 'lotus_dj_carbonated_water', price = 0, amount = 500, info = {}, type = 'item', slot = 9, },
            [10] = { name = 'lotus_dj_sugar', price = 0, amount = 500, info = {}, type = 'item', slot = 10, },
            [11] = { name = 'lotus_dj_cherry_coke_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 11, },
            [12] = { name = 'lotus_dj_coke_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 12, },
            [13] = { name = 'lotus_dj_diet_dew_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 13, },
            [14] = { name = 'lotus_dj_drpepper_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 14, },
            [15] = { name = 'lotus_dj_fanta_grape_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 15, },
            [16] = { name = 'lotus_dj_fanta_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 16, },
            [17] = { name = 'lotus_dj_fanta_pineapple_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 17, },
            [18] = { name = 'lotus_dj_redbull_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 18, },
            [19] = { name = 'lotus_dj_redbull_sugarfree_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 19, },
            [20] = { name = 'lotus_dj_mountain_dew_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 20, },
            [21] = { name = 'lotus_dj_sprite_flavour', price = 0, amount = 500, info = {}, type = 'item', slot = 21, },
        }
    },
    Emotes = {
        -- burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        -- bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        -- fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        -- bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}