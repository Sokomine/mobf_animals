-------------------------------------------------------------------------------
-- Donkey done by AspireMint based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: mobf_donkey mod loading ...")
local version = "0.1"

local donkey_groups = {
						not_in_creative_inventory=1
					}

--local selectionbox_donkey = {-0.5, -0.9, -0.5, 0.5, 0.6, 0.5}
local selectionbox_donkey = {-0.7, -0.1, -0.35, 0.7, 1.3, 0.35}

donkey_prototype = {
		name="donkey",
		modname="mobf_donkey",
		
		factions = {
			member = {
				"animals",
				"grassland_animals"
				}
			},
	
		generic = {
					description="Donkey",
					base_health=10,
					kill_result="",
					armor_groups= {
						fleshy=90,
					},
					groups = donkey_groups,
					envid = "meadow",
					stepheight=1.1,
				},
		movement =  {
					min_accel=0.05,
					max_accel=0.3,
					max_speed=1.0,
					min_speed=0.1,
					pattern="stop_and_go",
					canfly = false,
					},
		catching = {
					tool="animalmaterials:lasso",
					consumed=true,
					},
		spawning = {
					primary_algorithms = {
						{
						rate=0.001,
						density=600,
						algorithm="willow_mapgen",
						height=2
						},
					},
					secondary_algorithms = {
						{
						rate=0.001,
						density=600,
						algorithm="willow",
						height=2
						},
					}
				},
		ride = {
					walkspeed  = 7.8,
					sneakspeed = 0.8,
					jumpspeed  = 12, --58,
					attacheoffset = { x=0,y=3.5,z=1.0},
--					texturemod = "^mob_ostrich_ostrich_saddle_mesh.png",
					walk_anim = "walk"
			},
-- <AspireMint> donkey without backpack: 0-40 standing, 45-85 running
-- <AspireMint> donkey with empty backpack: 90-130 standing, 135-175 running
-- <AspireMint> donkey with full backpack: 180-220 standing, 225-265 running
		animation = {
				stand = {
					start_frame = 0,
					end_frame   = 40,
					},
				walk = {
					start_frame = 45,
					end_frame   = 85,
					},
				stand_backpack_empty = {
					start_frame = 90,
					end_frame   = 130,
					},
				walk_backpack_empty  = {
					start_frame = 135,
					end_frame   = 175,
					},
				stand_backpack_full = {
					start_frame = 180,
					end_frame   = 220,
					},
				walk_backpack_full  = {
					start_frame = 225,
					end_frame   = 265,
				} 
			},

		states = {
				{ 
				name = "default",
				movgen = "none",
				chance = 0,
				animation = "stand",
				graphics_3d = {
					visual = "mesh",
					mesh = "mobf_donkey.x",
					textures = {"mobf_donkey.png"},
					collisionbox = selectionbox_donkey,
					visual_size= {x=1.80,y=2.20,z=1.80},
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
minetest.log("action","\tadding mob "..donkey_prototype.name)
mobf_add_mob(donkey_prototype)

minetest.log("action","MOD: donkey mod            version " .. version .. " loaded")
