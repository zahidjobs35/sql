
REGISTER (REGISTERID, REGISTERDATE, SPECIALISTID, FULLNAME, MARITALSTATUS, SEX, DATEOFBIRTH, CONTACTADDRESS, CONTACTNUMBER, EMERGENCYCONTACTDETAILS, HIGHESTEDUCATIONS, SPECIALIZATIONAREA, TRAININGCERTIFICATES, MEMBERSHIPOFPROFESSIONAL,  VALIDDOCUMENTS,  PHOTOGRAPHS, VALIDCRB, REFERENCES) 

SPECIALIST(SPECIALISTID, FULLNAME, ADDRESS, GENDER, PHONE, EMAIL, STATE, ZIP, REGISTERID)

BOOKING (BOOKINGID, BOOKINGDATE, AVAILABLESTATUS, SPECIALISTID, ROOMID)

PATIENT(PATIENTID, FULLNAME, ADDRESS, GENDER, PHONE, EMAIL, STATE, ZIP, REGISTERID )

ROOM (ROOMID, DESCRIPTION, AVAILABLESTATUS)

SESSION (SESSIONID, SESSIONNAME, TIMESLOT, ROOMID)

PAYMENT (PAYMENTID, PAYMENTDATE, CHARGE, PAYMENTTYPE, PATIENTID, SPECIALISTID  )

PAYMENTTYPE (PAYMENTTYPEID, DESCRIPTION)


a. List of all specialists

Select * from SPECIALIST

b. List of all specialist according to specialization area (e.g. ENT, Orthopedic, Cardiology,
Endocrinology, Gastroenterology, Neurology, Urology, Paediatrics, Rheumatology etc.)
c. Count no of patients visited center in each day
d. View patients checked by particular specialist
e. List of patients visited a center at specific time period (day, week, one month, six months
or years)
f. List of room booked by doctors
g. List of available room for booking
h. List of specialist those who are greater than 50 years old
i. Statistics of male and female specialist
j. Particular’s specialist daily income :
i. List of card and cash payment
ii. Calculate the total money (card and cash)
iii. Calculate the total cash payment only
k. List of specialist those who has not pay the room charge