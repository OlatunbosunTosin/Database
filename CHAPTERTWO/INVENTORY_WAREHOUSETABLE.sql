select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity = "Atlanta" or WarehouseCity = "Bangor" or
WarehouseCity = "Chicago";

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity in ('Atlanta','Bangor','Chicago');

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity <> "Atlanta" and WarehouseCity <> "Bangor" and
WarehouseCity <> "Chicago";

select INVENTORY.SKU,
INVENTORY.SKU_Description, 
WAREHOUSE.WarehouseID,
WAREHOUSE.WarehouseCity,
WAREHOUSE.WarehouseState
from INVENTORY, WAREHOUSE
where WarehouseCity not in ('Atlanta','Bangor','Chicago');

select CONCAT(SKU_Description,"is located in,", WarehouseCity) as ItemLocation
from INVENTORY, WAREHOUSE;
 
SELECT SKU, SKU_Description, WarehouseID
FROM INVENTORY
WHERE WarehouseID = (SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith');

SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
WHERE Manager = 'Lucille Smith';

SELECT SKU, SKU_Description, WAREHOUSE.WarehouseID
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

SELECT WarehouseID, avg(QuantityOnHand) AS AVERAGE
FROM INVENTORY
WHERE WarehouseID = (SELECT WarehouseID
FROM WAREHOUSE
WHERE Manager = 'Lucille Smith')
GROUP BY WarehouseID;

SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY JOIN WAREHOUSE
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

SELECT WAREHOUSE.WarehouseID, avg(QuantityOnHand)
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith'
GROUP BY WarehouseID;

-- 2.51-- 
select SKU, SKU_Description, QuantityOnHand,
WAREHOUSE.WarehouseID,
WarehouseCity,
WarehouseState
FROM INVENTORY JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID
WHERE Manager = 'Lucille Smith';

SELECT WarehouseID, sum(QuantityOnOrder) AS TotalItemsOnOrder,
sum(QuantityOnHand) as TotalItemsOnHand
from INVENTORY
group by WarehouseID ,QuantityOnOrder;

-- subquery is returns specific dataset to outer query  --  

select SKU, SKU_Description, QuantityOnHand, QuantityOnOrder,
WAREHOUSE.WarehouseID,
WarehouseCity,
WarehouseState, Manager, SquareFeet
from INVENTORY RIGHT OUTER JOIN WAREHOUSE
ON INVENTORY.WarehouseID = WAREHOUSE.WarehouseID;

SELECT SKU, SKU_Description, Department
from CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2016
UNION
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
INTERSECT
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2016
INTERSECT
SELECT SKU, SKU_Description, Department, CatalogPage
FROM CATALOG_SKU_2017;

SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2016
EXCEPT
SELECT SKU, SKU_Description, Department
FROM CATALOG_SKU_2017;

