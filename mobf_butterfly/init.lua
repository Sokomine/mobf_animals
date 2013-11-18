-------------------------------------------------------------------------------
-- Butterfly by AspireMint based on Mob Framework Mod by Sapier
-------------------------------------------------------------------------------
minetest.log("action","MOD: mobf_butterfly loading ...")

local version = "0.0.14"

local butterfly_groups = {
						not_in_creative_inventory=1
					}

local selectionbox_butterfly = {-1, -0.3, -1, 1, 0.3, 1}

butterfly_prototype = {   
		name="butterfly",
		modname="mobf_butterfly",
		
		factions = {
			member = {
				"animals",
				"birds"
				}
			},
	
		generic = {
					description="Gull",
					base_health=5,
					kill_result="",
					armor_groups= {
						fleshy=85,
					},
					groups = butterfly_groups,
					envid="flight_1",
				},				
		movement =  {
					min_accel=0.5,
					max_accel=1,
					max_speed=4,
					pattern="flight_pattern1",
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
						density=250,
						algorithm="in_air1_spawner",
						height=-1,
						respawndelay=60
						},
					}
				},
--butterflies: 0-90 flying
		animation = {
				fly = {
					start_frame = 0,
					end_frame   = 90,
					},
				},
		states = {
				{
					name = "default",
					movgen = "probab_mov_gen",
					typical_state_time = 100,
					chance = 0,
					animation = "fly",
					graphics = {
						sprite_scale={x=2,y=2},
						sprite_div = {x=6,y=1},
						visible_height = 1,
						visible_width = 1,
					},
					graphics_3d = {
						visual = "mesh",
						mesh = "mobf_butterfly.x",
						textures = {"mobf_butterfly.png"},
						collisionbox = selectionbox_butterfly,
						visual_size= {x=1,y=1,z=1},
						},
				},
			}
		}


--register with animals mod
minetest.log("action","\tadding mob "..butterfly_prototype.name)
mobf_add_mob(butterfly_prototype)
minetest.log("action","MOD: mobf_butterfly mod            version " .. version .. " loaded")
