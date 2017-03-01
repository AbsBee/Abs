/*** Assignment 1 ***/

/*** Assignment 1.1 ***/
data basketball;
	input shot $ when $ count;
	datalines;
			made season 376
			missed season 331
			made playoff 52
			missed playoff 43
			;
run;

proc freq data=basketball;
	weight count;
	tables when*shot/ chisq riskdiff relrisk;
run;

/*** Assignment 1.2 ***/
data coin_count;
	input Outcomes $ Count;
	datalines;
			heads 5067
			tails 4933
 			;
run;

proc freq data=coin_count;
	tables Count/chisq testp=(50 50);
	weight Count;
run;

data coin_smallcount;
	input Outcomes $ Count;
	datalines;
			heads 30
			tails 20
 			;
run;

proc freq data=coin_smallcount;
	tables Count/chisq testp=(50 50);
	weight Count;
run;

data coin_Largecount;
	input Outcomes $ Count;
	datalines;
			heads 251000 
			tails 249000
 			;
run;

proc freq data=coin_Largecount;
	tables Count/chisq testp=(50 50);
	weight Count;
run;