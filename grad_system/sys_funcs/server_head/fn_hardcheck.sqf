If(hasInterface)exitWith {};




private ["_point","_dist","_hard_obj","_output"];
_point = _this select 0;
_dist = _this select 1;
				
_hard_obj = nearestObjects [_point,["Static","house","Tank","Car","StaticWeapon"],_dist];
_output = (count _hard_obj);
_output