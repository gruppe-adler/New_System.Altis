If(hasInterface)exitWith {};



                          private ["_obj","_output_arr","_holder"];
						  _obj = _this;
						  _output_arr = "";
						  _holder = [];
 
                          switch(typeName _obj)do
						  {
				            case "ARRAY":{
							               {_holder pushBack (format["%1",_x]);}forEach _obj;
										   _output_arr = _holder;
				                         };
				            case "OBJECT":{
							                _output_arr = (format["%1",_obj]);
							              };
                          };
						  _output_arr