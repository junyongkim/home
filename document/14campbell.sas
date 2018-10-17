/****************************************************************************************************
2014-1 Studies in Portfolio Management Assignment 1
Replication of Campbell et al. (2001,JF)
This program is entirely written by Junyong Kim.
Contact: junyongkim@snu.ac.kr, http://www.junyongkim.com/
****************************************************************************************************/

/****************************************************************************************************
Two reference papers are below.
¡Ü Campbell, Lettau, Malkiel and Xu, 2001, Journal of Finance, vol. 56, no. 1, pp. 1-43
¡Ü Fama and French, 1997, Journal of Financial Economics, vol. 43, no. 2, pp. 153-193
****************************************************************************************************/

resetline;
ods html close;
ods graphics off;
ods listing;

libname pfomgmt "C:\SAS\20140403";

/****************************************************************************************************
The library "pfomgmt" should contain below datasets, initially.
¡Ü _01_raw_data.sas7bdat (q56d9d3ea5f23a829_sas7bdat.zip)
¡Ü _02_t_bill_rate.sas7bdat (q7589a1bc80166eb6_sas7bdat.zip)
¡Ü _05_size_1962_6.sas7bdat (qd395ee2de35c4d9f_sas7bdat.zip)
****************************************************************************************************/

proc sort data=pfomgmt._01_raw_data(keep=date) out=pfomgmt._03_trade_day;
	by DATE;
run;

data pfomgmt._03_trade_day;
	set pfomgmt._03_trade_day;
	by DATE;
	if first.DATE;
	YEAR=year(DATE);
	MONTH=month(DATE);
run;

proc means data=pfomgmt._03_trade_day noprint;
	var DATE;
	by YEAR MONTH;
	output out=pfomgmt._03_trade_day(keep=YEAR MONTH _FREQ_ rename=(_FREQ_=NDAY)) n=NOBS;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._02_t_bill_rate;
	set pfomgmt._02_t_bill_rate;
	YEAR=year(CALDT);
	MONTH=month(CALDT);
run;

data pfomgmt._02_t_bill_rate;
	merge pfomgmt._02_t_bill_rate pfomgmt._03_trade_day;
	by YEAR MONTH;
	RFDAILY=T30RET/NDAY;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._04_value_weight;
	set pfomgmt._01_raw_data(keep=PERMNO DATE PRC SHROUT);
	YEAR=year(DATE);
	MONTH=month(DATE);
	SIZE=abs(PRC)*SHROUT;
run;

data pfomgmt._04_value_weight;
	set pfomgmt._04_value_weight;
	by PERMNO YEAR MONTH DATE;
	if last.MONTH;
run;

data pfomgmt._04_value_weight;
	set pfomgmt._04_value_weight;
	by PERMNO YEAR MONTH DATE;
	SIZE1=lag1(SIZE);
	if first.PERMNO then SIZE1=.;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._05_size_1962_6;
	set pfomgmt._05_size_1962_6;
	YEAR=year(DATE);
	MONTH=month(DATE)+1;
	SIZE2=abs(PRC)*SHROUT;
run;

data pfomgmt._05_size_1962_6;
	set pfomgmt._05_size_1962_6;
	by PERMNO YEAR MONTH DATE;
	if last.MONTH;
	keep PERMNO YEAR MONTH SIZE2;
run;

data pfomgmt._04_value_weight;
	merge pfomgmt._04_value_weight pfomgmt._05_size_1962_6;
	by PERMNO YEAR MONTH;
	if SIZE1=. and SIZE2^=. then SIZE1=SIZE2;
	keep PERMNO YEAR MONTH SIZE1;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._06_value_return;
	set pfomgmt._01_raw_data(keep=PERMNO DATE SICCD RET);
	YEAR=year(DATE);
	MONTH=month(DATE);
run;

data pfomgmt._06_value_return;
	merge pfomgmt._06_value_return pfomgmt._04_value_weight;
	by PERMNO YEAR MONTH;
run;

proc sort data=pfomgmt._06_value_return;
	by DATE PERMNO;
run;

