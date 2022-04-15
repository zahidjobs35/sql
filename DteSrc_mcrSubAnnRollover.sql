CREATE PROCEDURE DteSrc_mcrSubAnnRollover()

BEGIN	

	--DoCmd.OpenQuery "000AnnRollStart", acViewNormal, acEdit

	INSERT INTO LogCmn_tblLoadTrack ( BizGroup, BizUnit, Country, Brand, TimeZone, LoadType, LoadStart, DataKey )
	SELECT LogSet_tblCmnFilters.BizGroup, LogSet_tblCmnFilters.BizUnit, LogSet_tblCmnFilters.Country, LogSet_tblCmnFilters.Brand, LogSet_tblCmnFilters.TimeZone, "AnnRoll" AS LoadType, Now() AS LoadStart, [BizGroup] & [BizUnit] & [Country] & [Brand] & [LoadType] & CDbl([LoadStart]) AS DataKey
	FROM LogSet_tblCmnFilters;



    --DoCmd.OpenQuery "100Adj4YrStartEndTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblAdj4YrStartEnd.*
	FROM DteSrc_tblAdj4YrStartEnd;


	
	
    --DoCmd.OpenQuery "101AdjDateDailyTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjDatesDaily.*
	FROM DteSrc_tblAdjDatesDaily;


	
    --DoCmd.OpenQuery "102AdjDateDailyTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjDatesDaily
	SELECT DteSrc_tblAdjPeriodDateCombo.*
	FROM DteSrc_TblBaseYear INNER JOIN DteSrc_tblAdjPeriodDateCombo ON DteSrc_TblBaseYear.BaseYear = DteSrc_tblAdjPeriodDateCombo.BaseYear;

	
	
    --DoCmd.OpenQuery "103AdjDateWklyTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjDatesWkly.*
	FROM DteSrc_tblAdjDatesWkly;

	
	
    --DoCmd.OpenQuery "104AdjDatesWklyTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjDatesWkly ( Date_EOW, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN qry104RefDate_EOW ON DteSrc_tblAdjDatesDaily.Date = qry104RefDate_EOW.MaxOfDate;

	
    --DoCmd.OpenQuery "105AdjDate_BOWTblWipe", acViewNormal, acEdit
	
	DELETE DteWrk_tblAdjDatesBOW.*
	FROM DteWrk_tblAdjDatesBOW;


	
    --DoCmd.OpenQuery "106AdjDate_BOWTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteWrk_tblAdjDatesBOW ( AdjRprtYrWk, MinOfDate )
	SELECT DteSrc_tblAdjDatesDaily.AdjRprtYrWk, Min(DteSrc_tblAdjDatesDaily.Date) AS MinOfDate
	FROM DteSrc_tblAdjDatesDaily
	GROUP BY DteSrc_tblAdjDatesDaily.AdjRprtYrWk
	ORDER BY DteSrc_tblAdjDatesDaily.AdjRprtYrWk;

	
	
    --DoCmd.OpenQuery "107AdjDatesTblBOWDateAdd", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesWkly INNER JOIN DteWrk_tblAdjDatesBOW ON DteSrc_tblAdjDatesWkly.AdjRprtYrWk = DteWrk_tblAdjDatesBOW.AdjRprtYrWk SET DteSrc_tblAdjDatesWkly.Date_BOW = [DteWrk_tblAdjDatesBOW].MinOfDate;

	
	
    --DoCmd.OpenQuery "108AdjDateMthlyTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjDatesMthly.*
	FROM DteSrc_tblAdjDatesMthly;


	
    --DoCmd.OpenQuery "109AdjDatesMthlyTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjDatesMthly ( Date_EOM, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN qry109RefDate_EOM ON DteSrc_tblAdjDatesDaily.Date = qry109RefDate_EOM.MaxOfDate;

	
	
    --DoCmd.OpenQuery "110AdjDate_BOMTblWipe", acViewNormal, acEdit
	
	DELETE DteWrk_tblAdjDatesBOM.*
	FROM DteWrk_tblAdjDatesBOM;

	
	
    --DoCmd.OpenQuery "111AdjDate_BOMTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteWrk_tblAdjDatesBOM ( AdjRprtYrMth, MinOfDate )
	SELECT DteSrc_tblAdjDatesDaily.AdjRprtYrMth, Min(DteSrc_tblAdjDatesDaily.Date) AS MinOfDate
	FROM DteSrc_tblAdjDatesDaily
	GROUP BY DteSrc_tblAdjDatesDaily.AdjRprtYrMth
	ORDER BY DteSrc_tblAdjDatesDaily.AdjRprtYrMth;

	
	
    --DoCmd.OpenQuery "112AdjDatesTblBOMDateAdd", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesMthly INNER JOIN DteWrk_tblAdjDatesBOM ON DteSrc_tblAdjDatesMthly.AdjRprtYrMth = DteWrk_tblAdjDatesBOM.AdjRprtYrMth SET DteSrc_tblAdjDatesMthly.Date_BOM = [DteWrk_tblAdjDatesBOM].MinOfDate;

	
	
    --DoCmd.OpenQuery "113AdjDateQtrlyTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjDatesQtrly.*
	FROM DteSrc_tblAdjDatesQtrly;

	
	
    --DoCmd.OpenQuery "114AdjDatesQtrlyTblLoad", acViewNormal, acEdit
	
	
	INSERT INTO DteSrc_tblAdjDatesQtrly ( Date_EOQ, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN qry114RefDate_EOQ ON DteSrc_tblAdjDatesDaily.Date = qry114RefDate_EOQ.MaxOfDate;

	
    --DoCmd.OpenQuery "115AdjDate_BOQTblWipe", acViewNormal, acEdit
	
	DELETE DteWrk_tblAdjDatesBOQ.*
	FROM DteWrk_tblAdjDatesBOQ;

	
    --DoCmd.OpenQuery "116AdjDate_BOQTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteWrk_tblAdjDatesBOQ ( AdjRprtYrQtr, MinOfDate )
	SELECT DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, Min(DteSrc_tblAdjDatesDaily.Date) AS MinOfDate
	FROM DteSrc_tblAdjDatesDaily
	GROUP BY DteSrc_tblAdjDatesDaily.AdjRprtYrQtr
	ORDER BY DteSrc_tblAdjDatesDaily.AdjRprtYrQtr;

	
	
    --DoCmd.OpenQuery "117AdjDatesTblBOQDateAdd", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesQtrly INNER JOIN DteWrk_tblAdjDatesBOQ ON DteSrc_tblAdjDatesQtrly.AdjRprtYrQtr = DteWrk_tblAdjDatesBOQ.AdjRprtYrQtr SET DteSrc_tblAdjDatesQtrly.Date_BOQ = [DteWrk_tblAdjDatesBOQ].MinOfDate;

	
	
    --DoCmd.OpenQuery "118AdjDateYrlyTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjDatesYrly.*
	FROM DteSrc_tblAdjDatesYrly;

	
	
    --DoCmd.OpenQuery "119AdjDatesYrlyTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjDatesYrly ( Date_EOY, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN qry119RefDate_EOY ON DteSrc_tblAdjDatesDaily.Date = qry119RefDate_EOY.MaxOfDate;

	
	
    --DoCmd.OpenQuery "120AdjDate_BOQTblWipe", acViewNormal, acEdit
	
	
	DELETE DteWrk_tblAdjDatesBOY.*
	FROM DteWrk_tblAdjDatesBOY;

	
    --DoCmd.OpenQuery "121AdjDate_BOYTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteWrk_tblAdjDatesBOY ( AdjRprtYear, MinOfDate )
	SELECT DteSrc_tblAdjDatesDaily.AdjRprtYear, Min(DteSrc_tblAdjDatesDaily.Date) AS MinOfDate
	FROM DteSrc_tblAdjDatesDaily
	GROUP BY DteSrc_tblAdjDatesDaily.AdjRprtYear
	ORDER BY DteSrc_tblAdjDatesDaily.AdjRprtYear;

	
	
    --DoCmd.OpenQuery "122AdjDatesTblBOYDateAdd", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesYrly INNER JOIN DteWrk_tblAdjDatesBOY ON DteSrc_tblAdjDatesYrly.AdjRprtYear = DteWrk_tblAdjDatesBOY.AdjRprtYear SET DteSrc_tblAdjDatesYrly.Date_BOY = [DteWrk_tblAdjDatesBOY].MinOfDate;

	
	
    --DoCmd.OpenQuery "131AdjMthBaseDayTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblAdjMthBaseDays.*
	FROM DteSrc_tblAdjMthBaseDays;

	
    --DoCmd.OpenQuery "132AdjMthBaseDayTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjMthBaseDays ( BaseYear, AdjRprtYrMth, [Date] )
	SELECT DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.Date
	FROM DteSrc_tblAdjDatesDaily
	GROUP BY DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.Date;

	
	
    --DoCmd.OpenQuery "133AdjMthBaseWkTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblAdjMthBaseWks.*
	FROM DteSrc_tblAdjMthBaseWks;

	
	
    --DoCmd.OpenQuery "134AdjMthBaseWkTblLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdjMthBaseWks ( BaseYear, AdjRprtYrMth, RprtYrWk )
	SELECT DteSrc_tblAdjDatesWkly.BaseYear, DteSrc_tblAdjDatesWkly.AdjRprtYrMth, DteSrc_tblAdjDatesWkly.RprtYrWk
	FROM DteSrc_tblAdjDatesWkly
	GROUP BY DteSrc_tblAdjDatesWkly.BaseYear, DteSrc_tblAdjDatesWkly.AdjRprtYrMth, DteSrc_tblAdjDatesWkly.RprtYrWk;

	
    --DoCmd.OpenQuery "135Adj4YrStartEndDate", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblAdj4YrStartEnd ( AdjYrStartDate, AdjYrEndDate )
	SELECT Min(DteSrc_tblAdjDatesDaily.Date) AS AdjYrStartDate, Max(DteSrc_tblAdjDatesDaily.Date) AS AdjYrEndDate
	FROM DteSrc_tblAdjDatesDaily;



	
    --DoCmd.OpenQuery "999AnnRollEnd", acViewNormal, acEdit
	
	UPDATE LogCmn_tblLoadTrack INNER JOIN LogSet_tblCmnFilters ON (LogCmn_tblLoadTrack.BizGroup = LogSet_tblCmnFilters.BizGroup) AND (LogCmn_tblLoadTrack.Brand = LogSet_tblCmnFilters.Brand) AND (LogCmn_tblLoadTrack.Country = LogSet_tblCmnFilters.Country) AND (LogCmn_tblLoadTrack.BizUnit = LogSet_tblCmnFilters.BizUnit) SET LogCmn_tblLoadTrack.LoadEnd = Now()
	WHERE (((LogCmn_tblLoadTrack.LoadEnd) Is Null) AND ((LogCmn_tblLoadTrack.LoadType)="AnnRoll"));

	
END