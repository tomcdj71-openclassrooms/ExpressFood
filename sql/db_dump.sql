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
    ("Sylviane", "Blanc", "Sylviane.Blanc51@hotmail.fr", "furarejudoyuqopubowe", "0686956224", "5764", "Allée de Richelieu", "", "75018", "Paris", "France"),
    ("Abondance", "Petit", "Abondance_Petit64@yahoo.fr", "tafafecicekizugazuku", "0613406793", "3950", "Quai de Rivoli", "7 étage", "75010", "Paris", "France"),
    ("Alaine", "Morel", "Alaine_Morel@hotmail.fr", "qelufebisorapuzigato", "0696331363", "2", "Avenue Mouffetard", "Apt. 114", "75018", "Paris", "France"),
    ("Flore", "Lucas", "Flore_Lucas10@yahoo.fr", "dotanokoqihuwiwiyuje", "0608735961", "7", "Passage Montorgueil", "3 étage", "75009", "Paris", "France"),
    ("Aymardine", "Chevalier", "Aymardine_Chevalier50@hotmail.fr", "weboqonojepajojaqama", "0623335483", "564", "Avenue de la Huchette", "Apt. 156", "75002", "Paris", "France"),
    ("Mélodie", "Lemoine", "Mlodie74@yahoo.fr", "neyenalagifelopeniwa", "0668848867", "5054", "Avenue des Lombards", "9 étage", "75004", "Paris", "France"),
    ("Marceline", "Olivier", "Marceline59@yahoo.fr", "bareqaxewocecabuhure", "0623830662", "14", "Avenue Charlemagne", "Apt. 798", "75000", "Paris", "France"),
    ("Amédée", "Schmitt", "Amde.Schmitt@gmail.com", "daqilukupenewisipira", "0633686777", "2957", "Allée du Chat-qui-Pêche", "", "75014", "Paris", "France"),
    ("Gautier", "Perrot", "Gautier.Perrot@yahoo.fr", "zoqivofuyixojutakigi", "0620853551", "5", "Boulevard des Panoramas", "3 étage", "75019", "Paris", "France"),
    ("Althée", "Deschamps", "Althe.Deschamps2@gmail.com", "yopapusobavivuqahali", "0682099761", "3347", "Allée Oberkampf", "", "75016", "Paris", "France"),
    ("Anthelmette", "Schneider", "Anthelmette77@yahoo.fr", "sogebiqugunoxokekeza", "0613456051", "0181", "Place d'Assas", "Apt. 159", "75008", "Paris", "France"),
    ("Aymeric", "Bourgeois", "Aymeric.Bourgeois10@yahoo.fr", "sefiniyoniyupayuwepa", "0678479227", "7291", "Allée Joubert", "Apt. 806", "75018", "Paris", "France"),
    ("Clio", "Carpentier", "Clio.Carpentier7@gmail.com", "dujecenajedufayexihu", "0638992827", "11", "Allée de la Huchette", "", "75001", "Paris", "France"),
    ("Arlette", "Perrin", "Arlette65@yahoo.fr", "zetugazixoguhevocanu", "0652792052", "5", "Quai d'Abbeville", "7 étage", "75013", "Paris", "France"),
    ("Marion", "Simon", "Marion90@hotmail.fr", "dogopisinosizujaregi", "0629109727", "768", "Passage Delesseux", "Apt. 511", "75000", "Paris", "France"),
    ("Angilran", "David", "Angilran97@yahoo.fr", "fijejuqovogugowiyeji", "0671711989", "1083", "Avenue de Seine", "Apt. 864", "75006", "Paris", "France"),
    ("Adhémar", "Masson", "Adhmar.Masson@yahoo.fr", "kemibodatoyototalofe", "0642094137", "1809", "Boulevard de Montmorency", "", "75006", "Paris", "France"),
    ("Auxane", "Philippe", "Auxane17@gmail.com", "wodomatefemapohekame", "0631812215", "7627", "Impasse Saint-Jacques", "Apt. 698", "75010", "Paris", "France"),
    ("Isabeau", "Prevost", "Isabeau28@yahoo.fr", "mokodigeyisogidegiro", "0678505361", "9", "Quai Joubert", "Apt. 548", "75013", "Paris", "France"),
    ("Gisèle", "Menard", "Gisle35@yahoo.fr", "wunawuvoruvolawuxahu", "0641191981", "43", "Rue de la Huchette", "", "75015", "Paris", "France"),
    ("Jourdain", "Laine", "Jourdain80@gmail.com", "quvogazubesasitadeve", "0618265856", "8614", "Allée de Nesle", "9 étage", "75005", "Paris", "France"),
    ("Aristide", "Gonzalez", "Aristide_Gonzalez@gmail.com", "loquyonecocagajerexo", "0694017912", "5378", "Quai Laffitte", "", "75017", "Paris", "France"),
    ("Fidèle", "Thomas", "Fidle92@gmail.com", "yipunazodarawefedore", "0694935568", "2", "Impasse de Provence", "Apt. 813", "75006", "Paris", "France"),
    ("Éléonore", "Lucas", "lonore.Lucas@hotmail.fr", "nesexibalakeropofaxu", "0637952569", "3784", "Voie de l'Abbaye", "", "75017", "Paris", "France"),
    ("Amédée", "Vincent", "Amde_Vincent@yahoo.fr", "senisojujigonavububo", "0655994803", "24", "Quai des Francs-Bourgeois", "Apt. 553", "75009", "Paris", "France");
