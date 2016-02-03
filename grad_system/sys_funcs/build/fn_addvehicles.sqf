If(hasInterface)exitWith {};
#include "ga_macro.hpp"


if ((count TANKS_VEHICLE_CLASSES) == 0 && (count CAR_VEHICLE_CLASSES) == 0) exitWith {diag_log  str "GRAD_SYSTEM: Check Vehicle Class Definition - No Vehicle_Classes available";};


private ["_spawn_pos","_spawn_radius","_vehicle_num","_vehicle_choice","_location_idx","_night_mode","_main_pos","_x",
         "_behaviour_idx","_combat_mode_idx","_search_street_block","_street_block_in","_street_counter","_extra_pos","_mixed_arr",
		 "_vec_types","_vec_type","_vec_grp","_vec","_is_night","_check_roads","_roads_arr","_used_roads","_vec_spawn","_chk_type2",
		 "_border_pos","_grp_arr","_vec_arr","_ari_holder","_grp_holder","_vec_holder","_vec_pos_dir","_output_arr","_chk_type1","_holder"];


_spawn_pos = _this select 0;
_spawn_radius = _this select 1;
_vehicle_num = _this select 2;
_vehicle_choice = (toUpper (_this select 3));
_location_idx = (toUpper (_this select 4));
_night_mode = If(count _this > 5)then{_this select 5}else{true};
_behaviour_idx = If(count _this > 6)then{(toUpper (_this select 6));}else{"CARELESS"};
_combat_mode_idx = If(count _this > 7)then{(toUpper (_this select 7));}else{"YELLOW"};


_output_arr = [];
_is_allowed = false;

If((CPORT getVariable CNAME(hc_available)) && isDedicated)then{[["GA_VECS",_this]] call SFUNC(sendtohc);sleep (random 8);}else{_is_allowed = true;};

