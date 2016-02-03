If(!isDedicated)exitWith {};
#include "ga_macro.hpp"


		              private ["_pos_arr","_x_koord","_y_koord","_output_info","_holder","_is_hit"];
					  _pos_arr = _this;
                      _x_koord = (_pos_arr select 0);
					  _y_koord = (_pos_arr select 1);
					  _output_info = false;
					  _holder = (CPORT getVariable CNAME(pos_store_tridel));
                      
					  If(count _holder > 0)then
					  {
					    _is_hit = true;
					    {
						  If(_x_koord == (_x select 0) && _y_koord == (_x select 1) && _is_hit)then
						  {
						    _is_hit = false;
							_output_info = true;
						  };
					    }forEach _holder;
					  };
                      _output_info