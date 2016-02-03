If(!isDedicated)exitWith {};
#include "ga_macro.hpp"

                      private ["_pos_arr","_holder"];
					  
					  _pos_arr = _this;
					  waitUntil{CPORT getVariable CNAME(add_deltrigg_allowed)};
                      CPORT setVariable [CNAME(del_deltrigg_allowed),false,false];
					  
                      _holder = (CPORT getVariable CNAME(pos_store_tridel));

					  If(count _holder > 0)then
					  { 
					    _holder pushBack _pos_arr;
						CPORT setVariable [CNAME(pos_store_tridel),_holder,false];
                      }else{
					        CPORT setVariable [CNAME(pos_store_tridel),[_pos_arr],false];
						   };
					 CNAME setVariable [CNAME(del_deltrigg_allowed),true,false];
					 true