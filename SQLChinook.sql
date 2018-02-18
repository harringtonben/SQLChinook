use Chinook
GO

-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

--Using this query to grab unique countries so that I know how US is identified
select distinct country from Customer

select firstname + ' ' + lastname as Name, customerid, country from Customer
where country != 'USA'

-- Provide a query only showing the Customers from Brazil.
select * from customer
where country = 'Brazil'

/*Provide a query showing the Invoices of customers who are from Brazil. 
The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country. */
select c.firstname + ' ' + c.lastname as Name, i.invoiceid, i.invoicedate, i.billingcountry from customer c
join invoice i on i.CustomerId = c.CustomerId
where c.country = 'Brazil'

