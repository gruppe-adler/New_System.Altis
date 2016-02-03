If(hasInterface)exitWith {};
#include "ga_macro.hpp"

//Find a Safe Position in relation to Target Point with a specific Degrees


private ["_target_point","_target_radius","_degree","_tolerance","_output_arr","_search_point","_safe_pos","_co"];

_target_point = _this select 0;
_target_radius = _this select 1;
_degree = _this select 2;
_tolerance = _this select 3;
							  
_output_arr = [];
							  
_search_point = [_target_point,(_target_radius + _tolerance),_degree] call IFUNC(relPos);
							  
If(count _search_point > 0)then
{
 _safe_pos = [_search_point,1,_tolerance,3,0,50,0] call IFUNC(findSafePos);
 _co = 0;
 while{count _safe_pos == 0 && _co < 10}do
 {
  _safe_pos = [_search_point,1,_tolerance,3,0,50,0] call IFUNC(findSafePos);
  _co = _co + 1;
  sleep 0.04;
 };

 If(count _safe_pos > 0)then{_output_arr = _safe_pos;};
};
_output_arr