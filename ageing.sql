
set heading off
set feedback off
set echo off
set verify off

PROMPT 
PROMPT '****** AGING REPORT *******'
PROMPT

SELECT 'TODAYS DATE:' || SYSDATE FROM DUAL;

Accept vCustomerId prompt 'Enter the customer ID:';

PROMPT
Select 'Customer Name:' ||initcap(lastname) ||','||initcap(firstname)
from customers
where CUSTOMERID = '&vCustomerId';
PROMPT

