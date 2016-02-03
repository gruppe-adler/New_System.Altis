If(hasInterface)exitWith {};
include "ga_macro.hpp"


                                private ["_pos","_radius","_vec_num","_pos_at_border","_dir","_counter_dir","_streets","_distance",
								         "_output_arr","_pos_holder"];
								_pos = _this select 0;
								_radius = _this select 1;
								_vec_num = _this select 2;
                                _pos_at_border = [];
								_dir = 0;
								_distance = 60;
								_counter_dir = 0;
								_streets = [];
								_pos_holder = [];
								_output_arr = [];
								
								_pos_at_border = [_pos,_radius,1] call SFUNC(getunitpoint);
								If(count _pos_at_border > 0)then
								{
								  _dir = [_pos,_pos_at_border] call IFUNC(dirTo);
								  _streets = [_pos_at_border,_distance,true] call SFUNC(streetcheck);
								  If(count _streets >= _vec_num)then{_pos_holder = _pos_at_border;};
								  while{(count _streets) < _vec_num  && _counter_dir < 359}do
								  {
								    _dir = _dir + 1;
									If(_dir > 360)then{_dir = _dir - 360;};
									_pos_holder = [_pos,_radius,_dir] call IFUNC(relPos);
								    _streets = [_pos_holder,_distance,true] call SFUNC(streetcheck);
									_counter_dir = _counter_dir + 1;
									sleep 0.04;
								  };
								  If(count _streets >= _vec_num)then
								  {
								    _output_arr = _pos_holder;
								  }else{
								         _output_arr = _pos_at_border;
								       };
								  
								};
                                _output_arr