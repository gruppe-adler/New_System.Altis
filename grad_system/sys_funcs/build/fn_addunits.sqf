If(hasInterface)exitWith {};
#include "ga_macro.hpp"


if ((count NORMAL_UNIT_CLASSES) == 0 && (count SPECIAL_UNIT_CLASSES) == 0) exitWith {diag_log  str "GRAD_SYSTEM: Check Unit Class Definition - No UNIT_Classes available";};

private ["_spawn_pos","_spawn_radius","_num_grps","_num_units_in_grp","_grp_choice","_location_idx","_extra_pos","_holder",
         "_behaviour_idx","_combat_mode_idx","_is_allowed","_group_spawn","_grp_div","_unit_types","_house_pos","_house_arr",
		 "_main_pos","_house_ctrl","_spawn_point","_grp_holder","_sel_house","_unit_h_num","_grp_h_count","_chk_type1","_chk_type2",
		 "_grp","_unit","_pos","_grp_arr","_house_spawn","_area_spawn","_border_spawn","_ctrl_house","_unit_type","_x"];



_spawn_pos = _this select 0;
_spawn_radius = _this select 1;
_num_grps = If((_this select 2) > 0)then{_this select 2}else{If((_this select 2) < 1) exitWith {diag_log str "GRAD_SYSTEM: Check Group Count in Unitspawn < 1"};};
_num_units_in_grp = If((_this select 3) > 0)then{_this select 3}else{If((_this select 3) < 1) exitWith {diag_log str "GRAD_SYSTEM: Check Unit Count for Group in Unitspawn < 1 !"};};
_grp_choice = (toUpper (_this select 4));
_location_idx = (toUpper (_this select 5));
_behaviour_idx = If(count _this > 6)then{(toUpper (_this select 6));}else{"CARELESS"};
_combat_mode_idx = If(count _this > 7)then{(toUpper (_this select 7));}else{"YELLOW"};


_grp_arr = [];
_is_allowed = false;

If((CPORT getVariable CNAME(hc_available)) && isDedicated)then{[["GA_UNITS",_this]] call SFUNC(sendtohc);sleep (random 8);}else{_is_allowed = true;};

