CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    telephone TEXT NOT NULL,
    address_id INTEGER,
    FOREIGN KEY (address_id) REFERENCES address (id)
);

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

CREATE TABLE dish_stock (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dish_id INTEGER NOT NULL,
    staff_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    FOREIGN KEY (dish_id) REFERENCES dish (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (staff_id) REFERENCES staff (id) ON DELETE CASCADE ON UPDATE CASCADE
);

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

CREATE INDEX idx_order_order_number ON `order` (order_number);

PRAGMA foreign_keys = ON;
INSERT INTO staff (name, email, telephone, password, status, position, role) VALUES
    ('Christodule Garcia', 'Christodudule21@gmail.com', '0643270005', 'viwozawone', NULL, NULL, 'chef'),
    ('Lothaire Carpentier', 'leloth91@gmail.com', '0622240729', 'hanukivaza', 'available', NULL, 'deliverer'),
    ('Fulbert Picard', 'fufulbair75@hotmail.fr', '0600337693', 'povojuvoro', 'delivering', NULL, 'deliverer'),
    ('Philomène Arnaud', 'philomene.arnaud88@yahoo.fr', '0654646727', 'ganobifebo', 'delivering', NULL, 'deliverer'),
    ('Georges Duval', 'george.duval@gmail.com', '0699590825', 'wominoroxa', 'replenishing', NULL, 'deliverer');
INSERT INTO dish (name, category, description, enabled, price, created_by_id) VALUES
    ('Boeuf Bourguignon', 0 , 'Ragoût de boeuf mijoté avec des légumes, des champignons et du vin rouge', 1, 18, 1),
    ('Salade Niçoise', 0, 'Salade de thon, tomates, oeufs durs, olives et haricots verts', 0, 12, 1),
    ('Steak Tartare', 0, 'Steak de boeuf haché cru assaisonné avec des herbes et des épices, servi avec des frites et une salade', 0, 23, 1),
    ('Salade de Chèvre Chaud', 0, 'Salade verte avec des toasts de fromage de chèvre chaud et du miel', 0, 9, 1),
    ('Quiche Lorraine', 0, 'Tarte salée avec du bacon, de la crème et du fromage', 0, 8, 1),
    ('Crème Brûlée', 1, 'Dessert classique de crème cuite à la vanille avec une croûte caramélisée', 1, 6, 1),
    ("Soupe à l'Oignon", 0, 'Soupe de bouillon de boeuf gratinée avec des oignons et du fromage', 0, 7, 1),
    ('Crêpes au Jambon et au Fromage', 0, 'Crêpes garnies de jambon et de fromage, servies avec une salade', 0, 10, 1),
    ('Coq au Vin', 0, 'Poulet mijoté avec du vin rouge, des champignons et des oignons, servi avec des pommes de terre', 1, 16, 1),
    ('Plateau de Fromages', 1, 'Assortiment de fromages français avec des noix et de la confiture', 0, 19, 1),
    ('Ratatouille', 0, 'Ragoût de légumes du sud de la France, servi avec du riz', 0, 11, 1),
    ('Tarte Tatin', 1, 'Tarte aux pommes caramélisées renversée', 1, 7, 1),
    ('Croque-Monsieur', 0, 'Sandwich chaud avec du jambon, du fromage et de la béchamel', 0, 9, 1);
INSERT INTO dish_stock (dish_id, staff_id, quantity) VALUES
    (1, 1, 5),
    (2, 2, 2),
    (3, 1, 3),
    (4, 1, 4),
    (5, 1, 6),
    (6, 1, 8),
    (7, 2, 2),
    (8, 2, 3),
    (9, 1, 4),
    (10, 1, 2),
    (11, 2, 1),
    (12, 1, 7),
    (1, 2, 4),
    (2, 3, 3),
    (3, 3, 1),
    (4, 2, 2),
    (5, 3, 5),
    (6, 2, 6),
    (7, 3, 3),
    (8, 3, 1),
    (9, 2, 5),
    (10, 3, 2),
    (11, 2, 3),
    (12, 3, 4),
    (1, 4, 6),
    (2, 4, 1),
    (3, 4, 5),
    (4, 4, 2),
    (5, 4, 8),
    (6, 4, 2),
    (7, 4, 4),
    (8, 4, 5),
    (9, 4, 3),
    (10, 4, 4),
    (11, 4, 2),
    (12, 4, 1),
    (1, 5, 7),
    (2, 5, 3),
    (3, 5, 2),
    (4, 5, 4),
    (5, 5, 1),
    (6, 5, 5),
    (7, 5, 6),
    (8, 5, 1),
    (9, 5, 7),
    (10, 5, 3),
    (11, 5, 2),
    (12, 5, 5);
INSERT INTO address (number, street, city, zipcode, country) VALUES
    (123, 'Rue de la Paix', 'Paris', 75001, 'France'),
    (1, 'Avenue des Champs-Élysées', 'Paris', 75008, 'France'),
    (26, 'Rue du Faubourg Saint-Honoré', 'Paris', 75008, 'France'),
    (43, 'Boulevard Saint-Germain', 'Paris', 75006, 'France'),
    (51, 'Rue de Rivoli', 'Paris', 75001, 'France'),
    (17, 'Place de la Concorde', 'Paris', 75008, 'France'),
    (21, 'Rue de la Roquette', 'Paris', 75011, 'France'),
    (42, 'Boulevard Haussmann', 'Paris', 75008, 'France'),
    (12, 'Rue de Vaugirard', 'Paris', 75015, 'France'),
    (7, 'Rue Saint-Antoine', 'Paris', 75004, 'France'),
    (13, 'Rue du Temple', 'Paris', 75004, 'France'),
    (18, 'Rue du Faubourg Poissonnière', 'Paris', 75010, 'France'),
    (9, 'Rue des Petits Champs', 'Paris', 75001, 'France'),
    (8, 'Rue du Cherche-Midi', 'Paris', 75006, 'France'),
    (75, 'Avenue des Ternes', 'Paris', 75017, 'France'),
    (35, 'Rue du Faubourg Saint-Antoine', 'Paris', 75011, 'France'),
    (130, 'Rue de la Convention', 'Paris', 75015, 'France'),
    (69, 'Rue de la Roquette', 'Paris', 75011, 'France'),
    (51, 'Rue Saint-Honoré', 'Paris', 75001, 'France');
INSERT INTO customer (name, email, telephone, address_id) VALUES
    ('Aurélie Martin', 'aurelie.martin@example.com', '0695481573', 1),
    ('Benoît Dubois', 'benoit.dubois@example.com', '0664475669', 2),
    ('Chloé Girard', 'chloe.girard@example.com', '0672051019', 3),
    ('David Moreau', 'david.moreau@example.com', '0626148193', 4),
    ('Céline Durand', 'celine.durand@example.com', '0630523742', 5),
    ('Julien Leroy', 'julien.leroy@example.com', '0684635836', 6),
    ('Léa Dumont', 'lea.dumont@example.com', '0675855190', 7),
    ('Maxime Rousseau', 'maxime.rousseau@example.com', '0679161824', 8),
    ('Emma Dubois', 'emma.dubois@example.com', '0688569497', 9),
    ('Lucas Fournier', 'lucas.fournier@example.com', '0693594310', 10),
    ('Amélie Girard', 'amelie.girard@example.com', '0643270005', 11);
UPDATE address
SET customer_id = customer.id
FROM customer
WHERE address.id = customer.address_id;
INSERT INTO `order` (order_number, address_id, delivered_by_id, created_at, updated_at, status, telephone, amount) VALUES
    ('23F-475664', 1, NULL, '2022-01-01 10:00:00', '2022-01-01 10:00:00', 'pending', '0674651353', 9),
    ('23F-485830', 2, 4, '2022-01-02 11:00:00', '2022-01-02 11:00:00', 'in progress', NULL, 45),
    ('23F-766060', 3, 3, '2022-01-03 12:00:00', '2022-01-03 12:00:00', 'delivered', NULL, 34),
    ('23F-495177', 4, NULL, '2022-01-04 13:00:00', '2022-01-04 13:00:00', 'cancelled', '0615530587', 12),
    ('23F-216137', 5, 2, '2022-01-05 14:00:00', '2022-01-05 14:00:00', 'in progress', NULL, 23),
    ('23F-865661', 6, 3, '2022-01-06 15:00:00', '2022-01-06 15:00:00', 'delivered', NULL, 42),
    ('23F-493851', 7, 3, '2022-01-07 16:00:00', '2022-01-07 16:00:00', 'in progress', NULL, 22),
    ('23F-681393', 8, NULL, '2022-01-08 17:00:00', '2022-01-08 17:00:00', 'pending', NULL, 31),
    ('23F-177240', 9, NULL, '2022-01-09 18:00:00', '2022-01-09 18:00:00', 'cancelled', '0640117608', 17),
    ('23F-320248', 10, 5, '2022-01-10 19:00:00', '2022-01-10 19:00:00', 'delivered', NULL, 24),
    ('23F-327138', 2, 2, '2022-01-11 20:00:00', '2022-01-11 20:00:00', 'in progress', NULL, 28),
    ('23F-485992', 7, 2, '2022-01-07 16:00:00', '2022-01-07 16:00:00', 'delivered', NULL, 33),
    ('23F-516293', 8, NULL, '2022-01-08 17:00:00', '2022-01-08 17:00:00', 'pending', '0644240316', 36),
    ('23F-777863', 9, 4, '2022-01-09 18:00:00', '2022-01-09 18:00:00', 'in progress', NULL, 36),
    ('23F-273275', 10, NULL, '2022-01-10 19:00:00', '2022-01-10 19:00:00', 'cancelled', NULL, 19),
    ('23F-857948', 11, 4, '2022-01-11 20:00:00', '2022-01-11 20:00:00', 'in progress', NULL, 11),
    ('23F-889180', 12, 4, '2022-01-12 21:00:00', '2022-01-12 21:00:00', 'delivered', NULL, 25),
    ('23F-378550', 13, 5, '2022-01-13 22:00:00', '2022-01-13 22:00:00', 'delivered', NULL, 22),
    ('23F-181796', 14, NULL, '2022-01-14 23:00:00', '2022-01-14 23:00:00', 'pending', '0671355404', 41);
INSERT INTO order_item (dish_stock_id, quantity, total_amount, order_id, delivered_by_id) VALUES
    (1, 2, 30, 1, 3),
    (2, 1, 12, 2, 3),
    (3, 3, 54, 3, 3),
    (4, 2, 20, 4, 3),
    (1, 1, 15, 1, 3),
    (3, 2, 36, 3, 3),
    (2, 2, 30, 2, 1),
    (4, 1, 23, 4, 1),
    (5, 3, 33, 5, 2),
    (7, 2, 20, 7, 2),
    (10, 1, 12, 10, 3),
    (12, 2, 18, 12, 3),
    (1, 1, 15, 13, 3),
    (2, 2, 30, 14, 3),
    (3, 3, 54, 1, 3),
    (4, 2, 20, 2, 3),
    (5, 1, 11, 3, 2),
    (6, 2, 20, 4, 2),
    (7, 3, 30, 5, 2),
    (8, 2, 16, 6, 2),
    (9, 1, 9, 7, 1),
    (10, 2, 18, 8, 1),
    (11, 3, 27, 9, 1),
    (12, 2, 18, 10, 1),
    (1, 1, 15, 11, 3),
    (2, 2, 30, 12, 3),
    (3, 3, 54, 13, 3),
    (4, 2, 20, 14, 3),
    (5, 1, 11, 1, 2),
    (6, 2, 20, 2, 2),
    (7, 3, 30, 3, 2),
    (8, 2, 16, 4, 2),
    (9, 1, 9, 5, 1),
    (10, 2, 18, 6, 1),
    (11, 3, 27, 7, 1),
    (12, 2, 18, 8, 1),
    (1, 1, 15, 9, 3),
    (2, 2, 30, 10, 3),
    (9, 4, 64, 11, 3);
