/*** Case Study 6 ***/

/*** Lodaing Data ***/
FILENAME REFFILE 
	'/folders/myfolders/sasuser.v94/AdvstatsAssign/backgammon1.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=back_game;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=back_game;
RUN;

proc anova data=back_game;
	TITLE 'One WAY ANOVA';
	CLASS year;
	MODEL score=year;
	MEANS year /LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;