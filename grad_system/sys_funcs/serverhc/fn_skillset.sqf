If(hasInterface)exitWith {};



             private ["_unit","_idx","_skill"];
			 
			 _unit = _this select 0;
			 _idx = _this select 1;
			 
			 switch(_idx)do
			 {
			  case 0:{_skill = [0.1, 0.1, 1, 1, 1, 0.4, 1, 1, 1, 0.1];};
			  case 1:{_skill = [0.1, 0.2, 1, 1, 1, 0.8, 1, 1, 1, 0.2];};
			  case 2:{_skill = [0.2, 0.3, 1, 1, 1, 0.8, 1, 1, 1, 0.3];};
			  case 3:{_skill = [0.3, 0.4, 1, 1, 1, 0.8, 1, 1, 1, 0.4];};
			  case 4:{_skill = [0.4, 0.5, 1, 1, 1, 0.8, 1, 1, 1, 0.5];};
			  case 5:{_skill = [0.5, 0.5, 1, 1, 1, 0.8, 1, 1, 1, 0.6];};
			  case 6:{_skill = [0.6, 0.6, 1, 1, 1, 0.9, 1, 1, 1, 0.7];};
			  case 7:{_skill = [0.7, 0.7, 1, 1, 1, 0.9, 1, 1, 1, 0.8];};
			  case 8:{_skill = [0.9, 0.9, 1, 1, 1, 0.9, 1, 1, 1, 0.9];};
			  case 9:{_skill = [1,1,1,1,1,1,1,1,1,1];};
			 };

             _unit  setskill ["aimingAccuracy",(_skill select 0)];
			 _unit  setskill ["aimingShake",(_skill select 1)];
			 _unit  setskill ["aimingSpeed",(_skill select 2)];
			 _unit  setskill ["commanding",(_skill select 3)];
			 _unit  setskill ["spotTime",(_skill select 4)];
			 _unit  setskill ["courage",(_skill select 5)];
			 _unit  setskill ["general",(_skill select 6)];
			 _unit  setskill ["spotDistance",(_skill select 7)];
			 _unit  setskill ["endurance",(_skill select 8)];
			 _unit  setskill ["reloadSpeed",(_skill select 9)];