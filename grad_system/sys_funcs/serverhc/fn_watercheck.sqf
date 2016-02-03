If(hasInterface)exitWith {};


//_iswater = [Position] call FMW_fn_watercheck;
//Output = Boolean


private ["_x_k", "_y_k", "_z_k","_is_water"];

_pos = _this select 0;
_x_k = _pos select 0;
_y_k = _pos select 1;
_z_k = _pos select 2;
_is_water = 0;
					
If(!(surfaceiswater [_x_k,_y_k]))then {_is_water = false;}else{_is_water = true;};
_is_water