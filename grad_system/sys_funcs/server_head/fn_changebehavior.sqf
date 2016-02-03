If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                          private ["_target_pos","_behavior_mode","_combat_mode","_selected_arr","_holder_arr","_hit","_i","_selected",
						           "_pos","_x"];
						  _target_pos = _this select 0;
						  _behavior_mode = _this select 1;
                          _combat_mode = _this select 2;
						  
						  _selected_arr = [];
						  
						  If(count (CPORT getVariable CNAME(enemy_groups)) > 0)then
						  {
						    _holder_arr = (CPORT getVariable CNAME(enemy_groups));
							_hit = true;
							for "_i" from 0 to ((count _holder_arr) - 1) do
						    {
							  _selected = (_holder_arr select _i);
							  _pos = (_selected select 0);
							  If((_target_pos select 0) == (_pos select 0) && (_target_pos select 1) == (_pos select 1) && _hit)then
							  {
							    _selected_arr = (_selected select 1);
								_hit = false;
							  };
							 sleep 0.04;
                            };
							If(count _selected_arr > 0)then
							{
							 {
							  If(!isNull _x)then
							  { 
							    _x setBehaviour _behavior_mode;
							    _x setCombatMode _combat_mode;               
							  };
							  sleep 0.04;
							 }forEach _selected_arr;						  
							};
                          };
					      true