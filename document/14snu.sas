resetline;
ods html close;
ods graphics off;
ods listing;

%let PATH=C:\SAS\20140923_Seminar;
libname SEMINAR "&PATH.";

/**/

data SEMINAR._20140923_001_RETURN_D;
	infile "&PATH.\20140923_001_수익률_일별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2673 comma20.2;
	input TIME VAR0001-VAR2673;
	format TIME yymmdd10.;
run;

data SEMINAR._20140923_001_RETURN_D_N;
	infile "&PATH.\20140923_001_수익률_일별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2673 $7.;
	input VAR0000-VAR2673;
run;

proc transpose data=SEMINAR._20140923_001_RETURN_D out=SEMINAR._20140923_001_RETURN_D;
	var VAR0001-VAR2673;
	by TIME;
run;

proc transpose data=SEMINAR._20140923_001_RETURN_D_N out=SEMINAR._20140923_001_RETURN_D_N;
	var VAR0001-VAR2673;
run;

proc sort data=SEMINAR._20140923_001_RETURN_D;
	by _NAME_ TIME;
run;

data SEMINAR._20140923_001_RETURN_D;
	retain CODE TIME;
	merge SEMINAR._20140923_001_RETURN_D(rename=(COL1=RETURN))
		SEMINAR._20140923_001_RETURN_D_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140923_001_RETURN_D;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140923_001_RETURN_D_N;
run;

/**/

data SEMINAR._20140923_002_SIZE_D;
	infile "&PATH.\20140923_002_시가총액_일별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2673 comma20.;
	input TIME VAR0001-VAR2673;
	format TIME yymmdd10.;
run;

data SEMINAR._20140923_002_SIZE_D_N;
	infile "&PATH.\20140923_002_시가총액_일별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2673 $7.;
	input VAR0000-VAR2673;
run;

proc transpose data=SEMINAR._20140923_002_SIZE_D out=SEMINAR._20140923_002_SIZE_D;
	var VAR0001-VAR2673;
	by TIME;
run;

proc transpose data=SEMINAR._20140923_002_SIZE_D_N out=SEMINAR._20140923_002_SIZE_D_N;
	var VAR0001-VAR2673;
run;

proc sort data=SEMINAR._20140923_002_SIZE_D;
	by _NAME_ TIME;
run;

data SEMINAR._20140923_002_SIZE_D;
	retain CODE TIME;
	merge SEMINAR._20140923_002_SIZE_D(rename=(COL1=SIZE))
		SEMINAR._20140923_002_SIZE_D_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140923_002_SIZE_D;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140923_002_SIZE_D_N;
run;

/**/

data SEMINAR._20140923_003_RETURN_M;
	infile "&PATH.\20140923_003_수익률_월별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2673 comma20.2;
	input TIME VAR0001-VAR2673;
	format TIME yymmdd10.;
run;

data SEMINAR._20140923_003_RETURN_M_N;
	infile "&PATH.\20140923_003_수익률_월별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2673 $7.;
	input VAR0000-VAR2673;
run;

proc transpose data=SEMINAR._20140923_003_RETURN_M out=SEMINAR._20140923_003_RETURN_M;
	var VAR0001-VAR2673;
	by TIME;
run;

proc transpose data=SEMINAR._20140923_003_RETURN_M_N out=SEMINAR._20140923_003_RETURN_M_N;
	var VAR0001-VAR2673;
run;

proc sort data=SEMINAR._20140923_003_RETURN_M;
	by _NAME_ TIME;
run;

data SEMINAR._20140923_003_RETURN_M;
	retain CODE TIME;
	merge SEMINAR._20140923_003_RETURN_M(rename=(COL1=RETURN))
		SEMINAR._20140923_003_RETURN_M_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140923_003_RETURN_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140923_003_RETURN_M_N;
run;

/**/

data SEMINAR._20140923_004_SIZE_M;
	infile "&PATH.\20140923_004_시가총액_월별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2673 comma20.;
	input TIME VAR0001-VAR2673;
	format TIME yymmdd10.;
run;

data SEMINAR._20140923_004_SIZE_M_N;
	infile "&PATH.\20140923_004_시가총액_월별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2673 $7.;
	input VAR0000-VAR2673;
run;

proc transpose data=SEMINAR._20140923_004_SIZE_M out=SEMINAR._20140923_004_SIZE_M;
	var VAR0001-VAR2673;
	by TIME;
run;

proc transpose data=SEMINAR._20140923_004_SIZE_M_N out=SEMINAR._20140923_004_SIZE_M_N;
	var VAR0001-VAR2673;
run;

proc sort data=SEMINAR._20140923_004_SIZE_M;
	by _NAME_ TIME;
run;

data SEMINAR._20140923_004_SIZE_M;
	retain CODE TIME;
	merge SEMINAR._20140923_004_SIZE_M(rename=(COL1=SIZE))
		SEMINAR._20140923_004_SIZE_M_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140923_004_SIZE_M_N;
run;

/**/

data SEMINAR._20140923_005_VOLUME_M;
	infile "&PATH.\20140923_005_거래대금_월별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2673 comma20.;
	input TIME VAR0001-VAR2673;
	format TIME yymmdd10.;
run;

data SEMINAR._20140923_005_VOLUME_M_N;
	infile "&PATH.\20140923_005_거래대금_월별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2673 $7.;
	input VAR0000-VAR2673;
run;

proc transpose data=SEMINAR._20140923_005_VOLUME_M out=SEMINAR._20140923_005_VOLUME_M;
	var VAR0001-VAR2673;
	by TIME;
run;

proc transpose data=SEMINAR._20140923_005_VOLUME_M_N out=SEMINAR._20140923_005_VOLUME_M_N;
	var VAR0001-VAR2673;
run;

proc sort data=SEMINAR._20140923_005_VOLUME_M;
	by _NAME_ TIME;
run;

data SEMINAR._20140923_005_VOLUME_M;
	retain CODE TIME;
	merge SEMINAR._20140923_005_VOLUME_M(rename=(COL1=VOLUME))
		SEMINAR._20140923_005_VOLUME_M_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140923_005_VOLUME_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140923_005_VOLUME_M_N;
run;

/**/

data SEMINAR._20140924_001_COMCAP_Y;
	infile "&PATH.\20140924_001_보통주자본금_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_001_COMCAP_Y_N;
	infile "&PATH.\20140924_001_보통주자본금_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_001_COMCAP_Y out=SEMINAR._20140924_001_COMCAP_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_001_COMCAP_Y_N out=SEMINAR._20140924_001_COMCAP_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_001_COMCAP_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_001_COMCAP_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_001_COMCAP_Y(rename=(COL1=COMCAP))
		SEMINAR._20140924_001_COMCAP_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_001_COMCAP_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_001_COMCAP_Y_N;
run;

/**/

data SEMINAR._20140924_002_CAPSURP_Y;
	infile "&PATH.\20140924_002_자본잉여금_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_002_CAPSURP_Y_N;
	infile "&PATH.\20140924_002_자본잉여금_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_002_CAPSURP_Y out=SEMINAR._20140924_002_CAPSURP_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_002_CAPSURP_Y_N out=SEMINAR._20140924_002_CAPSURP_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_002_CAPSURP_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_002_CAPSURP_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_002_CAPSURP_Y(rename=(COL1=CAPSURP))
		SEMINAR._20140924_002_CAPSURP_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_002_CAPSURP_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_002_CAPSURP_Y_N;
run;

/**/

data SEMINAR._20140924_003_PROSURP_Y;
	infile "&PATH.\20140924_003_이익잉여금_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_003_PROSURP_Y_N;
	infile "&PATH.\20140924_003_이익잉여금_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_003_PROSURP_Y out=SEMINAR._20140924_003_PROSURP_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_003_PROSURP_Y_N out=SEMINAR._20140924_003_PROSURP_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_003_PROSURP_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_003_PROSURP_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_003_PROSURP_Y(rename=(COL1=PROSURP))
		SEMINAR._20140924_003_PROSURP_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_003_PROSURP_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_003_PROSURP_Y_N;
run;

/**/

data SEMINAR._20140924_004_DEFTAX_Y;
	infile "&PATH.\20140924_004_이연법인세부채_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_004_DEFTAX_Y_N;
	infile "&PATH.\20140924_004_이연법인세부채_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_004_DEFTAX_Y out=SEMINAR._20140924_004_DEFTAX_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_004_DEFTAX_Y_N out=SEMINAR._20140924_004_DEFTAX_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_004_DEFTAX_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_004_DEFTAX_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_004_DEFTAX_Y(rename=(COL1=DEFTAX))
		SEMINAR._20140924_004_DEFTAX_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_004_DEFTAX_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_004_DEFTAX_Y_N;
run;

/**/

data SEMINAR._20140924_005_TREAST_Y;
	infile "&PATH.\20140924_005_자기주식_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_005_TREAST_Y_N;
	infile "&PATH.\20140924_005_자기주식_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_005_TREAST_Y out=SEMINAR._20140924_005_TREAST_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_005_TREAST_Y_N out=SEMINAR._20140924_005_TREAST_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_005_TREAST_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_005_TREAST_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_005_TREAST_Y(rename=(COL1=TREAST))
		SEMINAR._20140924_005_TREAST_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_005_TREAST_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_005_TREAST_Y_N;
run;

/**/

data SEMINAR._20140924_006_DISTING_D;
	infile "&PATH.\20140924_006_시장구분_일별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 $20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_006_DISTING_D_N;
	infile "&PATH.\20140924_006_시장구분_일별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_006_DISTING_D out=SEMINAR._20140924_006_DISTING_D;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_006_DISTING_D_N out=SEMINAR._20140924_006_DISTING_D_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_006_DISTING_D;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_006_DISTING_D;
	retain CODE TIME;
	merge SEMINAR._20140924_006_DISTING_D
		SEMINAR._20140924_006_DISTING_D_N(rename=(COL1=CODE));
	by _NAME_;
	if COL1="KSE" then DISTING=0;
	if COL1="KOSDAQ" then DISTING=1;
	drop COL1 _NAME_;
run;

proc sort data=SEMINAR._20140924_006_DISTING_D;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_006_DISTING_D_N;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140924_006_DISTING_D(rename=(DISTING=TEMP0));
	where TIME="4jan2000"d;
	drop TIME;
run;

data SEMINAR._20140924_006_DISTING_D;
	merge SEMINAR._20140924_006_DISTING_D
		SEMINAR._20140923_001_RETURN_D;
	by CODE TIME;
run;

data SEMINAR._20140924_006_DISTING_D;
	merge SEMINAR._20140924_006_DISTING_D
		SEMINAR._TEMP0;
	by CODE;
	if TIME<"4jan2000"d and DISTING=. and RETURN^=. then DISTING=TEMP0;
	keep CODE TIME DISTING;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

data SEMINAR._20140924_007_VOLUME_D;
	infile "&PATH.\20140924_007_거래대금_일별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_007_VOLUME_D_N;
	infile "&PATH.\20140924_007_거래대금_일별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_007_VOLUME_D out=SEMINAR._20140924_007_VOLUME_D;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_007_VOLUME_D_N out=SEMINAR._20140924_007_VOLUME_D_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_007_VOLUME_D;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_007_VOLUME_D;
	retain CODE TIME;
	merge SEMINAR._20140924_007_VOLUME_D(rename=(COL1=VOLUME))
		SEMINAR._20140924_007_VOLUME_D_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_007_VOLUME_D;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_007_VOLUME_D_N;
run;

/**/

data SEMINAR._20140924_008_TYPE_C;
	retain CODE NAME TYPE MANUFAC;
	infile "&PATH.\20140924_008_업종구분,상장일자,상장폐지일자_횡단면.csv" dsd lrecl=99999 firstobs=7;
	informat CODE $7. NAME $20. TYPE $10. LIST yymmdd8. DELIST yymmdd8.;
	input CODE NAME TYPE LIST DELIST;
	if TYPE="제조업" then MANUFAC=1;
	else MANUFAC=0;
	format LIST yymmdd10.;
	format DELIST yymmdd10.;
run;

proc sort data=SEMINAR._20140924_008_TYPE_C;
	by CODE;
run;

/**/

data SEMINAR._20140924_009_ASSET_Y;
	infile "&PATH.\20140924_009_총자산_연도별.csv" dsd lrecl=99999 firstobs=15;
	informat TIME yymmdd10. VAR0001-VAR2675 comma20.;
	input TIME VAR0001-VAR2675;
	format TIME yymmdd10.;
run;

data SEMINAR._20140924_009_ASSET_Y_N;
	infile "&PATH.\20140924_009_총자산_연도별.csv" dsd lrecl=99999 firstobs=9 obs=9;
	informat VAR0000-VAR2675 $7.;
	input VAR0000-VAR2675;
run;

proc transpose data=SEMINAR._20140924_009_ASSET_Y out=SEMINAR._20140924_009_ASSET_Y;
	var VAR0001-VAR2675;
	by TIME;
run;

proc transpose data=SEMINAR._20140924_009_ASSET_Y_N out=SEMINAR._20140924_009_ASSET_Y_N;
	var VAR0001-VAR2675;
run;

proc sort data=SEMINAR._20140924_009_ASSET_Y;
	by _NAME_ TIME;
run;

data SEMINAR._20140924_009_ASSET_Y;
	retain CODE TIME;
	merge SEMINAR._20140924_009_ASSET_Y(rename=(COL1=ASSET))
		SEMINAR._20140924_009_ASSET_Y_N(rename=(COL1=CODE));
	by _NAME_;
	drop _NAME_;
run;

proc sort data=SEMINAR._20140924_009_ASSET_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _20140924_009_ASSET_Y_N;
run;

/**/

data SEMINAR._20140924_010_BOOKEQ_Y;
	merge SEMINAR._20140924_001_COMCAP_Y
		SEMINAR._20140924_002_CAPSURP_Y
		SEMINAR._20140924_003_PROSURP_Y
		SEMINAR._20140924_004_DEFTAX_Y
		SEMINAR._20140924_005_TREAST_Y;
	by CODE TIME;
	BOOKEQ=sum(COMCAP,CAPSURP,PROSURP,-DEFTAX,TREAST);
	keep CODE TIME BOOKEQ;
run;

/**/

data SEMINAR._20140924_011_SIZE6_Y;
	set SEMINAR._20140923_004_SIZE_M(rename=(SIZE=SIZE6));
	where month(TIME)=6;
