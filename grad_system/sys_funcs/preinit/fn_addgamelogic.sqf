If(!isDedicated) exitWith {}:
#include "ga_macro.hpp"

private ["_center","_group"];

if (isNil "CPORT") then 
{

	_center = createCenter sideLogic;
	_group = createGroup _center;
	CPORT = _group createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"];
	publicVariable "CPORT";

};