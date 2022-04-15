CREATE PROCEDURE DteSrc_mcrRefDateUpdates()

BEGIN

	--DoCmd.OpenQuery "001BaseYearUpdate", acViewNormal, acEdit
		
	UPDATE DteSrc_TblBaseYear, DteSrc_tblDatesDaily, DteSrc_tblToday SET DteSrc_TblBaseYear.BaseYear = [DteSrc_tblDatesDaily].RprtYear
	WHERE (((DteSrc_tblDatesDaily.Date)=[DteSrc_tblToday].[Date]-5));

	
	--DoCmd.OpenQuery "002BaseTimeUpdate", acViewNormal, acEdit

	UPDATE DteSrc_TblBaseYear SET DteSrc_TblBaseYear.BaseTime = Now()+(2/24);
	
END