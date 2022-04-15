--Start f:aging.sql

Set heading off
Set feedback off
Set echo off
Set verify off

Prompt
Prompt ****** AGING REPORT ******
Prompt


Select ' Today''s Date: ', Upper(to_char(sysdate,'dd/mm/yyyy')) from dual;

Accept vDaysNo prompt 'Please enter number of days to query: ';

Select Orders.OrderNumber,Orders.OrderDate,Orders.Status as Order_Status,Products.ProductID as Prod_Num,Products.ProductDescription, Orders.OrderQty, Products.CurrentPrice as UnitPrice, Orders.OrderAmount, '&vDaysNo' as DaysOpen
from Orders, Products
Where Orders.ProductID = Products.ProductID;

