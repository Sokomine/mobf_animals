-------------------------------------------------------------------------------
-- Turtle by AspireMint based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: mobf_turtle mod loading ...")
local version = "0.1"

local turtle_groups = {
						not_in_creative_inventory=1
					}

local selectionbox_turtle = {-0.4, 0.0, -0.4, 0.4, 0.35, 0.4}

local modpath = minetest.get_modpath("mobf_turtle")


turtle_prototype = {
		name="turtle",
		modname="mobf_turtle",
		
		factions = {
			member = {
				"animals",
				"grassland_animals"
				}
			},
	
		generic = {
					description="Turtle",
					base_health=10,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = turtle_groups,
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
-- turtle: 1-50 - doing nothing , 60-90 running , 95-100 hidden , 105-135 swimmin
		animation = {
				stand = {
					start_frame = 1,
					end_frame   = 50,
					},
				walk = {
					start_frame = 60,
					end_frame   = 90,
					},
				hide  = {
					start_frame = 95,
					end_frame   = 100,
					},
				swim  = {
					start_frame = 105,
					end_frame   = 135,
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
					mesh = "mobf_turtle.x",
					textures = {"mobf_turtle.png"},
					collisionbox = selectionbox_turtle,
					visual_size= {x=1,y=1,z=1},
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
minetest.log("action","\tadding animal "..turtle_prototype.name)
mobf_add_mob(turtle_prototype)
minetest.log("action","MOD: mobf_turtle mod         version " .. version .. " loaded")



turtle_diving_prototype = {
		name="turtle_diving",
		modname="mobf_turtle",
		
		factions = {
			member = {
				"animals",
				"fish"
				}
			},
	
		generic = {
					description="Turtle",
					base_health=10,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = turtle_groups,
					envid = "open_waters"
				},
		movement =  {
					min_accel=0.05,
					max_accel=0.1,
					max_speed=0.3,
					min_speed=0.1,
					pattern="swim_pattern2",
					canfly=true,
					},
		catching = {
					tool="animalmaterials:net",
					consumed=true,
					},
		spawning = {
					primary_algorithms = {
						{
							rate=0.02,
							density=350,
							algorithm="in_shallow_water_spawner",
							height=-1,
							respawndelay = 60,
						},
					}
				},
-- turtle: 1-50 - doing nothing , 60-90 running , 95-100 hidden , 105-135 swimmin
		animation = {
				stand = {
					start_frame = 1,
					end_frame   = 50,
					},
				swim  = {
					start_frame = 105,
					end_frame   = 135,
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
					mesh = "mobf_turtle.x",
					textures = {"mobf_turtle.png"},
					collisionbox = selectionbox_turtle,
					visual_size= {x=1,y=1,z=1},
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
minetest.log("action","\tadding animal "..turtle_diving_prototype.name)
mobf_add_mob(turtle_diving_prototype)
minetest.log("action","MOD: mobf_turtle_diving mod         version " .. version .. " loaded")
