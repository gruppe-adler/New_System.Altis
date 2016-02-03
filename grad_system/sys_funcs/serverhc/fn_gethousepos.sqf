If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                  private ["_search_house","_search_pos_idx","_sort_positions","_tolerance","_house_positions"];

				  _search_house = _this select 0;
				  _search_pos_idx = _this select 1;
				  				  
				  _sort_positions = [];
				  _tolerance = 0;
				  
				  _house_positions = [_search_house] call SFUNC(inhousepos);
				  
                  If(count _house_positions > 0)then
				  {
				    switch(_search_pos_idx)do
					{
				      case "HOUSE_TOP":{
										 {
					                       If((floor (_x select 2)) > _tolerance)then{_tolerance = (floor (_x select 2))};
					                     }forEach _house_positions;
										 
										 { 
										   If((_x select 2) >= _tolerance)then{_sort_positions = _sort_positions + [_x];};
										 }forEach _house_positions;
					                   };
					  case "HOUSE":{_sort_positions = _house_positions;};
					  case "MIXED":{_sort_positions = _house_positions;};
				    };
                   };
				  
                  _sort_positions