-------------------------------------------------------------------------------
-- Swan by AspireMint based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: mobf_swan mod loading ...")
local version = "0.1"

local swan_groups = {
						not_in_creative_inventory=1
					}

local selectionbox_swan = {-0.2, 0, -0.15, 0.2, 0.8, 0.15}

local modpath = minetest.get_modpath("mobf_swan")


swan_prototype = {
		name="swan",
		modname="mobf_swan",
		
		factions = {
			member = {
				"animals",
				"birds"
				}
			},
	
		generic = {
					description="Swan",
					base_health=10,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = swan_groups,
					envid = "meadow"
				},
		movement =  {
					min_accel=0.05,
					max_accel=0.1,
					max_speed=0.3,
					min_speed=0.1,
					pattern="stop_and_go",
					canfly = false,
					},
		catching = {
					tool="animalmaterials:net",
					consumed=true,
					},
		spawning = {
					primary_algorithms = {
						{
						rate=0.001,
						density=75,
						algorithm="willow_mapgen",
						height=1
						},
					}
				},
--  <AspireMint> swan: standing(0-180) , running(190-210) , lying(220-280) , swimming(290-390)
		animation = {
				stand = {
					start_frame = 1,
					end_frame   = 180,
					},
				walk = {
					start_frame = 190,
					end_frame   = 210,
					},
				lie    = {
					start_frame = 220,
					end_frame   = 280,
					},
			},

		states = {
				{ 
				name = "default",
				movgen = "none",
				chance = 0,
				animation = "stand",
				graphics_3d = {
					visual = "mesh",
					mesh = "mobf_swan.x",
					textures = {"mobf_swan.png"},
					collisionbox = selectionbox_swan,
					visual_size= {x=1.25,y=1.25,z=1.25},
					},
				graphics = {
					sprite_scale={x=1,y=1},
					sprite_div = {x=6,y=1},
					visible_height = 1,
					visible_width = 1,
					},
				typical_state_time = 30,
				},
				{ 
				name = "walking",
				movgen = "probab_mov_gen",
				chance = 0.50,
				animation = "walk",
				typical_state_time = 180,
				},
			},
		}
		

--register with animals mod
minetest.log("action","\tadding animal "..swan_prototype.name)
mobf_add_mob(swan_prototype)
minetest.log("action","MOD: mobf_swan mod         version " .. version .. " loaded")


env_swim_1 = {
                        media = {
						"air",
	                                        "default:water_source",
                                                "default:water_flowing"
                                        },
                        surfaces = {
                                                good = {
                                                        "default:water_source",
                                                	"default:water_flowing"
                                                       }

                                        },
                        --ground is first node above/below not beeing of media type
                        max_height_above_ground     = 1,
                        min_height_above_ground     = 1
                }

--!@}

environment.register("swim_1", env_swim_1)


local selectionbox_swan_swimming = {-0.2, 0, -0.15, 0.2, 0.8, 0.15}

swan_swimming_prototype = {
		name="swan_swimming",
		modname="mobf_swan",
		
		factions = {
			member = {
				"animals",
				"birds"
				}
			},
	
		generic = {
					description="Swan",
					base_health=10,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = swan_groups,
					envid="swim_1",
				},

		movement =  {
					min_accel=0.1,
					max_accel=0.4,
					max_speed=1,
					pattern="flight_pattern1",
					canfly=true,
					},
		
		spawning = {
					primary_algorithms = {
						{
						rate=0.2,
						density=250,
						algorithm="in_air1_spawner",
--							algorithm="in_shallow_water_spawner",
						height=-1,
						respawndelay=60
						},
					}
				},
		catching = {
					tool="animalmaterials:net",
					consumed=true,
					},
--  <AspireMint> swan: standing(0-180) , running(190-210) , lying(220-280) , swimming(290-390)
		animation = {
				fly  = { -- fly == swim
					start_frame = 290,
					end_frame   = 390,
					},
			},

		states = {
				{ 
				name = "default",
				movgen = "probab_mov_gen",
				typical_state_time = 100,
				chance = 0,
				animation = "fly",

				graphics_3d = {
					visual = "mesh",
					mesh = "mobf_swan.x",
					textures = {"mobf_swan.png"},
					collisionbox = selectionbox_swan_swimming,
					visual_size= {x=1.25,y=1.25,z=1.25},
					},
				graphics = {
					sprite_scale={x=1,y=1},
					sprite_div = {x=6,y=1},
					visible_height = 1,
					visible_width = 1,
					},
				typical_state_time = 30,
				},
			},
		}
		

--register with animals mod
minetest.log("action","\tadding animal "..swan_swimming_prototype.name)
mobf_add_mob(swan_swimming_prototype)
minetest.log("action","MOD: mobf_swan_swimming_ mod   version " .. version .. " loaded")

