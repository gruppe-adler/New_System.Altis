If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                       private ["_chk_pos","_chk_arr","_chk_idx","_x_koord","_y_koord","_chk_holder","_arr_counter","_holder_arr","_holder_pos",
					            "_holder_in_arr","_holder_posx","_holder_posy","_search_hit","_i"];
					   _chk_pos = _this select 0;
					   _chk_arr = _this select 1;
					   _chk_idx = (toUpper (_this select 2));
					   _x_koord = _chk_pos select 0;
					   _y_koord = _chk_pos select 1;
					   _chk_holder = [];
					   _search_hit = false;
					   _arr_counter = 0;
					   
                       If(CPORT getVariable CNAME(delete_allowed))then{CPORT setVariable [CNAME(delete_allowed),false,false];};
					   
					   switch(_chk_idx)do
					   {
					     case "GROUP_STORE":{
						                       If(isNil {CPORT getVariable CNAME(enemy_groups)})then
											   {
											      CPORT setVariable[CNAME(enemy_groups),[[_chk_pos,_chk_arr]],false];											   
											   }else{
											          _chk_holder = (CPORT getVariable CNAME(enemy_groups));
											          switch(true)do
													  {
													    case ((count _chk_holder) > 1):{
														                                  for "_i" from 0 to ((count _chk_holder) - 1) do
																						  {
																						    _holder_arr = (_chk_holder select _i);
																							_holder_pos = (_holder_arr select 0);
																						    _holder_posx = (_holder_pos select 0);
																							_holder_posy = (_holder_pos select 1);
																							If(_x_koord == _holder_posx && _y_koord == _holder_posy)then
																							{
																							  _arr_counter = _i; _search_hit = true;
																							};
																						   sleep 0.04;
																						  };
														                                  
																						  If(_search_hit)then
																						  {
																						    _holder_arr = (_chk_holder select _arr_counter);
																							_holder_pos = (_holder_arr select 0);
																						    _holder_in_arr = (_holder_arr select 1);
																																													
																							_holder_in_arr append _chk_arr;
																																													
																							_chk_holder set [_arr_counter,[_holder_pos,_holder_in_arr]];
																							CPORT setVariable[CNAME(enemy_groups),_chk_holder,false];
																							
																						  }else{
																						         _chk_holder pushBack [_chk_pos,_chk_arr];
																								 CPORT setVariable[CNAME(enemy_groups),_chk_holder,false];
																						       };
														                               };
													    case ((count _chk_holder) > 0 && (count _chk_holder) < 2):{
														                                                             _holder_arr = (_chk_holder select 0);
														                                                             _holder_pos = (_holder_arr select 0);
																													 _holder_in_arr = (_holder_arr select 1);
														                                                             _holder_posx = (_holder_pos select 0);
																													 _holder_posy = (_holder_pos select 1);
																													 
																													 If(_x_koord == _holder_posx && _y_koord == _holder_posy)then
																													 {
																													   _holder_in_arr append _chk_arr;
																													   
																													   CPORT setVariable[CNAME(enemy_groups),[[_holder_pos,_holder_in_arr]],false];
																													   
																													 }else{
																													        _chk_holder pushBack [_chk_pos,_chk_arr];
																															CPORT setVariable[CNAME(enemy_groups),_chk_holder,false];
																													      };
														
														                                                          };				    
													  };
											        };
						                    };
					     case "VEHICLE_STORE":{
						                         If(isNil {CPORT getVariable CNAME(all_vehicles)})then
											     {
											       CPORT setVariable[CNAME(all_vehicles),[[_chk_pos,_chk_arr]],false];											   
											     }else{
												         _chk_holder = (CPORT getVariable CNAME(all_vehicles));
														 switch(true)do
														 {
														   case (count _chk_holder > 1):{
																						   for "_i" from 0 to ((count _chk_holder) - 1) do
																						   {
																						    _holder_arr = (_chk_holder select _i);
																							_holder_pos = (_holder_arr select 0);
																						    _holder_posx = (_holder_pos select 0);
																							_holder_posy = (_holder_pos select 1);
																							If(_x_koord == _holder_posx && _y_koord == _holder_posy)then
																							{
																							  _arr_counter = _i; _search_hit = true;
																							};
																						   sleep 0.04;
																						   };
														                                  
																						   If(_search_hit)then
																						   {
																						    _holder_arr = (_chk_holder select _arr_counter);
																							_holder_pos = (_holder_arr select 0);
																						    _holder_in_arr = (_holder_arr select 1);
																							
																							_holder_in_arr append _chk_arr;
																							
																							_chk_holder set [_arr_counter,[_holder_pos,_holder_in_arr]];
																							CPORT setVariable[CNAME(all_vehicles),_chk_holder,false];
																							
																						   }else{
																						         _chk_holder pushBack [_chk_pos,_chk_arr];
																								 CPORT setVariable[CNAME(all_vehicles),_chk_holder,false];
																						        };
														 
														                                };
														   case ((count _chk_holder) > 0 && (count _chk_holder) < 2):{
																														_holder_arr = (_chk_holder select 0);
																														_holder_pos = (_holder_arr select 0);
																														_holder_in_arr = (_holder_arr select 1);
																														_holder_posx = (_holder_pos select 0);
																														_holder_posy = (_holder_pos select 1);
																													 
																														If(_x_koord == _holder_posx && _y_koord == _holder_posy)then
																														{
																														
																														  _holder_in_arr append _chk_arr;
																															
																														  CPORT setVariable[CNAME(all_vehicles),[[_holder_pos,_holder_in_arr]],false];
																													   
																														}else{
																																_chk_holder pushBack [_chk_pos,_chk_arr];
																																CPORT setVariable[CNAME(all_vehicles),_chk_holder,false];
																															 };
														                                    
																							                         };
														 };
												 
												      }; 
					                          };
					     case "MORTAR_STORE":{
						                        If(isNil {CPORT getVariable CNAME(all_mortars)})then
												{
												  CPORT setVariable[CNAME(all_mortars),_chk_arr,false];
												}else{
												       _holder_arr = (CPORT getVariable CNAME(all_mortars));
													   
                                                       _holder_in_arr append _chk_arr;
													   
													   CPORT setVariable[CNAME(all_mortars),_holder_arr,false];
												     };
                                             };
						 case "ARI_STORE":{
											 If(isNil {CPORT getVariable CNAME(artillery_vecs)})then
											 {
												CPORT setVariable[CNAME(artillery_vecs),_chk_arr,false];
											 }else{
												    _holder_arr = (CPORT getVariable CNAME(artillery_vecs));
													
                                                    _holder_in_arr append _chk_arr;
													
													CPORT setVariable[CNAME(artillery_vecs),_holder_arr,false];
												  };
						 
                                          };
                       };
					   CPORT setVariable [CNAME(delete_allowed),true,false];
                       true
