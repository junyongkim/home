resetline;
ods html close;
ods graphics off;
ods listing;

%let NSAMPLE=1000;
%let SIGMAX=1;
%let SIGMAEPS=2;

%macro FIRMEFFECT(INDS=,TIMES=,START=,FINISH=,INTERVAL=);

%do SOURCEX=&START. %to &FINISH. %by &INTERVAL.;

%do SOURCEEPS=&START. %to &FINISH. %by &INTERVAL.;

proc printto;
run;

%put INDS=&INDS. TIMES=&TIMES. SOURCEX=0.&SOURCEX. SOURCE¥å=0.&SOURCEEPS.;

proc printto log="nul:";
run;

data _01;
	do SAMPLE=1 to &NSAMPLE.;
	do IND=1 to &INDS.;
		MU=&SIGMAX.*sqrt(0.&SOURCEX.)*rannor(1);
		GAMMA=&SIGMAEPS.*sqrt(0.&SOURCEEPS.)*rannor(2);
		do TIME=1 to &TIMES.;
			X=MU+&SIGMAX.*sqrt(1-0.&SOURCEX.)*rannor(3);
			EPS=GAMMA+&SIGMAEPS.*sqrt(1-0.&SOURCEEPS.)*rannor(4);
			Y=X+EPS;
			output;
		end;
	end;
	end;
run;

proc reg noprint outest=_02 tableout;
	model Y=X/noint;
	by SAMPLE;
run;

proc transpose out=_02(rename=(COL1=BETAOLS COL2=SEOLS));
	var X;
	by SAMPLE;
	where _TYPE_ in ("PARMS","STDERR");
run;

ods listing close;
ods results off;
ods output parameterestimates=_03;

proc surveyreg data=_01;
	model Y=X/noint;
	cluster IND;
	by SAMPLE;
run;

ods listing;
ods results on;

proc sort data=_01;
	by SAMPLE TIME IND;
run;

proc reg noprint outest=_04;
	model Y=X/noint;
	by SAMPLE TIME;
run;

proc means noprint;
	var X;
	by SAMPLE;
	output out=_05 mean=BETAFM stderr=SEFM;
run;

data _02;
	merge _02 _03(where=(Parameter="X")) _05;
	by SAMPLE;
	TOLS=(BETAOLS-1)/SEOLS;
	SIGTOLS=(abs(TOLS)>2.58);
	SEC=StdErr;
	TC=(BETAOLS-1)/SEC;
	SIGTC=(abs(TC)>2.58);
	TFM=(BETAFM-1)/SEFM;
	SIGTFM=(abs(TFM)>2.58);
	keep SAMPLE BETAOLS SEOLS TOLS SIGTOLS SEC TC SIGTC BETAFM SEFM TFM SIGTFM;
run;

proc means data=_02 noprint;
	var BETAOLS SEOLS SIGTOLS SEC SIGTC BETAFM SEFM SIGTFM;
	output out=_06
		mean=BETAOLS SEOLS SIGTOLS SEC SIGTC BETAFM SEFM SIGTFM
		std=S_BETAOLS S_SEOLS S_SIGTOLS S_SEC S_SIGTC S_BETAFM S_SEFM S_SIGTFM;
run;

%if &SOURCEX.=50 and &SOURCEEPS.=50 and &INTERVAL.=25 %then %do;

goptions xpixels=800 ypixels=400 border;
title "Figure 2";

proc univariate data=_02;
	var TOLS TC TFM;
	histogram/normal(mu=0 sigma=1) midpoints=-7 to 7 vaxislabel="Percentile";
run;

goptions;
title "The SAS System";

%end;

data _06;
	retain BETAOLS S_BETAOLS BETAFM S_BETAFM;
	set _06;
	UNDEROLS=1-SEOLS/S_BETAOLS;
	UNDERC=1-SEC/S_BETAOLS;
	UNDERFM=1-SEFM/S_BETAFM;
	INDS=&INDS.;
	TIMES=&TIMES.;
	SOURCEX=0.&SOURCEX.;
	SOURCEEPS=0.&SOURCEEPS.;
run;

proc append base=_07 data=_06;
run;

%end;

%end;

%mend;

/**/

proc printto log="nul:";
run;

%FIRMEFFECT(INDS=500,TIMES=10,START=0,FINISH=75,INTERVAL=25);

proc printto;
run;

proc transpose out=_03;
	var BETAOLS--UNDERFM;
	by INDS TIMES SOURCEX SOURCEEPS;
run;

title "Table 1";

