If(hasInterface)exitWith {};
include "ga_macro.hpp"


                        private ["_group","_param"];
                        _group = _this;
			_param = "difficulty" call IFUNC(getParamValue);			
			    		{[_x,_param] call SFUNC(skillset);}forEach units _group;