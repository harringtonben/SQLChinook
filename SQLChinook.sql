use Chinook
GO

-- Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.

--Using this query to grab unique countries so that I know how US is identified
select distinct country from Customer

select firstname + ' ' + lastname as Name, customerid, country from Customer
where country != 'USA'

