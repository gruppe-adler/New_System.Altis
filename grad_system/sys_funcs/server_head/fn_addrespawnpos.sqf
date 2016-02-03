If(!isDedicated)exitWith {};
#include "ga_macro.hpp"


                   private ["_target_pos","_safe_pos","_store_holder","_add_to_store_arr","_add_in","_stored_pos","_x","_resp_id"];
				   _target_pos = _this select 0;
				   _safe_pos = _this select 1;
				 
				   _store_holder = [];
				   _add_to_store_arr = [];
				   _add_in = true;
				 
				   If(count (CPORT getVariable CNAME(resp_pos_store)) > 0)then
				   {
				     _store_holder = (CPORT getVariable CNAME(resp_pos_store));
				     {
				      _stored_pos = (_x select 0);
					  If((_target_pos select 0) == (_stored_pos select 0) && (_target_pos select 1) == (_stored_pos select 1))then{_add_in = false;};
					  sleep 0.04;
				     }forEach _store_holder;
				   };
				 
				   If(_add_in)then
				   {
                    _resp_id = [missionNamespace,_safe_pos] call IFUNC(addRespawnPosition);
					_add_to_store_arr = [_target_pos,_resp_id];
				   
				    If(count _store_holder > 0)then
				    {
				      _store_holder pushBack _add_to_store_arr;
				      CPORT setVariable [CNAME(resp_pos_store),_store_holder,false];
				    }else{
				          CPORT setVariable [CNAME(resp_pos_store),[_add_to_store_arr],false];
				         };
				   };
				   true