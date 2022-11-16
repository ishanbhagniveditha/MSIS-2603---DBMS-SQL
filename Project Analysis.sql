use `msis-2603-project-group-mavericks`;

Show FULL TABLES;

Create view MostFreqOrdereditem AS
Select OrderID, ProductQuantity, ItemDescription
from order_t O, customer_t C, product_t P
where O.CustomerID = C.CustomerID
and P.ProductID=O.ProductID
order by ProductQuantity;

Select * from MostFreqOrdereditem;

Create view lastorderbycustomer as
select orderID, OrderDate, customerName, ItemDescription
from order_t O, customer_t C, product_t P
where C.CustomerID = O.CustomerID and P.ProductID = O.ProductID;