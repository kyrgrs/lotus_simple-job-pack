# Lotus: Taco Job 

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)

If you don't have the MLO, you can use this (https://www.gta5-mods.com/maps/taco-restaurant-mlo-add-on-fivem-pablitomamutopaputo) and change the vectors in the [config.lua].

ESX/QB supported with bridge along with ox/qb inventory.

Note!!!: This script based by randol_burgershot 

## For QBCore users, Add this to your @qb-core/shared/jobs.lua. ESX users will have to implement the job themselves.
```lua
	taco = {
		label = 'Taco Shop',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cook',
                payment = 75
            },
            ['1'] = {
                name = 'Manager',
                isboss = true,
                payment = 150,
            },
        },
	},
```

# For ox inventory users, add to your items.lua 
```lua
	--taco
	['beef-taco'] = {
		label = 'Beef Taco',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Beef Taco'
		},
	},
	['quesadilla'] = {
		label = 'Quesadilla',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Quesadilla'
		},
	},
	['chicken-burrito'] = {
		label = 'Chicken Burrito',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Chicken Burrito'
		},
	},
	['nachos'] = {
		label = 'Nachos',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = 'burger',
			usetime = 2500,
			notification = 'You ate a delicious Nachos'
		},
	},
	['kurkakola'] = {
		label = 'Coke',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'prop_cs_cola',
				pos = { x = 0.02, y = 0.0, z = 0.07 },
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['tortillas'] = {
		label = 'Tortillas',
		weight = 5,
		stack = true,
		close = true
	},
	['ground-beef'] = {
		label = 'Ground Beef',
		weight = 5,
		stack = true,
		close = true
	},
	['cheddar-cheese'] = {
		label = 'Cheddar Cheese',
		weight = 5,
		stack = true,
		close = true
	},
	['butter'] = {
		label = 'Butter',
		weight = 5,
		stack = true,
		close = true
	},
	['chicken'] = {
		label = 'Chicken',
		weight = 5,
		stack = true,
		close = true
	},
	['lettuce'] = {
		label = 'Lettuce',
		weight = 5,
		stack = true,
		close = true
	},
	['tortilla-chips'] = {
		label = 'Tortilla Chips',
		weight = 5,
		stack = true,
		close = true
	},
	['carbonated-water'] = {
		label = 'Carbonated Water',
		weight = 5,
		stack = true,
		close = true
	},
	['sugar-cubes'] = {
		label = 'Sugar Cubes',
		weight = 5,
		stack = true,
		close = true
	},
	['taco-tomato'] = {
		label = 'Taco Tomato',
		weight = 5,
		stack = true,
		close = true
	},
	['gelato'] = {
		label = 'Gelato',
		weight = 5,
		stack = true,
		close = true
	},
```
# Props are based burgers if you have a prop you can change it