run;

/**/

data SEMINAR._20140924_012_BEME_Y;
	set SEMINAR._20140924_010_BOOKEQ_Y;
	TIME=mdy(7,1,year(TIME)+1)-1;
	if year(TIME)<2015;
run;

data SEMINAR._20140924_012_BEME_Y;
	merge SEMINAR._20140924_012_BEME_Y
		SEMINAR._20140924_011_SIZE6_Y(in=A);
	by CODE TIME;
	if BOOKEQ>0 and SIZE6>0 then BEME=BOOKEQ/(SIZE6*1000);
	keep CODE TIME BEME;
	if A;
run;

/**/

data SEMINAR._20140924_013_FACCRIT_Y;
	set SEMINAR._20140924_006_DISTING_D;
	where month(TIME)=6;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._20140924_013_FACCRIT_Y;
	set SEMINAR._20140924_013_FACCRIT_Y;
	by CODE YEAR MONTH TIME;
	if last.MONTH;
	TIME=mdy(7,1,YEAR)-1;
	drop YEAR MONTH;
run;

data SEMINAR._20140924_013_FACCRIT_Y;
	merge SEMINAR._20140924_011_SIZE6_Y
		SEMINAR._20140924_012_BEME_Y
		SEMINAR._20140924_013_FACCRIT_Y;
	by CODE TIME;
run;

proc sort data=SEMINAR._20140924_013_FACCRIT_Y;
	by TIME CODE;
run;

proc means data=SEMINAR._20140924_013_FACCRIT_Y noprint;
	var SIZE6;
	where SIZE6>0 and BEME>0 and DISTING=0;
	by TIME;
	output out=SEMINAR._TEMP0 median=SIZE6_50;
run;

proc means data=SEMINAR._20140924_013_FACCRIT_Y noprint;
	var BEME;
	where SIZE6>0 and BEME>0 and DISTING=0;
	by TIME;
	output out=SEMINAR._TEMP1 p30=BEME_30 p70=BEME_70;
run;

data SEMINAR._20140924_013_FACCRIT_Y;
	merge SEMINAR._20140924_013_FACCRIT_Y
		SEMINAR._TEMP0(keep=TIME SIZE6_50)
		SEMINAR._TEMP1(keep=TIME BEME_30 BEME_70);
	by TIME;
	if SIZE6^=. and BEME^=. then do;
		if SIZE6<=SIZE6_50 and BEME<=BEME_30 then FACTOR="_1_SL";
		if SIZE6<=SIZE6_50 and BEME_30<BEME<=BEME_70 then FACTOR="_2_SM";
		if SIZE6<=SIZE6_50 and BEME>BEME_70 then FACTOR="_3_SH";
		if SIZE6>SIZE6_50 and BEME<=BEME_30 then FACTOR="_4_BL";
		if SIZE6>SIZE6_50 and BEME_30<BEME<=BEME_70 then FACTOR="_5_BM";
		if SIZE6>SIZE6_50 and BEME>BEME_70 then FACTOR="_6_BH";
	end;
	keep CODE TIME FACTOR;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._TEMP0;
	merge SEMINAR._20140923_001_RETURN_D
		SEMINAR._20140923_002_SIZE_D;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if first.CODE then SIZE1=.;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

proc sort data=SEMINAR._TEMP0;
	by PTIME CODE TIME;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0(in=A)
		SEMINAR._20140924_013_FACCRIT_Y(rename=(TIME=PTIME));
	by PTIME CODE;
	if A;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME FACTOR CODE;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var RETURN;
	weight SIZE1;
	by TIME FACTOR;
	where RETURN^=. and SIZE1^=. and FACTOR^="";
	output out=SEMINAR._TEMP1 mean=RETURN;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._TEMP1;
	var RETURN;
	by TIME;
	id FACTOR;
run;

data SEMINAR._20140924_014_FACTOR_D;
	set SEMINAR._TEMP1;
	SMB=mean(_1_SL,_2_SM,_3_SH)-mean(_4_BL,_5_BM,_6_BH);
	HML=mean(_3_SH,_6_BH)-mean(_1_SL,_4_BL);
	keep TIME SMB HML;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._TEMP0;
	merge SEMINAR._20140923_003_RETURN_M
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if first.CODE then SIZE1=.;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

proc sort data=SEMINAR._TEMP0;
	by PTIME CODE TIME;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0(in=A)
		SEMINAR._20140924_013_FACCRIT_Y(rename=(TIME=PTIME));
	by PTIME CODE;
	if A;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME FACTOR CODE;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var RETURN;
	weight SIZE1;
	by TIME FACTOR;
	where RETURN^=. and SIZE1^=. and FACTOR^="";
	output out=SEMINAR._TEMP1 mean=RETURN;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._TEMP1;
	var RETURN;
	by TIME;
	id FACTOR;
run;

data SEMINAR._20140924_015_FACTOR_M;
	set SEMINAR._TEMP1;
	SMB=mean(_1_SL,_2_SM,_3_SH)-mean(_4_BL,_5_BM,_6_BH);
	HML=mean(_3_SH,_6_BH)-mean(_1_SL,_4_BL);
	keep TIME SMB HML;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._20140924_016_PORTCRIT_Y;
	set SEMINAR._20140924_006_DISTING_D;
	where month(TIME)=6;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._20140924_016_PORTCRIT_Y;
	set SEMINAR._20140924_016_PORTCRIT_Y;
	by CODE YEAR MONTH TIME;
	if last.MONTH;
	TIME=mdy(7,1,YEAR)-1;
	drop YEAR MONTH;
run;

data SEMINAR._20140924_016_PORTCRIT_Y;
	merge SEMINAR._20140924_011_SIZE6_Y
		SEMINAR._20140924_012_BEME_Y
		SEMINAR._20140924_016_PORTCRIT_Y;
	by CODE TIME;
run;

proc sort data=SEMINAR._20140924_016_PORTCRIT_Y;
	by TIME CODE;
run;

proc means data=SEMINAR._20140924_016_PORTCRIT_Y noprint;
	var SIZE6;
	where SIZE6>0 and BEME>0 and DISTING=0;
	by TIME;
	output out=SEMINAR._TEMP0 p20=SIZE6_20 p40=SIZE6_40 p60=SIZE6_60 p80=SIZE6_80;
run;

proc means data=SEMINAR._20140924_016_PORTCRIT_Y noprint;
	var BEME;
	where SIZE6>0 and BEME>0 and DISTING=0;
	by TIME;
	output out=SEMINAR._TEMP1 p20=BEME_20 p40=BEME_40 p60=BEME_60 p80=BEME_80;
run;

data SEMINAR._20140924_016_PORTCRIT_Y;
	merge SEMINAR._20140924_016_PORTCRIT_Y
		SEMINAR._TEMP0(keep=TIME SIZE6_20 SIZE6_40 SIZE6_60 SIZE6_80)
		SEMINAR._TEMP1(keep=TIME BEME_20 BEME_40 BEME_60 BEME_80);
	by TIME;
	if SIZE6^=. and BEME^=. then do;
		if SIZE6<=SIZE6_20 and BEME<=BEME_20 then PORTFOLIO="_01";
		if SIZE6<=SIZE6_20 and BEME_20<BEME<=BEME_40 then PORTFOLIO="_02";
		if SIZE6<=SIZE6_20 and BEME_40<BEME<=BEME_60 then PORTFOLIO="_03";
		if SIZE6<=SIZE6_20 and BEME_60<BEME<=BEME_80 then PORTFOLIO="_04";
		if SIZE6<=SIZE6_20 and BEME_80<BEME then PORTFOLIO="_05";
		if SIZE6_20<SIZE6<=SIZE6_40 and BEME<=BEME_20 then PORTFOLIO="_06";
		if SIZE6_20<SIZE6<=SIZE6_40 and BEME_20<BEME<=BEME_40 then PORTFOLIO="_07";
		if SIZE6_20<SIZE6<=SIZE6_40 and BEME_40<BEME<=BEME_60 then PORTFOLIO="_08";
		if SIZE6_20<SIZE6<=SIZE6_40 and BEME_60<BEME<=BEME_80 then PORTFOLIO="_09";
		if SIZE6_20<SIZE6<=SIZE6_40 and BEME_80<BEME then PORTFOLIO="_10";
		if SIZE6_40<SIZE6<=SIZE6_60 and BEME<=BEME_20 then PORTFOLIO="_11";
		if SIZE6_40<SIZE6<=SIZE6_60 and BEME_20<BEME<=BEME_40 then PORTFOLIO="_12";
		if SIZE6_40<SIZE6<=SIZE6_60 and BEME_40<BEME<=BEME_60 then PORTFOLIO="_13";
		if SIZE6_40<SIZE6<=SIZE6_60 and BEME_60<BEME<=BEME_80 then PORTFOLIO="_14";
		if SIZE6_40<SIZE6<=SIZE6_60 and BEME_80<BEME then PORTFOLIO="_15";
		if SIZE6_60<SIZE6<=SIZE6_80 and BEME<=BEME_20 then PORTFOLIO="_16";
		if SIZE6_60<SIZE6<=SIZE6_80 and BEME_20<BEME<=BEME_40 then PORTFOLIO="_17";
		if SIZE6_60<SIZE6<=SIZE6_80 and BEME_40<BEME<=BEME_60 then PORTFOLIO="_18";
		if SIZE6_60<SIZE6<=SIZE6_80 and BEME_60<BEME<=BEME_80 then PORTFOLIO="_19";
		if SIZE6_60<SIZE6<=SIZE6_80 and BEME_80<BEME then PORTFOLIO="_20";
		if SIZE6>SIZE6_80 and BEME<=BEME_20 then PORTFOLIO="_21";
		if SIZE6>SIZE6_80 and BEME_20<BEME<=BEME_40 then PORTFOLIO="_22";
		if SIZE6>SIZE6_80 and BEME_40<BEME<=BEME_60 then PORTFOLIO="_23";
		if SIZE6>SIZE6_80 and BEME_60<BEME<=BEME_80 then PORTFOLIO="_24";
		if SIZE6>SIZE6_80 and BEME_80<BEME then PORTFOLIO="_25";
	end;
	keep CODE TIME PORTFOLIO;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._TEMP0;
	merge SEMINAR._20140923_001_RETURN_D
		SEMINAR._20140923_002_SIZE_D;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if first.CODE then SIZE1=.;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

proc sort data=SEMINAR._TEMP0;
	by PTIME CODE TIME;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0(in=A)
		SEMINAR._20140924_016_PORTCRIT_Y(rename=(TIME=PTIME));
	by PTIME CODE;
	if A;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME PORTFOLIO CODE;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var RETURN;
	weight SIZE1;
	by TIME PORTFOLIO;
	where RETURN^=. and SIZE1^=. and PORTFOLIO^="";
	output out=SEMINAR._TEMP1 mean=RETURN;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME PORTFOLIO CODE;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._20140924_017_PORTFOLIO_D(drop=_NAME_);
	var RETURN;
	by TIME;
	id PORTFOLIO;
run;

data SEMINAR._20140924_017_PORTFOLIO_D;
	retain TIME _01-_25;
	set SEMINAR._20140924_017_PORTFOLIO_D;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._TEMP0;
	merge SEMINAR._20140923_003_RETURN_M
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if first.CODE then SIZE1=.;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

proc sort data=SEMINAR._TEMP0;
	by PTIME CODE TIME;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0(in=A)
		SEMINAR._20140924_016_PORTCRIT_Y(rename=(TIME=PTIME));
	by PTIME CODE;
	if A;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME PORTFOLIO CODE;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var RETURN;
	weight SIZE1;
	by TIME PORTFOLIO;
	where RETURN^=. and SIZE1^=. and PORTFOLIO^="";
	output out=SEMINAR._TEMP1 mean=RETURN;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME PORTFOLIO CODE;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._20140924_018_PORTFOLIO_M(drop=_NAME_);
	var RETURN;
	by TIME;
	id PORTFOLIO;
run;

data SEMINAR._20140924_018_PORTFOLIO_M;
	retain TIME _01-_25;
	set SEMINAR._20140924_018_PORTFOLIO_M;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._20140925_001_MARKET_D;
	infile "&PATH.\20140925_001_종합주가지수_일별.csv" dsd firstobs=15;
	informat TIME yymmdd10. MARKET comma20.2;
	input TIME MARKET;
	format TIME yymmdd10.;
run;

/**/

data SEMINAR._20140925_002_MARKET_M;
	infile "&PATH.\20140925_002_종합주가지수_월별.csv" dsd firstobs=15;
	informat TIME yymmdd10. MARKET comma20.2;
	input TIME MARKET;
	format TIME yymmdd10.;
run;

/**/

data SEMINAR._20140925_003_RISKFREE_D;
	infile "&PATH.\20140925_003_통화안정_일별.csv" dsd firstobs=15;
	informat TIME yymmdd10.;
	input TIME RISKFREE;
	format TIME yymmdd10.;
run;

/**/

data SEMINAR._20140925_004_RISKFREE_M;
	infile "&PATH.\20140925_004_통화안정_월별.csv" dsd firstobs=15;
	informat TIME yymmdd10.;
	input TIME RISKFREE;
	format TIME yymmdd10.;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140923_003_RETURN_M(in=A);
	by CODE TIME;
	if first.CODE then OBS=.;
	OBS+1;
	if RETURN=. then OBS=.;
	if A;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME CODE;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0 SEMINAR._20140925_002_MARKET_M;
	by TIME;
run;

proc sort data=SEMINAR._TEMP0;
	by CODE TIME;
run;

%macro PREBETA6;

%do YEAR=1982 %to 2014;

proc reg data=SEMINAR._TEMP0 noprint outest=SEMINAR._TEMP1;
	model RETURN=MARKET;
	by CODE;
	where mdy(7,1,&YEAR.-5)<TIME<mdy(7,1,&YEAR.) and RETURN^=.;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	TIME=mdy(6,30,&YEAR.);
	format TIME yymmdd10.;
	PREBETA6=MARKET;
	keep CODE TIME PREBETA6;
run;

proc append base=SEMINAR._TEMP2 data=SEMINAR._TEMP1;
run;

%end;

%mend;

proc printto log="nul:";
run;

%PREBETA6;

proc printto;
run;

proc sort data=SEMINAR._TEMP2;
	by CODE TIME;
