If(hasInterface)exitWith {};



                    private ["_search_point","_search_radius","_search_class","_search_id","_outclass_arr","_class_arr","_chk_arr"];
                    _search_point = _this select 0;
					_search_radius = _this select 1;
					_search_class = _this select 2;
					_search_id = 2;
					_outclass_arr = [];
					_class_arr = [];
					_chk_arr = [];
					
					If(typeName _search_class == "ARRAY")then{_search_id = 0;};
					If(typeName _search_class == "STRING")then{_search_id = 1;};

					switch(_search_id)do
					{
					  case 0:{_class_arr = nearestObjects [_search_point,_search_class,_search_radius];};
					  case 1:{_class_arr = nearestObjects [_search_point,[_search_class],_search_radius];};
					  case 2:{};
					};
                    If(count _class_arr > 0)then
					{
					  {if(alive _x)then{_chk_arr set [(count _chk_arr),_x];};} foreach _class_arr;
					  If(count _chk_arr > 0)then{_outclass_arr = _chk_arr;};					  
					};
                     _outclass_arr