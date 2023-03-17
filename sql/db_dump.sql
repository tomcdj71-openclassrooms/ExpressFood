-- drop the tables if they exist
DROP TABLE IF EXISTS `order_item`;
DROP TABLE IF EXISTS `dish_stock`;
DROP TABLE IF EXISTS `dish`;
DROP TABLE IF EXISTS `customer_order`;
DROP TABLE IF EXISTS `employee`;
DROP TABLE IF EXISTS `user`;

-- create the `ùser` table
CREATE TABLE IF NOT EXISTS `user` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    tel VARCHAR(255) NOT NULL,
    addressNumber VARCHAR(255) NOT NULL,
    addressLine1 VARCHAR(255) NOT NULL,
    addressLine2 VARCHAR(255) NULL,
    city VARCHAR(255) NOT NULL,
    zipCode VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

-- create the `employee` table
CREATE TABLE IF NOT EXISTS `employee` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(255) NOT NULL,
    status VARCHAR(255) NULL,
    tel VARCHAR(255) NOT NULL,
    addressNumber VARCHAR(255) NOT NULL,
    addressLine1 VARCHAR(255) NOT NULL,
    addressLine2 VARCHAR(255) NULL,
    city VARCHAR(255) NOT NULL,
    zipCode VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL
);

-- create the `customer_order` table
CREATE TABLE IF NOT EXISTS `customer_order` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    orderNumber INTEGER,
    status VARCHAR(255) NOT NULL,
    created_at VARCHAR(255) NOT NULL,
    updated_at  VARCHAR(255) NOT NULL,
    totalAmount INTEGER NOT NULL,
    deliverer_id INTEGER,
    customer_id INTEGER NULL,
    firstName VARCHAR(255) NULL,
    lastName VARCHAR(255) NULL,
    tel VARCHAR(255) NULL,
    addressNumber VARCHAR(255) NULL,
    addressLine1 VARCHAR(255) NULL,
    addressLine2 VARCHAR(255) NULL,
    city VARCHAR(255) NULL,
    zipCode VARCHAR(255) NULL,
    country VARCHAR(255) NULL,
    FOREIGN KEY(deliverer_id) REFERENCES employee(id),
    FOREIGN KEY(customer_id) REFERENCES user(id)
);

-- create the `dish` table
CREATE TABLE IF NOT EXISTS `dish` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    name VARCHAR(255) NOT NULL,
    description VARCHAR(255) NOT NULL,
    enabled BOOLEAN NOT NULL,
    price INTEGER NOT NULL,
    lastEdited  VARCHAR(255) NOT NULL,
    chef_id INTEGER NOT NULL,
    FOREIGN KEY(chef_id) REFERENCES employee(id)
);

-- create the `dish_stock` table
CREATE TABLE IF NOT EXISTS `dish_stock` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    quantity INTEGER NOT NULL,
    deliverer_id INTEGER NOT NULL,
    dish_id INTEGER NOT NULL,
    FOREIGN KEY(deliverer_id) REFERENCES employee(id),
    FOREIGN KEY(dish_id) REFERENCES dish(id)
);

-- create the `order_item` table
CREATE TABLE IF NOT EXISTS `order_item` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    quantity INTEGER NOT NULL,
    unitPrice FLOAT NOT NULL,
    vat FLOAT NOT NULL,
    order_id INTEGER NOT NULL,
    dish_id INTEGER NOT NULL,
    FOREIGN KEY(order_id) REFERENCES customer_order(id),
    FOREIGN KEY(dish_id) REFERENCES dish(id)
);

-- create the indexes for the tables
CREATE INDEX IF NOT EXISTS `idx_user_email` ON user(email);
CREATE INDEX IF NOT EXISTS `idx_customer_order_customerId` ON customer_order(customer_id);
CREATE INDEX IF NOT EXISTS `idx_order_item_orderId` ON order_item(order_id);
CREATE INDEX IF NOT EXISTS `idx_employee_role` ON employee(role);
CREATE INDEX IF NOT EXISTS `idx_name` ON dish(name);

