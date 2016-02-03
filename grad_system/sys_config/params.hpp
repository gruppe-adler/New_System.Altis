//Parameter Config
// 14.08.2012


class Params
{
	class timeofday
    {
		//paramsArray[0]
		title = "Time of Day:";
		values[] = {12,1};
		texts[] = {"Night - Stealth", "Day - Power"};
		default = 12;   
    };
	
	class difficulty
	{
		//paramsArray[1]  
		title = "Difficulty:";
		values[] = {0,2,3,4};
		texts[] = {"Easy","Normal","Hard","Ultra Hard"};
		default = 2;		
	};
	
	class c4only
	{
	    //paramsArray[2] 
	    title = "C4 only:";
		values[] = {0,1};
		texts[] = {"NO","YES"};
	    default = 1;
		isGlobal = 1;
	};
	
	class soundplay
	{
	    //paramsArray[3]  
        title = "Mission Sounds:";
	    values[] = {0,1};
	    texts[] = {"OFF","ON"};
	    default = 1;
        isGlobal = 1;	  
	};
	
	class nighteffect
	{
	    //paramsArray[4]
	    title = "Night Effects:";
	    values[] = {0,1};
		texts[] = {"OFF","ON"};
		default = 1;
	};
	
	class autoresppos
	{
	   //paramsArray[5]
	   title = "Automatic Respawn Position:";
	   values[] = {0,1};
	   texts[] = {"NO","YES"};
	   default = 1;
	};
};

class CfgRespawnTemplates
{
  class ActOnStart
  {
    onPlayerKilled = "BIS_fnc_respawnMenuPosition";
    respawnOnStart = -1;
  };
};

