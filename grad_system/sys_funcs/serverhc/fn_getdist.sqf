If(hasInterface)exitWith {};



				private ["_pos1","_pos2","_dist","_dist_is"];
				
				_pos1 = _this select 0;
				_pos2 = _this select 1;
				_dist = 0;
				_dist_is = 0;
				
				_dist = _pos1 distance _pos2;
				if(_dist > 0)then{_dist_is = _dist;};
				_dist_is