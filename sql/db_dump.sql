CREATE TABLE customer (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    tel TEXT NOT NULL,
    address_id INTEGER NOT NULL,
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

CREATE TABLE "order" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    order_number TEXT NOT NULL,
    address_id INTEGER NOT NULL,
    delivered_by_id INTEGER,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL,
    status TEXT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES address (id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (delivered_by_id) REFERENCES staff (id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE order_item (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    dish_id INTEGER NOT NULL,
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
    tel TEXT NOT NULL,
    password TEXT NOT NULL,
    status TEXT NOT NULL,
    position TEXT NOT NULL,
    role TEXT NOT NULL
);

CREATE INDEX idx_order_order_number ON "order" (order_number);
