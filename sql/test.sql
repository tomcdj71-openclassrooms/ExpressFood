PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telephone TEXT NOT NULL,
    address_id INTEGER,
    FOREIGN KEY (address_id) REFERENCES address (id)
);
INSERT INTO customer VALUES(1,'Aurélie Martin','aurelie.martin@example.com','0695481573',1);
INSERT INTO customer VALUES(2,'Benoît Dubois','benoit.dubois@example.com','0664475669',2);
INSERT INTO customer VALUES(3,'Chloé Girard','chloe.girard@example.com','0672051019',3);
INSERT INTO customer VALUES(4,'David Moreau','david.moreau@example.com','0626148193',4);
INSERT INTO customer VALUES(5,'Céline Durand','celine.durand@example.com','0630523742',5);
INSERT INTO customer VALUES(6,'Julien Leroy','julien.leroy@example.com','0684635836',6);
INSERT INTO customer VALUES(7,'Léa Dumont','lea.dumont@example.com','0675855190',7);
INSERT INTO customer VALUES(8,'Maxime Rousseau','maxime.rousseau@example.com','0679161824',8);
INSERT INTO customer VALUES(9,'Emma Dubois','emma.dubois@example.com','0688569497',9);
INSERT INTO customer VALUES(10,'Lucas Fournier','lucas.fournier@example.com','0693594310',10);
INSERT INTO customer VALUES(11,'Amélie Girard','amelie.girard@example.com','0643270005',11);
CREATE TABLE address (
    id INTEGER PRIMARY KEY AUTOINCREMENT, 
    number INTEGER NOT NULL,
    street TEXT NOT NULL,
    city TEXT NOT NULL,
    zipcode INTEGER NOT NULL,
    country TEXT NOT NULL,
    customer_id INTEGER,
    FOREIGN KEY (customer_id) REFERENCES customer (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO address VALUES(1,123,'Rue de la Paix','Paris',75001,'France',1);
INSERT INTO address VALUES(2,1,'Avenue des Champs-Élysées','Paris',75008,'France',2);
INSERT INTO address VALUES(3,26,'Rue du Faubourg Saint-Honoré','Paris',75008,'France',3);
INSERT INTO address VALUES(4,43,'Boulevard Saint-Germain','Paris',75006,'France',4);
INSERT INTO address VALUES(5,51,'Rue de Rivoli','Paris',75001,'France',5);
INSERT INTO address VALUES(6,17,'Place de la Concorde','Paris',75008,'France',6);
INSERT INTO address VALUES(7,21,'Rue de la Roquette','Paris',75011,'France',7);
INSERT INTO address VALUES(8,42,'Boulevard Haussmann','Paris',75008,'France',8);
INSERT INTO address VALUES(9,12,'Rue de Vaugirard','Paris',75015,'France',9);
INSERT INTO address VALUES(10,7,'Rue Saint-Antoine','Paris',75004,'France',10);
INSERT INTO address VALUES(11,13,'Rue du Temple','Paris',75004,'France',11);
INSERT INTO address VALUES(12,18,'Rue du Faubourg Poissonnière','Paris',75010,'France',NULL);
INSERT INTO address VALUES(13,9,'Rue des Petits Champs','Paris',75001,'France',NULL);
INSERT INTO address VALUES(14,8,'Rue du Cherche-Midi','Paris',75006,'France',NULL);
INSERT INTO address VALUES(15,75,'Avenue des Ternes','Paris',75017,'France',NULL);
INSERT INTO address VALUES(16,35,'Rue du Faubourg Saint-Antoine','Paris',75011,'France',NULL);
INSERT INTO address VALUES(17,130,'Rue de la Convention','Paris',75015,'France',NULL);
INSERT INTO address VALUES(18,69,'Rue de la Roquette','Paris',75011,'France',NULL);
INSERT INTO address VALUES(19,51,'Rue Saint-Honoré','Paris',75001,'France',NULL);
CREATE TABLE `order` (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_number TEXT NOT NULL,
    address_id INTEGER,
    delivered_by_id INTEGER,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    status TEXT NOT NULL,
    telephone TEXT,
    amount INTEGER DEFAULT 0 NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (delivered_by_id) REFERENCES staff (id) ON DELETE SET NULL ON UPDATE CASCADE
);
INSERT INTO "order" VALUES(1,'23F-475664',1,NULL,'2022-01-01 10:00:00','2022-01-01 10:00:00','pending','0674651353',9);
INSERT INTO "order" VALUES(2,'23F-485830',2,4,'2022-01-02 11:00:00','2022-01-02 11:00:00','in progress',NULL,45);
INSERT INTO "order" VALUES(3,'23F-766060',3,3,'2022-01-03 12:00:00','2022-01-03 12:00:00','delivered',NULL,34);
INSERT INTO "order" VALUES(4,'23F-495177',4,NULL,'2022-01-04 13:00:00','2022-01-04 13:00:00','cancelled','0615530587',12);
INSERT INTO "order" VALUES(5,'23F-216137',5,2,'2022-01-05 14:00:00','2022-01-05 14:00:00','in progress',NULL,23);
INSERT INTO "order" VALUES(6,'23F-865661',6,3,'2022-01-06 15:00:00','2022-01-06 15:00:00','delivered',NULL,42);
INSERT INTO "order" VALUES(7,'23F-493851',7,3,'2022-01-07 16:00:00','2022-01-07 16:00:00','in progress',NULL,22);
INSERT INTO "order" VALUES(8,'23F-681393',8,2,'2022-01-08 17:00:00','2022-01-08 17:00:00','pending',NULL,31);
INSERT INTO "order" VALUES(9,'23F-177240',9,NULL,'2022-01-09 18:00:00','2022-01-09 18:00:00','cancelled','0640117608',17);
INSERT INTO "order" VALUES(10,'23F-320248',10,5,'2022-01-10 19:00:00','2022-01-10 19:00:00','delivered',NULL,24);
INSERT INTO "order" VALUES(11,'23F-327138',2,2,'2022-01-11 20:00:00','2022-01-11 20:00:00','in progress',NULL,28);
INSERT INTO "order" VALUES(12,'23F-485992',7,2,'2022-01-07 16:00:00','2022-01-07 16:00:00','delivered',NULL,33);
INSERT INTO "order" VALUES(13,'23F-516293',8,NULL,'2022-01-08 17:00:00','2022-01-08 17:00:00','pending','0644240316',36);
INSERT INTO "order" VALUES(14,'23F-777863',9,4,'2022-01-09 18:00:00','2022-01-09 18:00:00','in progress',NULL,36);
INSERT INTO "order" VALUES(15,'23F-273275',10,4,'2022-01-10 19:00:00','2022-01-10 19:00:00','cancelled',NULL,19);
INSERT INTO "order" VALUES(16,'23F-857948',11,4,'2022-01-11 20:00:00','2022-01-11 20:00:00','in progress',NULL,11);
INSERT INTO "order" VALUES(17,'23F-889180',12,4,'2022-01-12 21:00:00','2022-01-12 21:00:00','delivered',NULL,25);
INSERT INTO "order" VALUES(18,'23F-378550',13,5,'2022-01-13 22:00:00','2022-01-13 22:00:00','delivered',NULL,22);
INSERT INTO "order" VALUES(19,'23F-181796',14,NULL,'2022-01-14 23:00:00','2022-01-14 23:00:00','pending','0671355404',41);
CREATE TABLE order_item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    quantity INTEGER NOT NULL,
    total_amount INTEGER NOT NULL,
    dish_stock_id INTEGER NOT NULL,
    order_id INTEGER NOT NULL,
    delivered_by_id INTEGER NOT NULL,
    FOREIGN KEY (dish_stock_id) REFERENCES dish_stock (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (order_id) REFERENCES "order" (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO order_item VALUES(1,2,30,1,1,3);
INSERT INTO order_item VALUES(2,1,12,2,2,3);
INSERT INTO order_item VALUES(3,3,54,3,3,3);
INSERT INTO order_item VALUES(4,2,20,4,4,3);
INSERT INTO order_item VALUES(5,1,15,1,1,3);
INSERT INTO order_item VALUES(6,2,36,3,3,3);
INSERT INTO order_item VALUES(7,2,30,2,2,1);
INSERT INTO order_item VALUES(8,1,23,4,4,1);
INSERT INTO order_item VALUES(9,3,33,5,5,2);
INSERT INTO order_item VALUES(10,2,20,7,7,2);
INSERT INTO order_item VALUES(11,1,12,10,10,3);
INSERT INTO order_item VALUES(12,2,18,12,12,3);
INSERT INTO order_item VALUES(13,1,15,1,13,3);
INSERT INTO order_item VALUES(14,2,30,2,14,3);
INSERT INTO order_item VALUES(15,3,54,3,1,3);
INSERT INTO order_item VALUES(16,2,20,4,2,3);
INSERT INTO order_item VALUES(17,1,11,5,3,2);
INSERT INTO order_item VALUES(18,2,20,6,4,2);
INSERT INTO order_item VALUES(19,3,30,7,5,2);
INSERT INTO order_item VALUES(20,2,16,8,6,2);
INSERT INTO order_item VALUES(21,1,9,9,7,1);
INSERT INTO order_item VALUES(22,2,18,10,8,1);
INSERT INTO order_item VALUES(23,3,27,11,9,1);
INSERT INTO order_item VALUES(24,2,18,12,10,1);
INSERT INTO order_item VALUES(25,1,15,1,11,3);
INSERT INTO order_item VALUES(26,2,30,2,12,3);
INSERT INTO order_item VALUES(27,3,54,3,13,3);
INSERT INTO order_item VALUES(28,2,20,4,14,3);
INSERT INTO order_item VALUES(29,1,11,5,1,2);
INSERT INTO order_item VALUES(30,2,20,6,2,2);
INSERT INTO order_item VALUES(31,3,30,7,3,2);
INSERT INTO order_item VALUES(32,2,16,8,4,2);
INSERT INTO order_item VALUES(33,1,9,9,5,1);
INSERT INTO order_item VALUES(34,2,18,10,6,1);
INSERT INTO order_item VALUES(35,3,27,11,7,1);
INSERT INTO order_item VALUES(36,2,18,12,8,1);
INSERT INTO order_item VALUES(37,1,15,1,9,3);
INSERT INTO order_item VALUES(38,2,30,2,10,3);
INSERT INTO order_item VALUES(39,4,64,9,11,3);
CREATE TABLE dish_stock (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dish_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (dish_id) REFERENCES dish (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dish_stock VALUES(1,1,1,5);
INSERT INTO dish_stock VALUES(2,2,2,2);
INSERT INTO dish_stock VALUES(3,3,1,3);
INSERT INTO dish_stock VALUES(4,4,1,4);
INSERT INTO dish_stock VALUES(5,5,1,6);
INSERT INTO dish_stock VALUES(6,6,1,8);
INSERT INTO dish_stock VALUES(7,7,2,2);
INSERT INTO dish_stock VALUES(8,8,2,3);
INSERT INTO dish_stock VALUES(9,9,1,4);
INSERT INTO dish_stock VALUES(10,10,1,2);
INSERT INTO dish_stock VALUES(11,11,2,1);
INSERT INTO dish_stock VALUES(12,12,1,7);
INSERT INTO dish_stock VALUES(13,1,2,4);
INSERT INTO dish_stock VALUES(14,2,3,3);
INSERT INTO dish_stock VALUES(15,3,3,1);
INSERT INTO dish_stock VALUES(16,4,2,2);
INSERT INTO dish_stock VALUES(17,5,3,5);
INSERT INTO dish_stock VALUES(18,6,2,6);
INSERT INTO dish_stock VALUES(19,7,3,3);
INSERT INTO dish_stock VALUES(20,8,3,1);
INSERT INTO dish_stock VALUES(21,9,2,5);
INSERT INTO dish_stock VALUES(22,10,3,2);
INSERT INTO dish_stock VALUES(23,11,2,3);
INSERT INTO dish_stock VALUES(24,12,3,4);
INSERT INTO dish_stock VALUES(25,1,4,6);
INSERT INTO dish_stock VALUES(26,2,4,1);
INSERT INTO dish_stock VALUES(27,3,4,5);
INSERT INTO dish_stock VALUES(28,4,4,2);
INSERT INTO dish_stock VALUES(29,5,4,8);
INSERT INTO dish_stock VALUES(30,6,4,2);
INSERT INTO dish_stock VALUES(31,7,4,4);
INSERT INTO dish_stock VALUES(32,8,4,5);
INSERT INTO dish_stock VALUES(33,9,4,3);
INSERT INTO dish_stock VALUES(34,10,4,4);
INSERT INTO dish_stock VALUES(35,11,4,2);
INSERT INTO dish_stock VALUES(36,12,4,1);
INSERT INTO dish_stock VALUES(37,1,5,7);
INSERT INTO dish_stock VALUES(38,2,5,3);
INSERT INTO dish_stock VALUES(39,3,5,2);
INSERT INTO dish_stock VALUES(40,4,5,4);
INSERT INTO dish_stock VALUES(41,5,5,1);
INSERT INTO dish_stock VALUES(42,6,5,5);
INSERT INTO dish_stock VALUES(43,7,5,6);
INSERT INTO dish_stock VALUES(44,8,5,1);
INSERT INTO dish_stock VALUES(45,9,5,7);
INSERT INTO dish_stock VALUES(46,10,5,3);
INSERT INTO dish_stock VALUES(47,11,5,2);
INSERT INTO dish_stock VALUES(48,12,5,5);
CREATE TABLE dish (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    category INTEGER NOT NULL,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    enabled BOOLEAN DEFAULT 1,
    price INTEGER NOT NULL,
    created_by_id INTEGER NOT NULL,
    FOREIGN KEY (created_by_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO dish VALUES(1,0,'Boeuf Bourguignon','Ragoût de boeuf mijoté avec des légumes, des champignons et du vin rouge',1,18,1);
INSERT INTO dish VALUES(2,0,'Salade Niçoise','Salade de thon, tomates, oeufs durs, olives et haricots verts',0,12,1);
INSERT INTO dish VALUES(3,0,'Steak Tartare','Steak de boeuf haché cru assaisonné avec des herbes et des épices, servi avec des frites et une salade',0,23,1);
INSERT INTO dish VALUES(4,0,'Salade de Chèvre Chaud','Salade verte avec des toasts de fromage de chèvre chaud et du miel',0,9,1);
INSERT INTO dish VALUES(5,0,'Quiche Lorraine','Tarte salée avec du bacon, de la crème et du fromage',0,8,1);
INSERT INTO dish VALUES(6,1,'Crème Brûlée','Dessert classique de crème cuite à la vanille avec une croûte caramélisée',1,6,1);
INSERT INTO dish VALUES(7,0,'Soupe à l''Oignon','Soupe de bouillon de boeuf gratinée avec des oignons et du fromage',0,7,1);
INSERT INTO dish VALUES(8,0,'Crêpes au Jambon et au Fromage','Crêpes garnies de jambon et de fromage, servies avec une salade',0,10,1);
INSERT INTO dish VALUES(9,0,'Coq au Vin','Poulet mijoté avec du vin rouge, des champignons et des oignons, servi avec des pommes de terre',1,16,1);
INSERT INTO dish VALUES(10,1,'Plateau de Fromages','Assortiment de fromages français avec des noix et de la confiture',0,19,1);
INSERT INTO dish VALUES(11,0,'Ratatouille','Ragoût de légumes du sud de la France, servi avec du riz',0,11,1);
INSERT INTO dish VALUES(12,1,'Tarte Tatin','Tarte aux pommes caramélisées renversée',1,7,1);
INSERT INTO dish VALUES(13,0,'Croque-Monsieur','Sandwich chaud avec du jambon, du fromage et de la béchamel',0,9,1);
CREATE TABLE staff (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    telephone TEXT NOT NULL,
    password TEXT NOT NULL,
    status TEXT,
    position TEXT,
    role TEXT NOT NULL
);
INSERT INTO staff VALUES(1,'Christodule Garcia','Christodudule21@gmail.com','0643270005','viwozawone',NULL,NULL,'chef');
INSERT INTO staff VALUES(2,'Lothaire Carpentier','leloth91@gmail.com','0622240729','hanukivaza','available',NULL,'deliverer');
INSERT INTO staff VALUES(3,'Fulbert Picard','fufulbair75@hotmail.fr','0600337693','povojuvoro','delivering',NULL,'deliverer');
INSERT INTO staff VALUES(4,'Philomène Arnaud','philomene.arnaud88@yahoo.fr','0654646727','ganobifebo','delivering',NULL,'deliverer');
INSERT INTO staff VALUES(5,'Georges Duval','george.duval@gmail.com','0699590825','wominoroxa','replenishing',NULL,'deliverer');
DELETE FROM sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('staff',5);
INSERT INTO sqlite_sequence VALUES('dish',13);
INSERT INTO sqlite_sequence VALUES('dish_stock',48);
INSERT INTO sqlite_sequence VALUES('address',19);
INSERT INTO sqlite_sequence VALUES('customer',11);
INSERT INTO sqlite_sequence VALUES('order',19);
INSERT INTO sqlite_sequence VALUES('order_item',39);
CREATE INDEX idx_order_order_number ON `order` (order_number);
COMMIT;
