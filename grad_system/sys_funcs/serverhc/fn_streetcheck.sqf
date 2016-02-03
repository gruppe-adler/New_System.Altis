If(hasInterface)exitWith {};



//checks for Streets in a spezific Range
//_street = [position Trigger, Radius,(Optional true/false)] call FWM_fn_streetcheck;
//for List(Array with streets): _street = [position Trigger, Radius,true] call FWM_fn_streetcheck;
//Output = Array/Number	



                      private ["_detect_street_point", "_detect_street_dist", "_streets_arr", "_streets_counter"];
					  
					  _detect_street_point = _this select 0;
					  _detect_street_dist = _this select 1;
					  _list_streets = if(count _this > 2) then {_this select 2}else{false};
					  _streets_arr = [];
					  _streets_counter = 0;
					  
					  _streets_arr = _detect_street_point nearRoads _detect_street_dist;
					  if(_list_streets) then {if(count _streets_arr > 0)then{_streets_counter = _streets_arr;}else{_streets_counter = [];};}else{_streets_counter = count _streets_arr;};
					  _streets_counter