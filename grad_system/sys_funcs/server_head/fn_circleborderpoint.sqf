If(hasInterface)exitWith {};
#include "ga_macro.hpp"


// get a random point at the borders of a circle
// parameters:
// center position, radius of the circle
// example: _random_point = [position trigger1, 200] call FWM_fn_circleborderpoint;


	private ["_center","_radius","_ret_val","_co","_angle","_point","_water","_hard_objs","_slope"];
	_center = _this select 0;
	_radius = _this select 1;
	_ret_val = [];
	_co = 0;
	while {count _ret_val == 0 && _co < 50} do 
	{
		_angle = floor (random 360);
		_point = [_center,_radius,_angle] call IFUNC(relPos);
		_water = [_point] call SFUNC(watercheck);
		_hard_objs = [_point,10] call SFUNC(hardcheck);
		if(!_water && _hard_objs == 0)then
		{
		  _slope = [_point, 5] call SFUNC(slopecheck);
		  if(_slope < 0.5)then 
		  {
			_ret_val = _point;
		  };			
		};
		if (count _ret_val == 0) then {
			_co = _co + 1;
			sleep .01;
		};
	};
	_ret_val