If(hasInterface)exitWith {};




                  private ["_num_grps","_num_in_grps","_calculation_idx","_output_num","_grp_count_1",
				           "_grp_count","_unit_count"];

                  _num_grps = _this select 0;
				  _num_in_grps = _this select 1;
				  _calculation_idx = _this select 2;
				  
				  _output_num = [];
				  _grp_count_1 = 0;
				  _grp_count = 0;
				  _unit_count = 0;
				  
				  switch(_calculation_idx)do
				  {
					case "HOUSE_TOP":{
					                  If(_num_in_grps > 3)then{_unit_count = 3;}else{_unit_count = _num_in_grps;};
									  _output_num = [_num_grps,_unit_count];
					                 };
				    case "MIXED":{
					                _grp_count_1 = (round (_num_grps * 0.65));
									If(_num_grps > 1)then{_grp_count = ((_num_grps - _grp_count_1) * 2)}else
                                                         {_grp_count = 1;};
									If(_num_in_grps >= 2)then{_unit_count = (round (_num_in_grps * 0.3));}else
									                         {_unit_count = 1;};
									_output_num = [_grp_count_1,_grp_count,_unit_count];					 
					             };

                  };
				  _output_num