If(_is_allowed)then
{

_grp_div = [];
_unit_types = [];
_house_pos = [];
_house_arr = [];
_house_ctrl = [];
_spawn_point = [];
_grp_holder = [];
_holder = [];
_sel_house = "";
_unit_h_num = 0;
_grp_h_count = 0;
_grp = 0;
_unit = "";
_pos = [];
_unit_type = "";
_extra_pos = false;
_main_pos = [];
_chk_type1 = "";
_chk_type2 = "";

_house_spawn = false;
_area_spawn = false;
_border_spawn = false;
_ctrl_house = false;

_chk_type1 = [_spawn_pos select 0] call SFUNC(datatype);
_chk_type2 = [_spawn_pos select 1] call SFUNC(datatype);

If(_chk_type1 == "ARRAY" && _chk_type2 == "ARRAY")then
{
  _main_pos = (_spawn_pos select 0);
  _holder = (_spawn_pos select 1);
  _spawn_pos = _holder;
  _extra_pos = true;
};


switch(_location_idx)do
{
  case "AREA":{_area_spawn = true;};
  case "BORDER":{_border_spawn = true;};
  case "HOUSE":{
                 _house_arr = [_spawn_pos,_spawn_radius,true] call SFUNC(housecheck);
                 If(count _house_arr > 0)then
				 {
				   _house_spawn = true;
				   _grp_h_count = _num_grps;
				   _unit_h_num = _num_units_in_grp;
				 };
               };
  case "HOUSE_TOP":{
                     _house_arr = [_spawn_pos,_spawn_radius,true] call SFUNC(housecheck);
                     If(count _house_arr > 0)then
					 {
					   _house_spawn = true;
					   _grp_div = [_num_grps,_num_units_in_grp,_location_idx] call SFUNC(groupdiv);
					   _grp_h_count = _grp_div select 0;
					   _unit_h_num = _grp_div select 1;
                     };
                   };
  case "MIXED":{
                 _area_spawn = true;
				 _house_arr = [_spawn_pos,_spawn_radius,true] call SFUNC(housecheck);
				 If(count _house_arr > 0)then
				 {
				   _house_spawn = true;
                   _grp_div = [_num_grps,_num_units_in_grp,_location_idx] call SFUNC(groupdiv);
				   _num_grps = _grp_div select 0;
				   _grp_h_count = _grp_div select 1;
				   _unit_h_num = _grp_div select 2;
				 				   
                 };
               };
};




If(_area_spawn)then
{
   for "_group_spawn" from 1 to _num_grps do
   {
      _unit_types = [_grp_choice,_num_units_in_grp,_location_idx] call SFUNC(getunitclasses);
	  
	  _spawn_point = [_spawn_pos,_spawn_radius,0] call SFUNC(getunitpoint);
	  
	  If(count _spawn_point > 0)then
	  {
	     _grp = createGroup ENEMY_SIDE;
		 {
		   _unit = _grp createUnit [_x, _spawn_point, [], 1, "PRIVATE"];
		   sleep 0.5;
		 }forEach _unit_types;
	     
	     _grp call SFUNC(setdifficulty);
		 [_grp,_spawn_pos,(round(_spawn_radius * 0.5))] call IFUNC(taskPatrol);
		 _grp setBehaviour _behaviour_idx;
		 _grp setCombatMode _combat_mode_idx;
		 _grp enableAttack true;
		 _grp enableGunLights "AUTO";
	     _grp_arr pushBack _grp;
	  };
    sleep 0.5;
   };
};

If(_border_spawn)then
{
   _pos = [_spawn_pos,(round(_spawn_radius * 2)),1] call SFUNC(getunitpoint);
   for "_group_spawn" from 1 to _num_grps do 
   {
      _unit_types = [_grp_choice,_num_units_in_grp,_location_idx] call SFUNC(getunitclasses);	  
	  _spawn_point = [_pos,60,0] call SFUNC(getunitpoint);
	  
	  If(count _spawn_point > 0)then
	  {
	     _grp = createGroup ENEMY_SIDE;
		 {
		   _unit = _grp createUnit [_x, _spawn_point, [], 1, "PRIVATE"];
		   sleep 0.5;
		 }forEach _unit_types;
		 [_grp,_spawn_pos,_spawn_radius] call set_attack_wps;
		 _grp enableAttack true;
		 _grp enableGunLights "AUTO";
	     _grp call SFUNC(setdifficulty);		 
	     _grp_arr pushBack _grp;
	  };
    sleep 0.5;
   };
   If(DEBUG)then{player setPos _pos;};
};

If(_house_spawn)then
{
   If(count _house_arr >= _grp_h_count)then
   {
     for "_group_spawn" from 1 to _grp_h_count do
	 {
	   _grp = createGroup ENEMY_SIDE;
	   _unit_types = [_grp_choice,_unit_h_num,_location_idx] call SFUNC(getunitclasses);
	   _sel_house = _house_arr call SFUNC(randomselect);
	   _ctrl_house = false;
	   
	   If(_sel_house In _house_ctrl)then
		 {
		   while{!_ctrl_house}do
		   {
		     _sel_house = _house_arr call SFUNC(randomselect);
			 If(_sel_house In _house_ctrl)then{}else{_ctrl_house = true;_house_ctrl = _house_ctrl + [_sel_house];};
		     sleep 0.04; 
	       };
		 }else{_ctrl_house = true;_house_ctrl = _house_ctrl + [_sel_house];};
	   		 
		 If(_ctrl_house)then
		 {
		   _house_pos = [_sel_house,_location_idx] call SFUNC(gethousepos)
;
		   if(count _house_pos > _unit_h_num)then
		   {
		    
		     {
		       _spawn_point = _house_pos call SFUNC(randomselect);
		       _unit = _grp createUnit [_x, _spawn_point, [], 1, "PRIVATE"];
		       _unit setPosATL _spawn_point;
			   _unit moveTo _spawn_point;
			   _unit allowFleeing 0;
			   			  		   
		       If(DEBUG)then{[_unit,0] call set_debug_marker;};
			   sleep 0.04;
			 }forEach _unit_types;
		   }else{ 
		         If(count _house_pos <= _unit_h_num)then
                 {
                   				 
		          {
				    _unit_type = _unit_types call SFUNC(randomselect);
					_unit = _grp createUnit [_unit_type,_x, [], 1, "PRIVATE"];
		            _unit setPosATL _x;
					_unit moveTo _x;
		            _unit allowFleeing 0;
										
		            If(DEBUG)then{[_unit,0] call SFUNC(setdebugmarker);};
		          }forEach _house_pos;
				 };
		        };
		 	        		 	   
	            _grp call SFUNC(setdifficulty);
                _grp setBehaviour _behaviour_idx;
	            _grp setCombatMode _combat_mode_idx;
				_grp enableAttack true;
	            _grp_arr pushBack _grp;
         
	     };
	  sleep 0.5; 
     };	  	 
   }else{
          If(count _house_arr > 0 && count _house_arr < _grp_h_count)then
		  {
		    {
			  _grp = createGroup ENEMY_SIDE;
			  _unit_types = [_grp_choice,_unit_h_num,_location_idx] call SFUNC(getunitclasses);
			  _house_pos = [_x,_location_idx] call SFUNC(gethousepos);
	          If(count _house_pos > _unit_h_num)then
			  {
			    for "_group_spawn" from 1 to _unit_h_num do
				{
				  _spawn_point = _house_pos call SFUNC(randomselect);
				  _unit_type = _unit_types call SFUNC(randomselect);
				  _unit = _grp createUnit [_unit_type, _spawn_point, [], 1, "PRIVATE"];
				  _unit setPosATL _spawn_point;
		          _unit moveTo _spawn_point;
				  _unit allowFleeing 0;
				  
				  
		          If(DEBUG)then{[_unit,0] call SFUNC(setdebugmarker)};
				  sleep 0.5;
				};
			  
			  }else{
			         for "_group_spawn" from 1 to (count _house_pos) do
					 {
					   _spawn_point = _house_pos call SFUNC(randomselect);
					   _unit_type = _unit_types call SFUNC(randomselect);
				       _unit = _grp createUnit [_unit_type, _spawn_point, [], 1, "PRIVATE"];
				       _unit setPosATL _spawn_point;
		               _unit moveTo _spawn_point;
					   _unit allowFleeing 0;
					   

					   If(DEBUG)then{[_unit,0] call SFUNC(setdebugmarker)};
					   sleep 0.5;
			         };
			       };
			  _grp call SFUNC(setdifficulty);
              _grp setBehaviour _behaviour_idx;
	          _grp setCombatMode _combat_mode_idx;
			  _grp enableAttack true;
	          _grp_arr pushBack _grp;
              sleep 0.04;  
				   
		    }forEach _house_arr;
          };
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
     
};
	 _grp_arr