run;

data SEMINAR._20140926_001_PREBETA6_Y;
	merge SEMINAR._TEMP2 SEMINAR._TEMP0(in=A);
	by CODE TIME;
	where month(TIME)=6;
	if OBS<24 then PREBETA6=.;
	if A;
	keep CODE TIME PREBETA6;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP2;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140924_006_DISTING_D;
	where month(TIME)=6;
	by CODE TIME;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._TEMP0;
	set SEMINAR._TEMP0;
	by CODE YEAR MONTH TIME;
	if last.MONTH;
	TIME=mdy(6,30,YEAR);
	drop YEAR MONTH;
run;

data SEMINAR._20140926_002_PORTCRIT_Y;
	merge SEMINAR._20140926_001_PREBETA6_Y
		SEMINAR._20140924_011_SIZE6_Y
		SEMINAR._TEMP0;
	by CODE TIME;
run;

proc sort data=SEMINAR._20140926_002_PORTCRIT_Y;
	by TIME CODE;
run;

proc univariate data=SEMINAR._20140926_002_PORTCRIT_Y noprint;
	var SIZE6;
	where PREBETA6^=. and SIZE6>0 and DISTING=0;
	by TIME;
	output out=SEMINAR._TEMP0
		pctlpts=12.5 25 37.5 50 62.5 75 87.5
		pctlpre=SIZE6_;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._20140926_002_PORTCRIT_Y SEMINAR._TEMP0;
	by TIME;
	if PREBETA6^=. and SIZE6>0 and SIZE6_12_5^=. then do;
		if SIZE6<=SIZE6_12_5 then RSIZE6=0;
		if SIZE6_12_5 <SIZE6<=SIZE6_25 then RSIZE6=1;
		if SIZE6_25 <SIZE6<=SIZE6_37_5 then RSIZE6=2;
		if SIZE6_37_5 <SIZE6<=SIZE6_50 then RSIZE6=3;
		if SIZE6_50 <SIZE6<=SIZE6_62_5 then RSIZE6=4;
		if SIZE6_62_5 <SIZE6<=SIZE6_75 then RSIZE6=5;
		if SIZE6_75 <SIZE6<=SIZE6_87_5 then RSIZE6=6;
		if SIZE6>SIZE6_87_5 then RSIZE6=7;
	end;
	else RSIZE6=.;
run;

proc sort data=SEMINAR._TEMP1;
	by TIME RSIZE6 CODE;
run;

proc rank data=SEMINAR._TEMP1 groups=8 out=SEMINAR._TEMP1;
	var PREBETA6;
	where PREBETA6^=. and RSIZE6^=.;
	by TIME RSIZE6;
run;

proc sort data=SEMINAR._TEMP1;
	by TIME CODE;
run;

data SEMINAR._20140926_002_PORTCRIT_Y;
	retain CODE TIME SIZE6 PREBETA6;
	merge SEMINAR._20140926_002_PORTCRIT_Y(keep=CODE TIME)
		SEMINAR._TEMP1(drop=SIZE6 rename=(RSIZE6=SIZE6));
	by TIME CODE;
	label PREBETA6=;
	keep CODE TIME SIZE6 PREBETA6;
run;

proc sort data=SEMINAR._20140926_002_PORTCRIT_Y;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140923_003_RETURN_M;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0 SEMINAR._20140926_002_PORTCRIT_Y(rename=(TIME=PTIME));
	by CODE PTIME;
	drop PTIME;
run;

proc sort data=SEMINAR._TEMP0;
	by TIME SIZE6 PREBETA6;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var RETURN;
	by TIME SIZE6 PREBETA6;
	where RETURN^=. and SIZE6^=.;
	output out=SEMINAR._TEMP1(drop=_TYPE_ _FREQ_) mean=RETURN;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP1(in=A) SEMINAR._20140925_002_MARKET_M;
	by TIME;
	if A;
run;

proc sort data=SEMINAR._TEMP1;
	by SIZE6 PREBETA6 TIME;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	by SIZE6 PREBETA6;
	MARKET1=lag1(MARKET);
	if first.PREBETA6 then MARKET1=.;
run;

proc reg data=SEMINAR._TEMP1 noprint outest=SEMINAR._TEMP2;
	model RETURN=MARKET MARKET1;
	by SIZE6 PREBETA6;
run;

data SEMINAR._20140926_003_POSTBETA_C;
	set SEMINAR._TEMP2;
	POSTBETA=MARKET+MARKET1;
	keep SIZE6 PREBETA6 POSTBETA;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP2;
run;

/**/

data SEMINAR._20140926_004_POSTBETA_M;
	set SEMINAR._20140923_003_RETURN_M(drop=RETURN);
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
run;

data SEMINAR._20140926_004_POSTBETA_M;
	merge SEMINAR._20140926_004_POSTBETA_M SEMINAR._20140926_002_PORTCRIT_Y(rename=(TIME=PTIME));
	by CODE PTIME;
	drop PTIME;
run;

proc sort data=SEMINAR._20140926_004_POSTBETA_M;
	by SIZE6 PREBETA6 CODE TIME;
run;

data SEMINAR._20140926_004_POSTBETA_M;
	merge SEMINAR._20140926_004_POSTBETA_M
		SEMINAR._20140926_003_POSTBETA_C;
	by SIZE6 PREBETA6;
run;

proc sort data=SEMINAR._20140926_004_POSTBETA_M;
	by CODE TIME;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140925_001_MARKET_D;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._TEMP0;
	set SEMINAR._TEMP0;
	by YEAR MONTH TIME;
	if first.MONTH then TDAY=.;
	TDAY+1;
	if last.MONTH;
	if MONTH=12 then TIME=mdy(1,1,YEAR+1)-1;
	else TIME=mdy(MONTH+1,1,YEAR)-1;
	keep TIME TDAY;
run;

data SEMINAR._TEMP1;
	set SEMINAR._20140925_003_RISKFREE_D;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	by YEAR MONTH TIME;
	if last.MONTH;
	if MONTH=12 then TIME=mdy(1,1,YEAR+1)-1;
	else TIME=mdy(MONTH+1,1,YEAR)-1;
	keep TIME RISKFREE;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP0 SEMINAR._TEMP1;
	by TIME;
	RISKFREE=RISKFREE/12/TDAY;
run;

data SEMINAR._TEMP2;
	set SEMINAR._20140925_001_MARKET_D;
	if month(TIME)=12 then PTIME=mdy(1,1,year(TIME)+1)-1;
	else PTIME=mdy(month(TIME)+1,1,year(TIME))-1;
	format PTIME yymmdd10.;
run;

data SEMINAR._TEMP2;
	merge SEMINAR._TEMP2 SEMINAR._TEMP1(rename=(TIME=PTIME));
	by PTIME;
	RMRF=MARKET-RISKFREE;
run;

proc sort data=SEMINAR._20140923_001_RETURN_D out=SEMINAR._TEMP3;
	by TIME CODE;
run;

data SEMINAR._TEMP3;
	set SEMINAR._TEMP3;
	if month(TIME)=12 then PTIME=mdy(1,1,year(TIME)+1)-1;
	else PTIME=mdy(month(TIME)+1,1,year(TIME))-1;
	format PTIME yymmdd10.;	
run;

data SEMINAR._TEMP3;
	merge SEMINAR._TEMP3 SEMINAR._TEMP1(rename=(TIME=PTIME));
	by PTIME;
	RIRF=RETURN-RISKFREE;
run;

data SEMINAR._TEMP3;
	merge SEMINAR._TEMP3(in=A) SEMINAR._TEMP2 SEMINAR._20140924_014_FACTOR_D;
	by TIME;
	if A;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc sort data=SEMINAR._TEMP3;
	by CODE TIME;
run;

proc reg data=SEMINAR._TEMP3 noprint outest=SEMINAR._TEMP4;
	model RIRF=RMRF SMB HML;
	where RIRF^=.;
	by CODE YEAR MONTH;
run;

data SEMINAR._TEMP5;
	set SEMINAR._20140923_005_RETURN_D;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._TEMP5;
	set SEMINAR._TEMP5;
	by CODE YEAR MONTH TIME;
	if first.MONTH then OBS=.;
	if RETURN^=. then OBS+1;
	if last.MONTH;
run;

data SEMINAR._20140927_001_IVOL_M;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP4(keep=CODE YEAR MONTH _RMSE_);
	by CODE YEAR MONTH;
	if OBS<15 or _RMSE_=0 then _RMSE_=.;
	if A;
	if MONTH=12 then TIME=mdy(1,1,YEAR+1)-1;
	else TIME=mdy(MONTH+1,1,YEAR)-1;
	if YEAR>1986;
	IVOL=sqrt(OBS)*_RMSE_;
	IVOL1=lag1(IVOL);
	if first.CODE then IVOL1=.;
	keep CODE TIME IVOL IVOL1;
run;

data SEMINAR._20140927_001_IVOL_M;
	merge SEMINAR._20140927_001_IVOL_M(in=A) SEMINAR._20140923_005_VOLUME_M;
	by CODE TIME;
	if VOLUME=0 then IVOL=.;
	if lag1(VOLUME)=0 then IVOL1=.;
	if A;
	drop VOLUME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140927_001_IVOL_M;
	by CODE TIME;
	if first.CODE then OBS=.;
	OBS+1;
	IVOL2=lag2(IVOL);
	if OBS<3 then IVOL2=.;
	IVOL3=lag3(IVOL);
	if OBS<4 then IVOL3=.;
	IVOL4=lag4(IVOL);
	if OBS<5 then IVOL4=.;
	IVOL5=lag5(IVOL);
	if OBS<6 then IVOL5=.;
	IVOL6=lag6(IVOL);
	if OBS<7 then IVOL6=.;
	IVOL11=lag11(IVOL);
	if OBS<12 then IVOL11=.;
	IVOL12=lag12(IVOL);
	if OBS<13 then IVOL12=.;
	IVOL13=lag13(IVOL);
	if OBS<14 then IVOL13=.;
	drop OBS;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var IVOL;
	where IVOL^=.;
	by CODE;
	output out=SEMINAR._TEMP1 mean=IVOL_MEAN std=IVOL_STD skew=IVOL_SKEW;
run;

data SEMINAR._TEMP1;
	retain CODE IVOL_MEAN IVOL_STD IVOL_CV;
	set SEMINAR._TEMP1(drop=_TYPE_ _FREQ_);
	IVOL_CV=IVOL_STD/IVOL_MEAN;
run;

proc corr data=SEMINAR._TEMP0 noprint out=SEMINAR._TEMP2;
	var IVOL--IVOL13;
	where IVOL^=.;
	by CODE;
run;

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	where _TYPE_="CORR" and _NAME_="IVOL";
	drop _TYPE_ _NAME_ IVOL;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP1 SEMINAR._TEMP2;
	by CODE;
run;

proc means data=SEMINAR._TEMP1 n mean maxdec=4;
	var IVOL_MEAN--IVOL13;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP2;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140927_001_IVOL_M;
	by CODE TIME;
	if first.CODE then OBS=.;
	OBS+1;
	LNDIVOL=log(IVOL/IVOL1);
	LNDIVOL1=lag1(LNDIVOL);
	if OBS<2 then LNDIVOL1=.;
	LNDIVOL2=lag2(LNDIVOL);
	if OBS<3 then LNDIVOL2=.;
	LNDIVOL3=lag3(LNDIVOL);
	if OBS<4 then LNDIVOL3=.;
	LNDIVOL4=lag4(LNDIVOL);
	if OBS<5 then LNDIVOL4=.;
	LNDIVOL5=lag5(LNDIVOL);
	if OBS<6 then LNDIVOL5=.;
	LNDIVOL6=lag6(LNDIVOL);
	if OBS<7 then LNDIVOL6=.;
	LNDIVOL11=lag11(LNDIVOL);
	if OBS<12 then LNDIVOL11=.;
	LNDIVOL12=lag12(LNDIVOL);
	if OBS<13 then LNDIVOL12=.;
	LNDIVOL13=lag13(LNDIVOL);
	if OBS<14 then LNDIVOL13=.;
	drop OBS;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var LNDIVOL;
	where LNDIVOL^=.;
	by CODE;
	output out=SEMINAR._TEMP1 mean=LNDIVOL_MEAN std=LNDIVOL_STD skew=LNDIVOL_SKEW;
run;

data SEMINAR._TEMP1;
	retain CODE LNDIVOL_MEAN LNDIVOL_STD LNDIVOL_CV;
	set SEMINAR._TEMP1(drop=_TYPE_ _FREQ_);
	LNDIVOL_CV=LNDIVOL_STD/abs(LNDIVOL_MEAN);
run;

proc corr data=SEMINAR._TEMP0 noprint out=SEMINAR._TEMP2;
	var LNDIVOL--LNDIVOL13;
	where LNDIVOL^=.;
	by CODE;
run;

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	where _TYPE_="CORR" and _NAME_="LNDIVOL";
	drop _TYPE_ _NAME_ LNDIVOL;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP1 SEMINAR._TEMP2;
	by CODE;
run;

proc means data=SEMINAR._TEMP1 n mean maxdec=4;
	var LNDIVOL_MEAN--LNDIVOL13;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP2;
run;

/**/

data SEMINAR._TEMP0;
	set SEMINAR._20140927_001_IVOL_M;
	DIVOL=IVOL-IVOL1;
	LNIVOL=log(IVOL);
	LNIVOL1=log(IVOL1);
	DLNIVOL=LNIVOL-LNIVOL1;
run;

proc reg data=SEMINAR._TEMP0 noprint outest=SEMINAR._TEMP1 tableout;
	model DIVOL=IVOL1;
	where DIVOL^=.;
	by CODE;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS" or _TYPE_="T";
	keep CODE _TYPE_ IVOL1;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._TEMP1;
	by CODE;
	id _TYPE_;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var DIVOL;
	by CODE;
	output out=SEMINAR._TEMP2 n=NOBS;
run;

data SEMINAR._TEMP3;
	merge SEMINAR._TEMP1 SEMINAR._TEMP2(keep=CODE NOBS);
	by CODE;
	if NOBS<30 then PARMS=.;
	if NOBS<30 then T=.;
	if T^=. then PROB=PROBDF(T,NOBS-1,1,"SSM");
	if 0<=PROB<=0.01 then REJECT=1;
	if PROB>0.01 then REJECT=0;
run;

