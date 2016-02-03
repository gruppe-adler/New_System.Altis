if(!local player) exitwith {};
private ["_counter"];
_counter = 0;



CAP = false;

player allowDamage false; 

0 = player addAction [(format ['<t color=''#ff4500''>Bewege %1</t>',(name player)]),"BUG\Debaction.sqf",(0),8,false,true,"","_this == player"];
1 = player addAction ['<t color=''#fddd00''>Koordinaten anfordern</t>',"BUG\Debaction.sqf",(1),8,false,true,"","_this == player"];
2 = player addAction ['<t color=''#ff45f0''>Starte Script</t>',"BUG\Debaction.sqf",(2),8,false,true,"","_this == player"];
3 = player addAction ['<t color=''#f000ff00''>SetCaptive an/aus</t>',"BUG\Debaction.sqf",(3),8,false,true,"","_this == player"];
4 = player addAction ['<t color=''#f00dffff''>Beende bewegen</t>',"BUG\Debaction.sqf",(4),8,false,true,"","_this == player"];
//(format ['<t color=''#f000ff00''>SetCaptive %1</t>',(CAP)])
/*
5 = player addAction ['<t color=''#ff4500''>' + (localize "STR_COA_Connect_mobile") + '</t>',"Debaction.sqf",(1),8,false,true,"","_this == player"];
*/
player addWeapon "Rangefinder"; 
player addAction["Get Class", "BUG\getClass.sqf"];

//'<t color=''#ff4500''>(format ["Bewege %1",(name player)])</t>'
/*
while{_counter < 11}do
{
  hintSilent format ["Initialize:\n%1",_counter];
  _counter = _counter + 1;
  sleep 1;
};

player setCaptive true;
player allowDamage false;
hint format ["SetCaptive: %1\n READY!",(captive player)];
*/