proc print noobs;
	var _NAME_ COL1;
	where TIMES=10 and _NAME_ in ("BETAOLS","S_BETAOLS","SEOLS","SIGTOLS","SEC","SIGTC");
	by SOURCEX SOURCEEPS;
	format COL1 8.4;
run;

title "Table 2";

proc print noobs;
	var _NAME_ COL1;
	where TIMES=10 and _NAME_ in ("BETAFM","S_BETAFM","SEFM","SIGTFM");
	by SOURCEX SOURCEEPS;
	format COL1 8.4;
run;

title "The SAS System";

proc sql;
	create table _A01_02 as select * from _02;
	create table _A01_03 as select * from _03;
	drop table _07;
quit;

/**/

proc printto log="nul:";
run;

%FIRMEFFECT(INDS=1000,TIMES=5,START=50,FINISH=50,INTERVAL=1);
%FIRMEFFECT(INDS=500,TIMES=10,START=50,FINISH=50,INTERVAL=1);
%FIRMEFFECT(INDS=250,TIMES=20,START=50,FINISH=50,INTERVAL=1);
%FIRMEFFECT(INDS=125,TIMES=40,START=50,FINISH=50,INTERVAL=1);
%FIRMEFFECT(INDS=100,TIMES=50,START=50,FINISH=50,INTERVAL=1);

proc printto;
run;

goptions xpixels=800 ypixels=600 border;
title "Figure 3";
symbol i=join v=circle;
legend position=(bottom center outside) frame;

proc gplot;
	plot UNDEROLS*TIMES UNDERC*TIMES UNDERFM*TIMES/overlay legend=legend1;
run;

goptions;
title "The SAS System";
symbol;
legend;

proc sql;
	create table _A02_02 as select * from _02;
	create table _A02_07 as select * from _07;
	drop table _01,_02,_03,_04,_05,_06,_07;
quit;

/**/

proc printto log="nul:";
run;

%FIRMEFFECT(INDS=500,TIMES=10,START=25,FINISH=25,INTERVAL=1);

proc printto;
run;

proc sort data=_01;
	by SAMPLE IND TIME;
run;

%macro NEWEYWEST;

%do NWLAG=0 %to 9;

proc printto;
run;

%put NWLAG=&NWLAG.;

proc printto log="nul:";
run;

ods listing close;
ods results off;
ods output parameterestimates=_08;

proc model data=_01;
	Y=BETA0+BETA1*X;
	parameters BETA0 BETA1;
	fit Y/gmm kernel=(bart,%eval(&NWLAG.+1),0) vardef=n;
	by SAMPLE;
run;

ods listing;
ods results on;

proc sql;
	create table _08 as
	select &NWLAG. as NWLAG,SAMPLE,StdErr as SENW label=""
	from _08(where=(Parameter="BETA1"));
quit;

proc append base=_09 data=_08;
run;

%end;

%mend;

proc printto log="nul:";
run;

%NEWEYWEST;

proc printto;
run;

proc means noprint;
	var SENW;
	by NWLAG;
	output out=_10 mean=SENW;
run;

proc sql;
	create table _03 as
	select NWLAG,S_BETAOLS+1e-4 as S_BETAOLS,SEOLS,SEC-1e-4 as SEC,SENW
	from _06,_10
	where _06._TYPE_=_10._TYPE_;
quit;

goptions xpixels=800 ypixels=600 border;
title "Figure 4";
symbol i=join v=circle;
legend position=(bottom center outside) frame;

proc gplot;
	plot S_BETAOLS*NWLAG SEOLS*NWLAG SEC*NWLAG SENW*NWLAG/overlay legend=legend1;
run;

goptions;
title "The SAS System";
symbol;
legend;

proc sql;
	create table _A03_03 as select * from _03;
	create table _A03_09 as select * from _09;
	drop table _01,_02,_03,_04,_05,_06,_07,_08,_09,_10;
quit;

/**/

%macro TIMEEFFECT(INDS=,TIMES=,START=,FINISH=,INTERVAL=);

%do SOURCEX=&START. %to &FINISH. %by &INTERVAL.;

%do SOURCEEPS=&START. %to &FINISH. %by &INTERVAL.;

proc printto;
run;

%put INDS=&INDS. TIMES=&TIMES. SOURCEX=0.&SOURCEX. SOURCE¥å=0.&SOURCEEPS.;

proc printto log="nul:";
run;

