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

--Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
select i.Total, e.firstname + ' ' + e.lastname as [Sales Agent], i.BillingCountry, c.FirstName + ' ' + c.LastName as [Customer Name] 
from Employee e
join customer c on c.SupportRepId = e.EmployeeId
join invoice i on i.CustomerId = c.CustomerId
where e.title = 'Sales Support Agent'

--How many Invoices were there in 2009 and 2011?
select count(*) as [Total Invoices] from Invoice
where InvoiceDate like '%2009%'
or InvoiceDate like '%2011%'

--What are the respective total sales for each of those years?
select count(*) as [Total Invoices], DATENAME(yyyy, InvoiceDate) as Year from Invoice
where InvoiceDate like '%2009%'
or InvoiceDate like '%2011%'
group by DATENAME(yyyy, InvoiceDate)

-- Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
select count(*) as [Total Number of Line Items] from InvoiceLine
where InvoiceId = 37
 
--checking work of that query
select * from InvoiceLine
where InvoiceId = 37

--Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice.
select InvoiceId, count(*) as [Lines per invoice] from InvoiceLine

--Provide a query that includes the purchased track name with each invoice line item.
select t.name as [Track Name], i.InvoiceLineId from Track t
join InvoiceLine i on i.TrackId = t.TrackId

--Provide a query that includes the purchased track name AND artist name with each invoice line item.
select t.name as [Track Name], ar.Name as [Artist Name], i.InvoiceLineId from Track t
join InvoiceLine i on i.TrackId = t.TrackId
join Album a on a.AlbumId = t.AlbumId
join Artist ar on ar.ArtistId = a.ArtistId

--Provide a query that shows the # of invoices per country
select BillingCountry, count(*) as [Number of Invoices] from Invoice
group by BillingCountry

