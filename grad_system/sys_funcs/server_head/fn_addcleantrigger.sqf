If(!isDedicated)exitWith {};
#include "ga_macro.hpp"

                           private ["_detect_pos","_detect_size","_detect_idx","_detect_trigger"];
					       _detect_pos = _this select 0;
					       _detect_size = _this select 1;
						   _detect_idx = If(count _this > 2)then{_this select 2}else{0};

                           _detect_trigger  = createTrigger["EmptyDetector",_detect_pos,false]; 
						   
						   switch(_detect_idx)do
						   {
                             case 0:{
							         grad_triggaction = SFUNC(doactivate);
									 
                                     _detect_trigger setTriggerArea[_detect_size,_detect_size,0,false];
							         _detect_trigger setTriggerActivation[(format ["%1",OWN_TRIGGER_SIDE]),"PRESENT",false];
							         _detect_trigger setTriggerStatements["this", "nul = [thisTrigger,0] spawn grad_triggaction",""];
									 
									 _detect_pos spawn SFUNC(addcleantriggpos);
									};
							 case 1:{
							         grad_triggaction = SFUNC(doactivate);
									 
                                     _detect_trigger setTriggerArea[(_detect_size + 100),(_detect_size + 100),0,false];
							         _detect_trigger setTriggerActivation[(format ["%1",OWN_TRIGGER_SIDE]),"NOT PRESENT",false];
							         _detect_trigger setTriggerStatements["this", "nul = [thisTrigger,1] spawn grad_triggaction",""];
									};
						   };
                                                   true