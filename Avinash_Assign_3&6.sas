/*Assignment 3*/ 

FILENAME REFFILE '/folders/myfolders/class/priority.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=class.priority;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=class.priority; RUN;


proc anova data=class.priority;
TITLE 'One WAY ANOVA';
	CLASS priority;
	MODEL days=priority;
	MEANS priority /LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;
	
/*Assignment 6*/
 
FILENAME REFFILE '/folders/myfolders/Avinash/backgammon.csv';

PROC IMPORT DATAFILE=REFFILE
	DBMS=CSV
	OUT=class.backam;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=class.backam; RUN;

proc anova data=class.backam;
TITLE 'One WAY ANOVA';
	CLASS year;
	MODEL score=year;
	MEANS year /LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;
