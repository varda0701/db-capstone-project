/* new view creation */
create view OrderDetail as select orderId, quantity, totalcost from orders;

select * from OrderDetail;

/* joins for detail of customers with total cost > 20 */
select c.customerid, firstname, lastname, orderid, totalcost, itemname, category from customers c 
inner join orders o on c.customerid = o.customerid 
inner join menu m on o.itemid = m.itemid where totalcost > 20;

/*suquery to get itemname which was ordered wih quantity greater than 2*/
select itemname from menu where itemid = any(select itemid from orders where quantity>2);

/* get max quantity */
create procedure GetMaxQuantity()
select max(quantity) as 'Max Quantity in Order' from orders;

call GetMaxQuantity();

/* prepared statement to get order details by a customer */
prepare GetOrderDetail from 'select orderid, quantity, totalcost from orders where customerid = ?';

set @id = 3;
execute GetOrderDetail using @id;

/* cancel order */
insert into orders(orderid, customerid, date, itemid, quantity, totalcost) values(3, 2, now(), 1, 1, 10);
delimiter //
create procedure CancelOrder(IN id int)
BEGIN
delete from orders where orderid = id;
select 'Order is cancelled' as 'Confirmation';
END 
//
delimiter ;
Call CancelOrder(3);