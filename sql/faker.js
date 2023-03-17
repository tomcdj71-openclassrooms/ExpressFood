const { faker } = require('@faker-js/faker/locale/fr');
const fs = require('fs');
// require sqlite3
const sqlite3 = require('sqlite3').verbose();

function createAddress() {
    const addressNumber = faker.address.buildingNumber();
    const addressLine1 = faker.address.street();
    const addressLine2 = faker.helpers.arrayElement([faker.address.secondaryAddress(), '']);
    const zipCode = faker.helpers.arrayElement(['75000', '75001', '75002', '75003', '75004', '75005', '75006', '75007', '75008', '75009', '75010', '75011', '75012', '75013', '75014', '75015', '75016', '75017', '75018', '75019', '75020']);
    const city = "Paris";
    const country = "France";

    return {
        addressNumber,
        addressLine1,
        addressLine2,
        zipCode,
        city,
        country,
    };
}

function createPersons() {
    const sex = faker.name.sexType();
    const firstName = faker.name.firstName(sex);
    const lastName = faker.name.lastName();
    const email = faker.helpers.unique(faker.internet.email, [
        firstName,
        lastName,
    ]);
    const tel = faker.phone.number('06########');
    const password = faker.internet.password(20, true);
    const address = createAddress();
    const addressNumber = address.addressNumber;
    const addressLine1 = address.addressLine1;
    const addressLine2 = address.addressLine2;
    const zipCode = address.zipCode;
    const city = address.city;
    const country = address.country;
    return {
        firstName,
        lastName,
        email,
        password,
        tel,
        addressNumber,
        addressLine1,
        addressLine2,
        zipCode,
        city,
        country,
    };
}

function createOrder() {
    const orderNumber = faker.finance.account(9);
    const status = faker.helpers.arrayElement(['pending', 'delivered', 'canceled']);
    const created_at = faker.date.between('2023-03-01T00:00:00.000Z', '2023-03-16T00:00:00.000Z');
    const updated_at = faker.date.between(created_at, new Date(created_at.getTime() + 3600000));
    const totalAmount = faker.commerce.price(10, 65);
    const deliverer_id = faker.datatype.number({ min: 1, max: 6 });
    const isUser = faker.datatype.boolean();
    const customer_id = isUser ? faker.datatype.number({ min: 1, max: 25 }) : null;
    const address = createAddress();
    const addressNumber = address.addressNumber;
    const addressLine1 = address.addressLine1;
    const addressLine2 = address.addressLine2;
    const zipCode = address.zipCode;
    const city = address.city;
    const country = address.country;
    const firstName = isUser ? null : faker.name.firstName();
    const lastName = isUser ? null : faker.name.lastName();
    const tel = isUser ? null : faker.phone.number('06########');

    return {
        orderNumber,
        status,
        created_at,
        updated_at,
        deliverer_id,
        customer_id,
        totalAmount,
        addressNumber,
        addressLine1,
        addressLine2,
        zipCode,
        city,
        country,
        firstName,
        lastName,
        tel
    };
}

function createDishes() {
    const name = faker.commerce.productName();
    const description = faker.commerce.productDescription();
    const price = faker.commerce.price(10, 65);
    const enabled = faker.datatype.boolean();
    const lastEdited = faker.date.between('2023-03-01T00:00:00.000Z', '2023-03-16T00:00:00.000Z');
    const chef_id = 1;

    return {
        name,
        description,
        price,
        enabled,
        lastEdited,
        chef_id,
    };
}

function createOrderItems() {
    const quantity = faker.random.numeric(1, { bannedDigits: ['0'] });
    const unitPrice = faker.commerce.price(10, 65);
    const vat = faker.helpers.arrayElement(['5.5', '8.8', '20']);
    const order_id = faker.datatype.number({ min: 1, max: 35 });
    const dish_id = faker.datatype.number({ min: 1, max: 10 });

    return {
        quantity,
        unitPrice,
        vat,
        order_id,
        dish_id,
    };
}

