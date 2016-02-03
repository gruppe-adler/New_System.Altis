If(hasInterface)exitWith {};
#include "ga_macro.hpp"


If(count STATIC_WEAPON_CLASSES == 0) exitWith {diag_log str "GRAD_SYSTEM: Check Static Weapon Class Definition - No STATIC_WEAPON_Classes available";};

private ["_spawn_pos","_spawn_radius","_num_statics","_static_choice","_location_idx","_behaviour_idx","_combat_mode_idx","_parents_arr",
         "_chk_string_aa","_chk_string_at","_static_weapon","_is_allowed","_look_pos","_static_pos_dir","_new_types_arr","_mortar_arr","_static_arr",
		 "_grp_arr","_stat_grp","_stat_type","_static_vec","_allow_spawn","_more_types","_mortar","_extra_pos","_main_pos","_chk_type1",
		 "_chk_type2","_output_arr"];

_spawn_pos = _this select 0;
_spawn_radius = _this select 1;
_num_statics = _this select 2;
_static_choice = (toUpper (_this select 3));
_location_idx = (toUpper (_this select 4));
_behaviour_idx = If(count _this > 5)then{(toUpper (_this select 5));}else{"AWARE"};
_combat_mode_idx = If(count _this > 6)then{(toUpper (_this select 6));}else{"YELLOW"};


_output_arr = [];
_is_allowed = false;

If((CPORT getVariable CNAME(hc_available)) && isDedicated)then{[["GA_STWEAPON",_this]] call SFUNC(sendtohc);sleep (random 8);}else{_is_allowed = true;};