INSERT INTO employee (firstName, lastName, email, password, tel, addressNumber, addressLine1, addressLine2, zipCode, city, country, status, role) VALUES
    ("Bertille", "Guillaume", "Bertille_Guillaume@yahoo.fr", "gakujujaqiragulusame", "0608969921", "3", "Passage du Havre", "", "75000", "Paris", "France", "delivering", "chef"),
    ("Philippe", "Morel", "Philippe19@hotmail.fr", "zovecomewipukivibono", "0607362675", "1", "Impasse Molière", "", "75007", "Paris", "France", "delivering", "deliverer"),
    ("Asceline", "Aubert", "Asceline_Aubert@hotmail.fr", "hizovavovikoyoyanidu", "0687905225", "61", "Boulevard Joubert", "", "75004", "Paris", "France", "unavailable", "deliverer"),
    ("Ludivine", "David", "Ludivine.David15@gmail.com", "lolicavipivurikobeqo", "0697415511", "6421", "Rue Saint-Bernard", "5 étage", "75002", "Paris", "France", "delivering", "deliverer"),
    ("Ophélie", "Vidal", "Ophlie2@yahoo.fr", "nuduvanefagehayokuta", "0690347910", "4", "Impasse de l'Odéon", "Apt. 374", "75004", "Paris", "France", "available", "deliverer"),
    ("Juste", "Lemaire", "Juste40@gmail.com", "xanedifihusikijejiwe", "0629653958", "5", "Avenue Du Sommerard", "9 étage", "75001", "Paris", "France", "available", "deliverer");
