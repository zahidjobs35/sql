
----Database----

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

Create table Wings
(
C_WingID_WG
C_ResortID_WG
T_WingName_WG
);
