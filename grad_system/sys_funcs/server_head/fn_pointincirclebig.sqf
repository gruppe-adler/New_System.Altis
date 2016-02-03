If(hasInterface)exitWith {};
include "ga_macro.hpp"
					
// get a random point inside a circle for bigger objects
// parameters: "SMALL" = 10m radius, "Normal" = 20m radius, "BIG" = 30m radius, "RBIG" = 50m radius 
// center position, radius of the circle
// example: _random_point = [position trigger1, 200, "NORMAL"] call FWM_fn_pointincirclebig;


	private ["_center","_radius","_size","_ret_val","_dist","_co","_angle","_point","_water","_nobs","_slope",
	         "_new_dist","_allow_new_dist","_border"];
	_center = _this select 0;
	_radius = _this select 1;
	_size = If((_this select 2) == "")then{"SPECIAL"}else{_this select 2};
	_new_dist = if(count _this > 3)then{_this select 3}else{5};
	_allow_new_dist = if(count _this > 3)then{true}else{false};
	_ret_val = [];
	_border = false;
	_point = [];
	_dist = 0;
	_co = 0;
        switch (_size) do { case "SMALL":{_dist = 10;};
                            case "NORMAL":{_dist = 20;};
                            case "BIG":{_dist = 30;};
                            case "RBIG":{_dist = 50;};
                            case "MBIG" :{_dist = 100;};
							case "SPECIAL":{_border = true;};
                          };
         if(_allow_new_dist)then{_dist = _new_dist;};						  

         while {count _ret_val == 0 && _co < 50} do 
		 {
		   _angle = floor (random 360);
		   If(_border)then
		   {
		     _point = [_center, _radius,_angle] call IFUNC(relPos);
		   }else{_point = [_center,(round (random _radius)),_angle] call IFUNC(relPos);};
		   _water = [_point] call SFUNC(watercheck);
		   if (!_water)then 
		   { 
             _nobs = nearestObjects [_point,["Static","House","Tank","Car","StaticWeapon","Truck_F"],_dist];
			 _streets = _point nearRoads _dist;
			 _nobs = _nobs + _streets;
             if(count _nobs == 0)then
			 {
			   _slope = [_point, 5] call SFUNC(slopecheck);
			   if(_slope < 0.5)then 
			   {
				_ret_val = _point;
			   };
			 };
				
		   };
		   
		   if(count _ret_val == 0)then
		   {
			 _co = _co + 1;
			 sleep .01;
		   };
	    };
_ret_val