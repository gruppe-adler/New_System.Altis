If(hasInterface)exitWith {};
#include "ga_macro.hpp"


// UNIT_CLASS_NAMES
// Class_Names for Creating the Enemy-Soldiers

NORMAL_UNIT_CLASSES = [
                        "O_Soldier_F",
						"O_Soldier_lite_F",
						"O_Soldier_GL_F",
						"O_Soldier_AR_F",
						"O_Soldier_SL_F",
						"O_Soldier_TL_F",
						"O_Soldier_AAR_F",
						"O_Soldier_AAA_F",
						"O_Soldier_AAT_F",
						"O_soldier_M_F",
						"O_Soldier_LAT_F",
						"O_medic_F",
						"O_soldier_exp_F",
						"O_soldierU_AR_F",
						"O_SoldierU_GL_F",
						"O_soldierU_AT_F",
						"O_soldierU_medic_F",
						"O_soldierU_LAT_F",
						"O_engineer_U_F",
						"O_soldierU_AA_F",
						"O_soldierU_repair_F",
						"O_soldierU_F",
						"O_soldierU_exp_F",
						"O_soldierU_TL_F"
					  ];
					  
					  
SPECIAL_UNIT_CLASSES = [
						 "O_recon_TL_F",
						 "O_recon_LAT_F",
						 "O_recon_F",
						 "O_recon_medic_F",
						 "O_recon_M_F",
						 "O_recon_JTAC_F",
						 "O_recon_exp_F"
					   ];
					   
SNIPER_UNIT_CLASSES = [
                        "O_sniper_F",
                        "O_spotter_F",
						"O_soldierU_M_F"
                      ];					   
					   
PILOT_UNIT_CLASSES = [
						"O_Pilot_F"
					 ];
				
PARACHUTIST_CLASSES = [
                        "O_soldier_PG_F"
                      ];

					   
//************************************************************************************************************
	
//Vehicle_CLASS_NAMES
//Class_Names for Creating the Enemy-vehicles


TANKS_VEHICLE_CLASSES = [
                          "BWA3_Puma_Fleck",
						  "O_APC_Wheeled_02_rcws_F",
						  "O_MBT_02_cannon_F",
						  "O_APC_Tracked_02_AA_F"
					    ];

CAR_VEHICLE_CLASSES = [
                         "O_MRAP_02_F",
						 "O_MRAP_02_gmg_F",
						 "O_MRAP_02_hmg_F"
                       ];
					   
ARI_VEHICLE_CLASSES = [
					     "O_MBT_02_arty_F"
                      ];					   

					  
CARRIER_TRUCK_VEHICLE_CLASSES = [                                   
								   "O_Truck_02_transport_F",
								   "O_Truck_02_covered_F"
                                ];
								
							

	
//************************************************************************************************************

//AIRVEHICLE_CLASS_NAMES
//Class_Names for Creating the Enemy-Airvehicles (ATTACK)


AIR_VEHICLE_CLASSES = [
						"O_Heli_Attack_02_F",
						"O_Heli_Attack_02_black_F",
						"O_Heli_Light_02_F",
						"O_Plane_CAS_02_F"
					  ];
					  
					  
//************************************************************************************************************

//AIR_TRANSPORT_CLASS_NAMES (Soldier Carry Support)



AIR_TRANSPORT_VEHICLE_CLASSES = [
                                  
								  "O_Heli_Transport_04_covered_F"
								];


//************************************************************************************************************

//STATIC_WEAPON_CLASS_NAMES


STATIC_WEAPON_CLASSES = [
						  "O_HMG_01_high_F",
						  "O_HMG_01_F",
						  "O_GMG_01_high_F",
						  "O_GMG_01_F",
						  "O_Mortar_01_F",
                          "O_static_AA_F",
						  "O_static_AT_F"
                        ];


//************************************************************************************************************

//ALLOWED_C4_CLASSNAMES

C4_CLASSES = [
               "DemoCharge_Remote_Ammo",
               "SatchelCharge_Remote_Ammo",
			   "SatchelCharge_Remote_Ammo_Scripted",
			   "DemoCharge_Remote_Ammo_Scripted",
			   "rhsusf_m112_ammo",
			   "rhsusf_m112x4_ammo"	           
             ];

//Feind Seite
ENEMY_SIDE = EAST;	//EAST,WEST,independent

//Eigene Seite
OWN_FACTION_SIDE = WEST; //EAST,WEST,independent

//************************************************************************************************************
//CIVILIAN_CLASS_NAMES


CIV_MEN_CLASSES = [
					"C_man_p_beggar_F_afro","C_man_p_fugitive_F_afro","C_man_p_shorts_1_F_afro",
					"C_man_shorts_2_F_afro","C_man_shorts_3_F_afro","C_man_shorts_4_F_afro","C_man_shorts_1_F_afro",
					"C_man_polo_1_F_afro","C_man_polo_2_F_afro","C_man_polo_3_F_afro","C_man_polo_4_F_afro",
					"C_man_polo_5_F_afro","C_man_polo_6_F_afro","C_man_p_fugitive_F_asia", "C_man_p_shorts_1_F_asia",
					"C_man_shorts_2_F_asia","C_man_shorts_3_F_asia","C_man_shorts_4_F_asia","C_man_shorts_1_F_asia",
					"C_man_polo_1_F_asia","C_man_polo_2_F_asia","C_man_polo_3_F_asia","C_man_polo_4_F_asia",
					"C_man_polo_5_F_asia","C_man_polo_6_F_asia","C_man_w_worker_F","C_man_1_1_F","C_man_1_2_F",
					"C_man_1_3_F","C_man_p_beggar_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F",
					"C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F","C_man_1"
			
				  ];
		  
		  
CIV_VEHICLE_CLASSES = [
                        "C_Hatchback_01_F","C_Hatchback_01_sport_F","C_Offroad_01_F","C_Quadbike_01_F",
						"C_SUV_01_F","C_Van_01_transport_F","C_Van_01_box_F"
                      ];

//**************************************************************************************************************
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  
					  

//dont touch this					  
//******************************************************************************************************************************************************	

CPORT setVariable[CNAME(c4_class_names),C4_CLASSES,true];
ENEMY_TRIGGER_SIDE = ENEMY_SIDE;
switch(true)do
{
 case (ENEMY_SIDE == resistance):{ENEMY_TRIGGER_SIDE = GUER};
 case (ENEMY_SIDE == independent):{ENEMY_TRIGGER_SIDE = GUER};
};
OWN_TRIGGER_SIDE = OWN_FACTION_SIDE;
switch(true)do
{
 case (OWN_FACTION_SIDE == resistance):{OWN_TRIGGER_SIDE = GUER};
 case (OWN_FACTION_SIDE == independent):{OWN_TRIGGER_SIDE = GUER};
};
				  
grad_class_settings_var = true;

diag_log format ["GRAD Init_Classes: %1",grad_class_settings_var];
//
//*******************************************************************************************************************************************************





















