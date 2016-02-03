If(hasInterface)exitWith {};
#include "ga_macro.hpp"



                        private ["_target_area","_second_area","_radius","_tolerance","_output_arr","_dir_co","_direction","_resp_pos"];
						_target_area = _this select 0;
                        _second_area = _this select 1;
                        _radius = _this select 2;
						_tolerance = _this select 3;
						
						_output_arr = [];
						_dir_co = 0;
						
						_direction = [_target_area,_second_area] call IFUNC(dirTo);
						_resp_pos = [_target_area,_radius,_direction,_tolerance] call SFUNC(bordersafepos);
						 while{count _resp_pos == 0 && _dir_co < 359}do
						 {
						   _direction = _direction + 1;
						   If(_direction > 360)then{_direction = _direction - 360;};
						   _resp_pos = [_target_area,_radius,_direction,_tolerance] call SFUNC(bordersafepos);
						   _dir_co = _dir_co + 1;
						   sleep 0.04;
						 };
						 If(count _resp_pos > 0)then
						 { 
						   _output_arr = _resp_pos;
						 };
						 _output_arr