proc means data=pfomgmt._06_value_return noprint;
	var RET;
	weight SIZE1;
	by DATE;
	where SIZE1^=.;
	output out=pfomgmt._06_value_return mean=RMDAILY;
run;

data pfomgmt._06_value_return;
	set pfomgmt._06_value_return(keep=DATE RMDAILY);
	where DATE^=.;
	YEAR=year(DATE);
	MONTH=month(DATE);
	label RMDAILY=;
run;

data pfomgmt._06_value_return;
	merge pfomgmt._06_value_return pfomgmt._02_t_bill_rate(keep=YEAR MONTH RFDAILY);
	by YEAR MONTH;
	ERMDAILY=RMDAILY-RFDAILY;
run;

/****************************************************************************************************
Individual stocks are grouped with the classification proposed by Fama and French (1997,JFE).
****************************************************************************************************/

data pfomgmt._07_industry;
	set pfomgmt._01_raw_data(keep=PERMNO DATE SICCD RET);
	by PERMNO DATE;
	YEAR=year(DATE);
	MONTH=month(DATE);
	if SICCD^=. then INDCD=49;
	if 100<=SICCD<=799 or 2048<=SICCD<=2048 then INDCD=1;
	if 2000<=SICCD<=2046 or 2050<=SICCD<=2063 or 2070<=SICCD<=2079 or 2090<=SICCD<=2095 or 2098<=SICCD<=2099 then INDCD=2;
	if 2064<=SICCD<=2068 or 2086<=SICCD<=2087 or 2096<=SICCD<=2097 then INDCD=3;
	if 2080<=SICCD<=2085 then INDCD=4;
	if 2100<=SICCD<=2199 then INDCD=5;
	if 900<=SICCD<=999 or 3650<=SICCD<=3652 or 3732<=SICCD<=3732 or 3930<=SICCD<=3949 then INDCD=6;
	if 7800<=SICCD<=7841 or 7900<=SICCD<=7999 then INDCD=7;
	if 2700<=SICCD<=2749 or 2770<=SICCD<=2799 then INDCD=8;
	if 2047<=SICCD<=2047 or 2391<=SICCD<=2392 or 2510<=SICCD<=2519 or 2590<=SICCD<=2599 or 2840<=SICCD<=2844 or 3160<=SICCD<=3199 or 3229<=SICCD<=3231 or 3260<=SICCD<=3260 or 3262<=SICCD<=3263 then INDCD=9;
	if 3269<=SICCD<=3269 or 3630<=SICCD<=3239 or 3750<=SICCD<=3751 or 3800<=SICCD<=3800 or 3860<=SICCD<=3879 or 3910<=SICCD<=3919 or 3960<=SICCD<=3961 or 3991<=SICCD<=3991 or 3995<=SICCD<=3995 then INDCD=9;
	if 2300<=SICCD<=2390 or 3020<=SICCD<=3021 or 3100<=SICCD<=3111 or 3130<=SICCD<=3159 or 3965<=SICCD<=3965 then INDCD=10;
	if 8000<=SICCD<=8099 then INDCD=11;
	if 3693<=SICCD<=3693 or 3840<=SICCD<=3851 then INDCD=12;
	if 2830<=SICCD<=2836 then INDCD=13;
	if 2800<=SICCD<=2829 or 2850<=SICCD<=2899 then INDCD=14;
	if 3000<=SICCD<=3000 or 3050<=SICCD<=3099 then INDCD=15;
	if 2200<=SICCD<=2295 or 2297<=SICCD<=2299 or 2393<=SICCD<=2395 or 2397<=SICCD<=2399 then INDCD=16;
	if 800<=SICCD<=899 or 2400<=SICCD<=2439 or 2450<=SICCD<=2459 or 2490<=SICCD<=2499 or 2950<=SICCD<=2952 or 3200<=SICCD<=3219 or 3240<=SICCD<=3259 or 3261<=SICCD<=3261 or 3264<=SICCD<=3264 then INDCD=17;
	if 3270<=SICCD<=3299 or 3420<=SICCD<=3442 or 3446<=SICCD<=3452 or 3490<=SICCD<=3499 or 3996<=SICCD<=3996 then INDCD=17;
	if 1500<=SICCD<=1549 or 1600<=SICCD<=1699 or 1700<=SICCD<=1799 then INDCD=18;
	if 3300<=SICCD<=3369 or 3390<=SICCD<=3399 then INDCD=19;
	if 3400<=SICCD<=3400 or 3443<=SICCD<=3444 or 3460<=SICCD<=3479 then INDCD=20;
	if 3510<=SICCD<=3536 or 3540<=SICCD<=3569 or 3580<=SICCD<=3599 then INDCD=21;
	if 3600<=SICCD<=3621 or 3623<=SICCD<=3629 or 3640<=SICCD<=3646 or 3648<=SICCD<=3649 or 3660<=SICCD<=3660 or 3691<=SICCD<=3692 or 3699<=SICCD<=3699 then INDCD=22;
	if 3900<=SICCD<=3900 or 3990<=SICCD<=3990 or 3999<=SICCD<=3999 or 9900<=SICCD<=9999 then INDCD=23;
	if 2296<=SICCD<=2296 or 2396<=SICCD<=2396 or 3010<=SICCD<=3011 or 3537<=SICCD<=3537 or 3647<=SICCD<=3647 or 3694<=SICCD<=3694 or 3700<=SICCD<=3716 or 3790<=SICCD<=3792 or 3799<=SICCD<=3799 then INDCD=24;
	if 3720<=SICCD<=3729 then INDCD=25;
	if 3730<=SICCD<=3731 or 3740<=SICCD<=3743 then INDCD=26;
	if 3480<=SICCD<=3489 or 3760<=SICCD<=3769 or 3795<=SICCD<=3795 then INDCD=27;
	if 1040<=SICCD<=1049 then INDCD=28;
	if 1000<=SICCD<=1039 or 1060<=SICCD<=1099 or 1400<=SICCD<=1499 then INDCD=29;
	if 1200<=SICCD<=1299 then INDCD=30;
	if 1310<=SICCD<=1389 or 2900<=SICCD<=2911 or 2990<=SICCD<=2999 then INDCD=31;
	if 4900<=SICCD<=4999 then INDCD=32;
	if 4800<=SICCD<=4899 then INDCD=33;
	if 7020<=SICCD<=7021 or 7030<=SICCD<=7039 or 7200<=SICCD<=7212 or 7215<=SICCD<=7299 or 7395<=SICCD<=7395 or 7500<=SICCD<=7500 or 7520<=SICCD<=7549 or 7600<=SICCD<=7699 or 8100<=SICCD<=8199 then INDCD=34;
	if 8200<=SICCD<=8299 or 8300<=SICCD<=8399 or 8400<=SICCD<=8499 or 8600<=SICCD<=8699 or 8800<=SICCD<=8899 then INDCD=34;
	if 2750<=SICCD<=2759 or 3993<=SICCD<=3993 or 7300<=SICCD<=7372 or 7374<=SICCD<=7394 or 7397<=SICCD<=7397 or 7399<=SICCD<=7399 or 7510<=SICCD<=7519 or 8700<=SICCD<=8748 or 8900<=SICCD<=8999 then INDCD=35;
	if 3570<=SICCD<=3579 or 3680<=SICCD<=3689 or 3695<=SICCD<=3695 or 7373<=SICCD<=7375 then INDCD=36;
	if 3622<=SICCD<=3622 or 3661<=SICCD<=3679 or 3810<=SICCD<=3810 or 3812<=SICCD<=3812 then INDCD=37;
	if 3811<=SICCD<=3811 or 3820<=SICCD<=3830 then INDCD=38;
	if 2520<=SICCD<=2549 or 2600<=SICCD<=2639 or 2670<=SICCD<=2699 or 2760<=SICCD<=2761 or 3950<=SICCD<=3955 then INDCD=39;
	if 2440<=SICCD<=2449 or 2640<=SICCD<=2659 or 3210<=SICCD<=3221 or 3410<=SICCD<=3412 then INDCD=40;
	if 4000<=SICCD<=4099 or 4100<=SICCD<=4199 or 4200<=SICCD<=4299 or 4400<=SICCD<=4499 or 4500<=SICCD<=4599 or 4600<=SICCD<=4699 or 4700<=SICCD<=4799 then INDCD=41;
	if 5000<=SICCD<=5099 or 5100<=SICCD<=5199 then INDCD=42;
	if 5200<=SICCD<=5299 or 5300<=SICCD<=5399 or 5400<=SICCD<=5499 or 5500<=SICCD<=5599 or 5600<=SICCD<=5699 or 5700<=SICCD<=5736 or 5900<=SICCD<=5999 then INDCD=43;
	if 5800<=SICCD<=5813 or 5890<=SICCD<=5890 or 7000<=SICCD<=7019 or 7040<=SICCD<=7049 or 7213<=SICCD<=7213 then INDCD=44;
	if 6000<=SICCD<=6099 or 6100<=SICCD<=6199 then INDCD=45;
	if 6300<=SICCD<=6399 or 6400<=SICCD<=6411 then INDCD=46;
	if 6500<=SICCD<=6553 then INDCD=47;
	if 6200<=SICCD<=6299 or 6700<=SICCD<=6799 then INDCD=48;
