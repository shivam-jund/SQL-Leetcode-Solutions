-- Write your PostgreSQL query statement below
SELECT t.Customer_ID
FROM (
    SELECT DISTINCT *
FROM Customer
) as t
GROUP BY t.Customer_ID
HAVING COUNT (t.*) = (
SELECT COUNT (p.*)
FROM Product p);