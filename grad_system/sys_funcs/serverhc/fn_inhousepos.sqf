If(hasInterface)exitWith {};
include "ga_macro.hpp"


                         private ["_house","_output_house_pos"];
						 
						 _house = _this select 0;
                         _output_house_pos = [];
						 
                         If(damage _house < 0.4)then
						 {
						   	_output_house_pos = [_house] call IFUNC(buildingPositions);					   
                         };
						 _output_house_pos