function createDishStocks() {
    const quantity = parseInt(faker.random.numeric(1, { bannedDigits: ['0'] }));
    const dish_id = parseInt(faker.datatype.number({ min: 1, max: 10 }));
    const deliverer_id = parseInt(faker.datatype.number({ min: 2, max: 6 }));

    return {
        quantity,
        dish_id,
        deliverer_id,
    };
}

const users = [];
const employees = [];
const dishes = [];
const dishStocks = [];
const orders = [];
const orderItems = [];

// Create 25 users
for (var i = 0; i < 25; i++) {
    // create persons and add to users array
    const user = createPersons();
    // convert string values to numbers if needed
    users.push(user);
}

// Create 6 employees
for (var i = 0; i < 6; i++) {
    const employee = createPersons();
    employee.status = faker.helpers.arrayElement(['delivering', 'available', 'unavailable']);
    employee.role = (i === 0) ? 'chef' : 'deliverer';
    employees.push(employee);
}

// Create 10 dishes
for (var i = 0; i < 10; i++) {
    const dish = createDishes();
    dishes.push(dish);
}

// create 20 dish stocks
for (var i = 0; i < 30; i++) {
    const dishStock = createDishStocks();
    dishStocks.push(dishStock);
}

// Create 35 orders
for (var i = 0; i < 35; i++) {
    const order = createOrder();
    order.deliverer_id = faker.helpers.arrayElement([2, 3, 4, 5]);
    order.customer_id = parseInt(faker.datatype.number({ min: 1, max: 25 }));
    orders.push(order);
}

// Create 55 order items
for (var i = 0; i < 55; i++) {
    const orderItem = createOrderItems();
    orderItems.push(orderItem);
}

const tableData = [
    { data: users, table: 'user' },
    { data: employees, table: 'employee' },
    { data: dishes, table: 'dish' },
    { data: dishStocks, table: 'dish_stock' },
    { data: orders, table: 'customer_order' },
    { data: orderItems, table: 'order_item' },
];

const sqlStatements = {};
tableData.forEach(({ data, table }) => {
    data.forEach((dataItem) => {
        const columns = Object.keys(dataItem);
        delete dataItem.table;
        const rowValues = `(${columns.map((column) => {
            if (column.endsWith('_id') || column === 'quantity' || column === 'price' || column === 'unitPrice' || column === 'vat') {
                return dataItem[column];
            } else {
                return `"${dataItem[column]}"`;
            }
        }).join(', ')})`;
        if (!sqlStatements[table]) {
            sqlStatements[table] = {
                columns,
                values: [rowValues],
            };
        } else {
            sqlStatements[table].values.push(rowValues);
        }
    });
});

// Build the INSERT INTO statement for each table
const insertStatements = Object.entries(sqlStatements).map(([table, values]) => {
    const columns = values.columns.join(', ');
    const rows = values.values.join(',\n    ');
    return `INSERT INTO ${table} (${columns}) VALUES\n    ${rows};`;
});

const db = new sqlite3.Database('database.db');
const newData = `PRAGMA foreign_keys = ON;\n${insertStatements.join('\n')}`;
// Read the modified db_dump.sql file
fs.readFile('db_dump.sql', 'utf8', (err, data) => {
    if (err) {
        console.log(err);
        return;
    }

    // check if PRAGMA foreign_keys = ON; exists
    const pragmaIndex = data.indexOf('PRAGMA foreign_keys = ON;');
    if (pragmaIndex !== -1) {
        // delete all content after PRAGMA statement
        data = data.substring(0, pragmaIndex);

        // replace PRAGMA statement with new data
        data = data.replace('PRAGMA foreign_keys = ON;\n', '');
        data += newData;
    }

    // Write the modified db_dump.sql file
    fs.writeFile('db_dump.sql', data, (err) => {
        if (err) {
            console.log(err);
            return;
        }
        console.log('db_dump.sql file updated');
    });
    // Execute the SQL statements in db_dump.sql
    db.serialize(() => {
        db.exec(data, (err) => {
            if (err) {
                console.log(err);
                return;
            }
            console.log('Data added to database');
        });
    });
});