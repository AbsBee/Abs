/*** Assignment 2 ***/

/*** Reading the file ***/

libname price '/folders/myfolders/sasuser.v94/AdvstatsAssign/';

data price.price_quote;
	set price.price;
run;

/*** T - Test ***/

proc ttest data=price.price_quote;
	paired barry_price*mary_price;
run;