-- A -- 
SELECT * 
FROM CUSTOMER, INVOICE, INVOICE_ITEM;

-- B -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER;

-- C -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName = "Nikki";

-- D -- 
SELECT LastName, FirstName, Phone, DateIn, DateOut
FROM CUSTOMER, INVOICE
WHERE TotalAmount > 100.00;

-- E -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE FirstName LIKE "B%";

-- F -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE LastName LIKE "%cat%";

-- G -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
WHERE Phone LIKE "_23%";

-- H -- 
SELECT MIN(TotalAmount) AS MINIMUM_AMOUNT, MAX(TotalAmount) AS MAXIMUM_AMOUNT
FROM INVOICE;

-- I -- 
SELECT AVG(TotalAmount) AS AVERAGE_AMOUNT
FROM INVOICE;

-- J -- 
SELECT COUNT(distinct CustomerID) AS NUMBER_OF_CUSTOMERS
FROM CUSTOMER;

-- K -- 
SELECT LastName, FirstName
FROM CUSTOMER
group by LastName, FirstName;

-- L -- 
SELECT CONCAT(LastName, FirstName) AS customer_name, count(*)
FROM CUSTOMER
group by customer_name;

-- M -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
where CustomerID IN (SELECT CustomerID
from INVOICE
where TotalAmount > 100.00
)
order by LastName, FirstName desc;

-- O -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER JOIN INVOICE
ON CUSTOMER.CustomerID = INVOICE.CustomerID
where TotalAmount > 100.00
order by LastName, FirstName desc;

-- P -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER
where CustomerID IN (
SELECT CustomerID
from INVOICE
where InvoiceNumber in 
(SELECT InvoiceNumber
from INVOICE_ITEM
where Item = "Dress Shirt")
)
order by LastName, FirstName desc;

-- Q -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER,INVOICE,INVOICE_ITEM
where CUSTOMER.CustomerID = INVOICE.CustomerID AND
INVOICE.InvoiceNumber = INVOICE_ITEM.InvoiceNumber AND
Item = "Dress Shirt"
order by LastName, FirstName desc;

-- R -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER JOIN INVOICE
ON CUSTOMER.CustomerID = INVOICE.CustomerID 
JOIN INVOICE_ITEM
ON INVOICE.InvoiceNumber = INVOICE_ITEM.InvoiceNumber 
where Item = "Dress Shirt"
order by LastName, FirstName desc;

-- S -- 
SELECT C1.LastName AS CustomerLastName, C1.FirstName AS CustomerFirstName, 
C2.LastName AS ReferredByLastName, C2.FirstName AS ReferredByFirstName
FROM CUSTOMER C1 LEFT JOIN CUSTOMER C2
ON C2.CustomerID = C1.ReferredBy;

-- T -- 
SELECT LastName, FirstName, Phone
FROM CUSTOMER JOIN INVOICE
ON CUSTOMER.CustomerID = INVOICE.CustomerID 
WHERE InvoiceNumber in
(SELECT InvoiceNumber
from INVOICE_ITEM
where Item = "Dress Shirt")
order by LastName, FirstName desc;

-- U -- 
SELECT LastName, FirstName, Phone, TotalAmount
FROM CUSTOMER JOIN INVOICE
ON CUSTOMER.CustomerID = INVOICE.CustomerID 
WHERE InvoiceNumber in
(SELECT InvoiceNumber
from INVOICE_ITEM
where Item = "Dress Shirt")

union

SELECT LastName, FirstName, Phone, TotalAmount
FROM CUSTOMER JOIN INVOICE
ON CUSTOMER.CustomerID = INVOICE.CustomerID 
WHERE InvoiceNumber not in
(SELECT InvoiceNumber
from INVOICE_ITEM
where Item = "Dress Shirt")
order by TotalAmount, LastName, FirstName desc;

