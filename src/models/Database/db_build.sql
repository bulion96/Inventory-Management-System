BEGIN;

DROP TABLE IF EXISTS users cascade;
DROP TABLE IF EXISTS inventories cascade;
DROP TABLE IF EXISTS goods cascade;
DROP TABLE IF EXISTS transactions cascade;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(20) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  role VARCHAR(50) NOT NULL,
  username VARCHAR(20) UNIQUE NOT NULL,
  password VARCHAR NOT NULL
);

CREATE TABLE inventories(
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) UNIQUE NOT NULL,
  location VARCHAR(250) NOT NULL,
  capacity VARCHAR(250) NOT NULL,
  status VARCHAR(250) NOT NULL DEFAULT 'فارغ' ,
  user_id INTEGER REFERENCES users (id)
);

CREATE TABLE goods (
  id SERIAL PRIMARY KEY,
  name VARCHAR(250) NOT NULL,
  quantity INTEGER,
  type VARCHAR(250),
  charge_date DATE NOT NULL DEFAULT CURRENT_DATE,
  image VARCHAR(500) NOT NULL,
  expiry_date DATE NOT NULL DEFAULT CURRENT_DATE,
  inventory_id INTEGER REFERENCES inventories(id)
);

CREATE TABLE transactions (
  id SERIAL PRIMARY KEY,
  transaction_type VARCHAR NOT NULL,
  transaction_date DATE NOT NULL,
  quantity INTEGER NOT NULL,
  inventory_id INTEGER REFERENCES inventories(id),
  good_name VARCHAR(250) NOT NULL,
  good_type VARCHAR(250) NOT NULL
);

-- INSERT INTO users (name, email, role, username, password) VALUES
--          ('سهاد دادر', 'sohadwd9@gmail.com', ' مالك المستودع ' ,
--           ' سهاد ' ,
--           '555'
-- );
--
-- INSERT INTO inventories (name, location, capacity, status, user_id) VALUES
--         ('  مستودع النصر ' ,
--         ' شارع النصر ' ,
--       300 ,
--     ' ممتلئ ' ,
--   1);
--
--   INSERT INTO goods (name, quantity, type, charge_date, image, expiry_date, inventory_id) VALUES
--           (' قميص ',
--           70,
--         ' قطن ',
--         CURRENT_DATE,
--         'dsfsdfmsdvxcvxc',
--         CURRENT_DATE,
--       1);
--
-- INSERT INTO transactions(transaction_type, transaction_date , quantity , inventory_id , good_name , good_type) VALUES
--                         ('إضافة',CURRENT_DATE , 5 , 1
--                            , 'قميص' , 'قطن'
--                         );

COMMIT;
