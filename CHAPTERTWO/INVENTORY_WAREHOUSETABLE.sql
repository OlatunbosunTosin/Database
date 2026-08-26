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