If(_is_allowed)then
{

_vec_types = [];
_vec_type = "";
_vec_grp = "";
_vec = [];
_is_night = false;
_check_roads = false;
_roads_arr = [];
_used_roads = [];
_border_pos = [];
_grp_arr = [];
_vec_arr = [];
_holder = [];
_ari_holder = [];
_grp_holder = [];
_vec_holder = [];
_vec_pos_dir = [];
_extra_pos = false;
_main_pos = [];
_chk_type1 = "";
_chk_type2 = "";

_chk_type1 = [_spawn_pos select 0] call SFUNC(datatype);
_chk_type2 = [_spawn_pos select 1] call SFUNC(datatype);

If(_chk_type1 == "ARRAY" && _chk_type2 == "ARRAY")then
{
  _main_pos = (_spawn_pos select 0);
  _holder = (_spawn_pos select 1);
  _spawn_pos = _holder;
  _extra_pos = true;
};

IF(_location_idx == "AREA")then
{
  _house_num = [_spawn_pos,_spawn_radius] call SFUNC(housecheck);
  If(_house_num > (_vehicle_num * 3))then{_check_roads = true;};
}else{
       If(_vehicle_choice == "ARTILLERY")then
	   {
	     _border_pos = [_spawn_pos,1200,1] call SFUNC(getunitpoint);
	   
       }else{
	          _border_pos = [_spawn_pos,(_spawn_radius * 5),_vehicle_num] call SFUNC(getvecborderstreetpos);
			  If(count _border_pos > 0)then
			  {
			    _roads_arr = [_border_pos,60,true] call SFUNC(streetcheck);			  
			  };
            };
     };
If(_vehicle_choice == "ARTILLERY")then{_check_roads = false;};

switch(_vehicle_choice)do
   {
      case "CARS":{If(count CAR_VEHICLE_CLASSES > 0)then{_vec_types = CAR_VEHICLE_CLASSES}else{if(count TANKS_VEHICLE_CLASSES > 0)then{_vec_types = TANKS_VEHICLE_CLASSES};};};
	  case "TANKS":{If(count TANKS_VEHICLE_CLASSES > 0)then{_vec_types = TANKS_VEHICLE_CLASSES;}else{If(count CAR_VEHICLE_CLASSES > 0)then{_vec_types = CAR_VEHICLE_CLASSES;};};};
	  case "MIXED":{
	                  _mixed_arr = [];
	                  If(count CAR_VEHICLE_CLASSES > 0)then{{_mixed_arr pushBack _x;}forEach CAR_VEHICLE_CLASSES;};
	                  If(count TANKS_VEHICLE_CLASSES > 0)then{{_mixed_arr pushBack _x;}forEach TANKS_VEHICLE_CLASSES;};
                      if(count _mixed_arr > 0)then{_vec_types = _mixed_arr call IFUNC(arrayShuffle);};				  
	               };
	  case "ARTILLERY":{If(count ARI_VEHICLE_CLASSES > 0)then{_vec_types = ARI_VEHICLE_CLASSES}else{If(count ARI_VEHICLE_CLASSES < 1) exitWith {diag_log  str "GRAD_SYSTEM: Check Ari Class Definition - No ARI_VEHICLE_CLASSES available";};};};
   };
   
If(_check_roads)then{_roads_arr = [_spawn_pos,_spawn_radius,true] call SFUNC(streetcheck);}; 

If(_night_mode)then{_is_night = [] call SFUNC(nightcheck);};

for "_vec_spawn" from 1 to _vehicle_num do
{
   _vec_type = _vec_types call SFUNC(randomselect);
   _vec_grp = createGroup ENEMY_SIDE;
   
   switch(_location_idx)do
   {
     case "AREA":{
	               If(_check_roads && ((count _roads_arr) > 0))then
				   {
				     _search_street_block = _roads_arr call SFUNC(randomselect);					 
					 If(_search_street_block In _used_roads)then
					 {
					   _street_block_in = true;
					   _street_counter = 0;
					   while{_street_block_in && _street_counter < (count _roads_arr)}do
					   {
					     _search_street_block = _roads_arr call SFUNC(randomselect);
						 If(_search_street_block In _used_roads)then{_street_counter = _street_counter + 1;}else
						 {
						  _street_block_in = false;
						  _used_roads pushBack _search_street_block;
						 };
					    sleep 0.04;
					   };
					 }else{
					         _used_roads pushBack _search_street_block;					 
				          };
					 _vec_pos_dir = [_search_street_block,0] call SFUNC(getstreetposdir);
					  	  
				   }else{
	                      _vec_pos_dir = [_spawn_pos,_spawn_radius] call SFUNC(getvecpoint);
						};
	 
	             };
     case "BORDER":{
	                  If(_vehicle_choice == "ARTILLERY")then
					  {
					    If(count _border_pos > 0)then
						{
						  _vec_pos_dir = [_border_pos,60,_spawn_pos] call SFUNC(getvecpoint);
                        };						  
	                  }else{
					         If((count _roads_arr) > 0)then
							 {
							   _search_street_block = _roads_arr call SFUNC(randomselect);					 
							   If(_search_street_block In _used_roads)then
							   {
								_street_block_in = true;
								_street_counter = 0;
								while{_street_block_in && _street_counter < (count _roads_arr)}do
								{
									_search_street_block = _roads_arr call SFUNC(randomselect);
									If(_search_street_block In _used_roads)then{_street_counter = _street_counter + 1;}else
									{
										_street_block_in = false;
										_used_roads pushBack _search_street_block;
									};
								  sleep 0.04;
								};
							   }else{
										_used_roads pushBack _search_street_block;					 
									};
							   _vec_pos_dir = [_search_street_block,1,_spawn_pos] call SFUNC(getstreetposdir); 
					  
					         }else{
							        _vec_pos_dir = [_border_pos,60,_spawn_pos] call SFUNC(getvecpoint);							  
					              };
					       };
	               };
   };
   
   If((count (_vec_pos_dir select 0)) > 0)then
   {
     
     _vec = [(_vec_pos_dir select 0),(_vec_pos_dir select 1),_vec_type,_vec_grp] call IFUNC(spawnVehicle);
     _grp_arr pushBack _vec_grp;
	 _vec_arr pushBack (_vec select 0);
	 _vec_grp call SFUNC(setdifficulty);
	 If(DEBUG)then{[(_vec select 0),1] call SFUNC(setdebugmarker);};
	 	 
	 If(_vehicle_choice == "ARTILLERY")then
	 {
	   If(count (crew (_vec select 0)) > 0)then
	   {	     
		 (gunner (_vec select 0)) lookAt _spawn_pos;		 
		 _vec_grp setBehaviour _behaviour_idx;
         [(_vec select 0)] spawn {sleep 10; (driver (_this select 0)) action ["engineOff", (_this select 0)];(_this select 0) setFuel 0;};		 
	     _vec_grp call SFUNC(setdifficulty);
       };		 
	 }else{
	        If(_is_night)then
			{
	          If(_location_idx == "AREA")then
			  {
			    _vec_grp setBehaviour _behaviour_idx;
	            _vec_grp setCombatMode _combat_mode_idx;	
	            _vec_grp call SFUNC(setdifficulty);
				(_vec select 0) engineOn false;
			    [(_vec select 0)] spawn {sleep 10; (driver (_this select 0)) action ["engineOff", (_this select 0)];};
			  }else{			         
	                 _vec_grp call SFUNC(setdifficulty);
			         [_vec_grp,_spawn_pos,_spawn_radius] spawn SFUNC(setattackwps);
			       };
	        }else{
			        If(_location_idx == "AREA")then
			        {
					   _vec_grp call SFUNC(setdifficulty);
					  [_vec_grp,_spawn_pos,(round(_spawn_radius * 0.5))] call IFUNC(taskPatrol);
					  _vec_grp setBehaviour _behaviour_idx;
	                  _vec_grp setCombatMode _combat_mode_idx;
					  _vec_grp setSpeedMode "LIMITED";
					
					}else{
					       _vec_grp call SFUNC(setdifficulty);
			              [_vec_grp,_spawn_pos,_spawn_radius] spawn SFUNC(setattackwps);					
					     };
			     };
	      };
	      
   };
     
};
If(DEBUG)then{player setPos (_vec_pos_dir select 0);};

If(_vehicle_choice == "ARTILLERY")then
{
   If(count _vec_arr > 0)then
   {
     [_spawn_pos,_vec_arr,"ARI_STORE"] call SFUNC(addtosystem);
   };
};

If(count _vec_arr > 0)then
{
    If(("autodelete" call IFUNC(getParamValue)) == 3)then
    {     
	   addToRemainsCollector _vec_arr;
    };
	If(CPORT getVariable CNAME(curator_available))then
	{
	  switch(true)do
	  {
	    case (!isDedicated):{["ADDTOCURATOR",_vec_arr] spawn SFUNC(hcsendtodedi)};
		case (isDedicated):{{_x addCuratorEditableObjects [_vec_arr,true];}forEach (allCurators);};
	  };
    };
    if(_extra_pos)then
	{
	  [_main_pos,_vec_arr,"VEHICLE_STORE"] call SFUNC(addtosystem);
	}else{
	       [_spawn_pos,_vec_arr,"VEHICLE_STORE"] call SFUNC(addtosystem);
	     };
	
	If(
};

If(count _grp_arr > 0)then
{
    If(("autodelete" call IFUNC(getParamValue)) == 3)then
    {
     {
	   addToRemainsCollector (units _x);
	 }forEach _grp_arr;
    };

    if(_extra_pos)then
	{
	  [_main_pos,_grp_arr,"GROUP_STORE"] call SFUNC(addtosystem);
	}else{
	       [_spawn_pos,_grp_arr,"GROUP_STORE"] call SFUNC(addtosystem);
	     };	
};
     _output_arr = [_vec_arr,_grp_arr];
};
     _output_arr