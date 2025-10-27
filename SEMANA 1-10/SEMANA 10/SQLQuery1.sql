use WideWorldImporters;


-- Un producto puede estar en multiples ordenes de compra.
-- Una orden de compra puede incluir multiples productos.
select * from Warehouse.StockItems;
select * from Purchasing.PurchaseOrders;


CREATE TABLE ProductosOrdenes (
    PurchaseOrderID INT,
    StockItemID INT,
    PRIMARY KEY (PurchaseOrderID, StockItemID),
    FOREIGN KEY (PurchaseOrderID) REFERENCES Purchasing.PurchaseOrders(PurchaseOrderID),
    FOREIGN KEY (StockItemID) REFERENCES Warehouse.StockItems(StockItemID)
);

drop table ProductosOrdenes;

insert into ProductosOrdenes (PurchaseOrderID,StockItemID) values 
(1,151),(2,76),(1, 150),(2,146),(2,147),(2,148),(2,149),(3,16),(3,18),(3,19),(3,20),(3,21),(3,22),
(3,23),(3,39),(3,40),(3,41),(3,44),(3,45),(3,50),(3,54),(3,55),(3,57),
(4,156),(4,158),(4,162),(4,163),(4,164),(4,165),(4,166),(4,167),(4,168),
(4,170),(4,171),(4,172),(4,181),(4,182),(4,183),(4,184),(4,191),(4,194),
(4,195),(4,197),(4,198),(4,200),(4,202),(4,206),(4,209),(4,210),(4,213),
(4,219),(5,58),(5,59),(5,63),(5,64),(5,67),(5,70),(5,71),(5,72),(6,2),
(6,5),(6,6),(6,7),(6,9),(7,77),(7,79),(7,82),(7,87),(7,90),(7,91),
(7,93),(7,95),(7,96),(7,97),(7,103),(7,105),(7,107),(7,112),(7,116),
(7,117),(7,118),(7,130),(7,133),(7,137),(8,28),(8,29),(8,38),(8,46),
(9,154),(9,160),(9,178),(9,186),(9,188),(9,189),(9,193),(9,196),(9,199),
(9,200),(9,203),(9,205),(9,207),(9,211),(9,212),(9,214),(9,216),(10,60),
(11,1),(11,3),(11,15),(12,77),(12,101),(12,108),(12,114),(12,119),(12,120),
(12,129),(12,139),(12,143),(13,32),(13,33),(14,153),(14,155),(14,159),(14,169),
(14,173),(14,175),(14,176),(14,177),(14,179),(14,185),(14,187),(14,189),(14,190),
(14,201),(14,203),(14,217),(15,68),(15,74),(16,4),(16,10),(16,13),(17,77);
select * from ProductosOrdenes;

select i.StockItemName,p.PurchaseOrderID
from Warehouse.StockItems i
join ProductosOrdenes c on i.StockItemID=c.StockItemID
join Purchasing.PurchaseOrders p on c.PurchaseOrderID= p.PurchaseOrderID;


