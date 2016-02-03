If(hasInterface)exitWith {};
include "ga_macro.hpp"


		  private ["_ari_pos","_ari_radius","_ari_point","_rel_ari_pos","_ap"];
		  _ari_pos = _this select 0;
		  _ari_radius = _this select 1;
		  _ari_point = [];
		  _rel_ari_pos = [];
		  _ap = 0;
		  while{count _ari_point == 0 && _ap < 50}do
		  {
		   _angle = floor (random 360);
		   _ari_point = [_ari_pos,(round(random _ari_radius)),_angle] call IFUNC(relPos);
		   _ap = _ap + 1;
		   sleep 0.02;
		  };
		  If(count _ari_point > 0)then{_rel_ari_pos = _ari_point;};
		  _rel_ari_pos