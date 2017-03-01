/*** Assignment 3 ***/
/*** Assignment 1 ***/
data Trash_bags;
	INPUT Trash $ Weights;
	datalines;
KROGER 34 
KROGER 30 
KROGER 40 
KROGER 38 
KROGER 36 
KROGER 30 
KROGER 30 
KROGER 42 
KROGER 36
KROGER 38 
GLAD 32
GLAD 42
GLAD 34
GLAD 36
GLAD 32
GLAD 40
GLAD 36
GLAD 43
GLAD 30
GLAD 38
HEFTY 33
HEFTY 34
HEFTY 32
HEFTY 40
HEFTY 40
HEFTY 34
HEFTY 36
HEFTY 34
HEFTY 32
HEFTY 34
TUFFSTUFF 26
TUFFSTUFF 18
TUFFSTUFF 20
TUFFSTUFF 15
TUFFSTUFF 20
TUFFSTUFF 20
TUFFSTUFF 17
TUFFSTUFF 18
TUFFSTUFF 19
TUFFSTUFF 20
;
RUN;

PROC ANOVA DATA=trash_bags;
	TITLE 'One Way Anova';
	CLASS Trash;
	MODEL Weights=Trash;
	MEANS Trash/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

	/*** Assignment 2 ***/
data hospital;
	input location $ waiting_time;
	datalines;
Main 120.08
Main 81.90
Main 78.79
Main 63.83
Main 79.77
Main 47.94
Main 79.88
Main 48.63
Main 55.43
Main 64.06
Main 64.99
Main 53.82
Main 62.43
Main 65.07
Main 81.02
1_Satellite 30.75
1_Satellite 61.83
1_Satellite 26.40
1_Satellite 53.84
1_Satellite 72.30
1_Satellite 53.09
1_Satellite 27.67
1_Satellite 52.46
1_Satellite 10.64
1_Satellite 53.50
1_Satellite 37.28
1_Satellite 34.31
1_Satellite 66.00
1_Satellite 8.99
1_Satellite 29.75
2_Satellite 75.86
2_Satellite 37.88
2_Satellite 68.73
2_Satellite 51.08
2_Satellite 50.21
2_Satellite 58.47
2_Satellite 86.29
2_Satellite 62.90
2_Satellite 44.84
2_Satellite 64.17
2_Satellite 50.68
2_Satellite 47.97
2_Satellite 60.57
2_Satellite 58.37
2_Satellite 30.40
3_Satellite 54.05
3_Satellite 38.82
3_Satellite 36.85
3_Satellite 32.83
3_Satellite 52.94
3_Satellite 34.13
3_Satellite 69.37
3_Satellite 78.52
3_Satellite 55.95
3_Satellite 49.61
3_Satellite 66.40
3_Satellite 76.06
3_Satellite 11.37
3_Satellite 83.51
3_Satellite 39.17
;
run;

PROC ANOVA DATA=hospital;
	TITLE 'ONE WAY ANOVA';
	CLASS location;
	MODEL waiting_time=location;
	MEANS location/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

	/*** ASsignment 3 ***/
data wash;
	input Brands $ Cycle $ time;
	datalines;
A 18 0.11
A 20 0.13
A 22 0.17
A 24 0.17
A 18 0.09
A 20 0.13
A 22 0.19
A 24 0.18
B 18 0.12
B 20 0.14
B 22 0.17
B 24 0.19
B 18 0.10
B 20 0.15
B 22 0.18
B 24 0.17
C 18 0.08
C 20 0.16
C 22 0.18
C 24 0.20
C 18 0.09
C 20 0.13
C 22 0.17
C 24 0.16
D 18 0.11
D 20 0.12
D 22 0.16
D 24 0.15
D 18 0.13
D 20 0.13
D 22 0.17
D 24 0.17
;
run;

proc anova data=wash;
	TITLE 'Randomized WAY ANOVA';
	CLASS brands cycle;
	MODEL time=brands cycle brands*cycle;
	MEANS cycle/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

	/*** Assignemnt 4 ***/
data order;
	input Type $ desired_time $ delivery_time;
	datalines;
Continental Early 1.2
Continental Late -2.5
Continental Early 2.1
Continental Late 3.0
Continental Early 3.3
Continental Late -0.2
Continental Early 4.4
Continental Late 1.2
Continental Early 3.4
Continental Late 1.2
Continental Early 5.3
Continental Late 0.7
Continental Early 2.2
Continental Late -1.3
Continental Early 1.0
Continental Late 0.2
Continental Early 5.4
Continental Late -0.5
Continental Early 1.4
Continental Late 3.8
American Early 4.4
American Late 6.0
American Early 1.1
American Late 2.3
American Early 4.8
American Late 4.2
American Early 7.1
American Late 3.8
American Early 6.7
American Late 5.5
American Early 5.6
American Late 1.8
American Early 9.5
American Late 5.1
American Early 4.1
American Late 4.2
American Early 7.9
American Late 4.9
American Early 9.4
American Late 4.0
;
run;

proc anova data=order;
	TITLE 'Two WAY ANOVA';
	CLASS type desired_time;
	MODEL delivery_time=type desired_time type*desired_time;
	MEANS desired_time/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

	/*** Assignment 5 ***/
	/*** Loading Data ***/
	FILENAME REFFILE '/folders/myfolders/sasuser.v94/AdvstatsAssign/Assign5.csv';

PROC IMPORT DATAFILE=REFFILE DBMS=CSV OUT=B_School;
	GETNAMES=YES;
RUN;

PROC CONTENTS DATA=B_School;
RUN;

proc anova data=B_school;
	TITLE 'One WAY ANOVA for Major';
	CLASS major;
	MODEL Satisfaction_Advisement=major;
	MEANS major/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

proc anova data=B_school;
	TITLE 'One WAY ANOVA for Grad_School';
	CLASS Grad_School;
	MODEL GPA=Grad_School;
	MEANS Grad_School/LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;

proc anova data=B_school;
	TITLE 'One WAY ANOVA for Employment Status';
	CLASS Employment_Status;
	MODEL Satisfaction_Advisement=Employment_Status;
	MEANS Employment_Status /LSD TUKEY CLDIFF hovtest=levene ALPHA=.05;
	RUN;