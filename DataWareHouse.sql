------------Database------------


Create table BillingParty
(
C_BillingPartyID_Bp   	number(10),
T_BillingFirstName_Bp	varchar22(100),
T_BillingMiddleName_Bp	varchar22(100),
T_BillingLastName_Bp	varchar22(100),
T_BillingAddress_Bp		varchar22(100),
I_BillingPhoneNumber_Bp	varchar22(100),
C_CustomerID_Bp			number(10)
);


Create table Billing
(
C_BuildingCode_Bu
T_BuildingName_Bu
T_BuildingDescription_Bu
C_ResortCode_Bu
);



Create table City
(
C_CityName_Ci 	varchar22(100),
C_ZipCode_Ci	varchar22(100),
T_State_Ci		varchar22(100),
C_RegionID_Ci	number(10)
);




Create table CleaningService
(
C_CleaningServiceorderNumber_Cs number(10),
C_WorkOrderNumber_Cs			number(10),
C_EmployeeNumber_Cs				number(10),
T_CleaningInstructions_Cs		varchar2(50)
);


Create table Country
(
C_CountryName_Co		varchar22(100),
T_CountryDescription_Co	varchar22(100),
N_ExchangeRate_Co		number(10),	
N_CountrySalesTax_Co	number(10),
N_CountryIncomeTax_Co	number(10)
);


Create table Customer
(
C_CustomerID_Cu					number(10),
C_FacilityReservationNumber_Cu	number(10),
I_EventCode_Cu					number(10),
C_BillingPartyID_Cu				number(10),
T_CustomerFirstName_Cu			varchar22(100),
T_CustomerLastName_Cu			varchar22(100),
T_CustomerMiddleName_Cu			varchar22(100),
T_CustomerAddress_Cu			varchar22(100),
I_CustomerPhoneNumber_Cu		varchar22(20)
);


Create table CustomerAffiliation
(
C_CustomerID_Ca 	number(10),
C_EventID_Ca		number(10)
);


Create table Deposits
(
C_DepositConfirmationNumber_De	number(10),
C_BillingPartyID_De				number(10),
N_RoomDepositAmount_De			number(10),
N_FacilityDepositAmount_De		number(10),
);



Create table Employees
(
C_EmployeeNumber_Em			number(10),
T_EmployeeFirstName_Em		varchar22(100),	
T_EmployeeMiddleName_Em		varchar22(100),
T_EmployeeLastName_Em		varchar22(100),
T_EmployeeAddress_Em		varchar22(100),
I_EmployeePhoneNumber_Em	varchar22(100),
T_EmployeeRanking_Em		varchar22(100),
T_EmployeeStatus_Em			varchar22(100)
);



Create table Event
(
C_EventID_Ev			varchar22(100),
T_EventDescription_Ev	varchar22(100),
D_EventStartDate_Ev		Date,
D_EventEndDate_Ev		Date,
C_BillingPartyID_Ev		number(10),
C_FacilityIDCode_Ev		number(10)
);


Create table EventPrice
(
C_EventPriceID_Ep		number(10),
T_ChargeDescription_Ep	varchar22(100),
C_EventID_Ep			number(10),
D_ChargeDate_Ep			Date,
N_ChargeAmount_Ep		number(10)
);


Create table Facility
(
C_FacilityIDCode_Fa  	number(10),
C_ResortCode_Fa			number(10),
T_FacilityDescription_Fa	varchar22(100)	
);

Create table FacilityReservation
(
C_FacilityReservationNumber_Fr 	number(10),
C_FacilityIDCode_Fr				number(10),
I_CustomerID_Fr					number(10),
D_RentDateStart_Fr				Date,
D_RentDateEnd_fr				Date
);


Create table FloorMst
(
C_FloorNumber_Fl	number(10),
I_BuildingCode_Fl	number(10),
T_Smoking_Fl		varchar22(100),
T_NonSmoking_Fl		varchar22(100),
C_WingCode_Fl		number(10)
);



Create table Invoice
(
C_InvoiceNumber_In	varchar22(100),
C_BillingPartyID_In	varchar22(100),
D_IssuedDate_In		Date,
T_ResortServices_In	varchar22(100),
N_InvoiceTotal_In	varchar22(100),
N_InvoiceRemaining_In varchar22(100)
);


Create table Payment
(
C_PaymentConfirmationCode_Pa 	number(10),
C_InvoiceNumber_Pa		number(10),
T_PaymentMethod_Pa		number(10),
N_PaymentAmount_Pa		number(10)
);

Create table Region
(
C_RegionID_Re		number(10),
T_CityName_Re		varchar22(100),
N_RegionSalesTax_Re	varchar22(100),
N_RegionIncomeTax_Re	varchar22(100),
C_CountryName_Re		varchar22(100)
);


Create table RepairService
(
C_RepairOrderNumber_Rp 	number(10),
C_WorkOrderNumber_Rp	number(10),
C_EmployeeNumber_Rp		number(10),
T_RepairInstructions_Rp	number(10)
);


Create table Resort
(
C_ResortCode_Rs		number(10),
T_ResortName_Rs		varchar22(100),
T_RegionID_Rs		number(10),
C_CityName_Rs		varchar22(100),
T_StreetAddress_Rs	varchar22(100),
T_State_Rs			varchar22(100),
C_ZipCode_Rs		number(10)
);





Create table ResortStaff
(
C_RoomNumber_Ro		number(10),
C_FloorNumber_Ro	number(10),
T_WingCode_Ro		number(10),
C_RoomType_Ro		varchar2(100),
T_RoomCondition_Ro	varchar2(100)
);



Create table Room
(
C_DescriptionCode_Rd 	number(10),
C_RoomType_Rd			varchar2(100),	
T_BedType_Rd			varchar2(100),
T_Amenities_Rd			number(10),
T_ConnectionDoor_Rd		number(10)
);


