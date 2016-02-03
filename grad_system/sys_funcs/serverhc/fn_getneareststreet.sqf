If(hasInterface)exitWith {};



                             private ["_streets_arr","_found_pos","_street_block","_old_distance","_distance"];
                             _streets_arr = _this select 0;
							 _found_pos = _this select 1;
							 _street_block = "";
							 _old_distance = 300;
							 _distance = 0;
							 
							 {
							   _distance = (getPos _x) distance _found_pos;
							   If(_distance < _old_distance)then
							   {
							     _old_distance = _distance;
								 _street_block = _x;
							   };
							 }forEach _streets_arr;
                             _street_block