If(_is_allowed)then
{

_static_pos_dir = [];
_new_types_arr = [];
_mortar_arr = [];
_static_arr = [];
_grp_arr = [];
_stat_grp = "";
_stat_type = "";
_static_vec = [];
_allow_spawn = false;
_more_types = false;
_mortar = false;
_extra_pos = false;
_main_pos = [];
_chk_type1 = "";
_chk_type2 = "";


_chk_type1 = [_spawn_pos select 0] call SFUNC(datatype);
_chk_type2 = [_spawn_pos select 1] call SFUNC(datatype);

If(_chk_type1 == "ARRAY" && _chk_type2 == "ARRAY")then
{
  _main_pos = (_spawn_pos select 0);
  _spawn_pos = (_spawn_pos select 1);
  _extra_pos = true;
};


IF(count STATIC_WEAPON_CLASSES < 2 && _static_choice != "MIXED")then{_static_choice = "MIXED";};

switch(_static_choice)do
{
  case "MG":{
               If(count STATIC_WEAPON_CLASSES > 2)then
			   {
			     {
			       _parents_arr = [(configFile >> "CfgVehicles" >> _x),true] call IFUNC(returnParents);
				   _chk_string_aa = ["AA",_x,true] call IFUNC(inString);
				   _chk_string_at = ["AT",_x,true] call IFUNC(inString);
				   
				   If("StaticMGWeapon" In _parents_arr && (!_chk_string_aa) && (!_chk_string_at))then
				   {
				     _new_types_arr pushBack _x;				   
				   };
				   			   
			     }forEach STATIC_WEAPON_CLASSES;
				 
				 If(count _new_types_arr > 0)then{_allow_spawn = true;};
				 If(count _new_types_arr > 1)then{_more_types = true;};
				 
			   }else{
			          _parents_arr = [(configFile >> "CfgVehicles" >> (STATIC_WEAPON_CLASSES select 0)),true] call IFUNC(returnParents);
					  _chk_string_aa = ["AA",(STATIC_WEAPON_CLASSES select 0),true] call IFUNC(inString);
				      _chk_string_at = ["AT",(STATIC_WEAPON_CLASSES select 0),true] call IFUNC(inString);
					  If("StaticMGWeapon" In _parents_arr && (!_chk_string_aa) && (!_chk_string_at))then
					  {
					    _new_types_arr pushBack (STATIC_WEAPON_CLASSES select 0);
						_allow_spawn = true;
					  }else{diag_log str "GRAD_SYSTEM: Check Static MG Weapon Class Definition - No MG_STATIC_Classes found";};
                    };
            };
  case "GMG":{
               If(count STATIC_WEAPON_CLASSES > 2)then
			   {
			     {
			       _parents_arr = [(configFile >> "CfgVehicles" >> _x),true] call IFUNC(returnParents);
				  				   
				   If("StaticGrenadeLauncher" In _parents_arr)then
				   {
				     _new_types_arr pushBack _x;				   
				   };
				   			   
			     }forEach STATIC_WEAPON_CLASSES;
				 
				 If(count _new_types_arr > 0)then{_allow_spawn = true;};
				 If(count _new_types_arr > 1)then{_more_types = true;};	
				 
			   }else{
			          _parents_arr = [(configFile >> "CfgVehicles" >> (STATIC_WEAPON_CLASSES select 0)),true] call IFUNC(returnParents);					  
					  If("StaticGrenadeLauncher" In _parents_arr)then
					  {
					    _new_types_arr pushBack (STATIC_WEAPON_CLASSES select 0);
						_allow_spawn = true;
					  }else{diag_log str "GRAD_SYSTEM: Check Static GMG Weapon Class Definition - No GMG_STATIC_Classes found";};
                    };
             };
  case "MORTAR":{
                  If(count STATIC_WEAPON_CLASSES > 2)then
				  {
					{
						_parents_arr = [(configFile >> "CfgVehicles" >> _x),true] call IFUNC(returnParents);
				  				   
						If("StaticMortar" In _parents_arr)then
						{
							_new_types_arr pushBack _x;				   
						};
									   
					}forEach STATIC_WEAPON_CLASSES;
					
					If(count _new_types_arr > 0)then{_allow_spawn = true;_mortar = true;};
				    If(count _new_types_arr > 1)then{_more_types = true;};	
					 
				  }else{
						_parents_arr = [(configFile >> "CfgVehicles" >> (STATIC_WEAPON_CLASSES select 0)),true] call IFUNC(returnParents);					  
						If("StaticMortar" In _parents_arr)then
						{
							_new_types_arr pushBack (STATIC_WEAPON_CLASSES select 0);
							_allow_spawn = true;
							_mortar = true;
						}else{diag_log str "GRAD_SYSTEM: Check Static MORTAR Weapon Class Definition - No MORTAR_STATIC_Classes found";};
					   };
				};
  case "MISSILE":{
                   If(count STATIC_WEAPON_CLASSES > 2)then
				  {
					{
						_parents_arr = [(configFile >> "CfgVehicles" >> _x),true] call IFUNC(returnParents);
				  		_chk_string_aa = ["AA",_x,true] call IFUNC(inString);
				        _chk_string_at = ["AT",_x,true] call IFUNC(inString);		   
						If("StaticMGWeapon" In _parents_arr)then
						{
						   If(_chk_string_aa || _chk_string_at)then	
						   {_new_types_arr pushBack _x;};				   
						};
															   
					}forEach STATIC_WEAPON_CLASSES;
					
					If(count _new_types_arr > 0)then{_allow_spawn = true;};
				    If(count _new_types_arr > 1)then{_more_types = true;};	
					 
				  }else{
						_parents_arr = [(configFile >> "CfgVehicles" >> (STATIC_WEAPON_CLASSES select 0)),true] call IFUNC(returnParents);
                        _chk_string_aa = ["AA",(STATIC_WEAPON_CLASSES select 0),true] call IFUNC(inString);
				        _chk_string_at = ["AT",(STATIC_WEAPON_CLASSES select 0),true] call IFUNC(inString);						
						If("StaticMGWeapon" In _parents_arr)then
						{
							If(_chk_string_aa || _chk_string_at)then	
						    {
							 _new_types_arr pushBack (STATIC_WEAPON_CLASSES select 0);
							 _allow_spawn = true;
							};
						}else{diag_log str "GRAD_SYSTEM: Check Static MISSILE Weapon Class Definition - No MISSILE_STATIC_Classes found";};
					   };
					   
                 };
  case "MIXED":{
                  _new_types_arr = STATIC_WEAPON_CLASSES;
				  If(count _new_types_arr > 0)then{_allow_spawn = true;};
				  If(count _new_types_arr > 1)then{_more_types = true;};
               };
};

If(_allow_spawn)then
{
  for "_static_weapon" from 1 to _num_statics do
  {
     _stat_grp = createGroup ENEMY_SIDE;	
	 
	 If(_more_types)then
	 {
	   _stat_type = _new_types_arr call SFUNC(randomselect);
	 }else{
	        _stat_type = (_new_types_arr select 0);
	      };
	
	 switch(_location_idx)do
	 {
	   case "AREA":{
	                  _static_pos_dir = [_spawn_pos,_spawn_radius] call SFUNC(getstaticpoint);
	               };
	   case "BORDER":{
	                   _static_pos_dir = [_spawn_pos,_spawn_radius,1] call SFUNC(getstaticpoint);	   
	                 };
	 };
	 
	 If(count (_static_pos_dir select 0) > 0)then
	 {
	    _static_vec = [(_static_pos_dir select 0), (_static_pos_dir select 1),_stat_type,_stat_grp] call IFUNC(spawnVehicle);
		
		_stat_grp setBehaviour _behaviour_idx;
	    _stat_grp setCombatMode _combat_mode_idx;	
	    _stat_grp call SFUNC(setdifficulty);
	    _static_arr pushBack (_static_vec select 0);
	    _grp_arr pushBack _stat_grp;
				
		_parents_arr = [(configFile >> "CfgVehicles" >> _stat_type),true] call IFUNC(returnParents);
		If("StaticMortar" In _parents_arr)then{_mortar_arr pushBack (_static_vec select 0);};

        If(DEBUG)then{[(_static_vec select 0),2] call SFUNC(setdebugmarker);};		
     };
   sleep 0.04;
  };
};

If(count _grp_arr > 0)then
{
  If(("autodelete" call IFUNC(getParamValue)) == 3)then
  {
    {
	  addToRemainsCollector (units _x);
	}forEach _grp_arr;
  };  
 
  If(_extra_pos)then
  {
    [_main_pos,_grp_arr,"GROUP_STORE"] call SFUNC(addtosystem);
  }else{
         [_spawn_pos,_grp_arr,"GROUP_STORE"] call SFUNC(addtosystem);
       };   
};

If(count _static_arr > 0)then
{
    If(("autodelete" call IFUNC(getParamValue)) == 3)then
    {     
	   addToRemainsCollector _vec_arr;
    };
	If(CPORT getVariable CNAME(curator_available))then
	{
	  switch(true)do
	  {
	    case (!isDedicated):{["ADDTOCURATOR",_static_arr] spawn SFUNC(hcsendtodedi)};
		case (isDedicated):{{_x addCuratorEditableObjects [_static_arr,true];}forEach (allCurators);};
	  };
    };

  If(_extra_pos)then
  {
    [_main_pos,_static_arr,"VEHICLE_STORE"] call SFUNC(addtosystem);
  }else{
         [_spawn_pos,_static_arr,"VEHICLE_STORE"] call SFUNC(addtosystem);
       };
};

If(count _mortar_arr > 0)then
{
  [_spawn_pos,_mortar_arr,"MORTAR_STORE"] call SFUNC(addtosystem);
};
_output_arr = [_static_arr,_grp_arr];
};
_output_arr