
waituntil {!isnil "bis_fnc_init"};
private ["_i"];

FRY_INIT = false;


If(isServer)then {FRY_INIT = true;} else { If(isNull player)then{[] spawn {waitUntil {!isNull player}; FRY_INIT = true;};}else{FRY_INIT = true;};};

waitUntil {FRY_INIT};

/*

//Grab parameters and put them into readable variables
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do
{
	call compile format 
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};


//fry_comp_scripts = [] execVM "fry_system\fry_sys_fnc\fry_compile_scripts.sqf";

*/

call compileFinal preprocessFileLineNumbers "test_function.sqf";

execVM "BUG\init_bug.sqf"; //entfernen
DEBUG = true; //entfernen


setTerrainGrid 50; // entfernen
setviewdistance 2500; //entfernen