INSERT INTO dish (name, description, price, enabled, lastEdited, chef_id) VALUES
    ("Ergonomique Bois Clavier", "Moteur Villiers. Puissance au frein : 7 HP, 3 vitesses, lancement au pied, éclairage électrique, carrosserie 2 places, coffre à outils, outillage complet, capote et pare-brise.", 13.00, "false", "Thu Mar 02 2023 19:22:55 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Ergonomique Béton Clavier", "Moteur Villiers. Puissance au frein : 7 HP, 3 vitesses, lancement au pied, éclairage électrique, carrosserie 2 places, coffre à outils, outillage complet, capote et pare-brise.", 50.00, "true", "Mon Mar 06 2023 16:29:46 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Fait main Granit Chaise", "Tous nos appareils sont blindés pour que leur rayonnement ne trouble pas les récepteurs radiophoniques, et ils fonctionnent sur courant alternatif 50 riodes 110 et 220 volts. Ils sont garantis pendant 1 an; toutefois, suivant la règle, le tube cathodique est garanti pour 6 mois seulement.", 26.00, "true", "Mon Mar 13 2023 23:15:49 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Incroyable Frais Salade", "Tous nos appareils sont blindés pour que leur rayonnement ne trouble pas les récepteurs radiophoniques, et ils fonctionnent sur courant alternatif 50 riodes 110 et 220 volts. Ils sont garantis pendant 1 an; toutefois, suivant la règle, le tube cathodique est garanti pour 6 mois seulement.", 27.00, "true", "Thu Mar 09 2023 13:11:56 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Fantastique Plastique Pantalon", "Petite griffe à sarcler. 5 dents en acier, largeur 8 cm. poignée estampée, longueur 26 cm. poids 150 gr. Pour ameublir le sol, arracher les herbes entre les plantes ou fleurs cultivées en lignes rapprochées.", 36.00, "true", "Mon Mar 13 2023 15:51:23 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Fait main Plastique Table", "Ces médailles et épingles sont en argent avec patine artistique. Elles ont été composées et frappées spécialement dans les ateliers de l'État pour la Société l'Hirondelle.", 42.00, "false", "Sun Mar 05 2023 03:33:52 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Savoureux Coton Salade", "Montre-bracelet, dite “d'Aviateur”, métal inaltérable, diam. 435ym. Mouvement de précision chronographe, cadran avec grande aiguille trotteuse, permettant la lecture 1/25de seconde.", 30.00, "true", "Thu Mar 09 2023 18:42:53 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Générique Acier Chaise", "Moteur Villiers. Puissance au frein : 7 HP, 3 vitesses, lancement au pied, éclairage électrique, carrosserie 2 places, coffre à outils, outillage complet, capote et pare-brise.", 18.00, "false", "Sun Mar 05 2023 13:31:15 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Savoureux Béton Fromage", "Lanterne cuivre fort, finement nickelé, chute d'eau réglable, suspension antivibratrice, projecteur diamètre cm2, avec verre bombé. Durée d'éclairage 3 heures. Poids 395 grammes.", 54.00, "false", "Wed Mar 08 2023 09:14:23 GMT+0100 (heure normale d’Europe centrale)", 1),
    ("Fantastique Frais Pantalon", "Récepteurs de télévision à haute définition 819 lignes, donnant une image très nette et d'un contraste agréable ne fatiguant pas la vue, le montage de la partie radio donne un son absolument remarquable.", 64.00, "false", "Fri Mar 10 2023 22:12:52 GMT+0100 (heure normale d’Europe centrale)", 1);
INSERT INTO dish_stock (quantity, dish_id, deliverer_id) VALUES
    (9, 8, 3),
    (5, 4, 5),
    (8, 4, 5),
    (6, 4, 3),
    (5, 6, 4),
    (6, 2, 5),
    (6, 2, 6),
    (9, 8, 6),
    (9, 1, 3),
    (6, 9, 3),
    (3, 1, 2),
    (8, 9, 5),
    (5, 5, 5),
    (4, 3, 2),
    (5, 10, 5),
    (3, 5, 3),
    (8, 1, 5),
    (8, 4, 2),
    (4, 2, 6),
    (5, 7, 6),
    (6, 8, 2),
    (8, 8, 5),
    (5, 1, 6),
    (3, 5, 3),
    (8, 2, 4),
    (9, 10, 5),
    (1, 3, 4),
    (3, 1, 5),
    (3, 9, 4),
    (8, 4, 4);
