If(!isDedicated) exitWith {}:

private ["_center","_group"];

if (isNil "FWM_COMPORT") then 
{

	_center = createCenter sideLogic;
	_group = createGroup _center;
	FWM_COMPORT = _group createUnit ["LOGIC", [0, 0, 0], [], 0, "NONE"];
	publicVariable "FWM_COMPORT";

};