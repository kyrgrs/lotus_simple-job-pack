# Lotus: Popeyes Job 

## Requirements

* [ox_lib](https://github.com/overextended/ox_lib/releases/)
* [ps-props](https://github.com/Project-Sloth/ps-props) (It's for drinks)

This Script based by breze_popeyes map if you have another map you can change vectors in config.lua 

ESX/QB supported with bridge along with ox/qb inventory.

Note!!!: This script based by randol_burgershot 

## For QBCore users, Add this to your @qb-core/shared/jobs.lua. ESX users will have to implement the job themselves.
```lua
	popeyes = {
		label = 'Popeyes',
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
	-- lotus_popeyes
	['lotus_pj_cherry_coke'] = {
		label = 'Coca Cola Cherry',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_cherrycoke',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_coke'] = {
		label = 'Coke',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_coke',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_diet_dew'] = {
		label = 'Diet MTN DEW',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_dietdew',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_drpepper'] = {
		label = 'Dr Pepper',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_dppepper',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_fanta_grape'] = {
		label = 'Fanta Grape',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantagrape',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_fanta'] = {
		label = 'Fanta',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantaorange',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_fanta_pineapple'] = {
		label = 'Fanta Pineapple',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_fantapineapple',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_mountain_dew'] = {
		label = 'Mountain Dew',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_mountaindew',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_redbull'] = {
		label = 'Redbull',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_redbull',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_redbull_sugarfree'] = {
		label = 'Redbull Sugar Free',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_redbullsugarfree',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	['lotus_pj_sprite'] = {
		label = 'Sprite',
		weight = 220,
		stack = true,
		close = true,
		client = {
			status = { thirst = 10000 },
			anim = { dict = 'mp_player_intdrink', clip = 'loop_bottle' },
			prop = {
				model = 'brum_can_sprite',
				pos = { x = 0.02, y = 0.0, z = 0.07 }, 
				rot = { x = 0.0, y = 0.0, z = 0.0 }
			},
			usetime = 6000,
		}
	},
	--food
	['lotus_pj_chicken_sandwich'] = {
		label = 'Chicken Sandwich',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Chicken Sandwich'
		},
	},
	['lotus_pj_fried_chicken'] = {
		label = 'Fried Chicken',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Fried Chicken'
		},
	},
	['lotus_pj_popcorn_chicken'] = {
		label = 'Popcorn Chicken',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Popcorn Chicken'
		},
	},
	['lotus_pj_chicken_tenders'] = {
		label = 'Chicken Tenders',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Chicken Tenders'
		},
	},
	['lotus_pj_coleslaw'] = {
		label = 'Coleslaw',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Coleslaw'
		},
	},
	['lotus_pj_redbeans_rice'] = {
		label = 'Red Beans and Rice',
		weight = 220,
		client = {
			status = { hunger = 200000 },
			anim = 'eating',
			prop = '',
			usetime = 2500,
			notification = 'You ate a delicious Red Beans and Rice'
		},
	},
	--ingredients
	['lotus_pj_chicken_breast'] = {
		label = 'Chicken Breast',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_sandwich_bread'] = {
		label = 'Sandwich Bread',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_lettuce'] = {
		label = 'Lettuce',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_mayonaise'] = {
		label = 'Mayonaise',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_chicken_pieces'] = {
		label = 'Chicken Pieces',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_flour'] = {
		label = 'Flour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_oil'] = {
		label = 'Oil',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_spicemix'] = {
		label = 'Spice Mix',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_cabbage'] = {
		label = 'Cabbage',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_carrot'] = {
		label = 'Carrot',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_vinegar'] = {
		label = 'Vingear',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_redbeans'] = {
		label = 'Red Beans',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_rice'] = {
		label = 'Rice',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_broth'] = {
		label = 'Broth',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_carbonated_water'] = {
		label = 'Carbonated Water',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_sugar'] = {
		label = 'Sugar',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_cherry_coke_flavour'] = {
		label = 'Coca Cola Cherry Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_coke_flavour'] = {
		label = 'Coke Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_diet_dew_flavour'] = {
		label = 'Diet MTN Dew Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_drpepper_flavour'] = {
		label = 'Dr Pepper Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_fanta_grape_flavour'] = {
		label = 'Fanta Grape Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_fanta_flavour'] = {
		label = 'Fanta Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_fanta_pineapple_flavour'] = {
		label = 'Fanta Pineapple Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_mountain_dew_flavour'] = {
		label = 'Mountain Dew Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_redbull_flavour'] = {
		label = 'Redbull Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_redbull_sugarfree_flavour'] = {
		label = 'Redbull Sugar Free Flavour',
		weight = 5,
		stack = true,
		close = true
	},
	['lotus_pj_sprite_flavour'] = {
		label = 'Sprite Flavour',
		weight = 5,
		stack = true,
		close = true
	},
```