-- insert the data into the tables
PRAGMA foreign_keys = ON;
INSERT INTO user (firstName, lastName, email, password, tel, addressNumber, addressLine1, addressLine2, zipCode, city, country) VALUES
    ("Arabelle", "Robert", "Arabelle56@hotmail.fr", "dejejobisexahahigiro", "0632828535", "7044", "Rue Saint-Honoré", "4 étage", "75003", "Paris", "France"),
    ("Guyot", "Gerard", "Guyot.Gerard77@gmail.com", "lomovekimakitohavuge", "0665941465", "7999", "Place des Saussaies", "", "75016", "Paris", "France"),
    ("Maugis", "Picard", "Maugis.Picard67@yahoo.fr", "kuhevudikinatevovami", "0638014642", "064", "Impasse La Boétie", "", "75004", "Paris", "France"),
    ("Aimé", "Gautier", "Aim.Gautier19@yahoo.fr", "futuqoyokekalidogoja", "0616039008", "130", "Voie de l'Odéon", "", "75010", "Paris", "France"),
    ("Aphélie", "Breton", "Aphlie.Breton@yahoo.fr", "fejonoqigafacuqorabi", "0681306085", "3", "Impasse Oberkampf", "Apt. 969", "75017", "Paris", "France"),
    ("Jehanne", "Lefevre", "Jehanne_Lefevre@gmail.com", "kohudegisiwugugixete", "0677164171", "8673", "Quai Bonaparte", "", "75011", "Paris", "France"),
    ("Théodora", "Laine", "Thodora_Laine61@hotmail.fr", "lojazihubuxehimurega", "0650074907", "25", "Allée de la Ferronnerie", "", "75005", "Paris", "France"),
    ("Pascal", "Masson", "Pascal_Masson@hotmail.fr", "lusidakufeketijadoxe", "0612706944", "4", "Quai Marcadet", "", "75011", "Paris", "France"),
    ("Adalbald", "Blanchard", "Adalbald1@hotmail.fr", "bawovovijejowovoyuwu", "0623817236", "0", "Quai Marcadet", "", "75010", "Paris", "France"),
    ("Jeanne d’Arc", "Poirier", "JeannedArc_Poirier@hotmail.fr", "vulatuzahuqisogemopo", "0679098612", "50", "Rue Vaneau", "", "75012", "Paris", "France"),
    ("Arsinoé", "Noel", "Arsino_Noel51@hotmail.fr", "gegayemuqevulamohuwo", "0622497315", "221", "Passage Saint-Dominique", "9 étage", "75000", "Paris", "France"),
    ("Amédée", "Leroy", "Amde.Leroy@yahoo.fr", "sojeviqelefexomepuli", "0645552996", "71", "Boulevard Dauphine", "", "75012", "Paris", "France"),
    ("Gustavine", "Guillaume", "Gustavine.Guillaume69@yahoo.fr", "pefomesofumuyalejiti", "0695847989", "81", "Avenue Laffitte", "6 étage", "75005", "Paris", "France"),
    ("Astarté", "Julien", "Astart20@yahoo.fr", "vodoyepebayomaciniye", "0681829803", "4214", "Rue Montorgueil", "8 étage", "75016", "Paris", "France"),
    ("Gabriel", "Jean", "Gabriel.Jean@yahoo.fr", "famepofevavasifevevo", "0621246031", "20", "Boulevard La Boétie", "4 étage", "75014", "Paris", "France"),
    ("Brigitte", "Francois", "Brigitte_Francois@hotmail.fr", "tuqorijuwusemunalivi", "0677777784", "5", "Passage de Presbourg", "Apt. 829", "75018", "Paris", "France"),
    ("Roch", "Pierre", "Roch33@yahoo.fr", "wirilokukigicupoqoji", "0620215847", "63", "Avenue Delesseux", "Apt. 261", "75008", "Paris", "France"),
    ("Armande", "Jean", "Armande.Jean@yahoo.fr", "kagawamurobutedekobi", "0657630078", "166", "Place Royale", "9 étage", "75019", "Paris", "France"),
    ("Sibylle", "Rodriguez", "Sibylle.Rodriguez79@gmail.com", "xeqigageharolekemuxi", "0632217336", "194", "Impasse des Rosiers", "Apt. 252", "75011", "Paris", "France"),
    ("Arsènie", "Morin", "Arsnie_Morin64@yahoo.fr", "vepamicuxizipaloyuto", "0694660862", "4", "Voie de Montmorency", "2 étage", "75014", "Paris", "France"),
    ("Edmée", "Meyer", "Edme_Meyer@gmail.com", "qojaxasubinavedarexo", "0673457841", "985", "Boulevard Adolphe Mille", "", "75014", "Paris", "France"),
    ("Clémentine", "Perez", "Clmentine.Perez@hotmail.fr", "bumoqidexocomadipece", "0659610417", "575", "Avenue Lepic", "1 étage", "75009", "Paris", "France"),
    ("Quentin", "Perrot", "Quentin_Perrot31@gmail.com", "jiqodaqoduhiwawaxepe", "0695196653", "88", "Quai Dauphine", "", "75011", "Paris", "France"),
    ("Arnaude", "Gauthier", "Arnaude28@yahoo.fr", "cuqubenolonayesixuda", "0632557768", "82", "Avenue Saint-Bernard", "Apt. 205", "75018", "Paris", "France"),
    ("Christodule", "Boyer", "Christodule94@yahoo.fr", "yirasajoqesumubinifa", "0645431509", "24", "Boulevard de Seine", "", "75019", "Paris", "France");
