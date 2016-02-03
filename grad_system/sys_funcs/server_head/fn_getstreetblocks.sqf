If(hasInterface)exitWith {};
#include "ga_macro.hpp"


                      private ["_searched_pos","_target_pos","_vec_count","_street_block","_streets_counter","_street_segments","_connected_streets",
					           "_street_pos","_first_street_block","_streets_counter","_first_dir","_first_pos","_dir_street","_chk_sector",
							   "_opposite_dir","_opposite_street_bl","_output_arr","_last_street_block","_x","_run_check","_counter"];
                      _searched_pos = _this select 0;
			          _target_pos = _this select 1;
					  _vec_count = _this select 2;
					  
					  _street_block = "";
					  _connected_streets = [];
					  _streets_counter = 0;
					  _last_street_block = "";
					  _first_street_block = "";
					  _first_dir = -1;
					  _first_pos = "";
					  _dir_street = 0;
					  _opposite_dir = -1;
					  _opposite_street_bl = "";
					  _output_arr = [];
					  
					  _street_segments = [_searched_pos,100,true] call SFUNC(streetcheck);
					  
					  If(count _street_segments > 0)then
					  {
					    _street_block = [_street_segments,_searched_pos] call SFUNC(getneareststreet);
						_connected_streets = roadsConnectedTo _street_block;
						while{count _connected_streets > 2 && _streets_counter < ((count _street_segments) - 1)}do
						{
						  _connected_streets = roadsConnectedTo (_street_segments select _streets_counter);
						  If(count _connected_streets < 3)then{_street_block = (_street_segments select _streets_counter);};
						  _streets_counter = _streets_counter + 1;
						 sleep 0.04;
					    };
						
			          };
					  If(count _connected_streets > 0 && count _connected_streets < 3)then
					  {				   
					    {
						  _dir_street = [(getPos _street_block),(getPos _x)] call IFUNC(dirTo);
						  _chk_sector = [(getPos _street_block),_dir_street,180,_target_pos] call IFUNC(inAngleSector);
						  If(_chk_sector)then
						  {
						    _first_dir = _dir_street;
							_first_pos = (getPos _street_block);
							_first_street_block = _street_block;
						  }else{
						         _opposite_dir = _dir_street;
								 _opposite_street_bl = (getPos _x);
								 _last_street_block = _x;
						       };
					    }forEach _connected_streets;
						
						If(_first_dir > -1 && (typeName _first_pos) == "ARRAY" && _opposite_dir > -1 && (typeName _opposite_street_bl) == "ARRAY")then
						{
						  
						  switch(true)do
                          {
                             case (_vec_count == 1):{_output_arr pushBack [_first_pos,_first_dir];};
                             case (_vec_count == 2):{_output_arr pushBack [_first_pos,_first_dir];
							                         _dir_street = [_opposite_street_bl,_first_pos] call IFUNC(dirTo);
													 _output_arr pushBack [_opposite_street_bl,_dir_street];
							                        };
							 case (_vec_count > 2):{
							                         _output_arr pushBack [_first_pos,_first_dir];
							                         _dir_street = [_opposite_street_bl,_first_pos] call IFUNC(dirTo);
													 _output_arr pushBack [_opposite_street_bl,_dir_street];
													 _counter = 0;
													
													 while{count _output_arr < _vec_count && _counter < 100}do
													 {
													   _run_check = true;
													   _connected_streets = roadsConnectedTo _last_street_block;
													   {
													     
														   _dir_street = [(getPos _first_street_block),(getPos _last_street_block)] call IFUNC(dirTo);
														   If(count _connected_streets < 3)then
														   {
													         _chk_sector = [(getPos _last_street_block),_dir_street,90,(getPos _x)] call IFUNC(inAngleSector);
														   }else{
														         If(count _connected_streets > 2)then
																 {
																   _chk_sector = [(getPos _last_street_block),_dir_street,30,(getPos _x)] call IFUNC(inAngleSector);
																 };
																};
														   If(_chk_sector && _run_check)then
														   {
														     _run_check = false;
															 _dir_street = [(getPos _x),(getPos _last_street_block)] call IFUNC(dirTo);
															 _first_street_block = _last_street_block;
															 _last_street_block = _x;
															 _output_arr pushBack [(getPos _x),_dir_street];															 
														   };													     							     
													   }forEach _connected_streets;
													   _counter = _counter + 1;
													 };
							                       };

                          };
                        };
					  
					  };
                      _output_arr