Create table RoomItemCondition
(
C_RoomNumber_Ic			number(10),
C_FloorNumber_Ic		number(10),
T_ToiletCondition_Ic	varchar2(100),
T_TelephoneCondition_Ic	varchar2(100),
T_BedCondition_Ic		varchar2(100),
T_ShowerCondition_Ic	varchar2(100)
T_BathroomCondition_Ic	varchar2(100)
T_TVCondition_Ic		varchar2(100)
T_ClosetCondition_Ic	varchar2(100)
T_DresserCondition_Ic	varchar2(100)
T_CarpetCondition_Ic	varchar2(100)
);



Create table RoomReservation
(
C_RoomReservationNumber_Rr 	number(10),
C_CustomerID_Rr				number(10),
C_RoomType_Rr 			varchar2(100),
D_ArrivalDate_Rr		varchar2(100),
D_DepartureDate_Rr		varchar2(100)
);


Create table RoomType
(
C_RoomType_Rt  number(10),
N_RoomPrice_Rt number(10)
);


Create table ServiceDescriptions
(
C_ResortServices_Sd   	number(10),
C_ServiceTypeID_St		number(10),
T_ServiceDescription_Sd	varchar2(100),
N_ServicePrice_Sd		number(10)
);

Create table ServiceType
(
C_ServiceTypeID_St			number(10),
T_ServiceTypeDescription_St	varchar2(100)
);


Create table ServiceUse
(
C_ServiceUseID_Su	number(10),	
C_ResortServices_Su	varchar2(100),
C_BillingPartyID_Su	number(10),
N_PriceCharged_Su	number(10)
);


Create table Wing
(
C_WingCode_Wi		number(10),
T_WingName_Wi		varchar2(100),
C_BuildingCode_Wi	number(10),
N_PoolProximity_Wi	varchar2(100),
N_ParkingGarageProximity_Wi	varchar2(100),
N_HandicappedAccess_Wi		varchar2(100)
);



Create table WorkOrder
(
C_WorkOrderNumber_Wo 	number(10),
C_RoomNumber_Wo			number(10),
C_FloorNumber_Wo		number(10),
T_DamageDescription_Wo 	varchar2(100),
C_EmployeeNumber_Wo		number(10)
);




Create table Location 
(
Attribute Name
C_LocationID_LN
T_LocationName_LN
);

Create table Maps
(
C_MapID_MP
T_MapName_MP
);

Create table Meeting
(
C_RoomID_MG
C_LocationID_MG
T_SeatingCapacity_MG
);

Create table MeetingRoomRates
(
C_MeetingRoomRateID_MR
T_MeetingRoomRateName_MR
);

Create table Meeting-Usages
(
C_MeetingRoomRateID_MU
C_MeetingID_MU
PaymentInfo
C_PaymentID_PI
T_PaymentName_PI
C_CustomerID_PI
);

Create table Person
(
C_PersonID_PR
T_PersonFName_PR
T_PersonLName_PR
T_StreetAddress_PR
T_City_PR
T_State_PR
I_ZipCode_PR
T_Country_PR
I_PhoneNumber_PR
T_Email_PR
);

Create table Reservation
(
C_ReservationID_RN
C_ResortID_RN
C_CustomerID_RN
C_RoomRateID_RN
T_DiscountName_RN
I_DiscountAmount_RN
T_ReservationDate_RN
);

Create table ReservationTime
(
C_ReservationTimeID_RT
T_ReservationTimeName_RT
);

Create table Resort
(
C_ResortID_RS
T_ResortName_RS
C_CountryID_RS
T_StreetAddress_CR
T_City_CR
T_State_CR
I_ZipCode_CR
I_PhoneNumber_CR
T_Email_CR
);

Create table Responsibilties
(
C_ResponsibilitiesID_RP
T_ResponsibilitiesName_RP
ResRoomID
C_ResRoomID_RO
C_RoomID_RO
C_MeetingID_RO
C_ReservationID_RO
C_BilledPartyID_RO
);

Create table ResTime
(
C_ResTimeID_RM
C_ReservationTimeID_RM
C_RoomID_RM
I_ResTimeAvailability_RM
);

Create table RoomCharges
(
C_RoomChargesID_RC
C_ResRoomID_RC
I_NightCount_RC
);

Create table RoomID
(
C_RoomID_RI
C_WingID_RI
C_BuildingID_RI
C_ResortID_RI
I_RoomNumber_RI
);

Create table RoomRate
(
C_RoomRateID_RR
T_RoomRateName_RR
T_RoomRateAmount_RR
);

Create table ServiceTransactions
(
C_ServiceTransactionsID_ST
C_ResRoomID_ST
Sleep-Furniture
C_FurnitureID_SF
C_SleepingRoomID_SF
);

Create table SleepingRoom
(
C_SleepingRoom_SR
T_Smoking_NonSmoking_SR
I_MaxRoomCapacity_SR
T_BaseRentalRate_SR
);

Create table Stalker
(
C_StalkerID_SK
C_CustomerID_SK
C_CensorID_SK
Suite-Furniture
C_FurnitureID_SU
C_SuiteRoomID_SU
);

Create table SuiteRoom
(
C_SuiteRoomID_SM
T_SuiteName_SM
);

Create table Titles
(
C_TitleID_TL
T_TitleName_TL
);

Create table Title_Responsibilities
(
C_TitleID_TR
C_ResponsibilitiesID_TR
);

Create table TypeOfService
(
C_ServiceTransactionsID_TS
T_ServiceName_TS
T_ServiceDescrption_TS
);

Create table Wing-Amenities
(
C_AmenityID_WA
C_WingID_WA
);


