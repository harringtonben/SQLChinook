use Chinook
GO

-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
select firstname + ' ' + lastname as Name, customerid, country from Customer
where country != 'USA'

--Using this query to grab unique countries so that I know how US is identified
select distinct country from Customer

-- Provide a query only showing the Customers from Brazil.
select * from customer
where country = 'Brazil'

/*Provide a query showing the Invoices of customers who are from Brazil. 
The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country. */
select c.firstname + ' ' + c.lastname as Name, i.invoiceid, i.invoicedate, i.billingcountry from customer c
join invoice i on i.CustomerId = c.CustomerId
where c.country = 'Brazil'

--Provide a query showing only the Employees who are Sales Agents.
select * from Employee
where title = 'Sales Support Agent'

--Using this query to select unique titles so I know how to pull sales people
select distinct title from Employee

--Provide a query showing a unique/distinct list of billing countries from the Invoice table.
select distinct billingcountry from Invoice

/*Provide a query that shows the invoices associated with each sales agent. 
The resultant table should include the Sales Agent's full name. */
select e.firstname + ' ' + e.lastname as Name, i.InvoiceId from Employee e
join customer c on c.SupportRepId = e.EmployeeId
join invoice i on i.CustomerId = c.CustomerId
where e.title = 'Sales Support Agent'

--determining if my query only pulled sales support agents and their invoices
select distinct firstname, lastname from Employee
where title = 'Sales Support Agent'


