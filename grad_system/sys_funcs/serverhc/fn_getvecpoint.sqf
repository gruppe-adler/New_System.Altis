If(hasInterface)exitWith {};
include "ga_macro.hpp"



                        private ["_pos","_radius","_choice_idx","_output_arr","_dir","_searched_pos","_counter","_dir_pos"];
                        _pos = _this select 0;
						_radius = _this select 1;
						_choice_idx = if(count _this > 2)then{1}else{0};
						_dir_pos = If(count _this > 2)then{_this select 2}else{[]};
						_output_arr = [];
						_searched_pos = [];
						_dir = 0;
						_counter = 0;
						
						_searched_pos = [_pos,_radius,"NORMAL"] call SFUNC(pointincirclebig);
                        while{count _searched_pos == 0 && _counter < 100}do
						{
						  _searched_pos = [_pos,_radius,"NORMAL"] call SFUNC(pointincirclebig);
						  _counter = _counter + 1;
						  sleep 0.04;						
						};
						If(count _searched_pos > 0)then
						{
						   switch(_choice_idx)do
						   {
						     case 0:{_output_arr = [_searched_pos,(random 360)];};
						     case 1:{
							          _dir = [_searched_pos,_dir_pos] call IFUNC(dirTo); 
						              _output_arr = [_searched_pos,_dir];
									};
						   };
						   											
						};
						_output_arr