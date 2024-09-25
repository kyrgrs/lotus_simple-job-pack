return {
    CookDuration = 10000,
    BlipCoords = vec3(12.47, -1600.2, 29.38),
    HungerFill = { -- How much they fill your hunger
        ['beef-taco'] = {emote = 'burger', amt = math.random(48, 54)},
        ['quesadilla'] = {emote = 'burger', amt = math.random(48, 54)},
        ['chicken-burrito'] = {emote = 'burger', amt = math.random(48, 54)},
        ['nachos'] = {emote = 'burger', amt = math.random(48, 54)},
    },
    ThirstFill = { -- How much they fill your thirst.
        ['kurkakola'] = {emote = 'bsdrink', amt = math.random(48, 54)},
    },
    Zones = {
        -- { coords = vec3(-1193.87, -894.41, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_taco:client:frontTray', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_1', slots = 10, weight = 75000}, 
        { coords = vec3(13.62, -1595.58, 28.96), radius = 0.9, icon = 'fa-solid fa-beer-mug-empty', event = 'lotus_taco:client:drinkStation', label = 'Make Drinks', job = 'taco' }, 
        { coords = vec3(10.69, -1598.92, 28.66), radius = 0.9, icon = 'fa-solid fa-burger', event = 'lotus_taco:client:cookTacos', label = 'Make Foods', job = 'taco' }, 
        -- { coords = vec3(-1201.6, -899.1, 14.0), radius = 0.7, icon = 'fa-solid fa-fire-burner', event = 'lotus_taco:client:friesStation', label = 'Make Fries', job = 'taco' },
        { coords = vec3(12.56, -1600.59, 29.3), radius = 1.35, icon = 'fa-solid fa-box-open', event = 'lotus_taco:client:ingredientStore', label = 'Ingredients', job = 'taco', type = 'shop' },
        -- { coords = vec3(-1197.56, -894.29, 14.0), radius = 0.7, icon = 'far fa-clipboard', event = 'lotus_taco:client:passThrough', label = 'Big Tray', job = 'taco', type = 'stash', stashLabel = 'BS_Big_Tray', slots = 20, weight = 150000 },
        -- { coords = vec3(-1195.36, -892.37, 14.0), radius = 0.5, icon = 'far fa-clipboard', event = 'lotus_taco:client:frontTray2', label = 'Food Tray', type = 'stash', stashLabel = 'BS_Front_Tray_2', slots = 10, weight = 75000},
    },
    Items = { -- qb-inventory, ew
    label = 'Shop',
        slots = 11,
        items = {
            [1] = { name = 'tortillas', price = 0, amount = 500, info = {}, type = 'item', slot = 1, },
            [2] = { name = 'ground-beef', price = 0, amount = 500, info = {}, type = 'item', slot = 2, },
            [3] = { name = 'cheddar-cheese', price = 0, amount = 500, info = {}, type = 'item', slot = 3, },
            [4] = { name = 'butter', price = 0, amount = 500, info = {}, type = 'item', slot = 4, },
            [5] = { name = 'chicken', price = 0, amount = 500, info = {}, type = 'item', slot = 5, },
            [6] = { name = 'lettuce', price = 0, amount = 500, info = {}, type = 'item', slot = 6, },
            [7] = { name = 'tortilla-chips', price = 0, amount = 500, info = {}, type = 'item', slot = 7, },
            [8] = { name = 'carbonated-water', price = 0, amount = 500, info = {}, type = 'item', slot = 8, },
            [9] = { name = 'sugar-cubes', price = 0, amount = 500, info = {}, type = 'item', slot = 9, },
            [10] = { name = 'taco-tomato', price = 0, amount = 500, info = {}, type = 'item', slot = 10, },
            [11] = { name = 'gelato', price = 0, amount = 500, info = {}, type = 'item', slot = 11, },
        }
    },
    Emotes = {
        -- burger = {prop = `prop_cs_burger_01`, bone = 18905, anim = 'mp_player_int_eat_burger', dict = 'mp_player_inteat@burger', coords = vec3(0.130000, 0.050000, 0.020000), rot = vec3(-50.000000, 16.000000, 60.000000)},
        -- bbqf = {prop = `prop_fish_slice_01`, bone = 28422, anim = 'idle_b', dict = 'amb@prop_human_bbq@male@idle_a', coords = vec3(0.0, 0.0, 0.0), rot = vec3(0.0, 0.0, 0.0)},
        -- fries = {prop = `prop_food_bs_chips`, bone = 18905, anim = 'mp_player_int_eat_burger_fp', dict = 'mp_player_inteat@burger', coords = vec3(0.090000, -0.060000, 0.050000), rot = vec3(300.000000, 150.000000, 0.000000)},
        -- bsdrink = {prop = `prop_food_bs_juice02`, bone = 28422, anim = 'idle_c', dict = 'amb@world_human_drinking@coffee@male@idle_a', coords = vec3(0.02, 0.0, -0.10), rot = vec3(0.0, 0.0, -0.50)},
    }
}