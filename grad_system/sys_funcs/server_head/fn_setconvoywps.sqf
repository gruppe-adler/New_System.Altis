If(hasInterface)exitWith {};




                    private ["_grp","_vec_pos","_wp_pos","_wp0","_wp1","_wp2"];
					
					_grp = _this select 0;
					_vec_pos = _this select 1;
					_wp_pos = _this select 2;
					
					
					
					_wp0 = _grp addWaypoint [_wp_pos, 1];
					_wp0 setWaypointCompletionRadius 5;
					_wp0 setWaypointType "MOVE";
					_wp0 setWaypointFormation "COLUMN";
					_wp0 setWaypointSpeed  "LIMITED";
					_wp0 setWaypointBehaviour "CARELESS";
					
					_wp1 = _grp addWaypoint [_wp_pos, 1];
					_wp1 setWaypointCompletionRadius 5;
					_wp1 setWaypointType "MOVE";
					_wp1 setWaypointFormation "COLUMN";
					_wp1 setWaypointSpeed  "LIMITED";
					_wp1 setWaypointBehaviour "CARELESS";
					
					
	                _wp2 = _grp addWaypoint [_wp_pos, 1];
					_wp2 setWaypointCompletionRadius 5;
                    _wp2 setWaypointType "HOLD";
					_wp2 setWaypointFormation "COLUMN";
					_wp2 setWaypointBehaviour "CARELESS";