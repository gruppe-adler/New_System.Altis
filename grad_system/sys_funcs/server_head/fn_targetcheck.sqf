If(hasInterface)exitWith {};



                 private ["_pos", "_radius", "_class_name", "_class_counter", "_class_arr", "_counter",
			              "_check_crew","_check_arr"];
			     _pos = _this select 0;
			     _radius = _this select 1;
			     _class_name = _this select 2;
			     _check_crew = If(count _this > 3)then{_this select 3}else{false};
			   
			   
			     _class_arr = [];
			     _check_arr = [];
			     _counter = 0;
			     _class_counter = nearestObjects [_pos, [_class_name], _radius];
			     sleep 0.05;
			     {if(alive _x)then{_class_arr set [(count _class_arr),_x];};} foreach _class_counter;
			     If(_check_crew)then{{if((count (crew _x)) > 0)then{_check_arr set [(count _check_arr),_x];};} foreach _class_arr;
			                          _counter = count _check_arr;
								    }else{_counter = count _class_arr;};
			     sleep 0.05;
			     _counter