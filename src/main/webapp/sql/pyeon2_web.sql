

select * from p2_gps;
select * from p2_location;


drop table p2_gps;
drop table p2_location;





create table p2_gps(
	area varchar2(30) primary key,
	address varchar2(50) not null,
	phone varchar2(15),
	b_hours varchar2(20) default '00:00 ~ 24:00'
);



create table p2_location(
	item_code varchar2(40) not null,
	area varchar2(30) not null,
	sector varchar2(30) not null,
	constraint location_pk  primary key(item_code, area)
);