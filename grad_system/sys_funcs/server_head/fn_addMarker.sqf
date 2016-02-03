If(!isDedicated)exitWith {};
#include "ga_macro.hpp"



/*
shapes
-------------
"ELLIPSE"
"ELLIPSE_BORDER"
"RECTANGLE"
"ICON"


*/

               private ["_marker_name","_marker_shape","_marker_pos","_marker_size","_marker_color","_marker_type","_marker_brush",
			           "_marker_dir","_marker_txt","_output"];
			   
			   _marker_name = _this select 0;
			   _marker_shape = (toUpper (_this select 1));
			   _marker_pos = _this select 2;
			   _marker_size = _this select 3;
			   _marker_color = If(count _this > 4)then{_this select 4}else{"Color1_FD_F"};
			   _marker_type = If(count _this > 5)then{_this select 5}else{"Empty"};
               _marker_brush = If(count _this > 6)then{_this select 6}else{"SolidBorder"};
			   _marker_dir = If(count _this > 7)then{_this select 7}else{0};
			   _marker_txt = if(count _this > 8)then{_this select 8}else{""};
			   _output = "";


               switch(_marker_shape)do
			   {
                 case "ELLIPSE":{
				                  If(([_marker_size] call SFUNC(datatype)) != "ARRAY") exitWith {diag_log str "Fry_Mission: Check Marker_Size Type - have to be a ARRAY!";};
				                  _marker = createMarker [_marker_name,[(_marker_pos select 0),(_marker_pos select 1)]];
								  _marker_name setMarkerShape "ELLIPSE";
								  _marker_name setMarkerType "Empty";
								  _marker_name setMarkerSize _marker_size; 
                                  _marker_name setMarkerColor _marker_color;
								  _marker_name setMarkerDir _marker_dir;
								  _marker_name setMarkerBrush _marker_brush;
								  If(_marker_txt != "")then{_marker_name setMarkerText _marker_txt;};
                                  _output = _marker_name;
                                };
				 case "ELLIPSE_BORDER":{
                                         If(([_marker_size] call SFUNC(datatype)) != "ARRAY") exitWith {diag_log str "Fry_Mission: Check Marker_Size Type - have to be a ARRAY!";};
				                         _marker = createMarker [_marker_name,[(_marker_pos select 0),(_marker_pos select 1)]];
								         _marker_name setMarkerShape "ELLIPSE";
								         _marker_name setMarkerType "Empty";
								         _marker_name setMarkerSize _marker_size;
                                         _marker_name setMarkerColor _marker_color;
								         _marker_name setMarkerDir _marker_dir;
								         _marker_name setMarkerBrush "Border";
								         If(_marker_txt != "")then{_marker_name setMarkerText _marker_txt;};
										 _output = _marker_name;
                                       };
				 case "RECTANGLE":{
				                    If(([_marker_size] call SFUNC(datatype)) != "ARRAY") exitWith {diag_log str "Fry_Mission: Check Marker_Size Type - have to be a ARRAY!";};
				                    _marker = createMarker [_marker_name,[(_marker_pos select 0),(_marker_pos select 1)]];
								    _marker_name setMarkerShape "RECTANGLE";
								    _marker_name setMarkerType "Empty";
								    _marker_name setMarkerSize _marker_size; 
                                    _marker_name setMarkerColor _marker_color;
								    _marker_name setMarkerDir _marker_dir;
								    _marker_name setMarkerBrush _marker_brush;
								    If(_marker_txt != "")then{_marker_name setMarkerText _marker_txt;};
                                    _output = _marker_name;
				                  };
				 case "ICON":{
							   If(_marker_type == "Empty") exitWith {diag_log str "Fry_Mission: Check Marker_Type - ""Empty"" not allowed with Marker_shape ""ICON""!";};
				               _marker = createMarker [_marker_name,[(_marker_pos select 0),(_marker_pos select 1)]];
							   _marker_name setMarkerShape "ICON";
							   _marker_name setMarkerType _marker_type;
                               _marker_name setMarkerColor _marker_color;
						       _marker_name setMarkerDir _marker_dir;
							   If(_marker_txt != "")then{_marker_name setMarkerText _marker_txt;};
                                _output = _marker_name;
				             };

               };
               _output