INSERT INTO customer_order (orderNumber, status, created_at, updated_at, deliverer_id, customer_id, totalAmount, addressNumber, addressLine1, addressLine2, zipCode, city, country, firstName, lastName, tel) VALUES
    ("243847201", "delivered", "Mon Mar 06 2023 10:49:43 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 06 2023 11:42:59 GMT+0100 (heure normale d’Europe centrale)", 5, 7, "34.00", "367", "Passage de l'Odéon", "", "75013", "Paris", "France", "null", "null", "null"),
    ("875130579", "pending", "Mon Mar 13 2023 20:33:11 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 20:35:30 GMT+0100 (heure normale d’Europe centrale)", 3, 13, "39.00", "0", "Rue de Vaugirard", "Apt. 102", "75000", "Paris", "France", "Tonnin", "Martinez", "0644947048"),
    ("617012136", "canceled", "Sat Mar 04 2023 10:14:38 GMT+0100 (heure normale d’Europe centrale)", "Sat Mar 04 2023 10:19:01 GMT+0100 (heure normale d’Europe centrale)", 3, 15, "40.00", "7453", "Impasse La Boétie", "", "75001", "Paris", "France", "Althée", "Carre", "0657258720"),
    ("003327096", "delivered", "Mon Mar 13 2023 12:09:33 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 12:18:50 GMT+0100 (heure normale d’Europe centrale)", 2, 21, "10.00", "3782", "Boulevard des Panoramas", "", "75016", "Paris", "France", "Marc", "Maillard", "0627968400"),
    ("227829064", "canceled", "Wed Mar 01 2023 05:36:19 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 01 2023 05:59:56 GMT+0100 (heure normale d’Europe centrale)", 2, 24, "39.00", "57", "Voie de la Bûcherie", "", "75001", "Paris", "France", "Élzéar", "Dumas", "0605526986"),
    ("638062735", "canceled", "Fri Mar 10 2023 22:24:47 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 10 2023 22:35:00 GMT+0100 (heure normale d’Europe centrale)", 5, 19, "34.00", "69", "Avenue de Solférino", "", "75017", "Paris", "France", "Martial", "Brunet", "0626734168"),
    ("262325661", "delivered", "Wed Mar 01 2023 07:30:58 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 01 2023 08:29:55 GMT+0100 (heure normale d’Europe centrale)", 3, 19, "34.00", "16", "Passage de Richelieu", "", "75008", "Paris", "France", "Léa", "Cousin", "0657814689"),
    ("032671886", "pending", "Mon Mar 06 2023 07:15:29 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 06 2023 07:31:26 GMT+0100 (heure normale d’Europe centrale)", 5, 15, "27.00", "264", "Allée Saint-Denis", "2 étage", "75020", "Paris", "France", "Nathalie", "Roche", "0645343783"),
    ("325405491", "delivered", "Sun Mar 12 2023 23:41:29 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 00:20:52 GMT+0100 (heure normale d’Europe centrale)", 3, 14, "42.00", "62", "Allée de Paris", "Apt. 582", "75011", "Paris", "France", "Jérôme", "Martin", "0662876926"),
    ("164888576", "delivered", "Wed Mar 01 2023 17:51:04 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 01 2023 18:18:52 GMT+0100 (heure normale d’Europe centrale)", 5, 4, "16.00", "19", "Allée de Caumartin", "", "75020", "Paris", "France", "Victorien", "Barbier", "0680382348"),
    ("373886997", "delivered", "Sun Mar 05 2023 11:36:18 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 12:15:57 GMT+0100 (heure normale d’Europe centrale)", 4, 19, "50.00", "4", "Place Saint-Denis", "6 étage", "75017", "Paris", "France", "null", "null", "null"),
    ("375922368", "canceled", "Wed Mar 08 2023 11:00:45 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 11:19:17 GMT+0100 (heure normale d’Europe centrale)", 2, 4, "28.00", "458", "Boulevard de Richelieu", "1 étage", "75003", "Paris", "France", "null", "null", "null"),
    ("127006662", "pending", "Tue Mar 07 2023 15:31:37 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 16:00:01 GMT+0100 (heure normale d’Europe centrale)", 4, 8, "51.00", "9548", "Allée Joubert", "", "75009", "Paris", "France", "null", "null", "null"),
    ("797523778", "canceled", "Fri Mar 10 2023 13:52:30 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 10 2023 14:30:43 GMT+0100 (heure normale d’Europe centrale)", 3, 23, "33.00", "36", "Voie d'Assas", "", "75009", "Paris", "France", "Anatolie", "Rousseau", "0600584117"),
    ("840405041", "delivered", "Sun Mar 05 2023 19:36:00 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 20:12:41 GMT+0100 (heure normale d’Europe centrale)", 2, 10, "43.00", "930", "Boulevard Pastourelle", "", "75010", "Paris", "France", "null", "null", "null"),
    ("858645452", "delivered", "Wed Mar 08 2023 21:52:55 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 22:32:19 GMT+0100 (heure normale d’Europe centrale)", 2, 16, "43.00", "1029", "Avenue Bonaparte", "2 étage", "75020", "Paris", "France", "null", "null", "null"),
    ("151088475", "canceled", "Wed Mar 01 2023 19:48:23 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 01 2023 19:56:01 GMT+0100 (heure normale d’Europe centrale)", 4, 10, "16.00", "734", "Boulevard des Lombards", "", "75014", "Paris", "France", "null", "null", "null"),
    ("546482150", "canceled", "Tue Mar 07 2023 06:16:32 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 07:01:19 GMT+0100 (heure normale d’Europe centrale)", 2, 21, "15.00", "6", "Rue de Tilsitt", "Apt. 388", "75014", "Paris", "France", "null", "null", "null"),
    ("658346123", "delivered", "Fri Mar 03 2023 19:15:01 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 19:36:06 GMT+0100 (heure normale d’Europe centrale)", 5, 21, "54.00", "7756", "Place d'Alésia", "", "75012", "Paris", "France", "Hildebert", "Da silva", "0636824399"),
    ("760175830", "delivered", "Wed Mar 08 2023 01:11:58 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 01:51:09 GMT+0100 (heure normale d’Europe centrale)", 4, 3, "49.00", "9666", "Rue Bonaparte", "6 étage", "75000", "Paris", "France", "Quintia", "Julien", "0638526751"),
    ("378741322", "delivered", "Tue Mar 14 2023 00:36:00 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 14 2023 01:16:40 GMT+0100 (heure normale d’Europe centrale)", 2, 25, "40.00", "58", "Voie Mouffetard", "", "75012", "Paris", "France", "Philémon", "Perez", "0697393754"),
    ("313995405", "pending", "Fri Mar 03 2023 01:57:33 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 02:00:44 GMT+0100 (heure normale d’Europe centrale)", 3, 15, "60.00", "8", "Passage de Richelieu", "Apt. 692", "75014", "Paris", "France", "Ernestine", "Sanchez", "0653856705"),
    ("056845001", "canceled", "Wed Mar 15 2023 17:35:03 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 15 2023 17:46:54 GMT+0100 (heure normale d’Europe centrale)", 2, 1, "16.00", "12", "Passage Oberkampf", "", "75019", "Paris", "France", "null", "null", "null"),
    ("824060178", "canceled", "Sun Mar 12 2023 23:40:38 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 00:34:55 GMT+0100 (heure normale d’Europe centrale)", 4, 19, "57.00", "5", "Rue Pastourelle", "2 étage", "75013", "Paris", "France", "null", "null", "null"),
    ("308296383", "pending", "Fri Mar 03 2023 21:22:51 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 21:55:00 GMT+0100 (heure normale d’Europe centrale)", 3, 6, "44.00", "5429", "Voie Laffitte", "7 étage", "75010", "Paris", "France", "Joëlle", "Schmitt", "0601997239"),
    ("253700942", "pending", "Thu Mar 02 2023 18:08:29 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 02 2023 18:52:21 GMT+0100 (heure normale d’Europe centrale)", 3, 17, "16.00", "58", "Place de la Huchette", "8 étage", "75020", "Paris", "France", "Ferdinand", "Barbier", "0657068255"),
    ("033817946", "pending", "Tue Mar 07 2023 17:43:42 GMT+0100 (heure normale d’Europe centrale)", "Tue Mar 07 2023 18:04:01 GMT+0100 (heure normale d’Europe centrale)", 4, 3, "15.00", "9852", "Rue Saint-Honoré", "1 étage", "75013", "Paris", "France", "Barbe", "Denis", "0606272250"),
    ("340692503", "delivered", "Sun Mar 12 2023 13:14:27 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 12 2023 13:49:57 GMT+0100 (heure normale d’Europe centrale)", 5, 16, "52.00", "92", "Avenue Pastourelle", "", "75000", "Paris", "France", "null", "null", "null"),
    ("870309370", "canceled", "Sun Mar 05 2023 04:04:35 GMT+0100 (heure normale d’Europe centrale)", "Sun Mar 05 2023 04:13:43 GMT+0100 (heure normale d’Europe centrale)", 3, 25, "60.00", "257", "Passage de Presbourg", "", "75001", "Paris", "France", "Robert", "Clement", "0651861853"),
    ("631109701", "canceled", "Mon Mar 13 2023 02:34:08 GMT+0100 (heure normale d’Europe centrale)", "Mon Mar 13 2023 03:25:40 GMT+0100 (heure normale d’Europe centrale)", 4, 19, "26.00", "689", "Rue Molière", "Apt. 414", "75013", "Paris", "France", "null", "null", "null"),
    ("040189811", "canceled", "Wed Mar 08 2023 15:59:13 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 16:09:52 GMT+0100 (heure normale d’Europe centrale)", 5, 20, "53.00", "1", "Quai La Boétie", "", "75016", "Paris", "France", "Savin", "Mathieu", "0681279047"),
    ("455398900", "pending", "Fri Mar 03 2023 09:09:42 GMT+0100 (heure normale d’Europe centrale)", "Fri Mar 03 2023 09:27:15 GMT+0100 (heure normale d’Europe centrale)", 2, 25, "48.00", "97", "Quai Saint-Denis", "", "75014", "Paris", "France", "null", "null", "null"),
    ("204072303", "pending", "Wed Mar 08 2023 15:13:33 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 08 2023 16:03:25 GMT+0100 (heure normale d’Europe centrale)", 2, 7, "46.00", "0", "Place Lepic", "", "75013", "Paris", "France", "Melchior", "Noel", "0631553795"),
    ("644476050", "delivered", "Wed Mar 15 2023 04:32:04 GMT+0100 (heure normale d’Europe centrale)", "Wed Mar 15 2023 04:45:42 GMT+0100 (heure normale d’Europe centrale)", 3, 22, "54.00", "4", "Rue de la Victoire", "", "75000", "Paris", "France", "Arcade", "Jacquet", "0605719084"),
    ("250857583", "pending", "Thu Mar 09 2023 14:23:46 GMT+0100 (heure normale d’Europe centrale)", "Thu Mar 09 2023 14:29:44 GMT+0100 (heure normale d’Europe centrale)", 3, 7, "57.00", "46", "Avenue des Panoramas", "", "75011", "Paris", "France", "Albert", "Bernard", "0681548400");
