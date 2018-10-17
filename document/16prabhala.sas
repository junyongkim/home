resetline;
ods html close;
ods graphics off;
ods listing;

data _01;
	do EP=.25 to .5 by .25;
	do W=.25 to .75 by .25;
	do N=1 to 1000;
	X2=100*ranuni(1);
	if EP=.25 then X1=1.75+ranuni(2);
	if EP=.5 then X1=1+ranuni(3);
	do S=1 to 400;
		PSI=rannor(4);
		if 1-X1+.01*X2+PSI>=0 then E=1;
		else E=0;
		AR=W*PSI+sqrt(1-W**2)*rannor(5);
		output;
	end;
	end;
	end;
	end;
run;

proc sort;
	by EP W S N;
run;

data _01;
	set _01;
	by EP W S N;
	if first.S then COUNT=0;
	if E=1 then COUNT+1;
run;

/*
proc means n mean maxdec=2;
	var E;
	by EP;
run;
*/

proc probit noprint
	outest=_02(rename=(Intercept=T0 X1=T1 X2=T2));
	model E=X1 X2;
	by EP W S;
	where N<101;
run;

data _02;
	set _02;
	T0=-T0;
	T1=-T1;
	T2=-100*T2;
run;

proc means n mean std maxdec=2;
	var T0 T1 T2;
	by EP W;
run;

data _02;
	set _02;
	T0=-T0;
	T1=-T1;
	T2=-T2/100;
run;

data _01;
	merge _01
		_02(keep=EP W S T0 T1 T2);
	by EP W S;
	if E=1 then do;
		NUM=pdf("normal",-T0-T1*X1-T2*X2);
		D=cdf("normal",-T0-T1*X1-T2*X2);
		L=NUM/D;
	end;
	else do;
		NUM=-pdf("normal",-T0-T1*X1-T2*X2);
		D=1-cdf("normal",-T0-T1*X1-T2*X2);
		L=NUM/D;
	end;
run;

proc reg noprint outest=_02;
	model AR=L/noint;
	by EP W S;
	where N<101;
run;

proc means n mean std maxdec=2;
	var L;
	by EP W;
run;

data _01;
	set _01;
	drop T0-T2 NUM D L;
run;

proc probit noprint
	outest=_02(rename=(Intercept=T0 X1=T1 X2=T2));
	model E=X1 X2;
	by EP W S;
	where N<251;
run;

data _02;
	set _02;
	T0=-T0;
	T1=-T1;
	T2=-100*T2;
run;

proc means n mean std maxdec=2;
	var T0 T1 T2;
	by EP W;
run;

data _02;
	set _02;
	T0=-T0;
	T1=-T1;
	T2=-T2/100;
run;

data _01;
	merge _01
		_02(keep=EP W S T0 T1 T2);
	by EP W S;
	if E=1 then do;
		NUM=pdf("normal",-T0-T1*X1-T2*X2);
		D=cdf("normal",-T0-T1*X1-T2*X2);
		L=NUM/D;
	end;
	else do;
		NUM=-pdf("normal",-T0-T1*X1-T2*X2);
		D=1-cdf("normal",-T0-T1*X1-T2*X2);
		L=NUM/D;
	end;
run;

proc reg noprint outest=_02;
	model AR=L/noint;
	by EP W S;
	where N<251;
run;

proc means n mean std maxdec=2;
	var L;
	by EP W;
run;

proc reg data=_01 noprint
	outest=_02(rename=(Intercept=B0 X1=B1 X2=B2));
	model AR=X1 X2;
	by EP W S;
	where E=1 and COUNT<101;
run;

data _02;
	set _02;
	B2=100*B2;
run;

proc means n mean std maxdec=2;
	var B0-B2;
	by EP W;
run;

proc reg data=_01 noprint
	outest=_02(rename=(Intercept=B0 X1=B1 X2=B2));
	model AR=X1 X2;
	by EP W S;
	where E=1 and COUNT<251;
run;

data _02;
	set _02;
	B2=100*B2;
run;

proc means n mean std maxdec=2;
	var B0-B2;
	by EP W;
run;

quit;
