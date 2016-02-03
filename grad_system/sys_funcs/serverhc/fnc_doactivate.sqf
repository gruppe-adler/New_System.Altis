If(!isDedicated)exitWith {};
#include "ga_macro.hpp"

				private ["_trigger","_idx","_trigger_pos","_trigger_size"];
				_trigger = _this select 0;
				_idx = _this select 1;
				
				_trigger_pos = position _trigger;
				_trigger_size = ((triggerArea _trigger) select 0);
				
				switch(_idx)do
				{
				  case 0:{
				           [_trigger_pos,_trigger_size,1] spawn SFUNC(addcleantrigger);
						   deleteVehicle _trigger;
				         };
				  case 1:{
                                           _trigger_pos spawn SFUNC(remcleantriggpos);
				           sleep 2; 	 
				           [_trigger_pos] spawn SFUNC(deltargetarea);
                                           deleteVehicle _trigger;
				         };				
				};
				true