proc means data=SEMINAR._TEMP3 n mean median q1 q3 maxdec=4;
	var PARMS T REJECT;
run;

proc reg data=SEMINAR._TEMP0 noprint outest=SEMINAR._TEMP1 tableout;
	model DLNIVOL=LNIVOL1;
	where DLNIVOL^=.;
	by CODE;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS" or _TYPE_="T";
	keep CODE _TYPE_ LNIVOL1;
run;

proc transpose data=SEMINAR._TEMP1 out=SEMINAR._TEMP1;
	by CODE;
	id _TYPE_;
run;

proc means data=SEMINAR._TEMP0 noprint;
	var DLNIVOL;
	by CODE;
	output out=SEMINAR._TEMP2 n=NOBS;
run;

data SEMINAR._TEMP3;
	merge SEMINAR._TEMP1 SEMINAR._TEMP2(keep=CODE NOBS);
	by CODE;
	if NOBS<30 then PARMS=.;
	if NOBS<30 then T=.;
	if T^=. then PROB=PROBDF(T,NOBS-1,1,"SSM");
	if 0<=PROB<=0.01 then REJECT=1;
	if PROB>0.01 then REJECT=0;
run;

proc means data=SEMINAR._TEMP3 n mean median q1 q3 maxdec=4;
	var PARMS T REJECT;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP3;
run;

/**/

proc sort data=SEMINAR._20140923_003_RETURN_M out=SEMINAR._TEMP0;
	by TIME CODE;
run;

data SEMINAR._TEMP1;
	set SEMINAR._20140925_003_RISKFREE_D;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	by YEAR MONTH TIME;
	if last.MONTH;
	if MONTH=12 then TIME=mdy(1,1,YEAR+1)-1;
	else TIME=mdy(MONTH+1,1,YEAR)-1;
	RISKFREE=RISKFREE/12;
	keep TIME RISKFREE;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0(in=A)
		SEMINAR._TEMP1
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	RIRF=RETURN-RISKFREE;
	RMRF=MARKET-RISKFREE;
run;

%macro EIVOL;

%do YEAR=1989 %to 2014;

%do MONTH=1 %to 12;

proc printto;
run;

%put &YEAR. &MONTH.;

proc printto log="nul:";
run;

proc sort data=SEMINAR._TEMP0 out=SEMINAR._TEMP1;
	by CODE TIME;
	where "1jan1987"d<TIME<mdy(&MONTH.,1,&YEAR.)+31;
run;

data SEMINAR._TEMP2;
	set SEMINAR._TEMP1;
	by CODE;
	if first.CODE then NOBS=.;
	if RIRF^=. then NOBS+1;
	if last.CODE;
	keep CODE RIRF NOBS;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP1 SEMINAR._TEMP2(rename=(RIRF=LASTRET));
	by CODE;
	if LASTRET=. or NOBS<31 then delete;
	drop LASTRET NOBS;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	by CODE TIME;
	if TIME>mdy(&MONTH.,1,&YEAR.) then RIRF=.;
	if first.CODE then NOBS=.;
	if RIRF^=. then NOBS+1;
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=1,p=1,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH11;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS11=0;
	if _STATUS_="1 Warning" then STATUS11=1;
	keep CODE STATUS11;
run;

data SEMINAR._TEMP3;
	retain CODE TIME NOBS;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME NOBS GARCH11;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC11=NVALUE2;
	keep CODE AIC11;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP3(in=A)
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS11=1 then GARCH11=.;
	if STATUS11=1 then AIC11=.;
run;

proc printto;
run;

%put GARCH11 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=2,p=1,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH12;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS12=0;
	if _STATUS_="1 Warning" then STATUS12=1;
	keep CODE STATUS12;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH12;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC12=NVALUE2;
	keep CODE AIC12;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS12=1 then GARCH12=.;
	if STATUS12=1 then AIC12=.;
run;

proc printto;
run;

%put GARCH12 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=3,p=1,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH13;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS13=0;
	if _STATUS_="1 Warning" then STATUS13=1;
	keep CODE STATUS13;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH13;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC13=NVALUE2;
	keep CODE AIC13;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS13=1 then GARCH13=.;
	if STATUS13=1 then AIC13=.;
run;

proc printto;
run;

%put GARCH13 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=1,p=2,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH21;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS21=0;
	if _STATUS_="1 Warning" then STATUS21=1;
	keep CODE STATUS21;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH21;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC21=NVALUE2;
	keep CODE AIC21;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS21=1 then GARCH21=.;
	if STATUS21=1 then AIC21=.;
run;

proc printto;
run;

%put GARCH21 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=2,p=2,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH22;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS22=0;
	if _STATUS_="1 Warning" then STATUS22=1;
	keep CODE STATUS22;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH22;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC22=NVALUE2;
	keep CODE AIC22;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS22=1 then GARCH22=.;
	if STATUS22=1 then AIC22=.;
run;

proc printto;
run;

%put GARCH22 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=3,p=2,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH23;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS23=0;
	if _STATUS_="1 Warning" then STATUS23=1;
	keep CODE STATUS23;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH23;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC23=NVALUE2;
	keep CODE AIC23;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS23=1 then GARCH23=.;
	if STATUS23=1 then AIC23=.;
run;

proc printto;
run;

%put GARCH23 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=1,p=3,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH31;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS31=0;
	if _STATUS_="1 Warning" then STATUS31=1;
	keep CODE STATUS31;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH31;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC31=NVALUE2;
	keep CODE AIC31;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS31=1 then GARCH31=.;
	if STATUS31=1 then AIC31=.;
run;

proc printto;
run;

%put GARCH31 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=2,p=3,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH32;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS32=0;
	if _STATUS_="1 Warning" then STATUS32=1;
	keep CODE STATUS32;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH32;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC32=NVALUE2;
	keep CODE AIC32;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS32=1 then GARCH32=.;
	if STATUS32=1 then AIC32=.;
run;

proc printto;
run;

%put GARCH32 complete!;

proc printto log="nul:";
run;

/*
proc printto log="nul:";
run;
*/

