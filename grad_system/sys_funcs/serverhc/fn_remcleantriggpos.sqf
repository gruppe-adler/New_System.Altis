If(!isDedicated)exitWith {};
#include "ga_macro.hpp"

                         private ["_pos_arr","_x_koord","_y_koord","_holder","_hit_counter","_a_hit","_del","_search_arr"];
                         _pos_arr = _this;
						 
						 waitUntil{CPORT getVariable CNAME(del_deltrigg_allowed)};
						 CPORT setVariable [CNAME(add_deltrigg_allowed),false,false];
						 
						 _x_koord = (_pos_arr select 0);
						 _y_koord = (_pos_arr select 1);
						 _holder = (CPORT getVariable CNAME(pos_store_tridel));
						 
						 switch(true)do
						 {
						   case (count _holder > 0 && count _holder < 2):{ 
						   						   						   If(_x_koord == ((_holder select 0) select 0) && _y_koord == ((_holder select 0) select 1))then
                                                                           {
																			 CPORT setVariable [CNAME(pos_store_tridel),[],false];
                                                                           };																		   
						                                                 };
					       case (count _holder > 1):{
						                              _hit_counter = 0;
													  _a_hit = true;
													  
													  for "_del" from 0 to ((count _holder) - 1) do
													  {
													    _search_arr = (_holder select _del);
														
														If(_x_koord == (_search_arr select 0) && _y_koord == (_search_arr select 1) && _a_hit)then
														{
														  _hit_counter = _del;
														  _a_hit = false;
														};
													   sleep 0.04;
						                              };
						                              If(!_a_hit)then
													  {
													    _holder set [_hit_counter,(_hit_counter * -1)];
														_holder = _holder - [(_hit_counter * -1)];
													    CPORT setVariable [CNAME(pos_store_tridel),_holder,false];
													  };
						                            };
						 };
                         CPORT setVariable [CNAME(add_deltrigg_allowed),true,false];
                         true