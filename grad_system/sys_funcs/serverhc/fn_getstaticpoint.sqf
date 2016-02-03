If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                           private ["_spawn_point","_spawn_dir","_spawn_idx","_look_point","_dir","_sp_pos","_output_arr","_counter"];
                           _spawn_point = _this select 0;
						   _spawn_dir = _this select 1;
						   _spawn_idx = If(count _this > 3)then{_this select 3}else{0};						   
                           _dir = 0;
						   _sp_pos = [];
						   _output_arr = [];
                           _counter = 0;
						   
						   switch(_spawn_idx)do
						   {
						     case 0:{
							          _sp_pos = [_spawn_point,_spawn_dir,"NORMAL",5] call SFUNC(pointincirclebig);
							          while{count _sp_pos == 0 && _counter < 100}do
									  {
									    _sp_pos = [_spawn_point,_spawn_dir,"NORMAL",5] call SFUNC(pointincirclebig);
									    _counter = _counter + 1;
										sleep 0.04;
									  };
									  If(count _sp_pos > 0)then
									  {
									    _dir = (random 360);
									    _output_arr = [_sp_pos,_dir];
									  }else{_output_arr = [[],0];};
									 
						            };
							 case 1:{
							          _sp_pos = [_spawn_point,_spawn_dir,"SPECIAL",5] call SFUNC(pointincirclebig);
							          while{count _sp_pos == 0 && _counter < 100}do
									  {
									    _sp_pos = [_spawn_point,_spawn_dir,"SPECIAL",5] SFUNC(pointincirclebig);
									    _counter = _counter + 1;
										sleep 0.04;
									  };
									  If(count _sp_pos > 0)then
									  {
									    _dir = [_spawn_point,_sp_pos] call IFUNC(dirTo);
									    _output_arr = [_sp_pos,_dir];
									  }else{_output_arr = [[],0];};						   
						            };
                           };
						   _output_arr