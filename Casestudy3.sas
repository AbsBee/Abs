/*** Case Study 3 ***/

/*** Lodaing Data ***/

libname REFFILE '/folders/myfolders/sasuser.v94/AdvstatsAssign';

data data_priority;
	set reffile.priority;
run;


