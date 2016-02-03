If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                       private ["_street_block","_choice_idx","_to_pos","_output_arr","_dir"];
                       _street_block = _this select 0;
					   _choice_idx = _this select 1;
					   _to_pos = if(count _this > 2)then{_this select 2;};
					   _output_arr = [];
					   _next_street = [];
					   _dir = 0;
					   
					   switch(_choice_idx)do
					   {
					     case 0:{
						          _next_street = roadsConnectedTo _street_block;
								  If(count _next_street > 0)then
								  {
								    _dir = [(position _street_block),(position (_next_street select 0))] call IFUNC(dirTo);
								  }else{_dir = (random 360);};
						          _output_arr = [(position _street_block),_dir];						 
						        };
					     case 1:{
						          _dir = [(position _street_block),_to_pos] call IFUNC(dirTo);  
						          _output_arr = [(position _street_block),_dir];
						        };				   
					   };
					   _output_arr