use pvfc;

#Q1. Write SQL statement to find Number of customers living in state ‘FL’ 
Select count(*) as 'Number of customers living in state FL'
from customer_t C
where C.CustomerState = 'FL';

#Q2. Write SQL statement to show only Customer State, Customer Postal Code and Customer Name of customers living in state ‘CA’
Select C.CustomerState, C.CustomerPostalCode, C.CustomerName
from customer_t C
where C.CustomerState = 'CA';

#Q3. Write SQL statement to find number of customers by State for all states sorted by alphabetical order of state (A-Z)
Select C.CustomerState, count(*) as 'Number of customers by State'
from customer_t C
group by C.CustomerState
order by C.CustomerState;

#Q4. Write SQL query to get following dataset for Territory = ‘Central’ : SALESPERSONNAME, SALESPERSONPHONE, TERRITORYID, TERRITORYNAME
Select SALESPERSONNAME, SALESPERSONPHONE, T.TERRITORYID, T.TERRITORYNAME
from salesperson_t S, territory_t T
where S.TERRITORYID=T.TERRITORYID and T.TERRITORYNAME='Central';

#Q5. Write SQL query to get Customer Name, Customer Address for Order Id 1005
Select C.CustomerName, C.CustomerAddress
from Customer_t C , Order_t O 
where C.CustomerID = O.CustomerID and O.OrderID='1005';

#Q6. Write SQL to Create a view with name ‘view1’ with the following columns from product table PRODUCTDESCRIPTION, PRODUCTFINISH where PRODUCTDESCRIPTION contains word ‘Table’.
Create view view1 as 
select ProductDescription, ProductFinish
from product_t
where ProductDescription like '%Table%';

Select * from view1;

#Q7. Write SQL to Create a view with name ‘view2’ with the following columns from product table PRODUCTDESCRIPTION, PRODUCTFINISH where PRODUCTDESCRIPTION contains word ‘Desk’. (Hint- Use ‘LIKE’) 
Create view view2 as 
select ProductDescription, ProductFinish
from product_t
where ProductDescription like '%Desk%';

Select * from view2;

#Q8. Write SQL to get the customer name, customer address, customer city and customer state, order ID and order date where customer ID = 15
Select C.CustomerName, C.CustomerAddress, C.CustomerCity, C.CustomerState, O.OrderID, O.OrderDate
from customer_t C, order_t O
where C.CustomerID = O.CustomerID 
and C.CustomerID='15';

#Q9. Write SQL to get the names of the salesperson that work in the SOUTH Territory.
Select SA.SALESPERSONNAME
from salesperson_t SA
join Territory_t T on T.TERRITORYID=SA.TERRITORYID
where T.TerritoryName like 'South%';

#10. Write SQL to get the names of the salesperson that work in the NORTH Territory.
Select SA.SALESPERSONNAME
from salesperson_t SA
join Territory_t T on T.TERRITORYID=SA.TERRITORYID
where T.TerritoryName like 'North%';

#Q11. Write SQL to get the name of the PRODUCTDESCRIPTION with the PRODUCTFINISH = ‘Walnut’.
Select PRODUCTDESCRIPTION
from product_t
where PRODUCTFINISH = 'Walnut';

#Q12. List all the PRODUCTDESCRIPTION and PRODUCTFINISH with the any type ‘Ash’ PRODUCTFINISH
Select PRODUCTDESCRIPTION, PRODUCTFINISH
from product_t
where PRODUCTFINISH like '%Ash%';

#Q13. Alter table customer_t to add customerphonenumber, customeremail as columns
Alter TABLE customer_t add(customerphonenumber varchar(30), customeremail varchar(255));
Select * from customer_t;