INSERT INTO employee (firstName, lastName, email, password, tel, addressNumber, addressLine1, addressLine2, zipCode, city, country, status, role) VALUES
    ("Melchior", "Robert", "Melchior22@hotmail.fr", "ranatiheguhavadalika", "0689127215", "1", "Voie du Bac", "Apt. 181", "75017", "Paris", "France", "unavailable", "deliverer"),
    ("Ariel", "Lacroix", "Ariel81@yahoo.fr", "feqaloyenayuxorofolu", "0669145037", "3198", "Boulevard Pierre Charron", "9 étage", "75007", "Paris", "France", "delivering", "deliverer"),
    ("Alix", "Rodriguez", "Alix_Rodriguez@gmail.com", "yufomecabuxugabecoqu", "0600302191", "90", "Quai Saint-Jacques", "", "75013", "Paris", "France", "delivering", "deliverer"),
    ("Acacie", "Simon", "Acacie19@hotmail.fr", "huyavecivohevodaluju", "0609150975", "274", "Rue de Vaugirard", "", "75012", "Paris", "France", "available", "deliverer"),
    ("Mathilde", "Mathieu", "Mathilde.Mathieu@gmail.com", "xocusahetopelilekera", "0635725427", "2657", "Boulevard de la Harpe", "", "75007", "Paris", "France", "available", "deliverer"),
    ("Yoann", "Perrot", "Yoann20@gmail.com", "veduboqahokifibuqove", "0666605120", "83", "Voie Delesseux", "", "75003", "Paris", "France", "unavailable", "deliverer");
