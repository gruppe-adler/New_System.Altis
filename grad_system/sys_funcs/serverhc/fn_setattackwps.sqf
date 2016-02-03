If(hasInterface)exitWith {};




                    private ["_grp","_wp_pos","_wp_radius","_wp1","_wp2"];

                    _grp = _this select 0;
					_wp_pos = _this select 1;
					_wp_radius = _this select 2;
 
                    
                    _wp1 = _grp addWaypoint [_wp_pos, 1];
					_wp1 setWaypointCompletionRadius _wp_radius;
                    _wp1 setWaypointType "MOVE";			
					_wp1 setWaypointSpeed  "FULL";
					_wp1 setWaypointCombatMode "RED";
					
					_wp2 = _grp addWaypoint [_wp_pos, 1];
					_wp2 setWaypointCompletionRadius (_wp_radius - 10);
                    _wp2 setWaypointType "SAD";