run;

data pfomgmt._11_firm;
	set pfomgmt._07_industry;
run;

data pfomgmt._07_industry;
	merge pfomgmt._07_industry pfomgmt._04_value_weight;
	by PERMNO YEAR MONTH;
run;

proc sort data=pfomgmt._07_industry;
	by INDCD DATE PERMNO;
run;

proc means data=pfomgmt._07_industry noprint;
	var SIZE1;
	by INDCD DATE;
	where SIZE1^=.;
	output out=pfomgmt._10_ind_size sum=INDSIZE1;
run;

data pfomgmt._10_ind_size;
	set pfomgmt._10_ind_size;
	where INDCD^=.;
	YEAR=year(DATE);
	MONTH=month(DATE);
run;

data pfomgmt._10_ind_size;
	set pfomgmt._10_ind_size;
	by INDCD YEAR MONTH DATE;
	if last.MONTH;
run;

proc means data=pfomgmt._07_industry noprint;
	var RET;
	weight SIZE1;
	by INDCD DATE;
	where SIZE1^=.;
	output out=pfomgmt._07_industry mean=RINDDAILY;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._07_industry;
	set pfomgmt._07_industry(drop=_TYPE_ rename=(_FREQ_=NIND));
	where INDCD^=.;
	label RINDDAILY=;
