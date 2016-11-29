
select userid,year,month,sum(hour) as hour,sum(money) as money from p2_userMoney where userid='ch' group by userid,year,month order by userid,year,month;      --user

-- 알바가 자기것만 
select userid,year,month,sum(hour) as hour,sum(money) as money from p2_userMoney where userid='ch' and year='2016' and month = '11' group by userid,year,month order by userid,year,month;  --user검색

-- 지점장이 전부
select userid,year,month,sum(hour) as hour,sum(money) as money from p2_userMoney group by userid,year,month order by userid,year,month;         --meniger

-- 지점장이 년 월을 선택해서 그 달에 일한 알바생들 전부 출력
select userid,year,month,sum(hour) as hour,sum(money) as money from p2_userMoney where year='2016' and month ='12' group by userid,year,month order by userid,year,month;    --메니져 연원 검색


select * from p2_user;
select * from p2_userMoney;


drop table p2_user;
drop table p2_userMoney;


alter table p2_member drop column address;
alter table p2_member add addr1 varchar2(200);
alter table p2_member add addr2 varchar2(200);

create table p2_user(
	userid varchar2(30),
	go_time date,
	back_time date,
	area varchar2(30) not null
)

select * from p2_userMoney where userid ='ch' and month = (SELECT TO_CHAR(go_time, 'MM' ) as month FROM p2_user where userid = 'ch') 

where month = (SELECT TO_CHAR(go_time, 'MM' ) as month FROM p2_user where userid = 'mina') 




select * from p2_userMoney where month = (SELECT TO_CHAR(go_time, 'MM' ) as month FROM p2_user where area = '판교')



insert into p2_user(userid , go_time) values ('지상동',sysdate)
insert into p2_user(userid , go_time, area) values ('mina',sysdate, '판교');
insert into p2_user(userid , go_time, area) values ('ch',sysdate, '판교');



update p2_user set go_time = sysdate where userid = '지상동'          --출근시간
update p2_user set back_time = sysdate where userid = '지상동'        --퇴근시간

SELECT ROUND((back_time-go_time)*24) FROM p2_user where userid = '지상동';        --시간계산 
SELECT ROUND((back_time-go_time)*24)*5000 FROM p2_user where userid = '지상동';   --시금계산

create table p2_userMoney(
	year varchar2(10),
	month varchar2(10),
	day varchar2(10),
	userid varchar2(30),
	hour number(5),
	money number(5),
	area varchar2(30) not null
)


SELECT TO_CHAR(back_time, 'YYYY' ) AS year FROM p2_user where userid = '지상동';    --년

SELECT TO_CHAR(back_time, 'MM' ) AS month FROM p2_user where userid = '지상동';      --월

SELECT TO_CHAR(back_time, 'dd' ) AS day FROM p2_user where userid = '지상동';      --일

delete from p2_userMoney
--------------------------------------------------------시급 계산 insert-------------------------------------------------------------------
insert into p2_userMoney(year,month,day,userid,hour,money) values ((SELECT TO_CHAR(go_time, 'YYYY' ) as year FROM p2_user where userid = '지상동'),
(SELECT TO_CHAR(go_time, 'MM' ) as month FROM p2_user where userid = '지상동') ,(SELECT TO_CHAR(go_time, 'dd' ) as day FROM p2_user where userid = '지상동'),
'지상동',(SELECT ROUND((back_time-go_time)*24) as hour FROM p2_user where userid = '지상동'),(SELECT ROUND((back_time-go_time)*24)*5000 as money FROM p2_user where userid = '지상동'))
---------------------------------------------------------------------------------------------------------------------------------------