INSERT INTO dish (name, description, price, enabled, lastEdited, chef_id) VALUES
    ("Moderne Coton Chaussures", "Bicyclette à 1 vitesse, pneus 1/2 ballon. Cadre de 52cm. Jantes chromées. Roue Hore.  Moyeux indéréglables. 2 freins sur jantes. Guidon trials. Garde-boue et couvre chaine en acier émaillé. Porte-bagages. Gardejupes. Pédales à blocs caoutchouc. Émail couleur. Selle route cuir. Sacoche avec outillage. Pompe de cadre. Timbre avertisseur.", 35.00, "false", "Wed Mar 08 2023 15:12:29 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Sur mesure Frais Souris", "Carrosserie en tôle d'acier laqué blanc montée sur roues pour faciliter le déplacement, couvercle laqué blanc, dessus et cuve en métal émaille marron, inaltérable a l'eau de lessive et a la chaleur,", 51.00, "true", "Tue Mar 07 2023 01:43:42 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Moderne Caoutchouc Ordinateur", "Montre-bracelet, dite “d'Aviateur”, métal inaltérable, diam. 435ym. Mouvement de précision chronographe, cadran avec grande aiguille trotteuse, permettant la lecture 1/25de seconde.", 24.00, "false", "Mon Mar 06 2023 12:51:52 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Licencié Granit Poulet", "Cadre raccord brasé de 53 ou 58 %. Jantes en acier émaillées. Pneus “Hiron” 700 x 35, garantis 12 mois. Pignon roue libre à emboitement hexagonal. Frein “Hirondelle” sur jante arrière. Garde-boue métal.", 54.00, "true", "Sat Mar 11 2023 15:45:10 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Licencié Plastique Frites", "Petite griffe à sarcler. 5 dents en acier, largeur 8 cm. poignée estampée, longueur 26 cm. poids 150 gr. Pour ameublir le sol, arracher les herbes entre les plantes ou fleurs cultivées en lignes rapprochées.", 64.00, "false", "Fri Mar 10 2023 14:41:51 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Magnifique Béton Chaise", "Bicyclette à 1 vitesse, pneus 1/2 ballon. Cadre de 52cm. Jantes chromées. Roue Hore.  Moyeux indéréglables. 2 freins sur jantes. Guidon trials. Garde-boue et couvre chaine en acier émaillé. Porte-bagages. Gardejupes. Pédales à blocs caoutchouc. Émail couleur. Selle route cuir. Sacoche avec outillage. Pompe de cadre. Timbre avertisseur.", 24.00, "true", "Fri Mar 03 2023 20:12:52 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Sur mesure Métal Pizza", "Lanterne cuivre fort, finement nickelé, chute d'eau réglable, suspension antivibratrice, projecteur diamètre cm2, avec verre bombé. Durée d'éclairage 3 heures. Poids 395 grammes.", 64.00, "true", "Mon Mar 06 2023 10:44:08 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Élégant Bois Savon", "Carrosserie en tôle d'acier laqué blanc montée sur roues pour faciliter le déplacement, couvercle laqué blanc, dessus et cuve en métal émaille marron, inaltérable a l'eau de lessive et a la chaleur,", 30.00, "false", "Fri Mar 03 2023 10:37:34 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Sans marque Acier Poulet", "Lanterne cuivre fort, finement nickelé, chute d'eau réglable, suspension antivibratrice, projecteur diamètre cm2, avec verre bombé. Durée d'éclairage 3 heures. Poids 395 grammes.", 52.00, "true", "Tue Mar 07 2023 15:54:46 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Générique Métal Vélo", "Moteur Villiers. Puissance au frein : 7 HP, 3 vitesses, lancement au pied, éclairage électrique, carrosserie 2 places, coffre à outils, outillage complet, capote et pare-brise.", 25.00, "false", "Tue Mar 07 2023 12:51:24 GMT+0100 (heure normale d’Europe centrale)", 1);
INSERT INTO dish_stock (quantity, dish_id, deliverer_id) VALUES
    (2, 5, 3),
    (6, 8, 3),
    (2, 4, 3),
    (2, 1, 4),
    (1, 1, 3),
    (6, 5, 5),
    (5, 8, 2),
    (5, 10, 3),
    (9, 8, 3),
    (4, 4, 5),
    (6, 9, 3),
    (1, 6, 5),
    (4, 2, 3),
    (9, 5, 3),
    (1, 4, 4),
    (5, 5, 2),
    (7, 9, 5),
    (1, 7, 5),
    (5, 1, 4),
    (5, 9, 2),
    (1, 7, 6),
    (4, 6, 5),
    (6, 4, 6),
    (7, 2, 6),
    (8, 7, 2),
    (7, 5, 2),
    (6, 5, 2),
    (6, 2, 2),
    (8, 4, 2),
    (8, 2, 2);