data _01;
	do SAMPLE=1 to &NSAMPLE.;
	do TIME=1 to &TIMES.;
		ZETA=&SIGMAX.*sqrt(0.&SOURCEX.)*rannor(1);
		DELTA=&SIGMAEPS.*sqrt(0.&SOURCEEPS.)*rannor(2);
		do IND=1 to &INDS.;
			X=ZETA+&SIGMAX.*sqrt(1-0.&SOURCEX.)*rannor(3);
			EPS=DELTA+&SIGMAEPS.*sqrt(1-0.&SOURCEEPS.)*rannor(4);
			Y=X+EPS;
			output;
		end;
	end;
	end;
run;

proc reg noprint outest=_02 tableout;
	model Y=X/noint;
	by SAMPLE;
run;

proc transpose out=_02(rename=(COL1=BETAOLS COL2=SEOLS));
	var X;
	by SAMPLE;
	where _TYPE_ in ("PARMS","STDERR");
run;

ods listing close;
ods results off;
ods output parameterestimates=_03;

proc surveyreg data=_01;
	model Y=X/noint;
	cluster TIME;
	by SAMPLE;
run;

ods listing;
ods results on;

proc reg noprint data=_01 outest=_04;
	model Y=X/noint;
	by SAMPLE TIME;
run;

proc means noprint;
	var X;
	by SAMPLE;
	output out=_05 mean=BETAFM stderr=SEFM;
run;

data _02;
	merge _02 _03(where=(Parameter="X")) _05;
	by SAMPLE;
	TOLS=(BETAOLS-1)/SEOLS;
	SIGTOLS=(abs(TOLS)>2.58);
	SEC=StdErr;
	TC=(BETAOLS-1)/SEC;
	SIGTC=(abs(TC)>2.58);
	TFM=(BETAFM-1)/SEFM;
	SIGTFM=(abs(TFM)>2.58);
	keep SAMPLE BETAOLS SEOLS TOLS SIGTOLS SEC TC SIGTC BETAFM SEFM TFM SIGTFM;
run;

proc means data=_02 noprint;
	var BETAOLS SEOLS SIGTOLS SEC SIGTC BETAFM SEFM SIGTFM;
	output out=_06
		mean=BETAOLS SEOLS SIGTOLS SEC SIGTC BETAFM SEFM SIGTFM
		std=S_BETAOLS S_SEOLS S_SIGTOLS S_SEC S_SIGTC S_BETAFM S_SEFM S_SIGTFM;
run;

%if &SOURCEX.=50 and &SOURCEEPS.=50 and &INTERVAL.=25 %then %do;

goptions xpixels=800 ypixels=400 border;
title "Figure 2";

proc univariate data=_02;
	var TOLS;
	histogram/normal(mu=0 sigma=1) midpoints=-50 to 50 by 5 vaxislabel="Percentile";
run;

proc univariate data=_02;
	var TC TFM;
	histogram/normal(mu=0 sigma=1) midpoints=-6 to 6 vaxislabel="Percentile";
run;

goptions;
title "The SAS System";

%end;

data _06;
	retain BETAOLS S_BETAOLS BETAFM S_BETAFM;
	set _06;
	UNDEROLS=1-SEOLS/S_BETAOLS;
	UNDERC=1-SEC/S_BETAOLS;
	UNDERFM=1-SEFM/S_BETAFM;
	INDS=&INDS.;
	TIMES=&TIMES.;
	SOURCEX=0.&SOURCEX.;
	SOURCEEPS=0.&SOURCEEPS.;
run;

proc append base=_07 data=_06;
run;

%end;

%end;

%mend;

/**/

proc printto log="nul:";
run;

%TIMEEFFECT(INDS=500,TIMES=10,START=0,FINISH=75,INTERVAL=25);

proc printto;
run;

proc transpose out=_03;
	var BETAOLS--UNDERFM;
	by INDS TIMES SOURCEX SOURCEEPS;
run;

title "Table 3";

proc print noobs;
	var _NAME_ COL1;
	where TIMES=10 and _NAME_ in ("BETAOLS","S_BETAOLS","SEOLS","SIGTOLS","SEC","SIGTC");
	by SOURCEX SOURCEEPS;
	format COL1 8.4;
run;

title "Table 4";

proc print noobs;
	var _NAME_ COL1;
	where TIMES=10 and _NAME_ in ("BETAFM","S_BETAFM","SEFM","SIGTFM");
	by SOURCEX SOURCEEPS;
	format COL1 8.4;
run;

title "The SAS System";

proc sql;
	create table _A04_02 as select * from _02;
	create table _A04_03 as select * from _03;
	drop table _07;
quit;
