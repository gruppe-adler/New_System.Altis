If(hasInterface)exitWith {};

// returns the number of human players currently playing a mission in MP
//
// _number = [] call FWM_fn_humancounter;


private ["_count"];

_count = (playersNumber east + playersNumber west + playersNumber resistance + playersNumber civilian);
_count