INSERT INTO customer_order (orderNumber, status, created_at, updated_at, deliverer_id, customer_id, totalAmount, addressNumber, addressLine1, addressLine2, zipCode, city, country, firstName, lastName, tel) VALUES
    ("893831117", "canceled", "Fri Mar 10 2023 04:40:40 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 10 2023 05:17:12 GMT+0100 (heure normale d’Europe centrale)", 2, 8, "34.00", "889", "Boulevard de Caumartin", "7 étage", "75005", "Paris", "France", "null", "null", "null"),
    ("180121098", "delivered", "Fri Mar 03 2023 00:48:01 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 01:02:28 GMT+0100 (heure normale d’Europe centrale)", 2, 1, "29.00", "955", "Place des Saussaies", "", "75005", "Paris", "France", "Eulalie", "Lacroix", "0698287422"),
    ("687849860", "delivered", "Mon Mar 06 2023 04:25:00 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 06 2023 05:11:48 GMT+0100 (heure normale d’Europe centrale)", 4, 24, "15.00", "808", "Passage du Chat-qui-Pêche", "", "75000", "Paris", "France", "null", "null", "null"),
    ("277267268", "delivered", "Sun Mar 12 2023 03:02:19 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 12 2023 03:19:45 GMT+0100 (heure normale d’Europe centrale)", 4, 1, "46.00", "9", "Allée du Faubourg-Saint-Denis", "", "75014", "Paris", "France", "René", "Charpentier", "0616913929"),
    ("082847597", "delivered", "Thu Mar 02 2023 21:26:11 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 02 2023 22:20:02 GMT+0100 (heure normale d’Europe centrale)", 4, 24, "20.00", "458", "Allée du Faubourg-Saint-Denis", "Apt. 585", "75008", "Paris", "France", "Clément", "Olivier", "0649005873"),
    ("131698262", "delivered", "Sun Mar 12 2023 01:20:14 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 12 2023 02:06:38 GMT+0100 (heure normale d’Europe centrale)", 2, 9, "25.00", "076", "Avenue de la Ferronnerie", "", "75020", "Paris", "France", "null", "null", "null"),
    ("493951158", "delivered", "Fri Mar 03 2023 14:00:40 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 14:10:16 GMT+0100 (heure normale d’Europe centrale)", 5, 8, "45.00", "67", "Avenue Adolphe Mille", "", "75018", "Paris", "France", "null", "null", "null"),
    ("271976351", "delivered", "Sun Mar 05 2023 16:43:44 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 17:43:01 GMT+0100 (heure normale d’Europe centrale)", 3, 4, "59.00", "96", "Avenue de la Huchette", "", "75014", "Paris", "France", "null", "null", "null"),
    ("511970575", "canceled", "Thu Mar 09 2023 11:33:01 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 09 2023 11:35:42 GMT+0100 (heure normale d’Europe centrale)", 5, 6, "33.00", "4", "Avenue de la Huchette", "Apt. 495", "75009", "Paris", "France", "null", "null", "null"),
    ("912977409", "delivered", "Tue Mar 07 2023 23:41:24 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 23:41:58 GMT+0100 (heure normale d’Europe centrale)", 3, 22, "39.00", "3958", "Place de Rivoli", "", "75005", "Paris", "France", "Laurent", "Marchal", "0644721547"),
    ("861991918", "delivered", "Fri Mar 03 2023 17:47:17 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 17:55:56 GMT+0100 (heure normale d’Europe centrale)", 2, 1, "39.00", "477", "Allée Adolphe Mille", "", "75009", "Paris", "France", "Aimable", "Caron", "0605988992"),
    ("915058803", "pending", "Sun Mar 05 2023 20:04:17 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 20:57:19 GMT+0100 (heure normale d’Europe centrale)", 3, 2, "58.00", "90", "Boulevard du Chat-qui-Pêche", "5 étage", "75017", "Paris", "France", "Mélanie", "Breton", "0668358597"),
    ("974259162", "delivered", "Sat Mar 04 2023 08:59:01 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 04 2023 08:59:20 GMT+0100 (heure normale d’Europe centrale)", 4, 17, "15.00", "390", "Boulevard du Dahomey", "", "75014", "Paris", "France", "null", "null", "null"),
    ("474623924", "pending", "Tue Mar 14 2023 21:57:27 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 14 2023 22:31:46 GMT+0100 (heure normale d’Europe centrale)", 5, 24, "65.00", "9", "Rue Lepic", "Apt. 234", "75009", "Paris", "France", "Catherine", "Meyer", "0604503920"),
    ("540868414", "canceled", "Wed Mar 15 2023 19:09:59 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 15 2023 19:30:42 GMT+0100 (heure normale d’Europe centrale)", 3, 17, "57.00", "1", "Allée Bonaparte", "Apt. 627", "75011", "Paris", "France", "null", "null", "null"),
    ("905630435", "delivered", "Mon Mar 06 2023 23:56:36 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 00:21:21 GMT+0100 (heure normale d’Europe centrale)", 5, 14, "13.00", "0", "Place Joubert", "", "75012", "Paris", "France", "null", "null", "null"),
    ("803441824", "delivered", "Thu Mar 09 2023 05:09:44 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 09 2023 05:45:03 GMT+0100 (heure normale d’Europe centrale)", 4, 25, "50.00", "76", "Place de la Paix", "Apt. 794", "75001", "Paris", "France", "null", "null", "null"),
    ("728961257", "pending", "Sat Mar 11 2023 15:01:54 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 11 2023 15:52:26 GMT+0100 (heure normale d’Europe centrale)", 4, 14, "53.00", "595", "Avenue de Solférino", "Apt. 417", "75017", "Paris", "France", "null", "null", "null"),
    ("640956163", "delivered", "Sun Mar 05 2023 14:37:14 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 15:30:06 GMT+0100 (heure normale d’Europe centrale)", 2, 17, "23.00", "832", "Boulevard de Rivoli", "", "75000", "Paris", "France", "Ariane", "Morel", "0625808215"),
    ("288518504", "delivered", "Tue Mar 07 2023 04:52:32 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 05:46:33 GMT+0100 (heure normale d’Europe centrale)", 5, 2, "21.00", "21", "Place des Lombards", "", "75003", "Paris", "France", "Colin", "Guillaume", "0678625451"),
    ("178411520", "delivered", "Sat Mar 04 2023 08:14:14 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 04 2023 08:17:39 GMT+0100 (heure normale d’Europe centrale)", 3, 14, "56.00", "57", "Quai Pastourelle", "9 étage", "75017", "Paris", "France", "Eustache", "Boyer", "0603956275"),
    ("523537461", "canceled", "Wed Mar 08 2023 00:25:43 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 00:49:19 GMT+0100 (heure normale d’Europe centrale)", 4, 4, "24.00", "5893", "Passage de la Paix", "0 étage", "75002", "Paris", "France", "Martine", "Guillaume", "0648703273"),
    ("412725536", "canceled", "Sat Mar 11 2023 21:49:47 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 11 2023 21:55:29 GMT+0100 (heure normale d’Europe centrale)", 4, 20, "21.00", "64", "Place d'Alésia", "9 étage", "75006", "Paris", "France", "null", "null", "null"),
    ("661361302", "canceled", "Tue Mar 14 2023 15:03:26 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 14 2023 15:56:05 GMT+0100 (heure normale d’Europe centrale)", 2, 1, "31.00", "526", "Allée de Presbourg", "Apt. 196", "75009", "Paris", "France", "null", "null", "null"),
    ("995320335", "delivered", "Fri Mar 10 2023 06:01:37 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 10 2023 07:00:46 GMT+0100 (heure normale d’Europe centrale)", 5, 1, "53.00", "6", "Allée Adolphe Mille", "", "75007", "Paris", "France", "null", "null", "null"),
    ("561011543", "canceled", "Mon Mar 13 2023 11:35:03 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 12:22:47 GMT+0100 (heure normale d’Europe centrale)", 3, 21, "39.00", "9", "Allée Vaneau", "", "75007", "Paris", "France", "Rebecca", "Paris", "0614999093"),
    ("883646252", "delivered", "Wed Mar 01 2023 10:11:43 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 01 2023 10:47:20 GMT+0100 (heure normale d’Europe centrale)", 4, 21, "46.00", "61", "Avenue Lepic", "", "75016", "Paris", "France", "Eugène", "Roger", "0617753353"),
    ("660608597", "pending", "Sat Mar 11 2023 10:23:40 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 11 2023 10:44:04 GMT+0100 (heure normale d’Europe centrale)", 5, 16, "26.00", "27", "Rue d'Assas", "Apt. 981", "75005", "Paris", "France", "Aimé", "Henry", "0698284289"),
    ("638907374", "canceled", "Tue Mar 07 2023 00:16:15 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 01:15:02 GMT+0100 (heure normale d’Europe centrale)", 2, 8, "41.00", "91", "Voie Monsieur-le-Prince", "Apt. 189", "75016", "Paris", "France", "null", "null", "null"),
    ("986106836", "pending", "Wed Mar 15 2023 13:11:23 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 15 2023 13:45:52 GMT+0100 (heure normale d’Europe centrale)", 3, 22, "57.00", "9974", "Boulevard du Bac", "", "75013", "Paris", "France", "null", "null", "null"),
    ("625967858", "delivered", "Sat Mar 04 2023 13:31:21 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 04 2023 14:26:31 GMT+0100 (heure normale d’Europe centrale)", 3, 22, "18.00", "0", "Voie Lepic", "Apt. 291", "75009", "Paris", "France", "null", "null", "null"),
    ("734077159", "pending", "Sun Mar 05 2023 17:36:47 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 18:35:54 GMT+0100 (heure normale d’Europe centrale)", 2, 7, "10.00", "99", "Place du Havre", "3 étage", "75015", "Paris", "France", "Vianney", "Baron", "0644075846"),
    ("949251637", "canceled", "Wed Mar 08 2023 16:07:03 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 16:55:42 GMT+0100 (heure normale d’Europe centrale)", 5, 12, "14.00", "8558", "Passage des Grands Augustins", "Apt. 616", "75007", "Paris", "France", "Venceslas", "Paris", "0654400383"),
    ("944322034", "pending", "Fri Mar 10 2023 07:13:03 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 10 2023 07:59:19 GMT+0100 (heure normale d’Europe centrale)", 3, 21, "31.00", "39", "Quai du Faubourg-Saint-Denis", "5 étage", "75015", "Paris", "France", "Odilon", "Martin", "0695709499"),
    ("274166582", "pending", "Thu Mar 09 2023 19:05:25 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 09 2023 19:50:26 GMT+0100 (heure normale d’Europe centrale)", 4, 21, "49.00", "87", "Allée Zadkine", "", "75002", "Paris", "France", "null", "null", "null");
