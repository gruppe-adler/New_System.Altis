If(!isDedicated)exitWith {};
#include "ga_macro.hpp"



                    private ["_main_pos","_holder","_resp_pos_id","_counter","_searched_arr","_searched_pos","_hit","_i"];
					_main_pos = _this select 0;
					
					_holder = [];
					_resp_pos_id = [];
					

					If(count (CPORT getVariable CNAME(resp_pos_store)) > 0)then
					{
					  _holder = (CPORT getVariable CNAME(resp_pos_store));
					  switch(true)do
					  {
					   case (count _holder < 2):{
					                              _searched_arr = (_holder select 0);
												  _searched_pos = (_searched_arr select 0);
												  If((_searched_pos select 0) == (_main_pos select 0) && (_searched_pos select 1) == (_main_pos select 1))then
												  { 
												    (_searched_arr select 1) call IFUNC(removeRespawnPosition);
                                                    CPORT setVariable [CNAME(resp_pos_store),[],false];												
												  };
					                            };
					   case (count _holder > 1):{
												  _counter = 0;
												  _hit = true;
												  for "_i" from 0 to ((count _holder) - 1) do
												  {
												    _searched_arr = (_holder select _i);
													_searched_pos = (_searched_arr select 0);
												    If((_searched_pos select 0) == (_main_pos select 0) && (_searched_pos select 1) == (_main_pos select 1) && _hit)then
													{
													  (_searched_arr select 1) call IFUNC(removeRespawnPosition);
													  _counter = _i;
													  _hit = false;
													};
												  };
												  If(!_hit)then
												  {
					                                _holder set [_counter,(_counter * -1)];
													_holder = _holder - [(_counter * -1)];
												    CPORT setVariable [CNAME(resp_pos_store),_holder,false];
												  };
					                            };
					  };
					};
					true