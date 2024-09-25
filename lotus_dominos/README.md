# Lotus: Dominos Job 

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)
* [ps-props](https://github.com/Project-Sloth/ps-props) (It's for drinks)

This Script based by breze_dominos map if you have another map you can change vectors in config.lua 

ESX/QB supported with bridge along with ox/qb inventory.

Note!!!: This script based by randol_burgershot 

## For QBCore users, Add this to your @qb-core/shared/jobs.lua. ESX users will have to implement the job themselves.
```lua
	dominos = {
		label = 'dominos',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Worker',
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
	-- lotus_dominos
	['lotus_dj_cherry_coke'] = {
		label = 'Coca Cola Cherry',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_cherrycoke',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_coke'] = {
		label = 'Coke',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_coke',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_diet_dew'] = {
		label = 'Diet MTN DEW',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_dietdew',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_drpepper'] = {
		label = 'Dr Pepper',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_dppepper',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_fanta_grape'] = {
		label = 'Fanta Grape',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantagrape',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_fanta'] = {
		label = 'Fanta',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantaorange',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_fanta_pineapple'] = {
		label = 'Fanta Pineapple',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantapineapple',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_mountain_dew'] = {
		label = 'Mountain Dew',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_mountaindew',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_redbull'] = {
		label = 'Redbull',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_redbull',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_redbull_sugarfree'] = {
		label = 'Redbull Sugar Free',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_redbullsugarfree',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_sprite'] = {
		label = 'Sprite',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_sprite',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, -- 'z' koordinatı yukarı kaldırmak için artırıldı
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_dj_cherry_coke_flavour'] = {
		label = 'Coca Cola Cherry Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_coke_flavour'] = {
		label = 'Coke Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_diet_dew_flavour'] = {
		label = 'Diet MTN Dew Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_drpepper_flavour'] = {
		label = 'Dr Pepper Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_fanta_grape_flavour'] = {
		label = 'Fanta Grape Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_fanta_flavour'] = {
		label = 'Fanta Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_fanta_pineapple_flavour'] = {
		label = 'Fanta Pineapple Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_mountain_dew_flavour'] = {
		label = 'Mountain Dew Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_redbull_flavour'] = {
		label = 'Redbull Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_redbull_sugarfree_flavour'] = {
		label = 'Redbull Sugar Free Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_sprite_flavour'] = {
		label = 'Sprite Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_pepperoni_pizza'] = {
		label = 'Pepperoni Pizza',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Pepperoni Pizza'
		},
	},
	['lotus_dj_cheese_pizza'] = {
		label = 'Cheese Pizza',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Cheese Pizza'
		},
	},
	['lotus_dj_bbq_chicken_pizza'] = {
		label = 'BBQ Chicken Pizza',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Popcorn Chicken'
		},
	},
	['lotus_dj_margeritha_pizza'] = {
		label = 'Margeritha Pizza',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Margeritha Pizza'
		},
	},
	['lotus_dj_pepperoni_calzone'] = {
		label = 'Pepperoni Calzone',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Pepperoni Calzone'
		},
	},
	['lotus_dj_carbonated_water'] = {
		label = 'Carbonated Water',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_sugar'] = {
		label = 'Sugar',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_dough'] = {
		label = 'Dough',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_tomato_sauce'] = {
		label = 'Tomato Sauce',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_cheese'] = {
		label = 'Cheese',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_pepperoni'] = {
		label = 'Pepperoni',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_oregano'] = {
		label = 'Oregano',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_bbq_sauce'] = {
		label = 'BBQ Sauce',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_chicken'] = {
		label = 'Chicken',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_dj_basil'] = {
		label = 'Basil',
		weight = 5,
		stack = true,
		close = true
	},
```