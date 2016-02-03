If(hasInterface)exitWith {};




//Checks the Existence of all living and not damaged Units,Vehicles and StaticWeapons 
//_enemy = [Position for Detecting, specific Radius, Side] call FWM_fn_enemiecheck;
//_enemy Output = Number


private ["_detect_point", "_detect_radius", "_det_faction", "_all_arr", "_counter","_counter2_arr"];
				 
_detect_point = _this select 0;
_detect_radius = _this select 1;
_det_faction = _this select 2;
_detect_all = if(count _this > 3)then{_this select 3}else{false};
				 
_all_arr = [];
_counter_arr = [];
_counter2_arr = [];
_counter = 0;
				 
_all_arr = nearestObjects [_detect_point, ["Man", "Car", "Tank", "Truck", "StaticWeapon"], _detect_radius];
sleep 0.05;
If(_detect_all)then{{if(side _x == _det_faction)then {_counter_arr set [(count _counter_arr),_x];};} foreach _all_arr;}else{
{if (alive _x && damage _x <= 0.9) then {_counter2_arr set [(count _counter2_arr),_x];};} foreach _all_arr;
{if (side _x == _det_faction) then {_counter_arr set [(count _counter_arr),_x];};} foreach _all_arr;};
sleep 0.05;
_counter = count _counter_arr;
_counter