﻿#define PRETAG grad
#define INTTAG bis  
#define DOUSET(se1,se2) se1##_##se2
#define TRISET(se1,se2,se3) se1##_##se2##_##se3
#define SFUNC(se1) TRISET(PRETAG,fnc,se1)
#define IFUNC(se1) TRISET(INTTAG,fnc,se1)
#define CPORT DOUSET(fwm,comport)
#define CNAME(se1) #DOUSET(PRETAG,se1)
