If(hasInterface)exitWith {};


                     private ["_para_man"];
                     _para_man = _this select 0;
					 _backpack = backpack _para_man;
					 
					 If(_backpack == "")then
					 {
					  _para_man addBackpack "B_Parachute";
					 }else{
                           If(_backpack != "B_Parachute")then{
						                                      removeBackpack _para_man;
															  _para_man addBackpack "B_Parachute";
															 };
                          };
                    					 