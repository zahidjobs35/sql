CREATE PROCEDURE DteSrc_mcrSubDailyUpdate()

BEGIN		
	
	
	--DoCmd.OpenQuery "000DlyRollStart", acViewNormal, acEdit
	
	INSERT INTO LogCmn_tblLoadTrack ( BizGroup, BizUnit, Country, Brand, TimeZone, LoadType, LoadStart, DataKey )
	SELECT LogSet_tblCmnFilters.BizGroup, LogSet_tblCmnFilters.BizUnit, LogSet_tblCmnFilters.Country, LogSet_tblCmnFilters.Brand, LogSet_tblCmnFilters.TimeZone, "DlyRoll" AS LoadType, Now() AS LoadStart, [BizGroup] & [BizUnit] & [Country] & [Brand] & [LoadType] & CDbl([LoadStart]) AS DataKey
	FROM LogSet_tblCmnFilters;

	
    --DoCmd.OpenQuery "003TimeZoneReset", acViewNormal, acEdit
	
	UPDATE DteRef_tblTimeZone SET DteRef_tblTimeZone.LoadStamp = Null;

	
	
    --DoCmd.OpenQuery "201RefDate_TodayTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblToday.*
	FROM DteSrc_tblToday;

	
	
    --DoCmd.OpenQuery "202RefDate_YstrdayTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblYstrday.*
	FROM DteSrc_tblYstrday;

	
    --DoCmd.OpenQuery "203RefDate_DayMinus7TblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblDayMinus7.*
	FROM DteSrc_tblDayMinus7;

	
	
    --DoCmd.OpenQuery "204RefDate_DayMinus14TblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblDayMinus14.*
	FROM DteSrc_tblDayMinus14;

	
    --DoCmd.OpenQuery "205RefDate_ThisWeekTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblThisWeek.*
	FROM DteSrc_tblThisWeek;

	
    --DoCmd.OpenQuery "206RefDate_ThisMthTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblThisMth.*
	FROM DteSrc_tblThisMth;

	
	
    --DoCmd.OpenQuery "207RefDate_ThisQtrTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblThisQtr.*
	FROM DteSrc_tblThisQtr;

	
    --DoCmd.OpenQuery "208RefDate_ThisYearTblWipe", acViewNormal, acEdit
	
	DELETE DteSrc_tblThisYear.*
	FROM DteSrc_tblThisYear;

	
    --DoCmd.OpenQuery "210RefDate_TodayLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblToday ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily
	WHERE (((DteSrc_tblAdjDatesDaily.Date)=DateValue(Now()+(1/12))));

	
    --DoCmd.OpenQuery "211RefDate_YstrdayLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblYstrday ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily
	WHERE (((DteSrc_tblAdjDatesDaily.Date)=DateValue(Now()+(1/12))-1));

	
    --DoCmd.OpenQuery "212RefDate_DayMinus7Load", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblDayMinus7 ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily
	WHERE (((DteSrc_tblAdjDatesDaily.Date)=DateValue(Now()+(1/12))-8));

	
	
    --DoCmd.OpenQuery "213RefDate_DayMinus14Load", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblDayMinus14 ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily
	WHERE (((DteSrc_tblAdjDatesDaily.Date)=DateValue(Now()+(1/12))-15));

	
    --DoCmd.OpenQuery "214RefDate_ThisWeekLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblThisWeek ( Date_EOW, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesWkly.Date_EOW, DteSrc_tblAdjDatesWkly.WkDay, DteSrc_tblAdjDatesWkly.WkDayNum, DteSrc_tblAdjDatesWkly.CalYear, DteSrc_tblAdjDatesWkly.CalMthNum, DteSrc_tblAdjDatesWkly.CalWkNum, DteSrc_tblAdjDatesWkly.CalMthDate, DteSrc_tblAdjDatesWkly.CalQtr, DteSrc_tblAdjDatesWkly.CalMth, DteSrc_tblAdjDatesWkly.CalWk, DteSrc_tblAdjDatesWkly.CalMthDay, DteSrc_tblAdjDatesWkly.CalYrMth, DteSrc_tblAdjDatesWkly.CalYrWk, DteSrc_tblAdjDatesWkly.RprtYear, DteSrc_tblAdjDatesWkly.RprtWkNum, DteSrc_tblAdjDatesWkly.RprtQtrCalc, DteSrc_tblAdjDatesWkly.RprtMthCalc, DteSrc_tblAdjDatesWkly.RprtDayNum, DteSrc_tblAdjDatesWkly.RprtQtr, DteSrc_tblAdjDatesWkly.RprtMth, DteSrc_tblAdjDatesWkly.RprtWk, DteSrc_tblAdjDatesWkly.RprtDay, DteSrc_tblAdjDatesWkly.RprtYrQtr, DteSrc_tblAdjDatesWkly.RprtYrMth, DteSrc_tblAdjDatesWkly.RprtYrWk, DteSrc_tblAdjDatesWkly.RprtYrDay, DteSrc_tblAdjDatesWkly.DayCount, DteSrc_tblAdjDatesWkly.RprtCycleWk, DteSrc_tblAdjDatesWkly.RptCycleDay, DteSrc_tblAdjDatesWkly.RptCycleWkDay, DteSrc_tblAdjDatesWkly.BaseYear, DteSrc_tblAdjDatesWkly.AdjRprtYear, DteSrc_tblAdjDatesWkly.AdjRprtWkNum, DteSrc_tblAdjDatesWkly.AdjRprtQtrCalc, DteSrc_tblAdjDatesWkly.AdjRprtMthCalc, DteSrc_tblAdjDatesWkly.AdjRprtDayNum, DteSrc_tblAdjDatesWkly.AdjRprtQtr, DteSrc_tblAdjDatesWkly.AdjRprtMth, DteSrc_tblAdjDatesWkly.AdjRprtWk, DteSrc_tblAdjDatesWkly.AdjRprtDay, DteSrc_tblAdjDatesWkly.AdjRprtYrQtr, DteSrc_tblAdjDatesWkly.AdjRprtYrMth, DteSrc_tblAdjDatesWkly.AdjRprtYrWk, DteSrc_tblAdjDatesWkly.AdjRprtYrDay, DteSrc_tblAdjDatesWkly.AdjRprtCycleWk, DteSrc_tblAdjDatesWkly.AdjRptCycleDay, DteSrc_tblAdjDatesWkly.AdjRptCycleWkDay, DteSrc_tblAdjDatesWkly.Period_Tag, DteSrc_tblAdjDatesWkly.Precedence, DteSrc_tblAdjDatesWkly.YrDateKey, DteSrc_tblAdjDatesWkly.MthBaseDate
	FROM DteSrc_tblToday INNER JOIN DteSrc_tblAdjDatesWkly ON DteSrc_tblToday.AdjRprtYrWk = DteSrc_tblAdjDatesWkly.AdjRprtYrWk;

	
    --DoCmd.OpenQuery "215RefDate_ThisMthLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblThisMth ( Date_EOM, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesMthly.Date_EOM, DteSrc_tblAdjDatesMthly.WkDay, DteSrc_tblAdjDatesMthly.WkDayNum, DteSrc_tblAdjDatesMthly.CalYear, DteSrc_tblAdjDatesMthly.CalMthNum, DteSrc_tblAdjDatesMthly.CalWkNum, DteSrc_tblAdjDatesMthly.CalMthDate, DteSrc_tblAdjDatesMthly.CalQtr, DteSrc_tblAdjDatesMthly.CalMth, DteSrc_tblAdjDatesMthly.CalWk, DteSrc_tblAdjDatesMthly.CalMthDay, DteSrc_tblAdjDatesMthly.CalYrMth, DteSrc_tblAdjDatesMthly.CalYrWk, DteSrc_tblAdjDatesMthly.RprtYear, DteSrc_tblAdjDatesMthly.RprtWkNum, DteSrc_tblAdjDatesMthly.RprtQtrCalc, DteSrc_tblAdjDatesMthly.RprtMthCalc, DteSrc_tblAdjDatesMthly.RprtDayNum, DteSrc_tblAdjDatesMthly.RprtQtr, DteSrc_tblAdjDatesMthly.RprtMth, DteSrc_tblAdjDatesMthly.RprtWk, DteSrc_tblAdjDatesMthly.RprtDay, DteSrc_tblAdjDatesMthly.RprtYrQtr, DteSrc_tblAdjDatesMthly.RprtYrMth, DteSrc_tblAdjDatesMthly.RprtYrWk, DteSrc_tblAdjDatesMthly.RprtYrDay, DteSrc_tblAdjDatesMthly.DayCount, DteSrc_tblAdjDatesMthly.RprtCycleWk, DteSrc_tblAdjDatesMthly.RptCycleDay, DteSrc_tblAdjDatesMthly.RptCycleWkDay, DteSrc_tblAdjDatesMthly.BaseYear, DteSrc_tblAdjDatesMthly.AdjRprtYear, DteSrc_tblAdjDatesMthly.AdjRprtWkNum, DteSrc_tblAdjDatesMthly.AdjRprtQtrCalc, DteSrc_tblAdjDatesMthly.AdjRprtMthCalc, DteSrc_tblAdjDatesMthly.AdjRprtDayNum, DteSrc_tblAdjDatesMthly.AdjRprtQtr, DteSrc_tblAdjDatesMthly.AdjRprtMth, DteSrc_tblAdjDatesMthly.AdjRprtWk, DteSrc_tblAdjDatesMthly.AdjRprtDay, DteSrc_tblAdjDatesMthly.AdjRprtYrQtr, DteSrc_tblAdjDatesMthly.AdjRprtYrMth, DteSrc_tblAdjDatesMthly.AdjRprtYrWk, DteSrc_tblAdjDatesMthly.AdjRprtYrDay, DteSrc_tblAdjDatesMthly.AdjRprtCycleWk, DteSrc_tblAdjDatesMthly.AdjRptCycleDay, DteSrc_tblAdjDatesMthly.AdjRptCycleWkDay, DteSrc_tblAdjDatesMthly.Period_Tag, DteSrc_tblAdjDatesMthly.Precedence, DteSrc_tblAdjDatesMthly.YrDateKey, DteSrc_tblAdjDatesMthly.MthBaseDate
	FROM DteSrc_tblToday INNER JOIN DteSrc_tblAdjDatesMthly ON DteSrc_tblToday.AdjRprtYrMth = DteSrc_tblAdjDatesMthly.AdjRprtYrMth;

	
    --DoCmd.OpenQuery "216RefDate_ThisQtrLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblThisQtr ( Date_EOQ, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesQtrly.Date_EOQ, DteSrc_tblAdjDatesQtrly.WkDay, DteSrc_tblAdjDatesQtrly.WkDayNum, DteSrc_tblAdjDatesQtrly.CalYear, DteSrc_tblAdjDatesQtrly.CalMthNum, DteSrc_tblAdjDatesQtrly.CalWkNum, DteSrc_tblAdjDatesQtrly.CalMthDate, DteSrc_tblAdjDatesQtrly.CalQtr, DteSrc_tblAdjDatesQtrly.CalMth, DteSrc_tblAdjDatesQtrly.CalWk, DteSrc_tblAdjDatesQtrly.CalMthDay, DteSrc_tblAdjDatesQtrly.CalYrMth, DteSrc_tblAdjDatesQtrly.CalYrWk, DteSrc_tblAdjDatesQtrly.RprtYear, DteSrc_tblAdjDatesQtrly.RprtWkNum, DteSrc_tblAdjDatesQtrly.RprtQtrCalc, DteSrc_tblAdjDatesQtrly.RprtMthCalc, DteSrc_tblAdjDatesQtrly.RprtDayNum, DteSrc_tblAdjDatesQtrly.RprtQtr, DteSrc_tblAdjDatesQtrly.RprtMth, DteSrc_tblAdjDatesQtrly.RprtWk, DteSrc_tblAdjDatesQtrly.RprtDay, DteSrc_tblAdjDatesQtrly.RprtYrQtr, DteSrc_tblAdjDatesQtrly.RprtYrMth, DteSrc_tblAdjDatesQtrly.RprtYrWk, DteSrc_tblAdjDatesQtrly.RprtYrDay, DteSrc_tblAdjDatesQtrly.DayCount, DteSrc_tblAdjDatesQtrly.RprtCycleWk, DteSrc_tblAdjDatesQtrly.RptCycleDay, DteSrc_tblAdjDatesQtrly.RptCycleWkDay, DteSrc_tblAdjDatesQtrly.BaseYear, DteSrc_tblAdjDatesQtrly.AdjRprtYear, DteSrc_tblAdjDatesQtrly.AdjRprtWkNum, DteSrc_tblAdjDatesQtrly.AdjRprtQtrCalc, DteSrc_tblAdjDatesQtrly.AdjRprtMthCalc, DteSrc_tblAdjDatesQtrly.AdjRprtDayNum, DteSrc_tblAdjDatesQtrly.AdjRprtQtr, DteSrc_tblAdjDatesQtrly.AdjRprtMth, DteSrc_tblAdjDatesQtrly.AdjRprtWk, DteSrc_tblAdjDatesQtrly.AdjRprtDay, DteSrc_tblAdjDatesQtrly.AdjRprtYrQtr, DteSrc_tblAdjDatesQtrly.AdjRprtYrMth, DteSrc_tblAdjDatesQtrly.AdjRprtYrWk, DteSrc_tblAdjDatesQtrly.AdjRprtYrDay, DteSrc_tblAdjDatesQtrly.AdjRprtCycleWk, DteSrc_tblAdjDatesQtrly.AdjRptCycleDay, DteSrc_tblAdjDatesQtrly.AdjRptCycleWkDay, DteSrc_tblAdjDatesQtrly.Period_Tag, DteSrc_tblAdjDatesQtrly.Precedence, DteSrc_tblAdjDatesQtrly.YrDateKey, DteSrc_tblAdjDatesQtrly.MthBaseDate
	FROM DteSrc_tblToday INNER JOIN DteSrc_tblAdjDatesQtrly ON DteSrc_tblToday.AdjRprtYrQtr = DteSrc_tblAdjDatesQtrly.AdjRprtYrQtr;

	
    --DoCmd.OpenQuery "217RefDate_ThisYearLoad", acViewNormal, acEdit
	
	INSERT INTO DteSrc_tblThisYear ( Date_EOY, WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesYrly.Date_EOY, DteSrc_tblAdjDatesYrly.WkDay, DteSrc_tblAdjDatesYrly.WkDayNum, DteSrc_tblAdjDatesYrly.CalYear, DteSrc_tblAdjDatesYrly.CalMthNum, DteSrc_tblAdjDatesYrly.CalWkNum, DteSrc_tblAdjDatesYrly.CalMthDate, DteSrc_tblAdjDatesYrly.CalQtr, DteSrc_tblAdjDatesYrly.CalMth, DteSrc_tblAdjDatesYrly.CalWk, DteSrc_tblAdjDatesYrly.CalMthDay, DteSrc_tblAdjDatesYrly.CalYrMth, DteSrc_tblAdjDatesYrly.CalYrWk, DteSrc_tblAdjDatesYrly.RprtYear, DteSrc_tblAdjDatesYrly.RprtWkNum, DteSrc_tblAdjDatesYrly.RprtQtrCalc, DteSrc_tblAdjDatesYrly.RprtMthCalc, DteSrc_tblAdjDatesYrly.RprtDayNum, DteSrc_tblAdjDatesYrly.RprtQtr, DteSrc_tblAdjDatesYrly.RprtMth, DteSrc_tblAdjDatesYrly.RprtWk, DteSrc_tblAdjDatesYrly.RprtDay, DteSrc_tblAdjDatesYrly.RprtYrQtr, DteSrc_tblAdjDatesYrly.RprtYrMth, DteSrc_tblAdjDatesYrly.RprtYrWk, DteSrc_tblAdjDatesYrly.RprtYrDay, DteSrc_tblAdjDatesYrly.DayCount, DteSrc_tblAdjDatesYrly.RprtCycleWk, DteSrc_tblAdjDatesYrly.RptCycleDay, DteSrc_tblAdjDatesYrly.RptCycleWkDay, DteSrc_tblAdjDatesYrly.BaseYear, DteSrc_tblAdjDatesYrly.AdjRprtYear, DteSrc_tblAdjDatesYrly.AdjRprtWkNum, DteSrc_tblAdjDatesYrly.AdjRprtQtrCalc, DteSrc_tblAdjDatesYrly.AdjRprtMthCalc, DteSrc_tblAdjDatesYrly.AdjRprtDayNum, DteSrc_tblAdjDatesYrly.AdjRprtQtr, DteSrc_tblAdjDatesYrly.AdjRprtMth, DteSrc_tblAdjDatesYrly.AdjRprtWk, DteSrc_tblAdjDatesYrly.AdjRprtDay, DteSrc_tblAdjDatesYrly.AdjRprtYrQtr, DteSrc_tblAdjDatesYrly.AdjRprtYrMth, DteSrc_tblAdjDatesYrly.AdjRprtYrWk, DteSrc_tblAdjDatesYrly.AdjRprtYrDay, DteSrc_tblAdjDatesYrly.AdjRprtCycleWk, DteSrc_tblAdjDatesYrly.AdjRptCycleDay, DteSrc_tblAdjDatesYrly.AdjRptCycleWkDay, DteSrc_tblAdjDatesYrly.Period_Tag, DteSrc_tblAdjDatesYrly.Precedence, DteSrc_tblAdjDatesYrly.YrDateKey, DteSrc_tblAdjDatesYrly.MthBaseDate
	FROM DteSrc_tblToday INNER JOIN DteSrc_tblAdjDatesYrly ON DteSrc_tblToday.AdjRprtYear = DteSrc_tblAdjDatesYrly.AdjRprtYear;

	
    --DoCmd.OpenQuery "220RelDatesUpdate_Day", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesDaily, DteSrc_tblToday SET DteSrc_tblRelDatesDaily.Date_EOD = [Date]+[YearAdj]+[PeriodAdj];

	
    --DoCmd.OpenQuery "221RelDatesUpdate_Wk", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesWkly, DteSrc_tblThisWeek SET DteSrc_tblRelDatesWkly.Date_EOW = [DteSrc_tblThisWeek].Date_EOW+[YearAdj]+[PeriodAdj];

	
    --DoCmd.OpenQuery "222RelDatesUpdate_Mth", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesMthly, DteSrc_tblThisMth SET DteSrc_tblRelDatesMthly.MthBaseDate = DateAdd("m",[PeriodAdj],[DteSrc_tblThisMth].MthBaseDate);

	
	
    --DoCmd.OpenQuery "223RelDatesUpdate_Qtr", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesQtrly, DteSrc_tblThisQtr SET DteSrc_tblRelDatesQtrly.Date_EOQ = [DteSrc_tblThisQtr].Date_EOQ+[YearAdj]+[PeriodAdj];

	
    --DoCmd.OpenQuery "224RelDatesUpdate_Year", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesYrly, DteSrc_tblThisYear SET DteSrc_tblRelDatesYrly.Date_EOY = [DteSrc_tblThisYear].Date_EOY+[YearAdj]+[PeriodAdj];

	
	
    --DoCmd.OpenQuery "225RelDatesDayNumUpdate_Day", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesDaily INNER JOIN DteSrc_tblAdjDatesDaily ON DteSrc_tblRelDatesDaily.Date_EOD = DteSrc_tblAdjDatesDaily.Date SET DteSrc_tblRelDatesDaily.AdjRprtDayNum = [DteSrc_tblAdjDatesDaily].AdjRprtDayNum;

	
	
    --DoCmd.OpenQuery "226RelDatesDayNumUpdate_Wk", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesWkly INNER JOIN DteSrc_tblAdjDatesDaily ON DteSrc_tblRelDatesWkly.Date_EOW = DteSrc_tblAdjDatesDaily.Date SET DteSrc_tblRelDatesWkly.AdjRprtDayNum = [DteSrc_tblAdjDatesDaily].AdjRprtDayNum, DteSrc_tblRelDatesWkly.AdjRprtYrWk = [DteSrc_tblAdjDatesDaily].AdjRprtYrWk;

	
	
    --DoCmd.OpenQuery "227RelDatesDayNumUpdate_Mth", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblRelDatesMthly INNER JOIN DteSrc_tblAdjDatesMthly ON DteSrc_tblRelDatesMthly.MthBaseDate = DteSrc_tblAdjDatesMthly.MthBaseDate SET DteSrc_tblRelDatesMthly.Date_EOM = [DteSrc_tblAdjDatesMthly].Date_EOM, DteSrc_tblRelDatesMthly.AdjRprtDayNum = [DteSrc_tblAdjDatesMthly].AdjRprtDayNum, DteSrc_tblRelDatesMthly.AdjRprtYrMth = [DteSrc_tblAdjDatesMthly].AdjRprtYrMth;

	
	
    --DoCmd.OpenQuery "228RelDatesDayNumUpdate_Qtr", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesQtrly INNER JOIN DteSrc_tblAdjDatesDaily ON DteSrc_tblRelDatesQtrly.Date_EOQ = DteSrc_tblAdjDatesDaily.Date SET DteSrc_tblRelDatesQtrly.AdjRprtDayNum = [DteSrc_tblAdjDatesDaily].AdjRprtDayNum, DteSrc_tblRelDatesQtrly.AdjRprtYrQtr = [DteSrc_tblAdjDatesDaily].AdjRprtYrQtr;

	
	
	
    --DoCmd.OpenQuery "229RelDatesDayNumUpdate_Yr", acViewNormal, acEdit
	
	UPDATE DteSrc_tblRelDatesYrly INNER JOIN DteSrc_tblAdjDatesDaily ON DteSrc_tblRelDatesYrly.Date_EOY = DteSrc_tblAdjDatesDaily.Date SET DteSrc_tblRelDatesYrly.AdjRprtYear = [DteSrc_tblAdjDatesDaily].AdjRprtYear;

	
	
	
    --DoCmd.OpenQuery "230RefDate_LastWeekTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblLastWeek.*
	FROM DteSrc_tblLastWeek;

	
	
    --DoCmd.OpenQuery "231RefDate_LastMthTblWipe", acViewNormal, acEdit
	
	
	DELETE DteSrc_tblLastMth.*
	FROM DteSrc_tblLastMth;

	
	
    --DoCmd.OpenQuery "232RefDate_LastWeekLoad", acViewNormal, acEdit
	
	
	INSERT INTO DteSrc_tblLastWeek ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN DteSrc_tblRelDatesWkly ON DteSrc_tblAdjDatesDaily.Date = DteSrc_tblRelDatesWkly.Date_EOW
	WHERE (((DteSrc_tblRelDatesWkly.Relative_Period)="TY_Wk-1"));

	
	
    --DoCmd.OpenQuery "233RefDate_LastMthLoad", acViewNormal, acEdit
	
	
	
	INSERT INTO DteSrc_tblLastMth ( [Date], WkDay, WkDayNum, CalYear, CalMthNum, CalWkNum, CalMthDate, CalQtr, CalMth, CalWk, CalMthDay, CalYrMth, CalYrWk, RprtYear, RprtWkNum, RprtQtrCalc, RprtMthCalc, RprtDayNum, RprtQtr, RprtMth, RprtWk, RprtDay, RprtYrQtr, RprtYrMth, RprtYrWk, RprtYrDay, DayCount, RprtCycleWk, RptCycleDay, RptCycleWkDay, BaseYear, AdjRprtYear, AdjRprtWkNum, AdjRprtQtrCalc, AdjRprtMthCalc, AdjRprtDayNum, AdjRprtQtr, AdjRprtMth, AdjRprtWk, AdjRprtDay, AdjRprtYrQtr, AdjRprtYrMth, AdjRprtYrWk, AdjRprtYrDay, AdjRprtCycleWk, AdjRptCycleDay, AdjRptCycleWkDay, Period_Tag, Precedence, YrDateKey, MthBaseDate )
	SELECT DteSrc_tblAdjDatesDaily.Date, DteSrc_tblAdjDatesDaily.WkDay, DteSrc_tblAdjDatesDaily.WkDayNum, DteSrc_tblAdjDatesDaily.CalYear, DteSrc_tblAdjDatesDaily.CalMthNum, DteSrc_tblAdjDatesDaily.CalWkNum, DteSrc_tblAdjDatesDaily.CalMthDate, DteSrc_tblAdjDatesDaily.CalQtr, DteSrc_tblAdjDatesDaily.CalMth, DteSrc_tblAdjDatesDaily.CalWk, DteSrc_tblAdjDatesDaily.CalMthDay, DteSrc_tblAdjDatesDaily.CalYrMth, DteSrc_tblAdjDatesDaily.CalYrWk, DteSrc_tblAdjDatesDaily.RprtYear, DteSrc_tblAdjDatesDaily.RprtWkNum, DteSrc_tblAdjDatesDaily.RprtQtrCalc, DteSrc_tblAdjDatesDaily.RprtMthCalc, DteSrc_tblAdjDatesDaily.RprtDayNum, DteSrc_tblAdjDatesDaily.RprtQtr, DteSrc_tblAdjDatesDaily.RprtMth, DteSrc_tblAdjDatesDaily.RprtWk, DteSrc_tblAdjDatesDaily.RprtDay, DteSrc_tblAdjDatesDaily.RprtYrQtr, DteSrc_tblAdjDatesDaily.RprtYrMth, DteSrc_tblAdjDatesDaily.RprtYrWk, DteSrc_tblAdjDatesDaily.RprtYrDay, DteSrc_tblAdjDatesDaily.DayCount, DteSrc_tblAdjDatesDaily.RprtCycleWk, DteSrc_tblAdjDatesDaily.RptCycleDay, DteSrc_tblAdjDatesDaily.RptCycleWkDay, DteSrc_tblAdjDatesDaily.BaseYear, DteSrc_tblAdjDatesDaily.AdjRprtYear, DteSrc_tblAdjDatesDaily.AdjRprtWkNum, DteSrc_tblAdjDatesDaily.AdjRprtQtrCalc, DteSrc_tblAdjDatesDaily.AdjRprtMthCalc, DteSrc_tblAdjDatesDaily.AdjRprtDayNum, DteSrc_tblAdjDatesDaily.AdjRprtQtr, DteSrc_tblAdjDatesDaily.AdjRprtMth, DteSrc_tblAdjDatesDaily.AdjRprtWk, DteSrc_tblAdjDatesDaily.AdjRprtDay, DteSrc_tblAdjDatesDaily.AdjRprtYrQtr, DteSrc_tblAdjDatesDaily.AdjRprtYrMth, DteSrc_tblAdjDatesDaily.AdjRprtYrWk, DteSrc_tblAdjDatesDaily.AdjRprtYrDay, DteSrc_tblAdjDatesDaily.AdjRprtCycleWk, DteSrc_tblAdjDatesDaily.AdjRptCycleDay, DteSrc_tblAdjDatesDaily.AdjRptCycleWkDay, DteSrc_tblAdjDatesDaily.Period_Tag, DteSrc_tblAdjDatesDaily.Precedence, DteSrc_tblAdjDatesDaily.YrDateKey, DteSrc_tblAdjDatesDaily.MthBaseDate
	FROM DteSrc_tblAdjDatesDaily INNER JOIN DteSrc_tblRelDatesMthly ON DteSrc_tblAdjDatesDaily.Date = DteSrc_tblRelDatesMthly.Date_EOM
	WHERE (((DteSrc_tblRelDatesMthly.Relative_Period)="TY_Mth-1"));

	
    --DoCmd.OpenQuery "240RelDatesYTDUpdate_Daily", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesDaily INNER JOIN qry240YTD_Daily ON DteSrc_tblAdjDatesDaily.AdjRprtDayNum = qry240YTD_Daily.AdjRprtDayNum SET DteSrc_tblAdjDatesDaily.YTDYTG_Daily = "YTD";

	
	
	
    --DoCmd.OpenQuery "241RelDatesYTGUpdate_Daily", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesDaily INNER JOIN qry241YTG_Daily ON DteSrc_tblAdjDatesDaily.AdjRprtDayNum = qry241YTG_Daily.AdjRprtDayNum SET DteSrc_tblAdjDatesDaily.YTDYTG_Daily = "YTG";

	
	
    --DoCmd.OpenQuery "242RelDatesYTDUpdate_Wkly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesWkly INNER JOIN qry242YTD_Wkly ON DteSrc_tblAdjDatesWkly.AdjRprtDayNum = qry242YTD_Wkly.AdjRprtDayNum SET DteSrc_tblAdjDatesWkly.YTDYTG_Wkly = "YTD";

	
	
    --DoCmd.OpenQuery "243RelDatesYTGUpdate_Wkly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesWkly INNER JOIN qry243YTG_Wkly ON DteSrc_tblAdjDatesWkly.AdjRprtDayNum = qry243YTG_Wkly.AdjRprtDayNum SET DteSrc_tblAdjDatesWkly.YTDYTG_Wkly = "YTG";

	
	
    --DoCmd.OpenQuery "244RelDatesYTDUpdate_Mthly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesMthly INNER JOIN qry244YTD_Mthly ON DteSrc_tblAdjDatesMthly.AdjRprtDayNum = qry244YTD_Mthly.AdjRprtDayNum SET DteSrc_tblAdjDatesMthly.YTDYTG_Mthly = "YTD";

	
	
    --DoCmd.OpenQuery "245RelDatesYTGUpdate_Mthly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesMthly INNER JOIN qry245YTG_Mthly ON DteSrc_tblAdjDatesMthly.AdjRprtDayNum = qry245YTG_Mthly.AdjRprtDayNum SET DteSrc_tblAdjDatesMthly.YTDYTG_Mthly = "YTG";

	
	
    --DoCmd.OpenQuery "246RelDatesActFcstUpdate_Daily", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesDaily INNER JOIN qry246ActFcstSplit_Daily ON DteSrc_tblAdjDatesDaily.Date = qry246ActFcstSplit_Daily.Date SET DteSrc_tblAdjDatesDaily.ActFcst_Daily = [ActFcst];

	
	
	
    --DoCmd.OpenQuery "247RelDatesActFcstUpdate_Wkly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesWkly INNER JOIN qry247ActFcstSplit_Wkly ON DteSrc_tblAdjDatesWkly.Date_EOW = qry247ActFcstSplit_Wkly.Date SET DteSrc_tblAdjDatesWkly.ActFcst_Wkly = [ActFcst];

	
	
	
	
    --DoCmd.OpenQuery "248RelDatesActFcstUpdate_Mthly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesMthly INNER JOIN qry248ActFcstSplit_Mthly ON DteSrc_tblAdjDatesMthly.Date_EOM = qry248ActFcstSplit_Mthly.Date SET DteSrc_tblAdjDatesMthly.ActFcst_Mthly = [ActFcst];

	
	
	
    --DoCmd.OpenQuery "250RelDatesDailyWipe_Daily", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesDaily SET DteSrc_tblAdjDatesDaily.RelYear_Daily = "", DteSrc_tblAdjDatesDaily.PeriodTitle_Daily = ""
	WHERE (((DteSrc_tblAdjDatesDaily.RelYear_Daily)<>"") AND ((DteSrc_tblAdjDatesDaily.PeriodTitle_Daily)<>""));

	
	
	
    --DoCmd.OpenQuery "251RelDatesDailyWipe_Wkly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesDaily SET DteSrc_tblAdjDatesDaily.RelYear_Wkly = "", DteSrc_tblAdjDatesDaily.PeriodTitle_Wkly = ""
	WHERE (((DteSrc_tblAdjDatesDaily.RelYear_Wkly)<>"") AND ((DteSrc_tblAdjDatesDaily.PeriodTitle_Wkly)<>""));

	
	
	
    --DoCmd.OpenQuery "252RelDatesDailyWipe_Mthly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesDaily SET DteSrc_tblAdjDatesDaily.RelYear_Mthly = "", DteSrc_tblAdjDatesDaily.PeriodTitle_Mthly = ""
	WHERE (((DteSrc_tblAdjDatesDaily.RelYear_Mthly)<>"") AND ((DteSrc_tblAdjDatesDaily.PeriodTitle_Mthly)<>""));

	
	
    --DoCmd.OpenQuery "253RelDatesDailyWipe_Qtrly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesDaily SET DteSrc_tblAdjDatesDaily.RelYear_Qtrly = "", DteSrc_tblAdjDatesDaily.PeriodTitle_Qtrly = ""
	WHERE (((DteSrc_tblAdjDatesDaily.RelYear_Qtrly)<>"") AND ((DteSrc_tblAdjDatesDaily.PeriodTitle_Qtrly)<>""));

	
    --DoCmd.OpenQuery "254RelDatesLTNDailyUpdate", acViewNormal, acEdit
	
	
	UPDATE ((((DteSrc_tblAdjDatesDaily LEFT JOIN DteSrc_tblRelDatesDaily ON DteSrc_tblAdjDatesDaily.Date = DteSrc_tblRelDatesDaily.Date_EOD) LEFT JOIN DteSrc_tblRelDatesWkly ON DteSrc_tblAdjDatesDaily.AdjRprtYrWk = DteSrc_tblRelDatesWkly.AdjRprtYrWk) LEFT JOIN DteSrc_tblRelDatesMthly ON DteSrc_tblAdjDatesDaily.AdjRprtYrMth = DteSrc_tblRelDatesMthly.AdjRprtYrMth) LEFT JOIN DteSrc_tblRelDatesQtrly ON DteSrc_tblAdjDatesDaily.AdjRprtYrQtr = DteSrc_tblRelDatesQtrly.AdjRprtYrQtr) LEFT JOIN DteSrc_tblRelDatesYrly ON DteSrc_tblAdjDatesDaily.AdjRprtYear = DteSrc_tblRelDatesYrly.AdjRprtYear SET DteSrc_tblAdjDatesDaily.RelYear_Daily = [DteSrc_tblRelDatesDaily].RelYear, DteSrc_tblAdjDatesDaily.PeriodTitle_Daily = [DteSrc_tblRelDatesDaily].PeriodTitle, DteSrc_tblAdjDatesDaily.RelYear_Wkly = [DteSrc_tblRelDatesWkly].RelYear, DteSrc_tblAdjDatesDaily.PeriodTitle_Wkly = [DteSrc_tblRelDatesWkly].PeriodTitle, DteSrc_tblAdjDatesDaily.RelYear_Mthly = [DteSrc_tblRelDatesMthly].RelYear, DteSrc_tblAdjDatesDaily.PeriodTitle_Mthly = [DteSrc_tblRelDatesMthly].PeriodTitle, DteSrc_tblAdjDatesDaily.RelYear_Qtrly = [DteSrc_tblRelDatesQtrly].RelYear, DteSrc_tblAdjDatesDaily.PeriodTitle_Qtrly = [DteSrc_tblRelDatesQtrly].PeriodTitle, DteSrc_tblAdjDatesDaily.RelYear_Yrly = [DteSrc_tblRelDatesYrly].RelYear;

	
	
	
    --DoCmd.OpenQuery "260RelDatesWklyWipe_Wkly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesWkly SET DteSrc_tblAdjDatesWkly.RelYear_Wkly = "", DteSrc_tblAdjDatesWkly.PeriodTitle_Wkly = ""
	WHERE (((DteSrc_tblAdjDatesWkly.RelYear_Wkly)<>"") AND ((DteSrc_tblAdjDatesWkly.PeriodTitle_Wkly)<>""));

	
	
    --DoCmd.OpenQuery "261RelDatesWklyWipe_Mthly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesWkly SET DteSrc_tblAdjDatesWkly.RelYear_Mthly = "", DteSrc_tblAdjDatesWkly.PeriodTitle_Mthly = ""
	WHERE (((DteSrc_tblAdjDatesWkly.RelYear_Mthly)<>"") AND ((DteSrc_tblAdjDatesWkly.PeriodTitle_Mthly)<>""));

	
	
    --DoCmd.OpenQuery "262RelDatesWklyWipe_Qtrly", acViewNormal, acEdit
	
	
	UPDATE DteSrc_tblAdjDatesWkly SET DteSrc_tblAdjDatesWkly.RelYear_Qtrly = "", DteSrc_tblAdjDatesWkly.PeriodTitle_Qtrly = ""
	WHERE (((DteSrc_tblAdjDatesWkly.RelYear_Qtrly)<>"") AND ((DteSrc_tblAdjDatesWkly.PeriodTitle_Qtrly)<>""));

	
	
    --DoCmd.OpenQuery "263RelDatesLTNWklyUpdate", acViewNormal, acEdit
	
	UPDATE (((DteSrc_tblAdjDatesWkly LEFT JOIN DteSrc_tblRelDatesWkly ON DteSrc_tblAdjDatesWkly.Date_EOW = DteSrc_tblRelDatesWkly.Date_EOW) LEFT JOIN DteSrc_tblRelDatesMthly ON DteSrc_tblAdjDatesWkly.AdjRprtYrMth = DteSrc_tblRelDatesMthly.AdjRprtYrMth) LEFT JOIN DteSrc_tblRelDatesQtrly ON DteSrc_tblAdjDatesWkly.AdjRprtYrQtr = DteSrc_tblRelDatesQtrly.AdjRprtYrQtr) LEFT JOIN DteSrc_tblRelDatesYrly ON DteSrc_tblAdjDatesWkly.AdjRprtYear = DteSrc_tblRelDatesYrly.AdjRprtYear SET DteSrc_tblAdjDatesWkly.RelYear_Wkly = [DteSrc_tblRelDatesWkly].RelYear, DteSrc_tblAdjDatesWkly.PeriodTitle_Wkly = [DteSrc_tblRelDatesWkly].PeriodTitle, DteSrc_tblAdjDatesWkly.RelYear_Mthly = [DteSrc_tblRelDatesMthly].RelYear, DteSrc_tblAdjDatesWkly.PeriodTitle_Mthly = [DteSrc_tblRelDatesMthly].PeriodTitle, DteSrc_tblAdjDatesWkly.RelYear_Qtrly = [DteSrc_tblRelDatesQtrly].RelYear, DteSrc_tblAdjDatesWkly.PeriodTitle_Qtrly = [DteSrc_tblRelDatesQtrly].PeriodTitle, DteSrc_tblAdjDatesWkly.RelYear_Yrly = [DteSrc_tblRelDatesYrly].RelYear;

	
	
	
    --DoCmd.OpenQuery "270RelDatesMthlyWipe_Mthly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesMthly SET DteSrc_tblAdjDatesMthly.RelYear_Mthly = "", DteSrc_tblAdjDatesMthly.PeriodTitle_Mthly = ""
	WHERE (((DteSrc_tblAdjDatesMthly.RelYear_Mthly)<>"") AND ((DteSrc_tblAdjDatesMthly.PeriodTitle_Mthly)<>""));

	
	
	
    --DoCmd.OpenQuery "271RelDatesMthlyWipe_Qtrly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesMthly SET DteSrc_tblAdjDatesMthly.RelYear_Qtrly = "", DteSrc_tblAdjDatesMthly.PeriodTitle_Qtrly = ""
	WHERE (((DteSrc_tblAdjDatesMthly.RelYear_Qtrly)<>"") AND ((DteSrc_tblAdjDatesMthly.PeriodTitle_Qtrly)<>""));

	
	
    --DoCmd.OpenQuery "272RelDatesLTNMthlyUpdate", acViewNormal, acEdit
	
	UPDATE ((DteSrc_tblAdjDatesMthly LEFT JOIN DteSrc_tblRelDatesMthly ON DteSrc_tblAdjDatesMthly.Date_EOM = DteSrc_tblRelDatesMthly.Date_EOM) LEFT JOIN DteSrc_tblRelDatesQtrly ON DteSrc_tblAdjDatesMthly.AdjRprtYrQtr = DteSrc_tblRelDatesQtrly.AdjRprtYrQtr) LEFT JOIN DteSrc_tblRelDatesYrly ON DteSrc_tblAdjDatesMthly.AdjRprtYear = DteSrc_tblRelDatesYrly.AdjRprtYear SET DteSrc_tblAdjDatesMthly.RelYear_Mthly = [DteSrc_tblRelDatesMthly].RelYear, DteSrc_tblAdjDatesMthly.PeriodTitle_Mthly = [DteSrc_tblRelDatesMthly].PeriodTitle, DteSrc_tblAdjDatesMthly.RelYear_Qtrly = [DteSrc_tblRelDatesQtrly].RelYear, DteSrc_tblAdjDatesMthly.PeriodTitle_Qtrly = [DteSrc_tblRelDatesQtrly].PeriodTitle, DteSrc_tblAdjDatesMthly.RelYear_Yrly = [DteSrc_tblRelDatesYrly].RelYear;

	
	
    --DoCmd.OpenQuery "280RelDatesQtrlyWipe_Qtrly", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesQtrly SET DteSrc_tblAdjDatesQtrly.RelYear_Qtrly = "", DteSrc_tblAdjDatesQtrly.PeriodTitle_Qtrly = ""
	WHERE (((DteSrc_tblAdjDatesQtrly.RelYear_Qtrly)<>"") AND ((DteSrc_tblAdjDatesQtrly.PeriodTitle_Qtrly)<>""));

	
	
    --DoCmd.OpenQuery "281RelDatesLTNQtrlyUpdate", acViewNormal, acEdit
	
	UPDATE (DteSrc_tblAdjDatesQtrly LEFT JOIN DteSrc_tblRelDatesQtrly ON DteSrc_tblAdjDatesQtrly.Date_EOQ = DteSrc_tblRelDatesQtrly.Date_EOQ) LEFT JOIN DteSrc_tblRelDatesYrly ON DteSrc_tblAdjDatesQtrly.AdjRprtYear = DteSrc_tblRelDatesYrly.AdjRprtYear SET DteSrc_tblAdjDatesQtrly.RelYear_Qtrly = [DteSrc_tblRelDatesQtrly].RelYear, DteSrc_tblAdjDatesQtrly.PeriodTitle_Qtrly = [DteSrc_tblRelDatesQtrly].PeriodTitle, DteSrc_tblAdjDatesQtrly.RelYear_Yrly = [DteSrc_tblRelDatesYrly].RelYear;

	
	
    --DoCmd.OpenQuery "282RelDatesLTNYrlyUpdate", acViewNormal, acEdit
	
	UPDATE DteSrc_tblAdjDatesYrly INNER JOIN DteSrc_tblRelDatesYrly ON DteSrc_tblAdjDatesYrly.Date_EOY = DteSrc_tblRelDatesYrly.Date_EOY SET DteSrc_tblAdjDatesYrly.RelYear_Yrly = [RelYear];

	
	
	
    --DoCmd.OpenQuery "999DlyRollEnd", acViewNormal, acEdit
	
	
	UPDATE LogCmn_tblLoadTrack INNER JOIN LogSet_tblCmnFilters ON (LogCmn_tblLoadTrack.BizGroup = LogSet_tblCmnFilters.BizGroup) AND (LogCmn_tblLoadTrack.Brand = LogSet_tblCmnFilters.Brand) AND (LogCmn_tblLoadTrack.Country = LogSet_tblCmnFilters.Country) AND (LogCmn_tblLoadTrack.BizUnit = LogSet_tblCmnFilters.BizUnit) SET LogCmn_tblLoadTrack.LoadEnd = Now()
	WHERE (((LogCmn_tblLoadTrack.LoadEnd) Is Null) AND ((LogCmn_tblLoadTrack.LoadType)="DlyRoll"));

	
END