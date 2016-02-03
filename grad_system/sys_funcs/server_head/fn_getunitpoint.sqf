If(hasInterface)exitWith {};
include "ga_macro.hpp"



                         private ["_spawn_pos_unit","_spawn_radius","_spawn_idx","_output_pos","_ctr"];
					 
						 _spawn_pos_unit = _this select 0;
						 _spawn_radius = _this select 1;
						 _spawn_idx = _this select 2;
						 
						 _output_pos = [];
						 _ctr = 0;
						 
						 switch(_spawn_idx)do
						 {
						   case 0:{
						            _output_pos = [_spawn_pos_unit,_spawn_radius] call SFUNC(pointincircle);
									
									while{count _output_pos == 0 && _ctr < 100} do
									{
									  _output_pos = [_spawn_pos_unit,_spawn_radius] call SFUNC(pointincircle);
									  _ctr = _ctr + 1;
									  sleep 0.04;
						            };
						          };
						   case 1:{
						            _output_pos = [_spawn_pos_unit,_spawn_radius] call SFUNC(circleborderpoint);
									
									while{count _output_pos == 0}do
									{
                                      _output_pos = [_spawn_pos_unit,_spawn_radius] call SFUNC(circleborderpoint);
									  sleep 0.04;
									};
                                  };
                         };
						 _output_pos