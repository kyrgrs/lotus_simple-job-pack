# Lotus: Tequila Job 

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)

ESX/QB supported with bridge along with ox/qb inventory.

Note!!!: This script based by randol_burgershot 

## For QBCore users, Add this to your @qb-core/shared/jobs.lua. ESX users will have to implement the job themselves.
```lua
tequila = {
		label = 'Tequila',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Barman',
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
	--lotus_tequila
	['lotus_tq_banana'] = {
		label = 'Banana',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_caramel'] = {
		label = 'Caramel',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_coconut'] = {
		label = 'Coconut',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_orange'] = {
		label = 'Orange',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_kiwi'] = {
		label = 'Kiwi',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_sugar'] = {
		label = 'Sugar',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_strawberry'] = {
		label = 'Strawberry',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_watermelon'] = {
		label = 'Watermelon',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_water'] = {
		label = 'Water',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_tequila'] = {
		label = 'Tequila',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_tq_daquiri'] = {
		label = 'Daquiri',
		weight = 5,
		stack = true,
		close = true
	},
	--lotus_tequila NonAlcoholic
	['lotus_tq_berry_hydrating'] = {
		label = 'Berry Hydrating',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		},
	},
	['lotus_tq_green_dream'] = {
		label = 'Green Dream',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_island_breeze'] = {
		label = 'Island Breeze',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_just_peachy'] = {
		label = 'Just Peachy',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_watermelon_dream'] = {
		label = 'Watermelon Dream',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_kiwi_juice'] = {
		label = 'Kiwi Jucie',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_orange_juice'] = {
		label = 'Orange Jucie',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_strawberry_juice'] = {
		label = 'Strawberry Jucie',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_banana_juice'] = {
		label = 'Banana Jucie',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	-- lotus_tequila alcoholic
	['lotus_tq_cocktail'] = {
		label = 'Coctail',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_coconut_drink'] = {
		label = 'Coconut Drink',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_island_fantasy'] = {
		label = 'Island Fantasy',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['lotus_tq_kamikaze'] = {
		label = 'Kamikaze',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
	['tq_redhot_daquiri'] = {
		label = 'Red Hot Daquiri',
		weight = 50,
		client = {
			status = {  thirst = 600000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = '',
			usetime = 6000,
		}
	},
```
# Props are not entered, if you have a prop you can change it.