proc autoreg data=SEMINAR._TEMP1 outest=SEMINAR._TEMP2;
	model RIRF=RMRF SMB HML/garch=(q=3,p=3,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP3 ht=GARCH33;
	ods output fitsummary=SEMINAR._TEMP4;
run;

/*
proc printto;
run;
*/

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	if _STATUS_="0 Converged" then STATUS33=0;
	if _STATUS_="1 Warning" then STATUS33=1;
	keep CODE STATUS33;
run;

data SEMINAR._TEMP3;
	retain CODE TIME;
	set SEMINAR._TEMP3;
	by CODE;
	if last.CODE;
	keep CODE TIME GARCH33;
run;

data SEMINAR._TEMP4;
	set SEMINAR._TEMP4;
	by CODE;
	if first.CODE then OBS=.;
	OBS+1;
	if OBS=11;
	AIC33=NVALUE2;
	keep CODE AIC33;
run;

data SEMINAR._TEMP5;
	merge SEMINAR._TEMP5(in=A)
		SEMINAR._TEMP3
		SEMINAR._TEMP4
		SEMINAR._TEMP2;
	by CODE;
	if A;
	if STATUS33=1 then GARCH33=.;
	if STATUS33=1 then AIC33=.;
run;

proc printto;
run;

%put GARCH33 complete!;

proc printto log="nul:";
run;

data SEMINAR._TEMP6;
	retain CODE TIME NOBS GARCH SELECT;
	set SEMINAR._TEMP5;
	if AIC11=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH11;
	if AIC12=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH12;
	if AIC13=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH13;
	if AIC21=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH21;
	if AIC22=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH22;
	if AIC23=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH23;
	if AIC31=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH31;
	if AIC32=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH32;
	if AIC33=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then GARCH=GARCH33;
	if NOBS<30 then GARCH=.;
	if AIC11=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=1;
	if AIC12=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=2;
	if AIC13=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=3;
	if AIC21=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=4;
	if AIC22=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=5;
	if AIC23=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=6;
	if AIC31=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=7;
	if AIC32=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=8;
	if AIC33=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then SELECT=9;
	if GARCH=. then SELECT=.;
run;

proc append base=SEMINAR._20140928_001_EIVOL_M data=SEMINAR._TEMP6;
run;

%end;

%end;

%mend;

ods listing close;
ods html close;

proc printto log="nul:";
run;

%EIVOL;

proc printto;
run;

%put Analysis complete!;

ods listing;

proc datasets lib=SEMINAR;
	delete _TEMP1-_TEMP6;
run;

/**/

data SEMINAR._20141006_001_RET_M;
	retain CODE TIME RET XRET LRET;
	set SEMINAR._TEMP0;
	RET=RETURN;
	XRET=RIRF;
	LRET=log(1+RET/100)*100;
	YEAR=year(TIME);
	MONTH=month(TIME);
	keep CODE TIME RET XRET LRET YEAR MONTH;
run;

proc means data=SEMINAR._20141006_001_RET_M mean std median q1 q3 skew n maxdec=4;
	var RET XRET LRET;
	where year(TIME)>=1989 and RET<300;
run;

proc univariate data=SEMINAR._20141006_001_RET_M noprint;
	var RET XRET LRET;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 99.5 pctlpre=_RET _XRET _LRET;
run;

data SEMINAR._20141006_002_WINRET_M;
	merge SEMINAR._20141006_001_RET_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if RET^=. and RET<_RET0_5 then RET=_RET0_5;
	if RET^=. and RET>_RET99_5 then RET=_RET99_5;
	if XRET^=. and XRET<_XRET0_5 then XRET=_XRET0_5;
	if XRET^=. and XRET>_XRET99_5 then XRET=_XRET99_5;
	if LRET^=. and LRET<_LRET0_5 then LRET=_LRET0_5;
	if LRET^=. and LRET>_LRET99_5 then LRET=_LRET99_5;
run;

proc sort data=SEMINAR._20141006_001_RET_M;
	by CODE TIME;
run;

proc sort data=SEMINAR._20141006_002_WINRET_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

proc means data=SEMINAR._20141006_002_WINRET_M mean std median q1 q3 skew n maxdec=4;
	var RET XRET LRET;
	where year(TIME)>=1989;
run;

/**/

proc sort data=SEMINAR._20140927_001_IVOL_M out=SEMINAR._20141006_003_IVOL_M;
	by TIME CODE;
run;

data SEMINAR._20141006_003_IVOL_M;
	set SEMINAR._20141006_003_IVOL_M;
	YEAR=year(TIME);
	MONTH=month(TIME);
	drop IVOL1;
run;

proc univariate data=SEMINAR._20141006_003_IVOL_M noprint;
	var IVOL;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 99.5 pctlpre=_IVOL;
run;

data SEMINAR._20141006_003_IVOL_M;
	merge SEMINAR._20141006_003_IVOL_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if IVOL^=. and IVOL<_IVOL0_5 then IVOL=_IVOL0_5;
	if IVOL^=. and IVOL>_IVOL99_5 then IVOL=_IVOL99_5;
run;

proc sort data=SEMINAR._20141006_003_IVOL_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

proc means data=SEMINAR._20141006_003_IVOL_M mean std median q1 q3 skew n maxdec=4;
	var IVOL;
	where year(TIME)>=1989;
run;

/**/

data SEMINAR._20141006_004_EIVOL_M;
	set SEMINAR._20140928_001_EIVOL_M(rename=(GARCH=EIVOL));
	array HT(*) EIVOL GARCH11 GARCH12 GARCH13 GARCH21 GARCH22 GARCH23 GARCH31 GARCH32 GARCH33;
	do I=1 to dim(HT);
		HT(I)=sqrt(HT(I));
	end;
	drop I;
run;

data SEMINAR._20141006_004_EIVOL_M;
	set SEMINAR._20141006_004_EIVOL_M;
	YEAR=year(TIME);
	MONTH=month(TIME);
	TEMP=1;
run;

proc univariate data=SEMINAR._20141006_004_EIVOL_M noprint;
	var EIVOL;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=2.5 97.5 pctlpre=_EIVOL;
run;

data SEMINAR._20141006_004_EIVOL_M;
	merge SEMINAR._20141006_004_EIVOL_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if EIVOL^=. and EIVOL<_EIVOL2_5 then EIVOL=_EIVOL2_5;
	if EIVOL^=. and EIVOL>_EIVOL97_5 then EIVOL=_EIVOL97_5;
run;

proc sort data=SEMINAR._20141006_004_EIVOL_M;
	by CODE TIME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

proc means data=SEMINAR._20141006_004_EIVOL_M mean std median q1 q3 skew n maxdec=4;
	var EIVOL;
	where year(TIME)>=1989;
run;

/**/

proc means data=SEMINAR._20140926_004_POSTBETA_M mean std median q1 q3 skew n maxdec=4;
	var POSTBETA;
	where year(TIME)>=1989;
run;

/**/

proc sort data=SEMINAR._20140923_004_SIZE_M out=SEMINAR._20141007_001_LOG_M;
	by TIME CODE;
run;

data SEMINAR._20141007_001_LOG_M;
	set SEMINAR._20141007_001_LOG_M;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc univariate data=SEMINAR._20141007_001_LOG_M noprint;
	var SIZE;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 99.5 pctlpre=SIZE;
run;

data SEMINAR._20141007_001_LOG_M;
	merge SEMINAR._20141007_001_LOG_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if SIZE^=. and SIZE<SIZE0_5 then SIZE=SIZE0_5;
	if SIZE^=. and SIZE>SIZE99_5 then SIZE=SIZE99_5;
run;

proc sort data=SEMINAR._20141007_001_LOG_M;
	by CODE TIME;
run;

data SEMINAR._20141007_001_LOG_M;
	merge SEMINAR._20140923_003_RETURN_M(in=A) SEMINAR._20141007_001_LOG_M;
	by CODE TIME;
	if month(TIME)<7 then PTIME=mdy(6,30,year(TIME)-1);
	else PTIME=mdy(6,30,year(TIME));
	format PTIME yymmdd10.;
	if A;
	keep CODE TIME PTIME RETURN SIZE;
run;

proc sort data=SEMINAR._20140924_012_BEME_Y out=SEMINAR._TEMP0;
	by TIME CODE;
run;

data SEMINAR._TEMP0;
	set SEMINAR._TEMP0;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc univariate data=SEMINAR._TEMP0 noprint;
	var BEME;
	by YEAR MONTH;
	output out=SEMINAR._TEMP1 pctlpts=0.5 99.5 pctlpre=BEME;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._TEMP0 SEMINAR._TEMP1;
	by YEAR MONTH;
	if BEME^=. and BEME<BEME0_5 then BEME=BEME0_5;
	if BEME^=. and BEME>BEME99_5 then BEME=BEME99_5;
run;

proc sort data=SEMINAR._TEMP0;
	by CODE TIME;
run;

data SEMINAR._20141007_001_LOG_M;
	merge SEMINAR._20141007_001_LOG_M(in=A) SEMINAR._TEMP0(rename=(TIME=PTIME));
	by CODE PTIME;
	if RETURN^=. and RETURN<300 and SIZE>0 then LSIZE=log(SIZE);
	if RETURN^=. and RETURN<300 and BEME>0 then LBEME=log(BEME);
	if A;
	drop PTIME;
run;

proc means data=SEMINAR._20141007_001_LOG_M mean std median q1 q3 skew n maxdec=4;
	var LSIZE LBEME;
	where year(TIME)>=1989;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

data SEMINAR._20141007_002_PASTRET_M;
	set SEMINAR._20140923_003_RETURN_M;
	by CODE TIME;
	if first.CODE or RETURN=. then OBS=.;
	if RETURN^=. then OBS+1;
	RETURN1=lag1(RETURN);
	if OBS<=1 then RETURN1=.;
	RETURN2=lag2(RETURN);
	if OBS<=2 then RETURN2=.;
	RETURN3=lag3(RETURN);
	if OBS<=3 then RETURN3=.;
	RETURN4=lag4(RETURN);
	if OBS<=4 then RETURN4=.;
	RETURN5=lag5(RETURN);
	if OBS<=5 then RETURN5=.;
	RETURN6=lag6(RETURN);
	if OBS<=6 then RETURN6=.;
	RETURN7=lag7(RETURN);
	if OBS<=7 then RETURN7=.;
	RETURN8=lag8(RETURN);
	if OBS<=8 then RETURN8=.;
	RETURN9=lag9(RETURN);
	if OBS<=9 then RETURN9=.;
	RETURN10=lag10(RETURN);
	if OBS<=10 then RETURN10=.;
	RETURN11=lag11(RETURN);
	if OBS<=11 then RETURN11=.;
	RETURN12=lag12(RETURN);
	if OBS<=12 then RETURN12=.;
	if RETURN^=. and RETURN<300 then
		RET27=exp(log(1+RETURN2/100)+log(1+RETURN3/100)+log(1+RETURN4/100)+log(1+RETURN5/100)+log(1+RETURN6/100)+log(1+RETURN7/100))-1;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc sort data=SEMINAR._20141007_002_PASTRET_M;
	by TIME CODE;
run;

proc univariate data=SEMINAR._20141007_002_PASTRET_M noprint;
	var RET27;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 99.5 pctlpre=RET27_;
run;

data SEMINAR._20141007_002_PASTRET_M;
	merge SEMINAR._20141007_002_PASTRET_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if RET27^=. and RET27<RET27_0_5 then RET27=RET27_0_5;
	if RET27^=. and RET27>RET27_99_5 then RET27=RET27_99_5;
run;

proc sort data=SEMINAR._20141007_002_PASTRET_M;
	by CODE TIME;
run;

proc means data=SEMINAR._20141007_002_PASTRET_M mean std median q1 q3 skew n maxdec=4;
	var RET27;
	where year(TIME)>=1989;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

data SEMINAR._20141007_003_TURN_M;
	merge SEMINAR._20140923_004_SIZE_M SEMINAR._20140923_005_VOLUME_M;
	by CODE TIME;
	if first.CODE then OBS=.;
	if SIZE>0 then OBS+1;
	if SIZE>0 then TURN=VOLUME/(SIZE*10000);
	TURN36=mean(lag1(TURN),lag2(TURN),lag3(TURN),lag4(TURN),lag5(TURN),lag6(TURN)
		,lag7(TURN),lag8(TURN),lag9(TURN),lag10(TURN),lag11(TURN),lag12(TURN)
		,lag13(TURN),lag14(TURN),lag15(TURN),lag16(TURN),lag17(TURN),lag18(TURN)
		,lag19(TURN),lag20(TURN),lag21(TURN),lag22(TURN),lag23(TURN),lag24(TURN)
		,lag25(TURN),lag26(TURN),lag27(TURN),lag28(TURN),lag29(TURN),lag30(TURN)
		,lag31(TURN),lag32(TURN),lag33(TURN),lag34(TURN),lag35(TURN),lag36(TURN));
	if OBS<37 then TURN36=.;
	STDTURN36=std(lag1(TURN),lag2(TURN),lag3(TURN),lag4(TURN),lag5(TURN),lag6(TURN)
		,lag7(TURN),lag8(TURN),lag9(TURN),lag10(TURN),lag11(TURN),lag12(TURN)
		,lag13(TURN),lag14(TURN),lag15(TURN),lag16(TURN),lag17(TURN),lag18(TURN)
		,lag19(TURN),lag20(TURN),lag21(TURN),lag22(TURN),lag23(TURN),lag24(TURN)
		,lag25(TURN),lag26(TURN),lag27(TURN),lag28(TURN),lag29(TURN),lag30(TURN)
		,lag31(TURN),lag32(TURN),lag33(TURN),lag34(TURN),lag35(TURN),lag36(TURN));
	if OBS<37 then STDTURN36=.;
	if TURN36>0 then CVTURN36=STDTURN36/TURN36;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc sort data=SEMINAR._20141007_003_TURN_M;
	by TIME CODE;
run;

proc univariate data=SEMINAR._20141007_003_TURN_M noprint;
	var TURN36 CVTURN36;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 99.5 pctlpre=TURN36_ CVTURN36_;
run;

data SEMINAR._20141007_003_TURN_M;
	merge SEMINAR._20141007_003_TURN_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if TURN36^=. and TURN36<TURN36_0_5 then TURN36=TURN36_0_5;
	if TURN36^=. and TURN36>TURN36_99_5 then TURN36=TURN36_99_5;
	if TURN36>0 then LTURN36=log(TURN36);
	if CVTURN36^=. and CVTURN36<CVTURN36_0_5 then CVTURN36=CVTURN36_0_5;
	if CVTURN36^=. and CVTURN36>CVTURN36_99_5 then CVTURN36=CVTURN36_99_5;
	if CVTURN36>0 then LCVTURN36=log(CVTURN36);
run;

proc sort data=SEMINAR._20141007_003_TURN_M;
	by CODE TIME;
run;

proc means data=SEMINAR._20141007_003_TURN_M mean std median q1 q3 skew n maxdec=4;
	var TURN36 LTURN36 CVTURN36 LCVTURN36;
	where year(TIME)>=1989;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

data SEMINAR._20141011_001_POOL_M;
	set SEMINAR._20141006_001_RET_M;
	where "31dec1988"d<TIME<"1sep2014"d;
	keep CODE TIME RET XRET LRET;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._20140927_001_IVOL_M(drop=IVOL1);
	by CODE TIME;
	keep CODE TIME RET XRET LRET IVOL IVOL1;
	IVOL1=lag1(IVOL);
	if first.CODE then IVOL1=.;
	if A;
run;

proc sort data=SEMINAR._20140928_001_EIVOL_M out=SEMINAR._TEMP0(keep=CODE TIME GARCH);
	by CODE TIME;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._TEMP0;
	by CODE TIME;
	EIVOL=sqrt(GARCH);
	keep CODE TIME RET XRET LRET IVOL IVOL1 EIVOL;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._20140926_004_POSTBETA_M(rename=(POSTBETA=BETA));
	by CODE TIME;
	if month(TIME)<7 then TIME2=mdy(6,30,year(TIME)-1);
	else TIME2=mdy(6,30,year(TIME));
	format TIME2 yymmdd10.;
	keep CODE TIME RET XRET LRET IVOL IVOL1 EIVOL BETA TIME2;
	if A;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._20140924_011_SIZE6_Y(rename=(TIME=TIME2))
		SEMINAR._20140924_012_BEME_Y(rename=(TIME=TIME2));
	by CODE TIME2;
	keep CODE TIME RET XRET LRET IVOL IVOL1 EIVOL BETA SIZE6 BEME;
	if A;
run;

data SEMINAR._TEMP0;
	set SEMINAR._20140923_003_RETURN_M;
	by CODE TIME;
	if first.CODE or RETURN=. then OBS=.;
	if RETURN^=. then OBS+1;
	RETURN1=lag1(RETURN);
	if OBS<=1 then RETURN1=.;
	RETURN2=lag2(RETURN);
	if OBS<=2 then RETURN2=.;
	RETURN3=lag3(RETURN);
	if OBS<=3 then RETURN3=.;
	RETURN4=lag4(RETURN);
	if OBS<=4 then RETURN4=.;
	RETURN5=lag5(RETURN);
	if OBS<=5 then RETURN5=.;
	RETURN6=lag6(RETURN);
	if OBS<=6 then RETURN6=.;
	RETURN7=lag7(RETURN);
	if OBS<=7 then RETURN7=.;
	RETURN8=lag8(RETURN);
	if OBS<=8 then RETURN8=.;
	RETURN9=lag9(RETURN);
	if OBS<=9 then RETURN9=.;
	RETURN10=lag10(RETURN);
	if OBS<=10 then RETURN10=.;
	RETURN11=lag11(RETURN);
	if OBS<=11 then RETURN11=.;
	RETURN12=lag12(RETURN);
	if OBS<=12 then RETURN12=.;
	if RETURN^=. then
		RET27=exp(log(1+RETURN2/100)+log(1+RETURN3/100)+log(1+RETURN4/100)+log(1+RETURN5/100)+log(1+RETURN6/100)+log(1+RETURN7/100))-1;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._TEMP0;
	by CODE TIME;
	keep CODE TIME RET XRET LRET IVOL IVOL1 EIVOL BETA SIZE6 BEME RET27;
	if A;
run;

data SEMINAR._TEMP0;
	merge SEMINAR._20140923_004_SIZE_M SEMINAR._20140923_005_VOLUME_M;
	by CODE TIME;
	if first.CODE then OBS=.;
	if SIZE>0 then OBS+1;
	if SIZE>0 then TURN=VOLUME/(SIZE*10000);
	TURN36=mean(lag1(TURN),lag2(TURN),lag3(TURN),lag4(TURN),lag5(TURN),lag6(TURN)
		,lag7(TURN),lag8(TURN),lag9(TURN),lag10(TURN),lag11(TURN),lag12(TURN)
		,lag13(TURN),lag14(TURN),lag15(TURN),lag16(TURN),lag17(TURN),lag18(TURN)
		,lag19(TURN),lag20(TURN),lag21(TURN),lag22(TURN),lag23(TURN),lag24(TURN)
		,lag25(TURN),lag26(TURN),lag27(TURN),lag28(TURN),lag29(TURN),lag30(TURN)
		,lag31(TURN),lag32(TURN),lag33(TURN),lag34(TURN),lag35(TURN),lag36(TURN));
	if OBS<37 then TURN36=.;
	STDTURN36=std(lag1(TURN),lag2(TURN),lag3(TURN),lag4(TURN),lag5(TURN),lag6(TURN)
		,lag7(TURN),lag8(TURN),lag9(TURN),lag10(TURN),lag11(TURN),lag12(TURN)
		,lag13(TURN),lag14(TURN),lag15(TURN),lag16(TURN),lag17(TURN),lag18(TURN)
		,lag19(TURN),lag20(TURN),lag21(TURN),lag22(TURN),lag23(TURN),lag24(TURN)
		,lag25(TURN),lag26(TURN),lag27(TURN),lag28(TURN),lag29(TURN),lag30(TURN)
		,lag31(TURN),lag32(TURN),lag33(TURN),lag34(TURN),lag35(TURN),lag36(TURN));
	if OBS<37 then STDTURN36=.;
	if TURN36>0 then CVTURN36=STDTURN36/TURN36;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M(in=A)
		SEMINAR._TEMP0;
	by CODE TIME;
	keep CODE TIME RET XRET LRET IVOL IVOL1 EIVOL BETA SIZE6 BEME RET27 TURN36 CVTURN36 YEAR MONTH;
	if A;
	YEAR=year(TIME);
	MONTH=month(TIME);
run;

proc sort data=SEMINAR._20141011_001_POOL_M;
	by TIME CODE;
run;

proc univariate data=SEMINAR._20141011_001_POOL_M noprint;
	var SIZE6 BEME IVOL IVOL1 EIVOL RET27 TURN36 CVTURN36;
	by YEAR MONTH;
	output out=SEMINAR._TEMP0 pctlpts=0.5 2.5 97.5 99.5 pctlpre=SIZE6_ BEME IVOL IVOL1_ EIVOL RET27_ TURN36_ CVTURN36_;
run;

data SEMINAR._20141011_001_POOL_M;
	merge SEMINAR._20141011_001_POOL_M SEMINAR._TEMP0;
	by YEAR MONTH;
	if SIZE6^=. and SIZE6<SIZE6_0_5 then SIZE6=SIZE6_0_5;
	if SIZE6^=. and SIZE6>SIZE6_99_5 then SIZE6=SIZE6_99_5;
	if SIZE6>0 then LSIZE6=log(SIZE6);
	if BEME^=. and BEME<BEME0_5 then BEME=BEME0_5;
	if BEME^=. and BEME>BEME99_5 then BEME=BEME99_5;
	if BEME>0 then LBEME=log(BEME);
	if IVOL^=. and IVOL<IVOL0_5 then IVOL=IVOL0_5;
	if IVOL^=. and IVOL>IVOL99_5 then IVOL=IVOL99_5;
	if IVOL1^=. and IVOL1<IVOL1_0_5 then IVOL1=IVOL1_0_5;
	if IVOL1^=. and IVOL1>IVOL1_99_5 then IVOL1=IVOL1_99_5;
	if EIVOL^=. and EIVOL<EIVOL2_5 then EIVOL=EIVOL2_5;
	if EIVOL^=. and EIVOL>EIVOL97_5 then EIVOL=EIVOL97_5;
	if RET27^=. and RET27<RET27_0_5 then RET27=RET27_0_5;
	if RET27^=. and RET27>RET27_99_5 then RET27=RET27_99_5;
	if TURN36^=. and TURN36<TURN36_0_5 then TURN36=TURN36_0_5;
	if TURN36^=. and TURN36>TURN36_99_5 then TURN36=TURN36_99_5;
	if TURN36>0 then LTURN36=log(TURN36);
	if CVTURN36^=. and CVTURN36<CVTURN36_0_5 then CVTURN36=CVTURN36_0_5;
	if CVTURN36^=. and CVTURN36>CVTURN36_99_5 then CVTURN36=CVTURN36_99_5;
	if CVTURN36>0 then LCVTURN36=log(CVTURN36);
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

proc means data=SEMINAR._20141011_001_POOL_M mean std median q1 q3 skew n maxdec=2;
	var RET XRET LRET IVOL EIVOL BETA LSIZE6 LBEME RET27 LTURN36 LCVTURN36;
	where TIME>"1jul1989"d and RET<300;
run;

/**/

proc corr data=SEMINAR._20141011_001_POOL_M noprint out=SEMINAR._TEMP0;
	var RET LRET IVOL IVOL1 EIVOL BETA LSIZE6 LBEME RET27 LTURN36 LCVTURN36;
	where TIME>"1jul1989"d and RET<300;
	by YEAR MONTH;
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP0(where=(_NAME_="RET"))
		SEMINAR._TEMP0(where=(_NAME_="LRET"))
		SEMINAR._TEMP0(where=(_NAME_="IVOL"))
		SEMINAR._TEMP0(where=(_NAME_="IVOL1"))
		SEMINAR._TEMP0(where=(_NAME_="EIVOL"))
		SEMINAR._TEMP0(where=(_NAME_="BETA"))
		SEMINAR._TEMP0(where=(_NAME_="LSIZE6"))
		SEMINAR._TEMP0(where=(_NAME_="LBEME"))
		SEMINAR._TEMP0(where=(_NAME_="RET27"))
		SEMINAR._TEMP0(where=(_NAME_="LTURN36"))
		SEMINAR._TEMP0(where=(_NAME_="LCVTURN36"));
	if _NAME_="RET" then NAME="01_RET";
	if _NAME_="LRET" then NAME="02_LRET";
	if _NAME_="IVOL" then NAME="03_IVOL";
	if _NAME_="IVOL1" then NAME="04_IVOL1";
	if _NAME_="EIVOL" then NAME="05_EIVOL";
	if _NAME_="BETA" then NAME="06_BETA";
	if _NAME_="LSIZE6" then NAME="07_LSIZE6";
	if _NAME_="LBEME" then NAME="08_LBEME";
	if _NAME_="RET27" then NAME="09_RET27";
	if _NAME_="LTURN36" then NAME="10_LTURN36";
	if _NAME_="LCVTURN36" then NAME="11_LCVTURN36";
run;

proc means data=SEMINAR._TEMP1 mean probt maxdec=2;
	var RET--LCVTURN36;
	by NAME;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0 _TEMP1;
run;

/**/

proc reg data=SEMINAR._20141011_001_POOL_M noprint outest=SEMINAR._TEMP0 rsquare;
	model RET=BETA LSIZE6 LBEME;
	model RET=BETA LSIZE6 LBEME RET27 LTURN36 LCVTURN36;
	model RET=EIVOL;
	model RET=LSIZE6 LBEME EIVOL;
	model RET=LSIZE6 LBEME RET27 LTURN36 LCVTURN36 EIVOL;
	model RET=LSIZE6 LBEME RET27 LTURN36 LCVTURN36 IVOL1;
	model RET=LSIZE6 LBEME RET27 LTURN36 LCVTURN36 IVOL;
	where TIME>"1jul1989"d and RET<300;
	by YEAR MONTH;
run;

proc sort data=SEMINAR._TEMP0;
	by _MODEL_ YEAR MONTH;
run;

proc means data=SEMINAR._TEMP0 mean t probt maxdec=2;
	var BETA LSIZE6 LBEME RET27 LTURN36 LCVTURN36 EIVOL IVOL1 IVOL _RSQ_;
	by _MODEL_;
run;

%macro NEWEYWEST(P01,P02,P03,P04);

ods listing close;

proc model data=&P01.;
	&P02.=mu;
	fit &P02./gmm kernel=(bart,%eval(&P03.+1),0) vardef=n;
	instruments/intonly;
	by &P04.;
	ods output parameterestimates=SEMINAR._TEMPNW;
run;

ods listing;

proc print data=SEMINAR._TEMPNW noobs;
	var &P04. Estimate tValue;
	format Estimate 8.2;
run;

proc datasets lib=SEMINAR;
	delete _TEMPNW;
run;

%mend;

%NEWEYWEST(SEMINAR._TEMP0,BETA,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LSIZE6,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LBEME,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,RET27,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LTURN36,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LCVTURN36,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,EIVOL,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,IVOL1,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,IVOL,3,_MODEL_);

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

proc sort data=SEMINAR._20141011_001_POOL_M(keep=CODE TIME XRET) out=SEMINAR._20141101_001_FEIVOL_M;
	by TIME CODE;
run;

data SEMINAR._20141101_001_FEIVOL_M;
	merge SEMINAR._20141101_001_FEIVOL_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XMKT=MARKET-RISKFREE/12;
	keep CODE TIME XRET XMKT SMB HML;
run;

proc sort data=SEMINAR._20141101_001_FEIVOL_M;
	by CODE TIME;
run;

proc means data=SEMINAR._20141101_001_FEIVOL_M noprint;
	var XRET;
	by CODE;
	output out=SEMINAR._TEMP0 n=OBS;
run;

data SEMINAR._20141101_001_FEIVOL_M;
	merge SEMINAR._20141101_001_FEIVOL_M
		SEMINAR._TEMP0(keep=CODE OBS);
	by CODE;
	if OBS<30 then delete;
run;

%macro FEIVOL;

data SEMINAR._TEMP3;
	CODE="A000010";
	TIME=.;
run;

%do P=1 %to 3;

%do Q=1 %to 3;

proc printto log="nul:";
run;

proc autoreg data=SEMINAR._20141101_001_FEIVOL_M outest=SEMINAR._TEMP0;
	model XRET=XMKT SMB HML/garch=(q=&Q.,p=&P.,type=exp) optmethod=tr maxiter=9999;
	by CODE;
	output out=SEMINAR._TEMP1(keep=CODE TIME FEIVOL&P.&Q.) ht=FEIVOL&P.&Q.;
	ods output fitsummary=SEMINAR._TEMP2;
run;

proc printto;
run;

data SEMINAR._TEMP0;
	set SEMINAR._TEMP0;
	if _STATUS_="0 Converged" then STATUS&P.&Q.=0;
	if _STATUS_="1 Warning" then STATUS&P.&Q.=1;
	keep CODE STATUS&P.&Q.;
run;

data SEMINAR._TEMP2;
	set SEMINAR._TEMP2;
	where Label2="AIC";
	by CODE;
	if last.CODE;
	AIC&P.&Q.=nValue2;
	keep CODE AIC&P.&Q.;
run;

data SEMINAR._TEMP1;
	merge SEMINAR._TEMP0-SEMINAR._TEMP2;
	by CODE;
	FEIVOL&P.&Q.=sqrt(FEIVOL&P.&Q.);
run;

data SEMINAR._TEMP3;
	merge SEMINAR._TEMP1 SEMINAR._TEMP3;
	by CODE TIME;
	if TIME;
run;

%end;

%end;

%mend;

ods listing close;
ods html close;

%FEIVOL;

ods listing;

data SEMINAR._20141101_001_FEIVOL_M;
	retain CODE TIME XRET FEIVOL AIC;
	merge SEMINAR._20141101_001_FEIVOL_M(in=A)
		SEMINAR._TEMP3;
	by CODE TIME;
	if A;
	if STATUS11^=0 then FEIVOL11=.;
	if STATUS12^=0 then FEIVOL12=.;
	if STATUS13^=0 then FEIVOL13=.;
	if STATUS21^=0 then FEIVOL21=.;
	if STATUS22^=0 then FEIVOL22=.;
	if STATUS23^=0 then FEIVOL23=.;
	if STATUS31^=0 then FEIVOL31=.;
	if STATUS32^=0 then FEIVOL32=.;
	if STATUS33^=0 then FEIVOL33=.;
	if STATUS11^=0 then AIC11=.;
	if STATUS12^=0 then AIC12=.;
	if STATUS13^=0 then AIC13=.;
	if STATUS21^=0 then AIC21=.;
	if STATUS22^=0 then AIC22=.;
	if STATUS23^=0 then AIC23=.;
	if STATUS31^=0 then AIC31=.;
	if STATUS32^=0 then AIC32=.;
	if STATUS33^=0 then AIC33=.;
	if AIC11=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL11;
	if AIC12=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL12;
	if AIC13=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL13;
	if AIC21=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL21;
	if AIC22=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL22;
	if AIC23=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL23;
	if AIC31=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL31;
	if AIC32=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL32;
	if AIC33=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then FEIVOL=FEIVOL33;
	if AIC11=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC11;
	if AIC12=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC12;
	if AIC13=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC13;
	if AIC21=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC21;
	if AIC22=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC22;
	if AIC23=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC23;
	if AIC31=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC31;
	if AIC32=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC32;
	if AIC33=min(AIC11,AIC12,AIC13,AIC21,AIC22,AIC23,AIC31,AIC32,AIC33) then AIC=AIC33;
	keep CODE TIME XRET FEIVOL AIC;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP3;
run;

proc sort data=SEMINAR._20141101_001_FEIVOL_M;
	by TIME CODE;
run;

proc corr data=SEMINAR._20141101_001_FEIVOL_M noprint out=SEMINAR._TEMP0;
	var XRET FEIVOL;
	by TIME;
run;

proc means data=SEMINAR._TEMP0 mean probt maxdec=4;
	var XRET;
	where _TYPE_="CORR" and _NAME_="FEIVOL";
run;

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

data SEMINAR._20141101_002_POOL_M;
	merge SEMINAR._20141011_001_POOL_M
		(keep=CODE TIME RET LRET BETA BEME LSIZE6 LBEME RET27 LTURN36 LCVTURN36 EIVOL IVOL IVOL1 in=A)
		SEMINAR._20141101_001_FEIVOL_M(keep=CODE TIME FEIVOL);
	by TIME CODE;
	if A;
	if RET=. then FEIVOL=.;
run;

proc univariate data=SEMINAR._20141101_002_POOL_M noprint;
	var FEIVOL;
	by TIME;
	output out=SEMINAR._TEMP0
		pctlpts=2.5 97.5
		pctlpre=FEIVOL;
run;

data SEMINAR._20141101_002_POOL_M;
	merge SEMINAR._20141101_002_POOL_M
		SEMINAR._TEMP0;
	by TIME;
	if FEIVOL^=. and FEIVOL<FEIVOL2_5 then FEIVOL=FEIVOL2_5;
	if FEIVOL^=. and FEIVOL>FEIVOL97_5 then FEIVOL=FEIVOL97_5;
	drop FEIVOL2_5 FEIVOL97_5;
run;

proc means data=SEMINAR._20141101_002_POOL_M mean std median q1 q3 skew n maxdec=2;
	var RET FEIVOL;
	where TIME>"1jul1989"d and RET<300;
run;

proc corr data=SEMINAR._20141101_002_POOL_M noprint out=SEMINAR._TEMP0;
	var FEIVOL RET LRET IVOL IVOL1 BETA LSIZE6 LBEME RET27 LTURN36 LCVTURN36;
	where TIME>"1jul1989"d and RET<300;
	by TIME;
run;

proc means data=SEMINAR._TEMP0 mean probt maxdec=2;
	var RET--LCVTURN36;
	where _TYPE_="CORR" and _NAME_="FEIVOL";
run;

/**/

proc reg data=SEMINAR._20141101_002_POOL_M noprint outest=SEMINAR._TEMP0 rsquare;
	model RET=FEIVOL;
	model RET=LSIZE6 LBEME FEIVOL;
	model RET=LSIZE6 LBEME RET27 LTURN36 LCVTURN36 FEIVOL;
	where TIME>"1jul1989"d and RET<300;
	by TIME;
run;

proc sort data=SEMINAR._TEMP0;
	by _MODEL_ TIME;
run;

proc means data=SEMINAR._TEMP0 mean t probt maxdec=2;
	var LSIZE6 LBEME RET27 LTURN36 LCVTURN36 FEIVOL _RSQ_;
	by _MODEL_;
run;

%NEWEYWEST(SEMINAR._TEMP0,LSIZE6,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LBEME,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,RET27,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LTURN36,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,LCVTURN36,3,_MODEL_);
%NEWEYWEST(SEMINAR._TEMP0,FEIVOL,3,_MODEL_);

proc datasets lib=SEMINAR;
	delete _TEMP0;
run;

/**/

proc sort data=SEMINAR._20141101_002_POOL_M out=SEMINAR._20141101_003_PORTFOLIO_M;
	by CODE TIME;
run;

data SEMINAR._20141101_003_PORTFOLIO_M;
	merge SEMINAR._20141101_003_PORTFOLIO_M(in=A)
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if A;
run;

data SEMINAR._20141101_003_PORTFOLIO_M;
	set SEMINAR._20141101_003_PORTFOLIO_M;
	EIVOL_RANK=EIVOL;
run;

proc sort data=SEMINAR._20141101_003_PORTFOLIO_M;
	by TIME CODE;
run;

proc rank data=SEMINAR._20141101_003_PORTFOLIO_M out=SEMINAR._20141101_003_PORTFOLIO_M groups=10;
	var EIVOL_RANK;
	by TIME;
run;

proc sort data=SEMINAR._20141101_003_PORTFOLIO_M;
	by TIME EIVOL_RANK CODE;
run;

proc means data=SEMINAR._20141101_003_PORTFOLIO_M noprint;
	var RET;
	by TIME EIVOL_RANK;
	weight SIZE1;
	where RET^=. and EIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141101_003_PORTFOLIO_M noprint;
	var RET;
	by TIME EIVOL_RANK;
	where RET^=. and EIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

data SEMINAR._20141101_004_PRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_);
	by TIME EIVOL_RANK;
