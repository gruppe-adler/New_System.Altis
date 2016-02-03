If(hasInterface)exitWith {};
include "ga_macro.hpp"

//Checks for Houses at a Point with specific Range and can list all Houses
//Description: _houses = [Position, Radius, to list all Houses] call FWM_fn_housecheck;
//Example(list Houses):_houses = [position player, 200, true] FWM_fn_housecheck;
//for Count Houses :  _houses = [position player, 200] call FWM_fn_housecheck; 
//_houses can be NUMBER or ARRAY


                    private ["_detect_house_point", "_detect_house_dist", "_list_house" ,"_houses_arr", "_good_houses_arr", "_house_positions", "_house_counter"];
					
					_detect_house_point = _this select 0;
					_detect_house_dist = _this select 1;
					_list_house = if(count _this > 2)then {_this select 2}else{false};
					
					_houses_arr = [];
					_good_houses_arr = [];
					_house_positions = [];
					_house_counter = 0;
					
					_houses_arr = nearestObjects [_detect_house_point, ["house"], _detect_house_dist];
					sleep 0.05;
					
					 {
					  _house_positions = [_x] call SFUNC(inhousepos);
					  if((damage _x) < 0.4 && count _house_positions > 0)then {_good_houses_arr pushBack _x;};
					 } foreach _houses_arr;
					 sleep 0.05;
					 if(_list_house)then{if(count _good_houses_arr > 0)then{_house_counter = _good_houses_arr}else{_house_counter = [];};} 
					 else {_house_counter = count _good_houses_arr;};
					 
					
					_house_counter