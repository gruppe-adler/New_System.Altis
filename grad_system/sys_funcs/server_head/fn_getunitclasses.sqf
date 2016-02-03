If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                      private ["_grp_choice","_units_in_grp","_location_idx","_output_arr","_choice_arr","_mixed_arr","_grp_build"];
 
                      _grp_choice = _this select 0;
					  _units_in_grp = _this select 1;
					  _location_idx = _this select 2;
					  
					  _output_arr = [];
					  _choice_arr = [];
					  _mixed_arr = [];
					  
					  
					  If(_grp_choice == "SNIPER_UNITS" && _location_idx == "AREA")then{_grp_choice = "MIXED_UNITS";};
					  
                      switch(_grp_choice)do
					  {
					    case "NORMAL_UNITS":{
						                      If(count NORMAL_UNIT_CLASSES < 1)then{_choice_arr = SPECIAL_UNIT_CLASSES;}else{_choice_arr = NORMAL_UNIT_CLASSES;};
											  
											  for "_grp_build" from 1 to _units_in_grp do
											  {
											   _unit_type = _choice_arr call SFUNC(randomselect);
											   _output_arr = _output_arr + [_unit_type];   
											   sleep 0.04
						                      };
					                        };
						case "SPECIAL_UNITS":{
						                       If(count SPECIAL_UNIT_CLASSES < 1)then{_choice_arr = NORMAL_UNIT_CLASSES;}else{_choice_arr = SPECIAL_UNIT_CLASSES;};
											   
											   for "_grp_build" from 1 to _units_in_grp do
											   {
											    _unit_type = _choice_arr call SFUNC(randomselect);
											    _output_arr = _output_arr + [_unit_type];   
											    sleep 0.04
						                       };
						                     };
						case "SNIPER_UNITS":{
						                       If(count SNIPER_UNIT_CLASSES > 0)then{_choice_arr = SNIPER_UNIT_CLASSES;}else
											   {
											     switch(true)do
												 {
						                           case (count NORMAL_UNIT_CLASSES > 0 && count SPECIAL_UNIT_CLASSES < 1):{_choice_arr = NORMAL_UNIT_CLASSES;};
												   case (count NORMAL_UNIT_CLASSES < 1 && count SPECIAL_UNIT_CLASSES > 0):{_choice_arr = SPECIAL_UNIT_CLASSES;};
												   case (count NORMAL_UNIT_CLASSES > 0 && count SPECIAL_UNIT_CLASSES > 0):{_choice_arr = SPECIAL_UNIT_CLASSES;};
						                         };
												for "_grp_build" from 1 to _units_in_grp do
											    {
											     _unit_type = _choice_arr call SFUNC(randomselect);
											     _output_arr = _output_arr + [_unit_type];   
											     sleep 0.04
						                        }; 
												
						                       };
					                        };
					    case "MIXED_UNITS":{
						                      If(count NORMAL_UNIT_CLASSES > 0)then{_mixed_arr = _mixed_arr + NORMAL_UNIT_CLASSES;};
											  If(count SPECIAL_UNIT_CLASSES > 0)then{_mixed_arr = _mixed_arr + SPECIAL_UNIT_CLASSES;};
											  If(count SNIPER_UNIT_CLASSES > 0)then{_mixed_arr = _mixed_arr + SNIPER_UNIT_CLASSES;};
											  
											  _choice_arr = _mixed_arr call IFUNC(arrayShuffle);
											  
											  for "_grp_build" from 1 to _units_in_grp do
											  {
											    _unit_type = _choice_arr call SFUNC(randomselect);
											    _output_arr = _output_arr + [_unit_type];   
											    sleep 0.04
						                      }; 
											  
						                   };
                      };
					  _output_arr