run;

data SEMINAR._20141101_004_PRESULT_M;
	merge SEMINAR._20141101_004_PRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141101_004_PRESULT_M;
	by EIVOL_RANK TIME;
run;

proc means data=SEMINAR._20141101_004_PRESULT_M noprint;
	var VWRET EWRET;
	by EIVOL_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var EIVOL_RANK VWRET EWRET;
run;

proc reg data=SEMINAR._20141101_004_PRESULT_M noprint outest=SEMINAR._TEMP1;
	model XVWRET=XMKT SMB HML;
	by EIVOL_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var EIVOL_RANK Intercept;
run;

proc sort data=SEMINAR._20141101_003_PORTFOLIO_M out=SEMINAR._TEMP3;
	by EIVOL_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var EIVOL IVOL BETA;
	by EIVOL_RANK;
	where RET^=. and EIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=EIVOL IVOL BETA;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var EIVOL_RANK EIVOL IVOL BETA;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var SIZE BEME;
	by EIVOL_RANK;
	where RET^=. and EIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP3 median=SIZE BEME;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var EIVOL_RANK SIZE BEME;
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[302*1-301:302*1]
		||XVWRET[302*2-301:302*2]
		||XVWRET[302*3-301:302*3]
		||XVWRET[302*4-301:302*4]
		||XVWRET[302*5-301:302*5]
		||XVWRET[302*6-301:302*6]
		||XVWRET[302*7-301:302*7]
		||XVWRET[302*8-301:302*8]
		||XVWRET[302*9-301:302*9]
		||XVWRET[302*10-301:302*10];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(302,1)*MU`)`*(XVWRETM-j(302,1)*MU`)/301;
	RESIDM=RESID[302*1-301:302*1]
		||RESID[302*2-301:302*2]
		||RESID[302*3-301:302*3]
		||RESID[302*4-301:302*4]
		||RESID[302*5-301:302*5]
		||RESID[302*6-301:302*6]
		||RESID[302*7-301:302*7]
		||RESID[302*8-301:302*8]
		||RESID[302*9-301:302*9]
		||RESID[302*10-301:302*10];
	SIGMA=RESIDM`*RESIDM/298;
	GRS=(302-10-3)/(10)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,10,302-10-3);
	print GRS PVAL;
