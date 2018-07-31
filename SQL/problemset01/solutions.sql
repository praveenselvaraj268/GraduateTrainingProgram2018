--ProblemSet01, July<31>2018
--Submission by<praveen.b.selvaraj@accenture.com>

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

2.List full details of all hotels in New York.

select * from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where City='New York';

H111|Empire Hotel|New York|313|H111|S|145
H111|Empire Hotel|New York|412|H111|N|145
H235|Park Place|New York|1267|H235|N|175
H235|Park Place|New York|1289|H235|N|195

3.List the names and cities of all guests, ordered according to their cities.

Select name,City from Guest_table order by City;

Robert Swift|Atlanta
Tara Cummings|Baltimore
Edward Cane|Baltimore
Tom Hancock|Philadelphia
Adam Wayne|Pittsburgh
Vanessa Parry|Pittsburgh

4.List all details for non-smoking rooms in ascending order of price.

Select * from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where type='N' order by Price;

H437|Calirmont Hotel|Boston|257|H437|N|140
H111|Empire Hotel|New York|412|H111|N|145
H498|James Plaza|Toronto|345|H498|N|160
H235|Park Place|New York|1267|H235|N|175
H193|Devon Hotel|Boston|1201|H193|N|175
H498|James Plaza|Toronto|467|H498|N|180
H235|Park Place|New York|1289|H235|N|195

5.List the number of hotels there are.

select count(Hotel_no) from Hotel_table;

6

6.List the cities in which guests live. Each city should be listed only once.

select distinct(City) from Guest_table;

Pittsburgh
Baltimore
Philadelphia
Atlanta

7.List the average price of a room.

select avg(Price) from Room_table;

155.666666666667

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

9.List the hotel names, booking dates, and room numbers for all hotels in New York

select name,Date_From,Date_To,Room_no from Hotel_table H inner join Booking_table B on H.Hotel_no=B.Hotel_no where City='New York';

Empire Hotel|10-AUG-99|15-AUG-99|412
Empire Hotel|18-AUG-99|21-AUG-99|412
Park Place|05-SEP-99|12-SEP-99|1267

10.What is the number of bookings that started in the month of September?

Select count(*) from Booking_table where Date_from like'%SEP%';

4

11.List the names and cities of guests who began a stay in New York in August.

select name,city from Guest_table G inner join Booking_table B on G.Guest_no=B.Guest_no where Hotel_no=(Select Hotel_no from Hotel_table where city='New York')and Date_From Like '%AUG%';

Adam Wayne|Pittsburgh
Tara Cummings|Baltimore

12.List the hotel names and room numbers of any hotel rooms that have not been booked.

select name,R.Room_no from Hotel_table H Inner join Room_table R on H.Hotel_no=R.Hotel_no where Room_no Not in(select room_no from Booking_table);

Calirmont Hotel|257
Empire Hotel|313
Brownstone Hotel|876
Brownstone Hotel|898
Park Place|1289

13.List the hotel name and city of the hotel with the highest priced room.

select name,city from Hotel_table H inner join Room_table R on H.Hotel_no=R.hotel_no where price=(select max(price) from Room_table);

Park Place|New York

14.List hotel names, room numbers, cities, and prices for hotels that have rooms with prices lower than the lowest priced room in a Boston hotel.

select name,Room_no,city,price from Hotel_table H inner join Room_table R on H.Hotel_no=R.Hotel_no where price<(select min(price) from Room_table R inner join Hotel_table H on R.Hotel_no=H.Hotel_no where city='BOSTON');

Brownstone Hotel|876|Toronto|124
Brownstone Hotel|898|Toronto|124

15.List the average price of a room grouped by city.

select avg(price),city from Hotel_table H inner join Room_table R on H.hotel_no=R.Hotel_no group by city;

155.0|Boston
165.0|New York
147.0|Toronto
