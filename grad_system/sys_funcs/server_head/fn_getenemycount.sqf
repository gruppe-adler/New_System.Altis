If(hasInterface)exitWith {};


                    private ["_diff_idx","_is_night","_human_count","_output_arr","_unit_num","_grp_num","_vec_num","_static_num","_air_num","_convoy_num"];
					
					
                    _diff_idx = _this select 0;
					_is_night = _this select 1;
					_human_count = _this select 2;
					
					_output_arr = [];
					_unit_num = 0;
					_grp_num = 0;
					_vec_num = 0;
					_static_num = 0;
					_air_num = 0;
					_convoy_num = 0;
					
					If(_human_count > 4)then
					{
					  switch(true)do
					  {
					    case (_diff_idx < 3):{
						                        If(_is_night)then
												{
												  _unit_num = 2;
												  _grp_num = _human_count;
												  _vec_num = 1;
                                                  _convoy_num = 2;
												  _static_num = 1;
												}else{
												       _unit_num = 5;
													   _grp_num = round((_human_count * 2) / 5);
													   _vec_num = 1;
													   _convoy_num = 2;
													   _static_num = 1;
												     };
						                     };
						case (_diff_idx > 2):{
						                        If(_is_night)then
												{
												  _units_num = 3;
												  _grp_num = round((_human_count * 2) / 3);
												  _vec_num = round(_human_count / 5);
												  If((round(_human_count / 6)) < 2)then{_convoy_num = 2;}else{_convoy_num = (round(_human_count / 6));};
												  _static_num = (round(_human_count / 4));
												}else{
												       _units_num = 5;
													   _grp_num = round((_human_count * 3) / 5);
													   _vec_num = round(_human_count / 5);
													   If((round(_human_count / 6)) < 2)then{_convoy_num = 2;}else{_convoy_num = (round(_human_count / 6));};
													   _static_num = (round(_human_count / 4));
													   _air_num = (round(_human_count / 10));
													 };
						                     };
					  };
					}else{
					       If(_is_night)then
						   {
						     _units_num = 2;
							 _grp_num = 4;
							 _vec_num = 1;
							 _convoy_num = 2;
							 _static_num = 1;
						   }else{
						          _units_num = 5;
							      _grp_num = 4;
							      _vec_num = 1;
							      _convoy_num = 2;
							      _static_num = 1;
						        };
					     };
                   _output_arr = [_grp_num,_units_num,_vec_num,_static_num,_convoy_num,_air_num];
				   _output_arr