run;

proc means data=pfomgmt._06_value_return noprint;
	var ERMDAILY;
	by YEAR MONTH;
	output out=pfomgmt._08_mkt css=MKT;
run;

data pfomgmt._08_mkt;
	set pfomgmt._08_mkt(drop=_TYPE_ _FREQ_);
	if MONTH^=12 then DATE=mdy(MONTH+1,1,YEAR)-1;
	else DATE=mdy(1,1,YEAR+1)-1;
	format DATE yymmddn8.;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._09_ind;
	set pfomgmt._07_industry;
	YEAR=year(DATE);
	MONTH=month(DATE);
run;

proc sort data=pfomgmt._09_ind;
	by YEAR MONTH DATE INDCD;
run;

data pfomgmt._09_ind;
	merge pfomgmt._09_ind pfomgmt._06_value_return(keep=DATE RMDAILY);
	by DATE;
	EERINDDAILY=RINDDAILY-RMDAILY;
run;

/****************************************************************************************************
****************************************************************************************************/

proc sort data=pfomgmt._09_ind;
	by INDCD DATE;
run;

proc means data=pfomgmt._09_ind noprint;
	var EERINDDAILY;
	by INDCD YEAR MONTH;
	output out=pfomgmt._09_ind uss=IND;
run;

data pfomgmt._09_ind;
	merge pfomgmt._09_ind pfomgmt._10_ind_size(keep=INDCD YEAR MONTH INDSIZE1);
	by INDCD YEAR MONTH;
run;

proc sort data=pfomgmt._09_ind;
	by YEAR MONTH INDCD;
run;