quit;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP4;
run;

/**/

proc sort data=SEMINAR._20141101_002_POOL_M out=SEMINAR._20141101_005_FPORT_M;
	by CODE TIME;
run;

data SEMINAR._20141101_005_FPORT_M;
	merge SEMINAR._20141101_005_FPORT_M(in=A)
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	SIZE1=lag1(SIZE);
	if A;
run;

data SEMINAR._20141101_005_FPORT_M;
	set SEMINAR._20141101_005_FPORT_M;
	FEIVOL_RANK=FEIVOL;
run;

proc sort data=SEMINAR._20141101_005_FPORT_M;
	by TIME CODE;
run;

proc rank data=SEMINAR._20141101_005_FPORT_M out=SEMINAR._20141101_005_FPORT_M groups=10;
	var FEIVOL_RANK;
	by TIME;
run;

proc sort data=SEMINAR._20141101_005_FPORT_M;
	by TIME FEIVOL_RANK CODE;
run;

proc means data=SEMINAR._20141101_005_FPORT_M noprint;
	var RET;
	by TIME FEIVOL_RANK;
	weight SIZE1;
	where RET^=. and FEIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141101_005_FPORT_M noprint;
	var RET;
	by TIME FEIVOL_RANK;
	where RET^=. and FEIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

data SEMINAR._20141101_006_FPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_);
	by TIME FEIVOL_RANK;
run;

data SEMINAR._20141101_006_FPRESULT_M;
	merge SEMINAR._20141101_006_FPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141101_006_FPRESULT_M;
	by FEIVOL_RANK TIME;
run;

proc means data=SEMINAR._20141101_006_FPRESULT_M noprint;
	var VWRET EWRET;
	by FEIVOL_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var FEIVOL_RANK VWRET EWRET;
run;

proc reg data=SEMINAR._20141101_006_FPRESULT_M noprint outest=SEMINAR._TEMP1;
	model XVWRET=XMKT SMB HML;
	by FEIVOL_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var FEIVOL_RANK Intercept;
run;

proc sort data=SEMINAR._20141101_005_FPORT_M out=SEMINAR._TEMP3;
	by FEIVOL_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var FEIVOL IVOL BETA;
	by FEIVOL_RANK;
	where RET^=. and FEIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=FEIVOL IVOL BETA;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var FEIVOL_RANK FEIVOL IVOL BETA;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var SIZE BEME;
	by FEIVOL_RANK;
	where RET^=. and FEIVOL_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP3 median=SIZE BEME;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var FEIVOL_RANK SIZE BEME;
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5]
		||XVWRET[308*6-307:308*6]
		||XVWRET[308*7-307:308*7]
		||XVWRET[308*8-307:308*8]
		||XVWRET[308*9-307:308*9]
		||XVWRET[308*10-307:308*10];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5]
		||RESID[308*6-307:308*6]
		||RESID[308*7-307:308*7]
		||RESID[308*8-307:308*8]
		||RESID[308*9-307:308*9]
		||RESID[308*10-307:308*10];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-10-3)/(10)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,10,308-10-3);
	print GRS PVAL;
quit;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP4;
run;

/**/

proc sort data=SEMINAR._20141101_002_POOL_M out=SEMINAR._20141126_001_LPORT_M;
	by CODE TIME;
run;

data SEMINAR._20141126_001_LPORT_M;
	merge SEMINAR._20141126_001_LPORT_M(in=A)
		SEMINAR._20140923_003_RETURN_M
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	RET1=lag1(RETURN);
	SIZE1=lag1(SIZE);
	if A;
	drop RETURN;
run;

data SEMINAR._20141126_001_LPORT_M;
	set SEMINAR._20141126_001_LPORT_M;
	IVOL1_RANK=IVOL1;
run;

proc sort data=SEMINAR._20141126_001_LPORT_M;
	by TIME CODE;
run;

proc rank data=SEMINAR._20141126_001_LPORT_M out=SEMINAR._20141126_001_LPORT_M groups=5;
	var IVOL1_RANK;
	by TIME;
run;

proc sort data=SEMINAR._20141126_001_LPORT_M;
	by TIME IVOL1_RANK CODE;
run;

proc means data=SEMINAR._20141126_001_LPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK;
	weight SIZE1;
	where RET^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141126_001_LPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

proc means data=SEMINAR._20141126_001_LPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK;
	weight SIZE1;
	where RET1^=. and IVOL1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP2 mean=VWRET1;
run;

proc means data=SEMINAR._20141126_001_LPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK;
	where RET1^=. and IVOL1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP3 mean=EWRET1;
run;

data SEMINAR._20141126_002_LPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP2(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP3(drop=_TYPE_ _FREQ_);
	by TIME IVOL1_RANK;
run;

data SEMINAR._20141126_002_LPRESULT_M;
	merge SEMINAR._20141126_002_LPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XVWRET1=VWRET1-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141126_002_LPRESULT_M;
	by IVOL1_RANK TIME;
run;

proc means data=SEMINAR._20141126_002_LPRESULT_M noprint;
	var VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
	by IVOL1_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var IVOL1_RANK VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

proc reg data=SEMINAR._20141126_002_LPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XVWRET=XMKT SMB HML;
	by IVOL1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

data SEMINAR._TEMP2;
	merge SEMINAR._20141126_002_LPRESULT_M(where=(IVOL1_RANK=0) rename=(XVWRET=X1))
		SEMINAR._20141126_002_LPRESULT_M(where=(IVOL1_RANK=4) keep=XVWRET IVOL1_RANK rename=(XVWRET=X5));
	XVWRET51=X5-X1;
run;

proc reg data=SEMINAR._TEMP2 noprint outest=SEMINAR._TEMP3 tableout;
	model XVWRET51=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

proc reg data=SEMINAR._20141126_002_LPRESULT_M noprint outest=SEMINAR._TEMP2 tableout;
	model XVWRET1=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP2;
	merge SEMINAR._20141126_002_LPRESULT_M(where=(IVOL1_RANK=0) rename=(XVWRET1=X1))
		SEMINAR._20141126_002_LPRESULT_M(where=(IVOL1_RANK=4) keep=XVWRET1 IVOL1_RANK rename=(XVWRET1=X5));
	XVWRET51=X5-X1;
run;

proc reg data=SEMINAR._TEMP2 noprint outest=SEMINAR._TEMP3 tableout;
	model XVWRET51=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

proc sort data=SEMINAR._20141126_001_LPORT_M out=SEMINAR._TEMP3;
	by IVOL1_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var IVOL1 IVOL SIZE1;
	by IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=IVOL1 IVOL SIZE1;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK IVOL1 IVOL SIZE1;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var RET;
	by IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP5 n=RET;
run;

proc print data=SEMINAR._TEMP5 noobs;
	var IVOL1_RANK RET;
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-5-3)/(5)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,5,308-5-3);
	print GRS PVAL;
quit;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

proc sort data=SEMINAR._20141101_002_POOL_M out=SEMINAR._20141128_001_HPORT_M;
	by CODE TIME;
run;

data SEMINAR._20141128_001_HPORT_M;
	merge SEMINAR._20141128_001_HPORT_M(in=A)
		SEMINAR._20140923_003_RETURN_M
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	RET1=lag1(RETURN);
	SIZE1=lag1(SIZE);
	if A;
	drop RETURN;
run;

data SEMINAR._20141128_001_HPORT_M;
	set SEMINAR._20141128_001_HPORT_M;
	IVOL1_RANK=IVOL1;
	RET1_RANK=RET1;
run;

proc sort data=SEMINAR._20141128_001_HPORT_M;
	by TIME CODE;
run;

proc rank data=SEMINAR._20141128_001_HPORT_M out=SEMINAR._20141128_001_HPORT_M groups=5;
	var IVOL1_RANK;
	by TIME;
run;

proc sort data=SEMINAR._20141128_001_HPORT_M;
	by TIME IVOL1_RANK CODE;
run;

proc rank data=SEMINAR._20141128_001_HPORT_M out=SEMINAR._20141128_001_HPORT_M groups=5;
	var RET1_RANK;
	by TIME IVOL1_RANK;
run;

proc sort data=SEMINAR._20141128_001_HPORT_M;
	by TIME IVOL1_RANK RET1_RANK CODE;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK RET1_RANK;
	weight SIZE1;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK RET1_RANK;
	weight SIZE1;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP2 mean=VWRET1;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK RET1_RANK;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP3 mean=EWRET1;
run;

data SEMINAR._20141128_002_HPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP2(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP3(drop=_TYPE_ _FREQ_);
	by TIME IVOL1_RANK RET1_RANK;
run;

data SEMINAR._20141128_002_HPRESULT_M;
	merge SEMINAR._20141128_002_HPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XVWRET1=VWRET1-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141128_002_HPRESULT_M;
	by IVOL1_RANK RET1_RANK TIME;
run;

proc means data=SEMINAR._20141128_002_HPRESULT_M noprint;
	var VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
	by IVOL1_RANK RET1_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var IVOL1_RANK RET1_RANK VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

proc reg data=SEMINAR._20141128_002_HPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XVWRET=XMKT SMB HML;
	by IVOL1_RANK RET1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK RET1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK RET1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

proc reg data=SEMINAR._20141128_002_HPRESULT_M noprint outest=SEMINAR._TEMP2 tableout;
	model XVWRET1=XMKT SMB HML;
	by IVOL1_RANK RET1_RANK;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK RET1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK RET1_RANK Intercept;
	where _TYPE_="T";
run;

proc sort data=SEMINAR._20141128_001_HPORT_M out=SEMINAR._TEMP3;
	by IVOL1_RANK RET1_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var IVOL1 IVOL SIZE1;
	by IVOL1_RANK RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=IVOL1 IVOL SIZE1;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK RET1_RANK IVOL1 IVOL SIZE1;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var RET;
	by IVOL1_RANK RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP5 n=RET;
run;

proc print data=SEMINAR._TEMP5 noobs;
	var IVOL1_RANK RET1_RANK RET;
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5]
		||XVWRET[308*6-307:308*6]
		||XVWRET[308*7-307:308*7]
		||XVWRET[308*8-307:308*8]
		||XVWRET[308*9-307:308*9]
		||XVWRET[308*10-307:308*10]
		||XVWRET[308*11-307:308*11]
		||XVWRET[308*12-307:308*12]
		||XVWRET[308*13-307:308*13]
		||XVWRET[308*14-307:308*14]
		||XVWRET[308*15-307:308*15]
		||XVWRET[308*16-307:308*16]
		||XVWRET[308*17-307:308*17]
		||XVWRET[308*18-307:308*18]
		||XVWRET[308*19-307:308*19]
		||XVWRET[308*20-307:308*20]
		||XVWRET[308*21-307:308*21]
		||XVWRET[308*22-307:308*22]
		||XVWRET[308*23-307:308*23]
		||XVWRET[308*24-307:308*24]
		||XVWRET[308*25-307:308*25];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5]
		||RESID[308*6-307:308*6]
		||RESID[308*7-307:308*7]
		||RESID[308*8-307:308*8]
		||RESID[308*9-307:308*9]
		||RESID[308*10-307:308*10]
		||RESID[308*11-307:308*11]
		||RESID[308*12-307:308*12]
		||RESID[308*13-307:308*13]
		||RESID[308*14-307:308*14]
		||RESID[308*15-307:308*15]
		||RESID[308*16-307:308*16]
		||RESID[308*17-307:308*17]
		||RESID[308*18-307:308*18]
		||RESID[308*19-307:308*19]
		||RESID[308*20-307:308*20]
		||RESID[308*21-307:308*21]
		||RESID[308*22-307:308*22]
		||RESID[308*23-307:308*23]
		||RESID[308*24-307:308*24]
		||RESID[308*25-307:308*25];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-25-3)/(25)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,25,308-25-3);
	print GRS PVAL;
quit;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

proc sort data=SEMINAR._20141128_001_HPORT_M;
	by TIME RET1_RANK CODE;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET;
	by TIME RET1_RANK;
	weight SIZE1;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET;
	by TIME RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET1;
	by TIME RET1_RANK;
	weight SIZE1;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP2 mean=VWRET1;
run;

proc means data=SEMINAR._20141128_001_HPORT_M noprint;
	var RET1;
	by TIME RET1_RANK;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP3 mean=EWRET1;
run;

