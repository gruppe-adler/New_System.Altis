If(hasInterface)exitWith {};




                      private ["_object","_idx","_chk_posses","_type","_arrow_over_point"];
                      _object = _this select 0;
					  _idx = _this select 1;
					  _chk_posses = If(count _this > 2)then{_this select 2}else{false};
                      _type = "";

                      switch(_idx)do
					  {
					    case 0:{_type = "Sign_Arrow_F";};
						case 1:{_type = "Sign_Arrow_Blue_F";};
						case 2:{_type = "Sign_Arrow_Green_F";};
					  };

					  If(_chk_posses)then
					  {
					    _arrow_over_point = createVehicle [_type,_object, [], 0, "NONE"]; 
					    _arrow_over_point setPosATL [(_object select 0), (_object select 1),((_object select 2) + 0.2)];;
					  }else{
					        _arrow_over_point = createVehicle [_type, getPos _object, [], 0, "NONE"]; 
                            _arrow_over_point setPosASL [(getPosASL _object select 0), (getPosASL _object select 1),(((getPosASL _object) select 2) + 10)];
                           };