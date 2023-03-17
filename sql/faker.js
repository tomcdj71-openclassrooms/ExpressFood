const { faker } = require('@faker-js/faker/locale/fr');
const sqlite3 = require('sqlite3').verbose();
const fs = require('fs');

/**
 * This function creates a random address in Paris.
 * @returns {{addressNumber: *, addressLine1: *, addressLine2: *, zipCode: *, city: string, country: string}}
 */

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

/**
 * This function creates a random person.
 * @returns {{firstName: *, lastName: *, email: *, password: *, tel: *, addressNumber: *, addressLine1: *, addressLine2: *, zipCode: *, city: string, country: string}}
 */
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

/**
 * This function creates a random order.
 * @returns {{orderNumber: *, status: *, created_at: *, updated_at: *, totalAmount: *, deliverer_id: *, customer_id: *, addressNumber: *, addressLine1: *, addressLine2: *, zipCode: *, city: string, country: string, firstName: *, lastName: *, tel: *}}
 */
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

/**
 * This function creates a random dish.
 * @returns {{name: *, description: *, price: *, enabled: *, lastEdited: *, chef_id: number}}
 */
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

/**
 * This function creates a random order item.
 * @returns {{quantity: *, unitPrice: *, vat: *, order_id: *, dish_id: *}}
 */
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

/**
 * This function creates a random dish stock.
 * @returns {{quantity: *, dish_id: *, deliverer_id: *}}
 */
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

/**
 * This function contains a loop to create a number of items.
 * @param {*} count 
 * @param {*} creator 
 * @returns 
 */
const createItems = (count, creator) => {
    const items = [];
    for (let i = 0; i < count; i++) {
        items.push(creator());
    }
    return items;
};

/**
 * Create the data.
 */
const users = createItems(25, createPersons);
const employees = createItems(6, (count) => {
    const employee = createPersons();
    employee.status = faker.helpers.arrayElement(['delivering', 'available', 'unavailable']);
    switch (count) {
        case 0:
            employee.role = 'chef';
            break;
        default:
            employee.role = 'deliverer';
    }
    return employee;
});
const dishes = createItems(10, createDishes);
const dishStocks = createItems(30, createDishStocks);
const orders = createItems(35, () => {
    const order = createOrder();
    order.deliverer_id = parseInt(faker.datatype.number({ min: 2, max: 5 }));
    order.customer_id = parseInt(faker.datatype.number({ min: 1, max: 25 }));
    return order;
});
const orderItems = createItems(55, createOrderItems);

/**
 * Create the table data.
 */
const tableData = [
    { table: 'user', data: users },
    { table: 'employee', data: employees },
    { table: 'dish', data: dishes },
    { table: 'dish_stock', data: dishStocks },
    { table: 'customer_order', data: orders },
    { table: 'order_item', data: orderItems },
];

/**
 * Create the SQL statements.
 * 
 */
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

/**
 * Create the SQL dump.
 * 
 */
const insertStatements = Object.entries(sqlStatements).map(([table, values]) => {
    const columns = values.columns.join(', ');
    const rows = values.values.join(',\n    ');
    return `INSERT INTO ${table} (${columns}) VALUES\n    ${rows};`;
});

/**
 * Write the SQL dump to a file.
 */
const db = new sqlite3.Database('database.db');
const newData = `PRAGMA foreign_keys = ON;\n${insertStatements.join('\n')}`;
fs.readFile('db_dump.sql', 'utf8', (err, data) => {
    if (err) {
        console.log(err);
        return;
    }

    const pragmaIndex = data.indexOf('PRAGMA foreign_keys = ON;');
    if (pragmaIndex !== -1) {
        data = data.substring(0, pragmaIndex);

        data = data.replace('PRAGMA foreign_keys = ON;\n', '');
        data += newData;
    }

    fs.writeFile('db_dump.sql', data, (err) => {
        if (err) {
            console.log(err);
            return;
        }
        console.log('db_dump.sql file updated');
    });

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