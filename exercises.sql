-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
SELECT FirstName, LastName, CustomerId, Country from Customer
WHERE Country != 'USA';

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.
SELECT * from Customer
WHERE Customer.Country = 'Brazil';

-- brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.
SELECT c.FirstName, c.LastName, i.InvoiceId, i.InvoiceDate, i.BillingCountry
FROM Invoice i
Join Customer c
On c.CustomerId = i.CustomerId
WHERE c.Country = 'Brazil';

-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.
SELECT * from Employee where Employee.title like "%Sales%";

-- unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry from Invoice;

-- sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.
SELECT e.firstname || " " || e.lastname AS fullname, i.*
FROM CUSTOMER c
Left Join Employee e on c.SupportRepId = e.EmployeeId
JOIN Invoice i on c.CustomerId = i.customerId;


-- invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.
SELECT 
	i.Total, 
	c.FirstName || " " || c.LastName as 'Customer', 
	c.Country,
	e.FirstName || " " || c.LastName as 'Sales Agent'
FROM Customer c
JOIN Invoice i
ON c.CustomerId = i.CustomerId
JOIN Employee e
ON e.EmployeeId = c.SupportRepId;



-- total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?
SELECT strftime('%Y', InvoiceDate) as 'year', COUNT()
FROM Invoice
WHERE year IN ('2009', '2011')
GROUP BY year;

-- total_sales_{year}.sql: What are the respective total sales for each of those years?
SELECT strftime('%Y', InvoiceDate) as 'year', total(i.total) as 'total sales'
FROM Invoice i
WHERE year IN ('2009', '2011')
GROUP BY year;

-- invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.
SELECT COUNT() as "Number of line items" 
from InvoiceLine i
WHERE i.InvoiceId = 37;

-- line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: GROUP BY
SELECT InvoiceId, Count(InvoiceId) as "Total Line Items"
FROM InvoiceLine
GROUP BY InvoiceId;

-- line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.
SELECT i.InvoiceLineId, t.name
FROM InvoiceLine i
JOIN Track t
ON i.TrackId = t.TrackId;


-- line_item_track_artist.sql: Provide a query that includes the purchased track name AND artist name with each invoice line item.
SELECT i.InvoiceLineId, t.name, a.name
FROM InvoiceLine i
JOIN Track t
ON i.TrackId = t.TrackId
JOIN Album
ON t.AlbumId = Album.AlbumId
JOIN Artist a
ON Album.ArtistId = a.ArtistId;

-- country_invoices.sql: Provide a query that shows the # of invoices per country. HINT: GROUP BY

-- playlists_track_count.sql: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

-- tracks_no_id.sql: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

-- invoices_line_item_count.sql: Provide a query that shows all Invoices but includes the # of invoice line items.

-- sales_agent_total_sales.sql: Provide a query that shows total sales made by each sales agent.

-- top_2009_agent.sql: Which sales agent made the most in sales in 2009?

-- Hint: Use the MAX function on a subquery.

-- top_agent.sql: Which sales agent made the most in sales over all?

-- sales_agent_customer_count.sql: Provide a query that shows the count of customers assigned to each sales agent.

-- sales_per_country.sql: Provide a query that shows the total sales per country.

-- top_country.sql: Which country's customers spent the most?

-- top_2013_track.sql: Provide a query that shows the most purchased track of 2013.



-- top_5_tracks.sql: Provide a query that shows the top 5 most purchased tracks over all.

-- top_3_artists.sql: Provide a query that shows the top 3 best selling artists.

-- top_media_type.sql: Provide a query that shows the most purchased Media Type.

