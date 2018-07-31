--ProblemSet01, July<31>2018
--Submission by<praveen.b.selvaraj@accenture.com>
create table Hotel_table(Hotel_no text primary key,name text,city text);

insert into Hotel_table(Hotel_no,name,city) values('H111','Empire Hotel','New York');
insert into Hotel_table(Hotel_no,name,city) values('H235','Park Place','New York');
insert into Hotel_table(Hotel_no,name,city) values('H432','Brownstone Hotel','Toronto');
insert into Hotel_table(Hotel_no,name,city) values('H498','James Plaza','Toronto');
insert into Hotel_table(Hotel_no,name,city) values('H193','Devon Hotel','Boston');
insert into Hotel_table(Hotel_no,name,city) values('H437','Calirmont Hotel','Boston');

create table Room_table(Room_no numeric,Hotel_no Text references Hotel_table(Hotel_no) ,Type varchar(2),Price numeric,constraint pk_key primary key(Room_no,Hotel_no));

insert into Room_table(Room_no,Hotel_no,type,price) values(313,'H111','S',145.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(412,'H111','N',145.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(1267,'H235','N',175.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(1289,'H235','N',195.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(876,'H432','S',124.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(898,'H432','S',124.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(345,'H498','N',160.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(467,'H498','N',180.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(1001,'H193','S',150.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(1201,'H193','N',175.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(257,'H437','N',140.00);
insert into Room_table(Room_no,Hotel_no,type,price) values(223,'H437','S',155.00);

create table Guest_table(Guest_no varchar(20) primary key,name varchar(25),city varchar(20));

insert into Guest_table(Guest_no,name,city) values('G256','Adam Wayne','Pittsburgh');
insert into Guest_table(Guest_no,name,city) values('G367','Tara Cummings','Baltimore');
insert into Guest_table(Guest_no,name,city) values('G879','Vanessa Parry','Pittsburgh');
insert into Guest_table(Guest_no,name,city) values('G230','Tom Hancock','Philadelphia');
insert into Guest_table(Guest_no,name,city) values('G467','Robert Swift','Atlanta');
insert into Guest_table(Guest_no,name,city) values('G190','Edward Cane','Baltimore');

create table Booking_table(Hotel_no text references Room_table(Hotel_no),Guest_no varchar(20) references Guest_table(Guest_no),Date_From varchar(20),Date_To varchar(20),Room_no numeric references Room_table(Room_no));

insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H111','G256','10-AUG-99','15-AUG-99',412);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H111','G367','18-AUG-99','21-AUG-99',412);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H235','G879','05-SEP-99','12-SEP-99',1267);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H498','G230','15-SEP-99','18-SEP-99',467);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H498','G256','30-NOV-99','02-DEC-99',345);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H498','G467','03-NOV-99','05-NOV-99',345);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H193','G190','15-NOV-99','19-NOV-99',1001);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H193','G367','12-SEP-99','14-SEP-99',1001);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H193','G367','01-OCT-99','06-OCT-99',1201);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H437','G190','04-OCT-99','06-OCT-99',223);
insert into Booking_table(Hotel_no,Guest_no,Date_From,Date_To,Room_no) values('H437','G879','14-SEP-99','17-SEP-99',223);

1.List full details of all hotels.

select * from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no;

H111|Empire Hotel|New York|313|H111|S|145
H111|Empire Hotel|New York|412|H111|N|145
H235|Park Place|New York|1267|H235|N|175
H235|Park Place|New York|1289|H235|N|195
H432|Brownstone Hotel|Toronto|876|H432|S|124
H432|Brownstone Hotel|Toronto|898|H432|S|124
H498|James Plaza|Toronto|345|H498|N|160
H498|James Plaza|Toronto|467|H498|N|180
H193|Devon Hotel|Boston|1001|H193|S|150
H193|Devon Hotel|Boston|1201|H193|N|175
H437|Calirmont Hotel|Boston|257|H437|N|140
H437|Calirmont Hotel|Boston|223|H437|S|155

Record Count=12

2.List full details of all hotels in New York.

select * from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where City='New York';

H111|Empire Hotel|New York|313|H111|S|145
H111|Empire Hotel|New York|412|H111|N|145
H235|Park Place|New York|1267|H235|N|175
H235|Park Place|New York|1289|H235|N|195

Record Count=4

3.List the names and cities of all guests, ordered according to their cities.

Select name,City from Guest_table order by City;

Robert Swift|Atlanta
Tara Cummings|Baltimore
Edward Cane|Baltimore
Tom Hancock|Philadelphia
Adam Wayne|Pittsburgh
Vanessa Parry|Pittsburgh

Record Count=6

4.List all details for non-smoking rooms in ascending order of price.

Select * from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where type='N' order by Price;

H437|Calirmont Hotel|Boston|257|H437|N|140
H111|Empire Hotel|New York|412|H111|N|145
H498|James Plaza|Toronto|345|H498|N|160
H235|Park Place|New York|1267|H235|N|175
H193|Devon Hotel|Boston|1201|H193|N|175
H498|James Plaza|Toronto|467|H498|N|180
H235|Park Place|New York|1289|H235|N|195

Record Count=7

5.List the number of hotels there are.

select count(Hotel_no) from Hotel_table;

6

Record Count=1

6.List the cities in which guests live. Each city should be listed only once.

select distinct(City) from Guest_table;

Pittsburgh
Baltimore
Philadelphia
Atlanta

Record Count=4


7.List the average price of a room.

select avg(Price) from Room_table;

155.666666666667

Record Count=1

8.List hotel names, their room numbers, and the type of that room.

select name,Room_no,Type from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no;

Empire Hotel|313|S
Empire Hotel|412|N
Park Place|1267|N
Park Place|1289|N
Brownstone Hotel|876|S
Brownstone Hotel|898|S
James Plaza|345|N
James Plaza|467|N
Devon Hotel|1001|S
Devon Hotel|1201|N
Calirmont Hotel|257|N
Calirmont Hotel|223|S

Record Count=12

9.List the hotel names, booking dates, and room numbers for all hotels in New York

select name,Date_From,Date_To,Room_no from Hotel_table H inner join Booking_table B on H.Hotel_no=B.Hotel_no where City='New York';

Empire Hotel|10-AUG-99|15-AUG-99|412
Empire Hotel|18-AUG-99|21-AUG-99|412
Park Place|05-SEP-99|12-SEP-99|1267

Record Count=3

10.What is the number of bookings that started in the month of September?

Select count(*) from Booking_table where Date_from like'%SEP%';

4

Record Count=1

11.List the names and cities of guests who began a stay in New York in August.

select name,city from Guest_table G inner join Booking_table B on G.Guest_no=B.Guest_no where Hotel_no=(Select Hotel_no from Hotel_table where city='New York')and Date_From Like '%AUG%';

Adam Wayne|Pittsburgh
Tara Cummings|Baltimore

Record Count=2

12.List the hotel names and room numbers of any hotel rooms that have not been booked.

select name,R.Room_no from Hotel_table H Inner join Room_table R on H.Hotel_no=R.Hotel_no where Room_no Not in(select room_no from Booking_table);

Calirmont Hotel|257
Empire Hotel|313
Brownstone Hotel|876
Brownstone Hotel|898
Park Place|1289

Record Count=5

13.List the hotel name and city of the hotel with the highest priced room.

select name,city from Hotel_table H inner join Room_table R on H.Hotel_no=R.hotel_no where price=(select max(price) from Room_table);

Park Place|New York

Record Count=1

14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.

select name,Room_no,city,price from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where price<(select min(price) from Room_table R inner join Hotel_table H on R.Hotel_no=H.Hotel_no where city='BOSTON');

Brownstone Hotel|876|Toronto|124
Brownstone Hotel|898|Toronto|124

Record Count=2

15.List the average price of a room grouped by city.

select avg(price),city from Hotel_table H inner join Room_table R on H.hotel_no=R.Hotel_no group by city;

155.0|Boston
165.0|New York
147.0|Toronto

Record Count=3
