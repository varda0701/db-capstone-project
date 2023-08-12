/* bookings table as givn in the course */
delete from bookings;
insert into bookings(bookingid, date, tablenumber, customerid) values(1, date('2022-10-10'), 5, 1);
insert into bookings(bookingid, date, tablenumber, customerid) values(2, date('2022-11-12'), 3, 3);
insert into bookings(bookingid, date, tablenumber, customerid) values(3, date('2022-10-11'), 2, 2);
insert into bookings(bookingid, date, tablenumber, customerid) values(4, date('2022-10-13'), 2, 1);

select * from bookings;

/* checkBooking procedure */
delimiter //
create procedure CheckBooking(IN bdate datetime, IN tableno int)
begin
set @bid = (select bookingid from bookings where date = bdate and tablenumber = tableno);
if @bid is not null then
	select 'Table is already booked' as 'Booking Status';
else
	select 'Table is available' as 'Booking Status';
end if;
end
//
delimiter ;
Call checkbooking('2022-10-13',2);

/* add valid booking procedure*/
delimiter //
create procedure AddValidBooking(In bdate datetime, in tableno int, in custid int)
begin
Start transaction ;
	set @bid = (select max(bookingid) from bookings);
    set @booking = (select bookingid from bookings where date = bdate and tablenumber = tableno);
	insert into bookings(bookingid, date, tablenumber, customerid) values(@bid+1, bdate, tableno, custid); 
    if @booking is null then
    select 'Booking confirmed.' as 'Booking status';
    commit;
    else 
    select 'table is already booked. Booking cancelled' as 'Booking status';
    rollback;
    end if;
end
//
delimiter ;
call addvalidbooking('2022-10-13',6, 1);
call addvalidbooking('2022-10-13',6, 3);

/* addbooking procedure*/
delimiter //
create procedure addbooking(in bid int, in custid int, in bdate datetime, in tableno int)
begin
insert into bookings(bookingid, customerid, date, tablenumber) value(bid, custid, bdate, tableno);
select 'New booking added' as Confirmation;
end
//
delimiter ;
call addbooking(9, 3, '2022-12-30', 4);

/* update bookings procedure */
delimiter //
create procedure updatebooking(in bid int, in bdate datetime)
begin
update bookings set date = bdate where bookingid = bid;
select 'Booking is updated' as Confirmation;
end
//
delimiter ;
call updatebooking(9, '2022-12-14');

/* cancel booking procedure */
delimiter //
create procedure cancelbooking(in bid int)
begin
delete from bookings where bookingid = bid;
select 'Booking cancelled' as confirmation;
end
//
delimiter ;
call cancelbooking(9);