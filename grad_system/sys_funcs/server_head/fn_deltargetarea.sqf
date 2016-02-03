If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                       private ["_position","_x_koordinate","_y_koordinate","_group_store_arr","_vehicle_store_arr",
					            "_mortar_store_arr","_ari_store_arr","_inside_arr","_inside_pos","_grp_store","_del_grps","_x","_search",
								"_hit_counter","_search_hit","_wanted_arr","_vec_store","_vec","_mortar_change","_ari_change","_holder","_is_target"];
						                      					   
                       _position = _this select 0;
					   
					   If((CPORT getVariable CNAME(hc_available)) && isDedicated)then{[["DELETE",_position]] spawn SFUNC(sendtohc);sleep (random 8);};
					   					    
					   _x_koordinate = (_trigger_pos select 0);
                       _y_koordinate = (_trigger_pos select 1);
					   
					   waitUntil{(CPORT getVariable CNAME(delete_allowed))};					   
                       CPORT setVariable [CNAME(spawn_allowed),false,false];
					   
					   _group_store_arr = If(!isNil {CPORT getVariable CNAME(enemy_groups)})then{(CPORT getVariable CNAME(enemy_groups))}else{[]};
					   _vehicle_store_arr = If(!isNil {CPORT getVariable CNAME(all_vehicles)})then{(CPORT getVariable CNAME(all_vehicles))}else{[]};
					   _mortar_store_arr = If(!isNil {CPORT getVariable CNAME(all_mortars)})then{(CPORT getVariable CNAME(all_mortars))}else{[]};
					   _ari_store_arr = If(!isNil {CPORT getVariable CNAME(artillery_vecs)})then{(CPORT getVariable CNAME(artillery_vecs))}else{[]};
					   
					  If(count _group_store_arr > 0)then
					  {
					   switch(true)do
					   {
					     case (count _group_store_arr > 0 && count _group_store_arr < 2):{
						                                                                    _inside_arr = (_group_store_arr select 0);
					                                                                        _inside_pos = (_inside_arr select 0);
                                                                                            _grp_store = (_inside_arr select 1);
																							
																						   If(_x_koordinate == (_inside_pos select 0) && _y_koordinate == (_inside_pos select 1))then
																						   {
																						    for "_del_grps" from 0 to ((count _grp_store) - 1) do
																							{
																							 If(!isNull (_grp_store select _del_grps))then
																							 {
																							  { 
																							    if(isInRemainsCollector _x)then{removeFromRemainsCollector [_x];sleep 0.04;};
																							    deleteVehicle _x;
																								
																							  }forEach units (_grp_store select _del_grps);
																							 };
																							 sleep 0.04;
																							};
																							
																							CPORT setVariable[CNAME(enemy_groups),[],false];
																						   };
																						 };
					     case (count _group_store_arr > 1):{
						                                      _hit_counter = 0;
															  _search_hit = true;
															  
						                                      for "_search" from 0 to ((count _group_store_arr) - 1) do
															  {
															     _inside_arr = (_group_store_arr select _search);
															     _inside_pos = (_inside_arr select 0);
															  
															     If(_x_koordinate == (_inside_pos select 0) && _y_koordinate == (_inside_pos select 1) && _search_hit)then
																 {
																   _search_hit = false;
																   _hit_counter = _search;
																 };
															   sleep 0.04;									  
															  };
															  If(!_search_hit)then
															  {
															    _wanted_arr = (_group_store_arr select _hit_counter);
																_grp_store = (_wanted_arr select 1);
															  
															    for "_del_grps" from 0 to ((count _grp_store) - 1) do
																{
																 If(!isNull (_grp_store select _del_grps))then
																 {
																  {
																   if(isInRemainsCollector _x)then{removeFromRemainsCollector [_x];sleep 0.04;};
																   deleteVehicle _x;
																  }forEach units (_grp_store select _del_grps);
																 };
															     sleep 0.04;
															    };
																_group_store_arr set [_hit_counter,(_hit_counter * -1)];
																_group_store_arr = _group_store_arr - [(_hit_counter * -1)];
																
																CPORT setVariable[CNAME(enemy_groups),_group_store_arr,false];
															  };
						 
						                                   };
					    };
					   };
					   If(count _vehicle_store_arr > 0)then
					   {
					     switch(true)do
					     {
					       case (count _vehicle_store_arr > 0 && count _vehicle_store_arr < 2):{
																								  _inside_arr = (_vehicle_store_arr select 0);
																								  _inside_pos = (_inside_arr select 0);
                                                                                                  _vec_store = (_inside_arr select 1);
																								  _mortar_change = false;
																								  _ari_change = false;
																								  
																								  
																								  If(_x_koordinate == (_inside_pos select 0) && _y_koordinate == (_inside_pos select 1))then
																								  {
																								    {
																									  _vec = _x;
																					
																									  If(count _mortar_store_arr > 0)then
																								      {
																									    If(_vec In _mortar_store_arr)then{_mortar_store_arr = _mortar_store_arr - [_vec];_mortar_change = true;};
																									  };
																									  If(count _ari_store_arr > 0)then
																									  {
																									    If(_vec In _ari_store_arr)then{_ari_store_arr = _ari_store_arr - [_vec];_ari_change = true;};
																									  };
																									  If(local _vec)then{
																									                     if(isInRemainsCollector _vec)then{removeFromRemainsCollector [_vec];sleep 0.04;};
																									                     deleteVehicle _vec;
																														};
					                                                                                }forEach _vec_store;
																									If(_mortar_change)then{CPORT setVariable[CNAME(all_mortars),_mortar_store_arr,false];};
																									If(_ari_change)then{CPORT setVariable[CNAME(artillery_vecs),_ari_store_arr,false];};
																									CPORT setVariable[CNAME(all_vehicles),[],false];
																								  };
					                                                                           };
					        case (count _vehicle_store_arr > 1):{
							                                      _hit_counter = 0;
															      _search_hit = true;
																  _mortar_change = false;
																  _ari_change = false;
		
																  
							                                      for "_search" from 0 to ((count _vehicle_store_arr) - 1) do
																  {
																    _inside_arr = (_vehicle_store_arr select _search);
																    _inside_pos = (_inside_arr select 0);

                                                                    If(_x_koordinate == (_inside_pos select 0) && _y_koordinate == (_inside_pos select 1) && _search_hit)then
                                                                    {
																	  _search_hit = false;
																      _hit_counter = _search;
                                                                    };																	
																   sleep 0.04;
							                                      }; 
																  If(!_search_hit)then
																  {
																    _wanted_arr = (_vehicle_store_arr select _hit_counter);
																	_vec_store = (_wanted_arr select 1);
																	{
																	  _vec = _x;
																	  
																	  If(count _mortar_store_arr > 0)then
																	  {
																	   If(_vec In _mortar_store_arr)then{_mortar_store_arr = _mortar_store_arr - [_vec]; _mortar_change = true;};
																	  };
																	  If(count _ari_store_arr > 0)then
																	  {
																	   If(_vec In _ari_store_arr)then{_ari_store_arr = _ari_store_arr - [_vec]; _ari_change = true;};
																	  };
																	  If(local _vec)then{
																	                     if(isInRemainsCollector _vec)then{removeFromRemainsCollector [_vec];sleep 0.04;};
																	                     deleteVehicle _vec;
																	                    };																	  
							                                        }forEach _vec_store;
																	
																	If(_mortar_change)then{CPORT setVariable[CNAME(all_mortars),_mortar_store_arr,false];};
																	If(_ari_change)then{CPORT setVariable[CNAME(artillery_vecs),_ari_store_arr,false];};
																	_vehicle_store_arr set [_hit_counter,(_hit_counter * -1)];
																	_vehicle_store_arr = _vehicle_store_arr - [(_hit_counter * -1)];
																	CPORT setVariable[CNAME(all_vehicles),_vehicle_store_arr,false];
							                                      };
							                                    };
					   
					      };
					   };
					   
					   CPORT setVariable [CNAME(spawn_allowed),true,false];
                       true	