data SEMINAR._20141128_002_HPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP2(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP3(drop=_TYPE_ _FREQ_);
	by TIME RET1_RANK;
run;

data SEMINAR._20141128_002_HPRESULT_M;
	merge SEMINAR._20141128_002_HPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XVWRET1=VWRET1-RISKFREE/12;
	XEWRET=EWRET-RISKFREE/12;
	XEWRET1=EWRET1-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141128_002_HPRESULT_M;
	by RET1_RANK TIME;
run;

proc means data=SEMINAR._20141128_002_HPRESULT_M noprint;
	var VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
	by RET1_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var RET1_RANK VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
run;

proc reg data=SEMINAR._20141128_002_HPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XVWRET=XMKT SMB HML;
	by RET1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-5-3)/(5)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,5,308-5-3);
	print GRS PVAL;
quit;

proc reg data=SEMINAR._20141128_002_HPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XEWRET=XMKT SMB HML;
	by RET1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-5-3)/(5)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,5,308-5-3);
	print GRS PVAL;
quit;

proc sort data=SEMINAR._20141128_001_HPORT_M out=SEMINAR._TEMP3;
	by RET1_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var IVOL1 IVOL SIZE1;
	by RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP2 mean=IVOL1 IVOL SIZE1;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var RET1_RANK IVOL1 IVOL SIZE1;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var RET;
	by RET1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300 and IVOL1_RANK>2;
	output out=SEMINAR._TEMP5 n=RET;
run;

proc print data=SEMINAR._TEMP5 noobs;
	var RET1_RANK RET;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

proc sort data=SEMINAR._20141101_002_POOL_M out=SEMINAR._20141129_001_RPORT_M;
	by CODE TIME;
run;

data SEMINAR._20141129_001_RPORT_M;
	merge SEMINAR._20141129_001_RPORT_M(in=A)
		SEMINAR._20140923_003_RETURN_M
		SEMINAR._20140923_004_SIZE_M;
	by CODE TIME;
	RET1=lag1(RETURN);
	SIZE1=lag1(SIZE);
	if A;
	drop RETURN;
run;

data SEMINAR._20141129_001_RPORT_M;
	set SEMINAR._20141129_001_RPORT_M;
	IVOL1_RANK=IVOL1;
	RET1_RANK=RET1;
run;

proc sort data=SEMINAR._20141129_001_RPORT_M;
	by TIME CODE;
run;

proc rank data=SEMINAR._20141129_001_RPORT_M out=SEMINAR._20141129_001_RPORT_M groups=5;
	var RET1_RANK;
	by TIME;
run;

proc sort data=SEMINAR._20141129_001_RPORT_M;
	by TIME RET1_RANK CODE;
run;

proc rank data=SEMINAR._20141129_001_RPORT_M out=SEMINAR._20141129_001_RPORT_M groups=5;
	var IVOL1_RANK;
	by TIME RET1_RANK;
run;

proc sort data=SEMINAR._20141129_001_RPORT_M;
	by TIME RET1_RANK IVOL1_RANK CODE;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET;
	by TIME RET1_RANK IVOL1_RANK;
	weight SIZE1;
	where RET^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET;
	by TIME RET1_RANK IVOL1_RANK;
	where RET^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET1;
	by TIME RET1_RANK IVOL1_RANK;
	weight SIZE1;
	where RET1^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP2 mean=VWRET1;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET1;
	by TIME RET1_RANK IVOL1_RANK;
	where RET1^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP3 mean=EWRET1;
run;

data SEMINAR._20141129_002_RPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP2(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP3(drop=_TYPE_ _FREQ_);
	by TIME RET1_RANK IVOL1_RANK;
run;

data SEMINAR._20141129_002_RPRESULT_M;
	merge SEMINAR._20141129_002_RPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XVWRET1=VWRET1-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141129_002_RPRESULT_M;
	by RET1_RANK IVOL1_RANK TIME;
run;

proc means data=SEMINAR._20141129_002_RPRESULT_M noprint;
	var VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
	by RET1_RANK IVOL1_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var RET1_RANK IVOL1_RANK VWRET EWRET XVWRET VWRET1 EWRET1 XVWRET1;
run;

goptions xpixels=800 ypixels=600 border;

proc g3d data=SEMINAR._TEMP0;
	plot RET1_RANK*IVOL1_RANK=XVWRET/grid rotate=15 tilt=75 ctop=blue cbottom=blue xticknum=5 yticknum=5 zticknum=5 zmin=-3 zmax=1;
	label RET1_RANK=;
	label IVOL1_RANK=;
run;

proc g3d data=SEMINAR._TEMP0;
	plot RET1_RANK*IVOL1_RANK=XVWRET1/grid rotate=15 tilt=75 ctop=blue cbottom=blue xticknum=5 yticknum=5 zticknum=5 zmin=-50 zmax=50;
	label RET1_RANK=;
	label IVOL1_RANK=;
run;

goptions;

proc reg data=SEMINAR._20141129_002_RPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XVWRET=XMKT SMB HML;
	by RET1_RANK IVOL1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var RET1_RANK IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

goptions xpixels=800 ypixels=600 border;

proc g3d data=SEMINAR._TEMP1;
	plot RET1_RANK*IVOL1_RANK=Intercept/grid rotate=15 tilt=75 ctop=blue cbottom=blue xticknum=5 yticknum=5 zticknum=5 zmin=-3 zmax=1;
	label RET1_RANK=;
	label IVOL1_RANK=;
	label Intercept="XVWFFA";
run;

goptions;

proc reg data=SEMINAR._20141129_002_RPRESULT_M noprint outest=SEMINAR._TEMP2 tableout;
	model XVWRET1=XMKT SMB HML;
	by RET1_RANK IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var RET1_RANK IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP2 noobs;
	var RET1_RANK IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

goptions xpixels=800 ypixels=600 border;

proc g3d data=SEMINAR._TEMP2;
	plot RET1_RANK*IVOL1_RANK=Intercept/grid rotate=15 tilt=75 ctop=blue cbottom=blue xticknum=5 yticknum=5 zticknum=5 zmin=-50 zmax=50;
	label RET1_RANK=;
	label IVOL1_RANK=;
	label Intercept="XVWFFA1";
run;

goptions;

proc sort data=SEMINAR._20141129_001_RPORT_M out=SEMINAR._TEMP3;
	by RET1_RANK IVOL1_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var IVOL1 IVOL SIZE1;
	by RET1_RANK IVOL1_RANK;
	where RET^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=IVOL1 IVOL SIZE1;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var RET1_RANK IVOL1_RANK IVOL1 IVOL SIZE1;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var RET;
	by RET1_RANK IVOL1_RANK;
	where RET^=. and RET1_RANK^=. and IVOL1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP5 n=RET;
run;

proc print data=SEMINAR._TEMP5 noobs;
	var RET1_RANK IVOL1_RANK RET;
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5]
		||XVWRET[308*6-307:308*6]
		||XVWRET[308*7-307:308*7]
		||XVWRET[308*8-307:308*8]
		||XVWRET[308*9-307:308*9]
		||XVWRET[308*10-307:308*10]
		||XVWRET[308*11-307:308*11]
		||XVWRET[308*12-307:308*12]
		||XVWRET[308*13-307:308*13]
		||XVWRET[308*14-307:308*14]
		||XVWRET[308*15-307:308*15]
		||XVWRET[308*16-307:308*16]
		||XVWRET[308*17-307:308*17]
		||XVWRET[308*18-307:308*18]
		||XVWRET[308*19-307:308*19]
		||XVWRET[308*20-307:308*20]
		||XVWRET[308*21-307:308*21]
		||XVWRET[308*22-307:308*22]
		||XVWRET[308*23-307:308*23]
		||XVWRET[308*24-307:308*24]
		||XVWRET[308*25-307:308*25];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5]
		||RESID[308*6-307:308*6]
		||RESID[308*7-307:308*7]
		||RESID[308*8-307:308*8]
		||RESID[308*9-307:308*9]
		||RESID[308*10-307:308*10]
		||RESID[308*11-307:308*11]
		||RESID[308*12-307:308*12]
		||RESID[308*13-307:308*13]
		||RESID[308*14-307:308*14]
		||RESID[308*15-307:308*15]
		||RESID[308*16-307:308*16]
		||RESID[308*17-307:308*17]
		||RESID[308*18-307:308*18]
		||RESID[308*19-307:308*19]
		||RESID[308*20-307:308*20]
		||RESID[308*21-307:308*21]
		||RESID[308*22-307:308*22]
		||RESID[308*23-307:308*23]
		||RESID[308*24-307:308*24]
		||RESID[308*25-307:308*25];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-25-3)/(25)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,25,308-25-3);
	print GRS PVAL;
quit;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

proc sort data=SEMINAR._20141129_001_RPORT_M;
	by TIME IVOL1_RANK CODE;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK;
	weight SIZE1;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP0 mean=VWRET;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET;
	by TIME IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP1 mean=EWRET;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK;
	weight SIZE1;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP2 mean=VWRET1;
run;

proc means data=SEMINAR._20141129_001_RPORT_M noprint;
	var RET1;
	by TIME IVOL1_RANK;
	where RET1^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET1<300;
	output out=SEMINAR._TEMP3 mean=EWRET1;
run;

data SEMINAR._20141129_002_RPRESULT_M;
	merge SEMINAR._TEMP0(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP1(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP2(drop=_TYPE_ _FREQ_)
		SEMINAR._TEMP3(drop=_TYPE_ _FREQ_);
	by TIME IVOL1_RANK;
run;

data SEMINAR._20141129_002_RPRESULT_M;
	merge SEMINAR._20141129_002_RPRESULT_M(in=A)
		SEMINAR._20140925_002_MARKET_M
		SEMINAR._20140925_004_RISKFREE_M
		SEMINAR._20140924_015_FACTOR_M;
	by TIME;
	if A;
	XVWRET=VWRET-RISKFREE/12;
	XVWRET1=VWRET1-RISKFREE/12;
	XEWRET=EWRET-RISKFREE/12;
	XEWRET1=EWRET1-RISKFREE/12;
	XMKT=MARKET-RISKFREE/12;
run;

proc sort data=SEMINAR._20141129_002_RPRESULT_M;
	by IVOL1_RANK TIME;
run;

proc means data=SEMINAR._20141129_002_RPRESULT_M noprint;
	var VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
	by IVOL1_RANK;
	output out=SEMINAR._TEMP0 mean=VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
run;

proc print data=SEMINAR._TEMP0 noobs;
	var IVOL1_RANK VWRET EWRET XVWRET XEWRET VWRET1 EWRET1 XVWRET1 XEWRET1;
run;

proc reg data=SEMINAR._20141129_002_RPRESULT_M noprint outest=SEMINAR._TEMP1 tableout;
	model XVWRET=XMKT SMB HML;
	by IVOL1_RANK;
	output out=SEMINAR._TEMP4 r=RESID;
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP1 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP1;
	set SEMINAR._TEMP1;
	where _TYPE_="PARMS";
run;

data SEMINAR._TEMP2;
	merge SEMINAR._20141129_002_RPRESULT_M(where=(IVOL1_RANK=0) rename=(XVWRET=X1))
		SEMINAR._20141129_002_RPRESULT_M(where=(IVOL1_RANK=4) keep=XVWRET IVOL1_RANK rename=(XVWRET=X5));
	XVWRET51=X5-X1;
run;

proc reg data=SEMINAR._TEMP2 noprint outest=SEMINAR._TEMP3 tableout;
	model XVWRET51=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

proc reg data=SEMINAR._20141129_002_RPRESULT_M noprint outest=SEMINAR._TEMP2 tableout;
	model XVWRET1=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

data SEMINAR._TEMP2;
	merge SEMINAR._20141129_002_RPRESULT_M(where=(IVOL1_RANK=0) rename=(XVWRET1=X1))
		SEMINAR._20141129_002_RPRESULT_M(where=(IVOL1_RANK=4) keep=XVWRET1 IVOL1_RANK rename=(XVWRET1=X5));
	XVWRET51=X5-X1;
run;

proc reg data=SEMINAR._TEMP2 noprint outest=SEMINAR._TEMP3 tableout;
	model XVWRET51=XMKT SMB HML;
	by IVOL1_RANK;
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="PARMS";
run;

proc print data=SEMINAR._TEMP3 noobs;
	var IVOL1_RANK Intercept;
	where _TYPE_="T";
run;

proc iml;
	use SEMINAR._TEMP4;
	read all var {XVWRET} into XVWRET;
	read all var {RESID} into RESID;
	use SEMINAR._TEMP1;
	read all var {Intercept} into ALPHA;
	XVWRETM=XVWRET[308*1-307:308*1]
		||XVWRET[308*2-307:308*2]
		||XVWRET[308*3-307:308*3]
		||XVWRET[308*4-307:308*4]
		||XVWRET[308*5-307:308*5];
	MU=mean(XVWRETM)`;
	OMEGA=(XVWRETM-j(308,1)*MU`)`*(XVWRETM-j(308,1)*MU`)/307;
	RESIDM=RESID[308*1-307:308*1]
		||RESID[308*2-307:308*2]
		||RESID[308*3-307:308*3]
		||RESID[308*4-307:308*4]
		||RESID[308*5-307:308*5];
	SIGMA=RESIDM`*RESIDM/304;
	GRS=(308-5-3)/(5)*(ALPHA`*inv(SIGMA)*ALPHA)/(1+MU`*inv(OMEGA)*MU);
	PVAL=1-probf(GRS,5,308-5-3);
	print GRS PVAL;
quit;

proc sort data=SEMINAR._20141129_001_RPORT_M out=SEMINAR._TEMP3;
	by IVOL1_RANK CODE TIME;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var IVOL1 IVOL SIZE1;
	by IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP2 mean=IVOL1 IVOL SIZE1;
run;

proc print data=SEMINAR._TEMP2 noobs;
	var IVOL1_RANK IVOL1 IVOL SIZE1;
run;

proc means data=SEMINAR._TEMP3 noprint;
	var RET;
	by IVOL1_RANK;
	where RET^=. and IVOL1_RANK^=. and RET1_RANK^=. and SIZE1^=. and RET<300;
	output out=SEMINAR._TEMP5 n=RET;
run;

proc print data=SEMINAR._TEMP5 noobs;
	var IVOL1_RANK RET;
run;

proc datasets lib=SEMINAR;
	delete _TEMP0-_TEMP5;
run;

/**/

quit;
