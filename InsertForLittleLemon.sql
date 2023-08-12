show databases;
use littlelemondb;

/* insert statements for customers table */
insert into customers(customerid, firstname, lastname, email, contactno) values(1, 'Varda', 'Desai', 'abc@123', 12345678);
insert into customers(customerid, firstname, lastname, email, contactno) values(2, 'ABC', 'ABC', 'aabbcc@123', 123456789);
insert into customers(customerid, firstname, lastname, email, contactno) values(3, 'XYZ', 'ABC', 'xaybzc@123', 1123456789);

/* insert statements for menu table */
insert into menu(itemid, itemname, category, price) values(1, 'pizza', 'italian', 10);
insert into menu(itemid, itemname, category, price) values(2, 'coffee', 'drink', 8);
insert into menu(itemid, itemname, category, price) values(3, 'pasta', 'italian', 11);
insert into menu(itemid, itemname, category, price) values(4, 'brownie', 'dessert', 13);

/* insert statements for staff table */
insert into staff(staffid, firstname, lastname, contactno, Role, salary) values(1, 'aa', 'bb', 888765, 'waiter', 800);
insert into staff(staffid, firstname, lastname, contactno, Role, salary) values(2, 'cc', 'dd', 9999090, 'cook', 1000);

/* insert statements for bookings table */
insert into bookings(bookingid, date, tablenumber, customerid) values(1, now(), 11, 1);
insert into bookings(bookingid, date, tablenumber, customerid) values(2, now(), 8, 3);

/* insert statements for orders table */
insert into orders(orderid, customerid, date, itemid, quantity, totalcost) values(1, 1, now(), 2, 5, 40);
insert into orders(orderid, customerid, date, itemid, quantity, totalcost) values(2, 3, now(), 4, 1, 13);

/* insert statements for Deliverystatus table */
insert into deliverystatus(orderid, deliverystatus, deliverydate, deliverystaff) values(1, 'delivered', now(), 1);