proc means data=pfomgmt._09_ind noprint;
	var IND;
	weight INDSIZE1;
	by YEAR MONTH;
	output out=pfomgmt._09_ind mean=IND;
run;

data pfomgmt._09_ind;
	set pfomgmt._09_ind(drop=_TYPE_ _FREQ_);
	if MONTH^=12 then DATE=mdy(MONTH+1,1,YEAR)-1;
	else DATE=mdy(1,1,YEAR+1)-1;
	format DATE yymmddn8.;
run;

/****************************************************************************************************
****************************************************************************************************/

proc sort data=pfomgmt._11_firm;
	by INDCD DATE PERMNO;
run;

data pfomgmt._11_firm;
	merge pfomgmt._11_firm pfomgmt._07_industry;
	by INDCD DATE;
	if RET^=. then EERFIRMDAILY=RET-RINDDAILY;
run;

data pfomgmt._11_firm;
	set pfomgmt._11_firm;
	if RET^=. then EERFIRMDAILY=RET-RINDDAILY;
run;

proc sort data=pfomgmt._11_firm;
	by PERMNO DATE;
run;

proc means data=pfomgmt._11_firm noprint;
	var EERFIRMDAILY;
	by PERMNO YEAR MONTH;
	id INDCD;
	output out=pfomgmt._11_firm(drop=_TYPE_ _FREQ_) uss=FIRM;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._11_firm;
	merge pfomgmt._11_firm pfomgmt._04_value_weight;
	by PERMNO YEAR MONTH;
run;

proc sort data=pfomgmt._11_firm;
	by INDCD YEAR MONTH PERMNO;
run;

proc means data=pfomgmt._11_firm noprint;
	var FIRM;
	weight SIZE1;
	by INDCD YEAR MONTH;
	where SIZE1^=.;
	output out=pfomgmt._11_firm mean=FIRM;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._11_firm;
	merge pfomgmt._11_firm pfomgmt._10_ind_size(keep=INDCD YEAR MONTH INDSIZE1);
	by INDCD YEAR MONTH;
run;

proc sort data=pfomgmt._11_firm;
	by YEAR MONTH INDCD;
run;

proc means data=pfomgmt._11_firm noprint;
	var FIRM;
	weight INDSIZE1;
	by YEAR MONTH;
	where INDSIZE1^=. and _FREQ_>1;
	output out=pfomgmt._11_firm(drop=_TYPE_ _FREQ_) mean=FIRM;
run;

data pfomgmt._11_firm;
	set pfomgmt._11_firm;
	if MONTH^=12 then DATE=mdy(MONTH+1,1,YEAR)-1;
	else DATE=mdy(1,1,YEAR+1)-1;
	format DATE yymmddn8.;
run;

/****************************************************************************************************
****************************************************************************************************/

data pfomgmt._12_result;
	retain DATE MKT IND FIRM;
	merge pfomgmt._08_mkt pfomgmt._09_ind pfomgmt._11_firm;
	by DATE;
	MKT12=(MKT+lag1(MKT)+lag2(MKT)+lag3(MKT)+lag4(MKT)+lag5(MKT)+lag6(MKT)+lag7(MKT)+lag8(MKT)+lag9(MKT)+lag10(MKT)+lag11(MKT))/12;
	IND12=(IND+lag1(IND)+lag2(IND)+lag3(IND)+lag4(IND)+lag5(IND)+lag6(IND)+lag7(IND)+lag8(IND)+lag9(IND)+lag10(IND)+lag11(IND))/12;
	FIRM12=(FIRM+lag1(FIRM)+lag2(FIRM)+lag3(FIRM)+lag4(FIRM)+lag5(FIRM)+lag6(FIRM)+lag7(FIRM)+lag8(FIRM)+lag9(FIRM)+lag10(FIRM)+lag11(FIRM))/12;
	keep DATE MKT IND FIRM MKT12 IND12 FIRM12;
	format DATE yymmdd10.;
run;

proc export data=pfomgmt._12_result outfile="C:\SAS\20140403\pfomgmt.csv" dbms=csv replace;
run;

quit;
