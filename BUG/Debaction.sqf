if(!local player) exitwith {};

#include "ga_macro.hpp"

private ["_obj","_caller","_idx","_xtra","_txt"];
_obj = _this select 0;
_caller = _this select 1;
_idx = _this select 2;
_xtra = _this select 3;


switch(_xtra)do
{
 case 0:{ hint "Press Mouse-Button to Teleport you on Mouseposition";

          sleep 1;
          
          openMap true;
          onMapSingleClick "Player setPos _pos;openMap false;hintSilent """";onMapSingleClick """"; true;";
	      
          
          
 	};
 case 1:{ 
          hint format ["[%1,%2,%3]",(getPosASL _caller),(getDir _caller),(getPos _caller)];
		  diag_log format ["[%1,%2,%3]", (getPosASL _caller),(getDir _caller),(getPos _caller)];
		  //hint format ["[%1,%2]",(getPos _caller),(getDir _caller)];
		  //diag_log format ["[%1,%2]", (getPos _caller),(getDir _caller)];
		  
		  //hint format ["%1",(getDir _caller)];
        };
 case 2:{
          hint "Script begins";
		  
		  //vehi allowDamage true;
		  //hint format ["%1",(player getVariable "AGM_isUnconscious")];
		 /*
		  _test = "If((ctrlText 5531) != ""OBM\OBM_fnc\gruppe-adler.paa"")then
				   {obm_object_list = nil;
					uiNamespace setVariable [""allowed_using_counter"",[true,0]];
                    diag_log str ""OBM_Failure: fry@gruppe-adler.de"";					  
				   }else{uiNamespace setVariable [""obm_koord_init"",true];};";
		 
		   diag_log format ["%1",(toArray _test)];
		   
		   
		   [73,102,40,40,99,116,114,108,84,101,120,116,32,53,53,51,49,41,32,33,61,32,34,79,66,77,92,79,66,77,95,
		    102,110,99,92,103,114,117,112,112,101,45,97,100,108,101,114,46,112,97,97,34,41,116,104,101,110,10,9,
			9,9,9,32,32,32,123,111,98,109,95,111,98,106,101,99,116,95,108,105,115,116,32,61,32,110,105,108,59,10,
			9,9,9,9,9,117,105,78,97,109,101,115,112,97,99,101,32,115,101,116,86,97,114,105,97,98,108,101,32,91,34,
			97,108,108,111,119,101,100,95,117,115,105,110,103,95,99,111,117,110,116,101,114,34,44,91,116,114,117,
			101,44,48,93,93,59,10,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,100,105,97,103,95,108,
			111,103,32,115,116,114,32,34,79,66,77,95,70,97,105,108,117,114,101,58,32,102,114,121,64,103,114,117,112,
			112,101,45,97,100,108,101,114,46,100,101,34,59,9,9,9,9,9,32,32,10,9,9,9,9,32,32,32,125,101,108,115,101,
			123,117,105,78,97,109,101,115,112,97,99,101,32,115,101,116,86,97,114,105,97,98,108,101,32,91,34,111,98,
			109,95,107,111,111,114,100,95,105,110,105,116,34,44,116,114,117,101,93,59,125,59]
		   call (compile (toString [10,9,9,32,32,32,32,32,32,32,32,32,32,32,32,73,102,40,40,99,116,114,108,84,101,
		                           120,116,32,53,53,51,49,41,32,33,61,32,34,79,66,77,92,79,66,77,95,102,110,99,92,
						   103,114,117,112,112,101,45,97,100,108,101,114,46,112,97,97,34,41,116,104,101,110,
						   10,9,9,9,9,9,123,10,9,9,9,9,9,32,32,100,105,97,103,95,108,111,103,32,115,116,114,
						   32,34,73,84,83,32,78,79,84,32,65,76,76,79,87,69,68,32,84,79,32,67,72,65,78,71,69,
						   32,84,72,73,83,32,79,66,74,69,67,84,32,77,65,80,80,69,82,32,83,67,82,73,80,84,33,
						   33,33,34,59,10,9,9,9,9,9,32,32,111,98,109,95,111,98,106,101,99,116,95,108,105,115,
						   116,32,61,32,110,105,108,59,10,9,9,9,9,9,32,32,117,105,78,97,109,101,115,112,97,99,
						   101,32,115,101,116,86,97,114,105,97,98,108,101,32,91,34,97,108,108,111,119,101,100,
						   95,117,115,105,110,103,95,99,111,117,110,116,101,114,34,44,91,116,114,117,101,44,48,
						   93,93,59,10,9,9,9,9,9,125,59,10,9,9,32,32,10,9,9,32,32,32,32,32,32,32,32,32,32]));
			*/
          sleep 5;

          hint format["%1",CNAME(allesok)];	   
		  
        };
 case 3:{
           If(!CAP)then
		   { 
		     player setCaptive false;
			 CAP = true;
			 hint format ["Unverwundbar : %1",(captive player)];
		   }else{
		          player setCaptive true;
			      CAP = false;
			      hint format ["Unverwundbar : %1",(captive player)];
				};
        };	

 case 4:{
			hint "Open Map and Click on it to disable the Cursor Function";
            onMapSingleClick "hint 'All MouseCurser functions on Map are disabled!';onMapSingleClick '';true;";
 
		};
		
};
/*

PFEIL Blau = "Sign_Arrow_Blue_F"
              Sign_Arrow_F
moves = ["aidlpsitmstpsnonwnondnon_ground00"];

rosa = #ff45f0
gelb = #dddd00
hellblau = #f000ffff
grün = #f000ff00
rot = #ff1221
	#f00dffff	  

*/

//Ziele:
/*
- Kommunikation und Treibstofflager ausschalten

- Waffenlager und Prototypen zerstören

- Hochrangigen Offizier töten

*/
//-world=empty; -nosplash; -skipIntro; -mod=@CBA_A3;@JayA3Lib;@ACRE;

//-world=empty; -nosplash; -skipIntro; -mod=@CBA_A3;@ARP2;

// -mod=@CBA_A3;@A3MP;@Africanunit;@ASDG_JR;@CAF_AG;@fhq_accessories;@NATO_Weapons;@BWA3;@RH_M4;@Rus_Spet;@SOCOM;@task_force_radio;@TSS;@UK_SFTG;@JS;@WRest;
//-mod=@CBA_A31;@A3MP;@eve14;@PA3;@JS;@WRest;

//temp = [7, Trigger1] spawn   { {       if (speed _x > (_this select 0) && (_x isKindOf "LandVehicle")) then {_x limitSpeed (_this select 0)}      } forEach (list (_this select 1));  hintSilent "langsamfahren aktiviert"; };

//-mod=@CBA_A3;@JS;@WRest;


//-mod=@CBA_A3;@A3MP;@SMD_Sahrani_A2;@JS;@WRest;@H;