INSERT INTO order_item (quantity, unitPrice, vat, order_id, dish_id) VALUES
    (6, 27.00, 20, 9, 5),
    (3, 26.00, 8.8, 32, 7),
    (5, 56.00, 8.8, 22, 10),
    (8, 45.00, 20, 35, 4),
    (7, 35.00, 20, 20, 2),
    (5, 47.00, 5.5, 27, 3),
    (7, 22.00, 20, 17, 1),
    (8, 32.00, 8.8, 20, 7),
    (6, 48.00, 20, 26, 7),
    (9, 30.00, 8.8, 20, 10),
    (6, 37.00, 5.5, 6, 4),
    (7, 61.00, 20, 9, 1),
    (6, 62.00, 8.8, 21, 5),
    (8, 12.00, 5.5, 33, 5),
    (1, 29.00, 5.5, 9, 8),
    (4, 55.00, 8.8, 8, 9),
    (3, 36.00, 20, 17, 2),
    (7, 43.00, 5.5, 35, 6),
    (9, 60.00, 5.5, 7, 2),
    (6, 25.00, 5.5, 23, 4),
    (8, 47.00, 20, 31, 3),
    (2, 50.00, 8.8, 3, 5),
    (4, 49.00, 5.5, 9, 3),
    (2, 40.00, 5.5, 18, 8),
    (4, 39.00, 8.8, 20, 5),
    (4, 34.00, 20, 1, 5),
    (8, 51.00, 5.5, 6, 6),
    (3, 57.00, 20, 17, 7),
    (5, 35.00, 5.5, 6, 5),
    (1, 49.00, 20, 3, 10),
    (8, 56.00, 5.5, 5, 9),
    (2, 41.00, 8.8, 20, 10),
    (6, 42.00, 5.5, 24, 1),
    (7, 51.00, 8.8, 31, 2),
    (8, 35.00, 8.8, 4, 5),
    (4, 32.00, 8.8, 17, 5),
    (6, 34.00, 5.5, 12, 1),
    (3, 50.00, 5.5, 14, 1),
    (2, 20.00, 20, 33, 4),
    (1, 16.00, 8.8, 21, 8),
    (3, 25.00, 8.8, 11, 3),
    (5, 35.00, 5.5, 12, 2),
    (9, 25.00, 8.8, 33, 8),
    (2, 32.00, 5.5, 3, 10),
    (5, 51.00, 5.5, 35, 8),
    (1, 45.00, 8.8, 17, 5),
    (5, 47.00, 5.5, 14, 8),
    (2, 15.00, 5.5, 30, 2),
    (9, 59.00, 20, 27, 5),
    (5, 34.00, 8.8, 4, 2),
    (3, 65.00, 5.5, 17, 4),
    (4, 25.00, 8.8, 2, 4),
    (3, 54.00, 20, 3, 1),
    (2, 17.00, 20, 1, 9),
    (5, 47.00, 5.5, 2, 2);