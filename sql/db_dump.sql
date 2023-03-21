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
    status INTEGER NULL,
    tel VARCHAR(255) NOT NULL
);

-- create the `customer_order` table
CREATE TABLE IF NOT EXISTS `customer_order` (
    id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    orderNumber INTEGER,
    status INTEGER NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at  DATETIME NOT NULL,
    totalAmount FLOAT NOT NULL,
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
    vat FLOAT NOT NULL,
    price FLOAT NOT NULL,
    lastEdited  DATETIME NOT NULL,
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
    ("Évrard", "Caron", "vrard_Caron29@gmail.com", "wilizedenewowesikeme", "0613191200", "31", "Rue de la Bûcherie", "", "75009", "Paris", "France"),
    ("Titien", "Moulin", "Titien_Moulin78@gmail.com", "kijihexajapitekejaju", "0615074081", "54", "Passage de Caumartin", "", "75010", "Paris", "France"),
    ("Rosalie", "Laurent", "Rosalie47@yahoo.fr", "gobuvodunacajeguseco", "0624431868", "62", "Voie des Lombards", "Apt. 135", "75012", "Paris", "France"),
    ("Yoann", "Berger", "Yoann_Berger14@hotmail.fr", "feyitonedasugogidonu", "0685163738", "706", "Rue de Tilsitt", "", "75017", "Paris", "France"),
    ("Raoul", "Perrot", "Raoul.Perrot@yahoo.fr", "kinikodecamimisunuwu", "0636807002", "4513", "Impasse Saint-Dominique", "Apt. 046", "75003", "Paris", "France"),
    ("Aaron", "Leroy", "Aaron_Leroy@yahoo.fr", "wabomiyewaguxejuduge", "0692745476", "27", "Place La Boétie", "", "75006", "Paris", "France"),
    ("Amandin", "Prevost", "Amandin.Prevost93@yahoo.fr", "hubuqapovabuwihuhaxi", "0690626103", "642", "Avenue de Montmorency", "2 étage", "75002", "Paris", "France"),
    ("Mélodie", "Deschamps", "Mlodie.Deschamps@yahoo.fr", "kogucuwapegazegejibi", "0645501974", "3795", "Avenue du Chat-qui-Pêche", "Apt. 204", "75006", "Paris", "France"),
    ("Gérard", "Blanchard", "Grard.Blanchard@yahoo.fr", "weqalidiximalopirojo", "0607855852", "0", "Impasse de la Huchette", "", "75003", "Paris", "France"),
    ("Odon", "Denis", "Odon.Denis34@gmail.com", "notonetupexemeluseta", "0625658779", "7", "Passage de Provence", "", "75018", "Paris", "France"),
    ("Aymard", "Mathieu", "Aymard.Mathieu24@hotmail.fr", "beyaziludeniwuhuguta", "0636247488", "71", "Boulevard de la Huchette", "", "75015", "Paris", "France"),
    ("Aloyse", "Guillaume", "Aloyse_Guillaume@hotmail.fr", "yexorifolunamotucusa", "0611596140", "613", "Avenue Saint-Séverin", "Apt. 744", "75003", "Paris", "France"),
    ("Normand", "Petit", "Normand_Petit@hotmail.fr", "vorosobakelegohohati", "0626183792", "4359", "Place de la Paix", "2 étage", "75010", "Paris", "France"),
    ("Claudien", "Renaud", "Claudien_Renaud@yahoo.fr", "rofubehupayataduwiza", "0645960696", "705", "Passage du Faubourg-Saint-Denis", "Apt. 717", "75010", "Paris", "France"),
    ("Théodore", "Bernard", "Thodore_Bernard11@hotmail.fr", "duzefoxuzepoyexuzoru", "0621743682", "93", "Avenue de la Pompe", "Apt. 642", "75012", "Paris", "France"),
    ("Brunehilde", "Mercier", "Brunehilde.Mercier@yahoo.fr", "bivobejatidoyadorete", "0699464667", "7", "Place de la Victoire", "", "75020", "Paris", "France"),
    ("Aleaume", "Da silva", "Aleaume.Dasilva95@yahoo.fr", "nifuyewaxipigurigeri", "0620456062", "0", "Rue Montorgueil", "0 étage", "75007", "Paris", "France"),
    ("Ascension", "Bourgeois", "Ascension.Bourgeois9@hotmail.fr", "mizogisodebiyixomeje", "0680906073", "32", "Rue Du Sommerard", "", "75017", "Paris", "France"),
    ("Geneviève", "Guillot", "Genevive.Guillot@hotmail.fr", "rajofasumiseyegojidu", "0685087432", "3361", "Avenue Vaneau", "", "75002", "Paris", "France"),
    ("Hardouin", "Legrand", "Hardouin_Legrand42@yahoo.fr", "nerenicosiverahefusu", "0645965249", "6763", "Boulevard du Faubourg-Saint-Denis", "", "75004", "Paris", "France"),
    ("Diane", "Nicolas", "Diane0@gmail.com", "pukicipegifotoqaxuya", "0600817564", "93", "Rue Dauphine", "", "75001", "Paris", "France"),
    ("Sandrine", "Nicolas", "Sandrine90@hotmail.fr", "fejonemaporegamufitu", "0634085765", "04", "Allée de Vaugirard", "", "75009", "Paris", "France"),
    ("Prudence", "Bourgeois", "Prudence.Bourgeois76@yahoo.fr", "yibaqicujatefegaqipa", "0697292130", "6", "Impasse de Caumartin", "", "75007", "Paris", "France"),
    ("Mylène", "Blanchard", "Mylne.Blanchard@yahoo.fr", "xerasufugoletubehupi", "0657269567", "39", "Passage Charlemagne", "", "75000", "Paris", "France"),
    ("Emma", "Faure", "Emma55@hotmail.fr", "lolexubuganufinuximo", "0610381597", "7784", "Impasse La Boétie", "", "75007", "Paris", "France");
INSERT INTO employee (firstName, lastName, email, password, tel, status, role) VALUES
    ("Alaïs", "Charpentier", "Alas2@gmail.com", "garuqaruveveyukehudi", "0619845672", "2", "deliverer"),
    ("Agapet", "Gauthier", "Agapet_Gauthier79@hotmail.fr", "cewojumerakeyigucuzi", "0637551065", "3", "deliverer"),
    ("Octave", "Dubois", "Octave.Dubois@hotmail.fr", "siculaxihoxoqifoceca", "0613068350", "1", "deliverer"),
    ("Alverède", "Roche", "Alverde_Roche@hotmail.fr", "gapapatafuwujukolimu", "0621440293", "1", "deliverer"),
    ("Raymonde", "Brun", "Raymonde63@yahoo.fr", "kugeliyawamufebonuda", "0667485222", "1", "deliverer"),
    ("Antonine", "Huet", "Antonine93@gmail.com", "labeyitowufiyuvalaki", "0630833576", "3", "deliverer");
INSERT INTO dish (name, description, price, enabled, lastEdited, chef_id, vat) VALUES
    ("Fantastique Coton Ordinateur", "Rasoir de sûreté “Prima” tout en laiton massif nickelé chromé, manche moleté bien en main. Peigne et contre-peigne galbés tenant tout d'une pièce, fermeture à charnière, blocage instantané de la lame.", 50.00, "true", "Tue Mar 07 2023 11:44:59 GMT+0100 (heure normale d’Europe centrale)", 1, 20),
    ("Raffiné Bronze Chemise", "Lunettes étanches, monture caoutchouc moulé de 1re qual. glaces rondes de 55 mm de diam. en verre clair. Les lunettes protègent les yeux contre les poussières, fumées et gaz industriels et se portent av. nos masques 5862-5864. Pds 60 gr.", 25.00, "false", "Mon Mar 06 2023 16:47:55 GMT+0100 (heure normale d’Europe centrale)", 1, 20),
    ("Sans marque Doux Chapeau", "Petite griffe à sarcler. 5 dents en acier, largeur 8 cm. poignée estampée, longueur 26 cm. poids 150 gr. Pour ameublir le sol, arracher les herbes entre les plantes ou fleurs cultivées en lignes rapprochées.", 26.00, "false", "Wed Mar 01 2023 08:49:52 GMT+0100 (heure normale d’Europe centrale)", 1, 20),
    ("Magnifique Plastique Clavier", "Tous nos appareils sont blindés pour que leur rayonnement ne trouble pas les récepteurs radiophoniques, et ils fonctionnent sur courant alternatif 50 riodes 110 et 220 volts. Ils sont garantis pendant 1 an; toutefois, suivant la règle, le tube cathodique est garanti pour 6 mois seulement.", 40.00, "true", "Sun Mar 05 2023 20:32:32 GMT+0100 (heure normale d’Europe centrale)", 1, 8.8),
    ("Électronique Acier Chemise", "Rasoir de sûreté “Prima” tout en laiton massif nickelé chromé, manche moleté bien en main. Peigne et contre-peigne galbés tenant tout d'une pièce, fermeture à charnière, blocage instantané de la lame.", 11.00, "false", "Tue Mar 14 2023 04:50:04 GMT+0100 (heure normale d’Europe centrale)", 1, 8.8),
    ("Rustique Granit Poisson", "Petite griffe à sarcler. 5 dents en acier, largeur 8 cm. poignée estampée, longueur 26 cm. poids 150 gr. Pour ameublir le sol, arracher les herbes entre les plantes ou fleurs cultivées en lignes rapprochées.", 11.00, "false", "Thu Mar 02 2023 22:26:29 GMT+0100 (heure normale d’Europe centrale)", 1, 5.5),
    ("Fait main Plastique Chemise", "Maillot en coton fin à rayures se boutonnant devant pour enfants.", 30.00, "false", "Wed Mar 01 2023 13:24:44 GMT+0100 (heure normale d’Europe centrale)", 1, 20),
    ("Génial Acier Ordinateur", "Ce magnifique radio-phono comprend un excellent récepteur radioL'ensemble, dans une belle ébénisterie teintée palissandre, forme un très phonique 6 lampes et un tourne-disque de vitesses placé sous le couvercle. Beau meuble. Ce modèle, dont le montage particulièrement soigne assure un très bon rendement aussi bien en radio qu'en phono, est garanti mn an.", 63.00, "true", "Wed Mar 01 2023 09:14:49 GMT+0100 (heure normale d’Europe centrale)", 1, 5.5),
    ("Recyclé Béton Pantalon", "Maillot en coton fin à rayures se boutonnant devant pour enfants.", 54.00, "true", "Sat Mar 11 2023 12:42:23 GMT+0100 (heure normale d’Europe centrale)", 1, 5.5),
    ("Moderne Bronze Chemise", "Tous nos appareils sont blindés pour que leur rayonnement ne trouble pas les récepteurs radiophoniques, et ils fonctionnent sur courant alternatif 50 riodes 110 et 220 volts. Ils sont garantis pendant 1 an; toutefois, suivant la règle, le tube cathodique est garanti pour 6 mois seulement.", 19.00, "false", "Sun Mar 05 2023 18:23:37 GMT+0100 (heure normale d’Europe centrale)", 1, 5.5);
INSERT INTO dish_stock (quantity, dish_id, deliverer_id) VALUES
    (2, 10, 6),
    (8, 9, 2),
    (1, 8, 5),
    (9, 3, 5),
    (4, 1, 5),
    (5, 7, 5),
    (7, 1, 5),
    (7, 2, 5),
    (6, 9, 4),
    (7, 7, 6),
    (4, 6, 5),
    (9, 10, 5),
    (3, 2, 2),
    (7, 6, 2),
    (4, 3, 4),
    (2, 4, 4),
    (9, 8, 2),
    (8, 6, 2),
    (6, 4, 5),
    (8, 3, 3),
    (1, 9, 5),
    (1, 6, 2),
    (1, 10, 5),
    (3, 1, 4),
    (5, 7, 3),
    (1, 9, 3),
    (6, 2, 4),
    (9, 4, 3),
    (5, 8, 2),
    (7, 8, 4);
INSERT INTO customer_order (orderNumber, status, created_at, updated_at, totalAmount, addressNumber, addressLine1, addressLine2, zipCode, city, country, firstName, lastName, tel, deliverer_id, customer_id) VALUES
    ("837025979", "1", "2023-03-14 08:31:03", "2023-03-14 09:17:32", "35.00", "6", "Boulevard de Tilsitt", "", "75006", "Paris", "France", "null", "null", "null", 3, 13),
    ("837025980", "2", "2023-03-13 22:43:35", "2023-03-13 23:40:32", "46.00", "789", "Passage de la Victoire", "", "75013", "Paris", "France", "Mylène", "Henry", "0660345582", 2, 25),
    ("837025981", "3", "2023-03-02 09:37:52", "2023-03-02 10:31:27", "46.00", "3141", "Boulevard Molière", "7 étage", "75018", "Paris", "France", "null", "null", "null", 5, 4),
    ("837025982", "3", "2023-03-13 15:54:04", "2023-03-13 16:42:12", "17.00", "4908", "Allée de la Pompe", "", "75010", "Paris", "France", "Alban", "Dufour", "0683580765", 4, 10),
    ("837025983", "5", "2023-03-14 17:28:52", "2023-03-14 17:57:32", "56.00", "0", "Boulevard Molière", "0 étage", "75016", "Paris", "France", "Basile", "Leroux", "0679491982", 3, 22),
    ("837025984", "2", "2023-03-04 08:45:34", "2023-03-04 09:18:14", "50.00", "5", "Place des Rosiers", "Apt. 754", "75016", "Paris", "France", "null", "null", "null", 5, 22),
    ("837025985", "1", "2023-03-09 23:43:29", "2023-03-10 00:27:49", "53.00", "0332", "Rue d'Argenteuil", "0 étage", "75006", "Paris", "France", "null", "null", "null", 5, 3),
    ("837025986", "4", "2023-03-13 07:18:46", "2023-03-13 07:43:07", "64.00", "80", "Passage Du Sommerard", "8 étage", "75018", "Paris", "France", "null", "null", "null", 5, 5),
    ("837025987", "3", "2023-03-12 05:58:21", "2023-03-12 06:15:06", "64.00", "520", "Boulevard Marcadet", "4 étage", "75013", "Paris", "France", "Philothée", "Gerard", "0691183872", 5, 20),
    ("837025988", "3", "2023-03-03 12:04:37", "2023-03-03 12:56:49", "18.00", "75", "Allée La Boétie", "", "75012", "Paris", "France", "null", "null", "null", 3, 14),
    ("837025989", "2", "2023-03-12 05:32:04", "2023-03-12 06:08:33", "59.00", "93", "Allée de l'Odéon", "6 étage", "75019", "Paris", "France", "null", "null", "null", 3, 1),
    ("837025990", "2", "2023-03-15 19:01:38", "2023-03-15 19:37:31", "63.00", "3545", "Avenue d'Orsel", "", "75020", "Paris", "France", "null", "null", "null", 4, 22),
    ("837025991", "5", "2023-03-10 17:21:42", "2023-03-10 18:08:45", "32.00", "6012", "Place des Lombards", "Apt. 627", "75005", "Paris", "France", "Étienne", "Boyer", "0617446779", 3, 18),
    ("837025992", "4", "2023-03-11 19:38:47", "2023-03-11 19:44:16", "40.00", "1645", "Rue des Francs-Bourgeois", "8 étage", "75017", "Paris", "France", "Élodie", "Robert", "0633055019", 5, 17),
    ("837025993", "1", "2023-03-07 21:24:31", "2023-03-07 21:26:30", "18.00", "49", "Avenue Delesseux", "0 étage", "75006", "Paris", "France", "Job", "Henry", "0699327608", 2, 14),
    ("837025994", "3", "2023-03-09 08:29:30", "2023-03-09 09:13:10", "61.00", "970", "Avenue Bonaparte", "Apt. 571", "75014", "Paris", "France", "Clélie", "Morin", "0640544543", 2, 24),
    ("837025995", "2", "2023-03-14 00:38:50", "2023-03-14 01:23:56", "34.00", "2", "Avenue Saint-Jacques", "6 étage", "75007", "Paris", "France", "Flavien", "Lefebvre", "0647051562", 4, 16),
    ("837025996", "1", "2023-03-06 15:24:40", "2023-03-06 15:45:52", "13.00", "28", "Avenue de Provence", "Apt. 806", "75002", "Paris", "France", "null", "null", "null", 3, 21),
    ("837025997", "4", "2023-03-09 08:40:31", "2023-03-09 09:23:20", "58.00", "21", "Quai de Vaugirard", "Apt. 869", "75010", "Paris", "France", "null", "null", "null", 3, 1),
    ("837025998", "1", "2023-03-04 04:55:42", "2023-03-04 05:29:41", "30.00", "9470", "Allée d'Assas", "Apt. 476", "75010", "Paris", "France", "Aleth", "Carpentier", "0674461928", 4, 20),
    ("837025999", "3", "2023-03-11 07:16:00", "2023-03-11 08:06:02", "22.00", "992", "Quai de Seine", "6 étage", "75009", "Paris", "France", "null", "null", "null", 3, 21),
    ("837026000", "1", "2023-03-13 01:38:29", "2023-03-13 02:08:47", "44.00", "8014", "Impasse d'Assas", "", "75018", "Paris", "France", "Marion", "Picard", "0656551774", 5, 21),
    ("837026001", "3", "2023-03-15 04:40:40", "2023-03-15 05:22:57", "19.00", "57", "Avenue Du Sommerard", "8 étage", "75020", "Paris", "France", "Coralie", "Mathieu", "0639619563", 4, 22),
    ("837026002", "5", "2023-03-13 01:56:03", "2023-03-13 01:56:32", "61.00", "06", "Avenue Bonaparte", "Apt. 095", "75012", "Paris", "France", "null", "null", "null", 2, 15),
    ("837026003", "4", "2023-03-10 23:39:17", "2023-03-11 00:01:02", "61.00", "5096", "Boulevard Royale", "Apt. 822", "75008", "Paris", "France", "Albane", "Boyer", "0666626338", 4, 25),
    ("837026004", "1", "2023-03-09 15:14:38", "2023-03-09 15:50:59", "10.00", "116", "Passage de la Harpe", "", "75017", "Paris", "France", "Constance", "Guyot", "0654116564", 4, 4),
    ("837026005", "4", "2023-03-07 12:24:42", "2023-03-07 13:06:13", "14.00", "0367", "Boulevard de la Pompe", "6 étage", "75004", "Paris", "France", "null", "null", "null", 3, 17),
    ("837026006", "4", "2023-03-09 07:20:00", "2023-03-09 07:57:22", "55.00", "4", "Avenue Oberkampf", "6 étage", "75017", "Paris", "France", "Quintia", "Faure", "0612748155", 3, 4),
    ("837026007", "4", "2023-03-15 21:44:03", "2023-03-15 22:28:53", "56.00", "096", "Allée Du Sommerard", "", "75017", "Paris", "France", "null", "null", "null", 4, 23),
    ("837026008", "4", "2023-03-13 13:15:43", "2023-03-13 14:04:15", "60.00", "0199", "Rue de Presbourg", "Apt. 258", "75018", "Paris", "France", "Zoé", "Charpentier", "0651538601", 4, 4),
    ("837026009", "1", "2023-03-10 09:24:12", "2023-03-10 09:50:09", "35.00", "898", "Boulevard d'Abbeville", "Apt. 874", "75013", "Paris", "France", "René", "Henry", "0634035697", 3, 13),
    ("837026010", "3", "2023-03-14 22:35:04", "2023-03-14 23:09:51", "48.00", "3", "Quai de la Harpe", "", "75001", "Paris", "France", "null", "null", "null", 5, 10),
    ("837026011", "5", "2023-03-03 19:46:47", "2023-03-03 19:53:53", "13.00", "99", "Avenue de Provence", "", "75012", "Paris", "France", "null", "null", "null", 2, 18),
    ("837026012", "2", "2023-03-03 05:59:19", "2023-03-03 06:47:49", "37.00", "0", "Allée de l'Odéon", "Apt. 890", "75007", "Paris", "France", "Côme", "Dumas", "0602701068", 4, 9),
    ("837026013", "4", "2023-03-08 05:38:00", "2023-03-08 05:58:53", "18.00", "7955", "Quai du Faubourg-Saint-Denis", "", "75003", "Paris", "France", "Francette", "Fontaine", "0608610788", 3, 23);
INSERT INTO order_item (quantity, unitPrice, vat, order_id, dish_id) VALUES
    (2, 42.00, 8.8, 2, 4),
    (9, 62.00, 8.8, 7, 4),
    (3, 28.00, 8.8, 27, 4),
    (9, 27.00, 8.8, 9, 9),
    (4, 28.00, 5.5, 10, 2),
    (9, 10.00, 5.5, 26, 9),
    (3, 57.00, 20, 35, 5),
    (3, 26.00, 8.8, 20, 7),
    (5, 22.00, 8.8, 22, 4),
    (1, 49.00, 5.5, 29, 4),
    (3, 23.00, 8.8, 15, 10),
    (1, 23.00, 8.8, 14, 7),
    (4, 19.00, 20, 16, 8),
    (7, 38.00, 5.5, 21, 1),
    (3, 30.00, 8.8, 23, 7),
    (3, 64.00, 5.5, 25, 4),
    (1, 49.00, 8.8, 33, 10),
    (4, 46.00, 5.5, 26, 3),
    (9, 58.00, 8.8, 30, 4),
    (6, 23.00, 5.5, 2, 2),
    (6, 22.00, 5.5, 5, 4),
    (1, 20.00, 8.8, 15, 3),
    (8, 25.00, 5.5, 26, 1),
    (3, 53.00, 8.8, 21, 3),
    (4, 23.00, 5.5, 27, 2),
    (2, 29.00, 5.5, 19, 9),
    (6, 65.00, 20, 17, 3),
    (8, 33.00, 20, 14, 6),
    (5, 47.00, 5.5, 10, 4),
    (5, 47.00, 8.8, 6, 7),
    (2, 32.00, 5.5, 22, 4),
    (1, 52.00, 5.5, 22, 4),
    (7, 46.00, 8.8, 35, 10),
    (9, 58.00, 20, 20, 1),
    (8, 50.00, 5.5, 7, 5),
    (5, 49.00, 8.8, 33, 9),
    (4, 51.00, 5.5, 5, 4),
    (7, 40.00, 20, 18, 7),
    (6, 62.00, 8.8, 19, 6),
    (5, 59.00, 8.8, 30, 2),
    (6, 60.00, 20, 4, 3),
    (7, 58.00, 5.5, 31, 8),
    (6, 26.00, 8.8, 20, 2),
    (6, 46.00, 5.5, 2, 5),
    (3, 39.00, 8.8, 11, 5),
    (7, 56.00, 20, 11, 9),
    (3, 54.00, 20, 13, 1),
    (9, 17.00, 20, 25, 2),
    (5, 45.00, 8.8, 12, 10),
    (8, 23.00, 5.5, 9, 7),
    (3, 38.00, 8.8, 13, 4),
    (3, 19.00, 20, 11, 9),
    (9, 22.00, 20, 6, 10),
    (4, 11.00, 20, 27, 9),
    (5, 43.00, 5.5, 35, 5);