INSERT INTO order_item (quantity, unitPrice, vat, order_id, dish_id) VALUES
    (5, 53.00, 5.5, 24, 4),
    (4, 17.00, 8.8, 16, 1),
    (6, 41.00, 20, 8, 1),
    (9, 56.00, 8.8, 6, 6),
    (8, 19.00, 20, 16, 2),
    (4, 31.00, 8.8, 17, 1),
    (7, 61.00, 5.5, 16, 6),
    (3, 52.00, 5.5, 28, 7),
    (1, 61.00, 20, 29, 10),
    (9, 62.00, 5.5, 34, 4),
    (9, 12.00, 20, 27, 7),
    (5, 42.00, 20, 23, 1),
    (8, 65.00, 20, 30, 1),
    (3, 50.00, 20, 21, 4),
    (2, 60.00, 20, 2, 8),
    (4, 23.00, 20, 25, 10),
    (9, 31.00, 8.8, 1, 2),
    (3, 20.00, 8.8, 23, 1),
    (2, 37.00, 20, 4, 5),
    (2, 32.00, 20, 34, 5),
    (2, 48.00, 5.5, 17, 10),
    (2, 43.00, 5.5, 23, 6),
    (9, 23.00, 20, 5, 9),
    (1, 12.00, 5.5, 27, 8),
    (2, 21.00, 20, 5, 4),
    (9, 52.00, 5.5, 26, 1),
    (9, 45.00, 20, 32, 9),
    (7, 58.00, 5.5, 5, 2),
    (9, 47.00, 8.8, 7, 3),
    (7, 38.00, 5.5, 28, 10),
    (9, 58.00, 20, 29, 2),
    (6, 21.00, 8.8, 10, 4),
    (8, 34.00, 5.5, 19, 6),
    (8, 36.00, 5.5, 16, 5),
    (3, 65.00, 8.8, 7, 2),
    (6, 52.00, 5.5, 15, 9),
    (2, 47.00, 20, 3, 5),
    (8, 51.00, 5.5, 10, 8),
    (2, 56.00, 20, 17, 2),
    (2, 61.00, 5.5, 3, 7),
    (4, 50.00, 8.8, 5, 7),
    (1, 34.00, 5.5, 14, 10),
    (2, 31.00, 8.8, 18, 10),
    (5, 43.00, 5.5, 14, 3),
    (9, 61.00, 20, 22, 7),
    (4, 27.00, 5.5, 2, 9),
    (8, 33.00, 20, 12, 6),
    (5, 47.00, 8.8, 13, 4),
    (8, 41.00, 8.8, 25, 1),
    (6, 16.00, 8.8, 1, 3),
    (8, 60.00, 8.8, 2, 2),
    (1, 25.00, 20, 31, 10),
    (3, 50.00, 5.5, 1, 3),
    (9, 24.00, 20, 27, 3),
    (9, 40.00, 8.8, 29, 9);