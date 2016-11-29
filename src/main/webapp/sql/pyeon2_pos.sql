update p2_user set back_time = sysdate where userid = 'ch'


update p2_item set item_image = 'http://justliquor.com.au/512/hite-dry-finish-cans.jpg' where item_name = 'Hite Dry Finish 500ml 캔';
update p2_item set item_image = 'http://photo.jtbc.joins.com/news/2015/06/10/20150610070105487.jpg' where item_name = '참이슬 자몽에 이슬';
update p2_item set item_image = 'http://cdnweb01.wikitree.co.kr/webdata/editor/201411/17/img_20141117104024_a5983ded.jpg' where item_name = '참이슬 fresh';


update company_item set item_image = 'http://justliquor.com.au/512/hite-dry-finish-cans.jpg' where item_name = 'Hite Dry Finish 500ml 캔';
update company_item set item_image = 'http://photo.jtbc.joins.com/news/2015/06/10/20150610070105487.jpg' where item_name = '참이슬 자몽에 이슬';
update company_item set item_image = 'http://cdnweb01.wikitree.co.kr/webdata/editor/201411/17/img_20141117104024_a5983ded.jpg' where item_name = '참이슬 fresh';


ALTER TABLE roll RENAME TO role;

select * from p2_member;
select * from p2_item;
select * from p2_calc;
select * from p2_dayCalc;
select * from p2_weekCalc;
select * from p2_monthCalc;
select * from role;
select * from SAL;
select * from p2_daymoney;

drop table p2_member;
drop table p2_item;
drop table p2_calc;
drop table p2_dayCalc;
drop table p2_weekCalc;
drop table p2_monthCalc;
drop table roll;
drop table p2_local;
drop table sal;

alter table p2_member drop column post1;
alter table p2_member drop column post2;
alter table p2_member drop column addr1;
alter table p2_member drop column addr2;

alter table p2_member add postcode varchar2(20);
alter table p2_member add address varchar2(200);
alter table p2_member add address2 varchar2(200);

-- 아르바이트생 근무시간 오전/오후/야간 구분
insert into p2_member values('alba1', 1, 'alba1', 'user', '010', 20, '한국', '남', '정자동', '오전');
insert into p2_member values('alba2', 1, 'alba2', 'user', '010', 20, '한국', '남', '정자동', '오후');
insert into p2_member values('alba3', 1, 'alba3', 'user', '010', 20, '한국', '남', '정자동', '야간');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK101','하늘보리P280ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/79A4191B8B694F5090EAB3CF00A91F7A.jpg',1000,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK102','딸기우유250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/24310106D5B24CD7993ED05B43C4DD1F.jpg',1000,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK103','지파크캔250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3AE051F6D7E9439AAEFA45547DF0CB87.jpg',1500,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK104','드링킹복숭아310ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1800,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK105','네이처티라임모히또중',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056052997.jpg',2000,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK106','커피빈카페라떼P300',
'http://cdn2.bgfretail.com/bgfbrand/files/product/E801676D88D548D0A1B4D66C997C2990.jpg',2500,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK107','인삼한뿌리소병',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801007020945.jpg',4000,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK108','립톤복숭아중P',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056044534.jpg',1700,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK109','사과드링크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056020415.jpg',600,30,0,'음료','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK110','미에로210',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8806004382119.jpg',1350,30,0,'음료','판교');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK101','내마음속하트도넛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3F579498A3EC491D9DFBF6552A026D0D.jpg',1300,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK102','갈릭팡',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1200,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK103','ID미스터리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062317752.jpg',1200,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK104','오천자일리톨핑크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062215799.jpg',5000,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK105','쟈키쟈키1500',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801111770231.jpg',1500,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK106','자가비1700',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801019604997(1).jpg',1700,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK107','홀스체리맛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/01793CF6CF3C4E12AD502AB82DB2639E.jpg',1000,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK108','돌풍감자허니치즈',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EB8D2B992E1741A4BFE8E492BEB5FE23.jpg',1500,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK109','피카츄상큼패스츄리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/FC428DA0EB7C4601B9A35A23AC160B59.jpg',1200,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK110','크라운산도딸기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B8B39C2F0AD1423682543A004657254A.jpg',2400,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK111','오리온눈을감자56g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/02E8667DA3914498B4BDFFE057E7083E.jpg',1500,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK112','롯데몽쉘초코바나나',
'http://cdn2.bgfretail.com/bgfbrand/files/product/A5C2391155B54E41B6E704890972BB8E.jpg',4200,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK113','스피아민트스틱팩',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062320653.jpg',1000,30,0,'스낵','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK114','생후라보노',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801117627102.jpg',500,30,0,'스낵','판교');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT101','팔도탄탄면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/D747D62C269F4B678EC0238BC4C8B39D.jpg',1600,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT102','한성한입어묵60g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/778FD7ED5B924596A35D2EC40F6F2BE4.jpg',1000,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT103','팔도왕뚜껑',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4DCB16CD577F419E9F4117CA06FB3AE2.jpg',1050,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT104','삼양불닭볶음탕면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/F8E86E1F01504DCAA4781BD4E23109DC.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT105','오뚜기부대찌개라면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/185DB5F492444B4E9A1EA0EBCCA54B92.jpg', 1600,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT106','팔도김치도시락',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EC28F4E834F44BDE85B8148580D846D7.jpg',850,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT107','불고기사각피자96g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9D6D9061AA6345DF9DF74BA7D05CB74B.jpg',2800,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT108','오뚜기열떡볶이면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/CDFB85C9ACA94E4DAF7B54951F08C4C9.jpg',1400,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT109','오뚜기볶음진짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EE63A7E2CE854C9BB9716CCCCA805977.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT110','농심둥지비빔냉면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6214872FA1604352ADCEC82CE11D10C7.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT111','양반전통김',
'http://cdn2.bgfretail.com/bgfbrand/files/product/00F279D5DC324FCABD10450D23CA82D5.jpg',1300,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT112','컵반옐로우커리덮밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/E89308DBC6694851AADB7265B30A8077.jpg',3300,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT113','오뚜기볶음진짬뽕컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B6D39921CEEA4383B608A5A91E5736F9.jpg',1600,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT114','팔도팔도비빔면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/55290779F8724326AA910F9D627375D7.jpg',1050,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT115','오뚜기새우볶음밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6C34044F1D32465FBE94E2B6154EA8CC.jpg',3500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT116','하이면김맛우동',
'http://cdn2.bgfretail.com/bgfbrand/files/product/995FCA2EE0624FCB872979B438F3037D.jpg',2500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT117','팔도짜장면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B74268DE514C468CB20D5CEBA0EC8113.jpg',1500,30,0,'인스턴트','판교');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT118','농심신라면블랙봉지',
'http://cdn2.bgfretail.com/bgfbrand/files/product/934787B40C0E4F368FCF860F35FDC740.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT119','오뚜기옛날누룽지용기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/AB3611FC4BEA45CE91B3A7B4E582CA26.jpg',1800,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT120','팔도불짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4CCD22A75F634FCDB214D811BEE6A2C7.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT121','농심맛짬뽕큰사발',
'http://cdn2.bgfretail.com/bgfbrand/files/product/21DFE67AE2C54DE281519C9D2E0718C1.jpg',1500,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT122','오뚜기진라면순한컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9A3CD41FDF504629A452952AF1E8B514.jpg',950,30,0,'인스턴트','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT123','오뚜기진짜짱컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9C988E488F364A6FAD626C7E92255529.jpg',1500,30,0,'인스턴트','판교');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC101','참이슬 fresh',
'http://image.asiatoday.co.kr/file/310975(0)-%5E484%5E1033%5E.jpg',1400,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC102','처음처럼',
'http://www.bizwatch.co.kr/files/2014/02/19/90131d475483dc16998c041ccc708199170636.jpg',1400,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC103','참이슬 자몽에 이슬',
'http://image.newsis.com/2015/06/09/NISI20150609_0011033834_web.jpg',1500,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC104','처음처럼 순하리',
'https://image-proxy.namuwikiusercontent.com/r/http%3A%2F%2Fimg.tf.co.kr%2Farticle%2Fhome%2F2015%2F04%2F28%2F201534091430214707.jpg',1500,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC105','Hite 캔 500ml',
'http://callmart-gimpo.com/data/item/1440839029/thumb-7ZWY7J207Yq4500ml_300x300.jpg',2600,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC106','Hite Dry Finish 500ml 캔',
'http://file.hitejinro.com/hitejinro/Cust/Pres/dry_finish_d.jpg',2600,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC107','OB Primium 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838900/thumb-OB7ZSE66as6647JeE500ml_300x300.jpg',2600,30,0,'주류','판교');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC108','CASS FRESH 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838986/thumb-7Lm07Iqk500ml_300x300.jpg',2600,30,0,'주류','판교');



insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK101','하늘보리P280ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/79A4191B8B694F5090EAB3CF00A91F7A.jpg',1000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK102','딸기우유250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/24310106D5B24CD7993ED05B43C4DD1F.jpg',1000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK103','지파크캔250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3AE051F6D7E9439AAEFA45547DF0CB87.jpg',1500,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK104','드링킹복숭아310ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1800,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK105','네이처티라임모히또중',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056052997.jpg',2000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK106','커피빈카페라떼P300',
'http://cdn2.bgfretail.com/bgfbrand/files/product/E801676D88D548D0A1B4D66C997C2990.jpg',2500,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK107','인삼한뿌리소병',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801007020945.jpg',4000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK108','립톤복숭아중P',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056044534.jpg',1700,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK109','사과드링크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056020415.jpg',600,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK110','미에로210',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8806004382119.jpg',1350,30,0,'음료','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK101','내마음속하트도넛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3F579498A3EC491D9DFBF6552A026D0D.jpg',1300,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK102','갈릭팡',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK103','ID미스터리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062317752.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK104','오천자일리톨핑크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062215799.jpg',5000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK105','쟈키쟈키1500',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801111770231.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK106','자가비1700',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801019604997(1).jpg',1700,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK107','홀스체리맛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/01793CF6CF3C4E12AD502AB82DB2639E.jpg',1000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK108','돌풍감자허니치즈',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EB8D2B992E1741A4BFE8E492BEB5FE23.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK109','피카츄상큼패스츄리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/FC428DA0EB7C4601B9A35A23AC160B59.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK110','크라운산도딸기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B8B39C2F0AD1423682543A004657254A.jpg',2400,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK111','오리온눈을감자56g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/02E8667DA3914498B4BDFFE057E7083E.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK112','롯데몽쉘초코바나나',
'http://cdn2.bgfretail.com/bgfbrand/files/product/A5C2391155B54E41B6E704890972BB8E.jpg',4200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK113','스피아민트스틱팩',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062320653.jpg',1000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK114','생후라보노',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801117627102.jpg',500,30,0,'스낵','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT101','팔도탄탄면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/D747D62C269F4B678EC0238BC4C8B39D.jpg',1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT102','한성한입어묵60g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/778FD7ED5B924596A35D2EC40F6F2BE4.jpg',1000,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT103','팔도왕뚜껑',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4DCB16CD577F419E9F4117CA06FB3AE2.jpg',1050,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT104','삼양불닭볶음탕면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/F8E86E1F01504DCAA4781BD4E23109DC.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT105','오뚜기부대찌개라면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/185DB5F492444B4E9A1EA0EBCCA54B92.jpg', 1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT106','팔도김치도시락',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EC28F4E834F44BDE85B8148580D846D7.jpg',850,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT107','불고기사각피자96g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9D6D9061AA6345DF9DF74BA7D05CB74B.jpg',2800,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT108','오뚜기열떡볶이면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/CDFB85C9ACA94E4DAF7B54951F08C4C9.jpg',1400,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT109','오뚜기볶음진짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EE63A7E2CE854C9BB9716CCCCA805977.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT110','농심둥지비빔냉면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6214872FA1604352ADCEC82CE11D10C7.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT111','양반전통김',
'http://cdn2.bgfretail.com/bgfbrand/files/product/00F279D5DC324FCABD10450D23CA82D5.jpg',1300,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT112','컵반옐로우커리덮밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/E89308DBC6694851AADB7265B30A8077.jpg',3300,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT113','오뚜기볶음진짬뽕컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B6D39921CEEA4383B608A5A91E5736F9.jpg',1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT114','팔도팔도비빔면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/55290779F8724326AA910F9D627375D7.jpg',1050,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT115','오뚜기새우볶음밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6C34044F1D32465FBE94E2B6154EA8CC.jpg',3500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT116','하이면김맛우동',
'http://cdn2.bgfretail.com/bgfbrand/files/product/995FCA2EE0624FCB872979B438F3037D.jpg',2500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT117','팔도짜장면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B74268DE514C468CB20D5CEBA0EC8113.jpg',1500,30,0,'인스턴트','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT118','농심신라면블랙봉지',
'http://cdn2.bgfretail.com/bgfbrand/files/product/934787B40C0E4F368FCF860F35FDC740.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT119','오뚜기옛날누룽지용기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/AB3611FC4BEA45CE91B3A7B4E582CA26.jpg',1800,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT120','팔도불짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4CCD22A75F634FCDB214D811BEE6A2C7.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT121','농심맛짬뽕큰사발',
'http://cdn2.bgfretail.com/bgfbrand/files/product/21DFE67AE2C54DE281519C9D2E0718C1.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT122','오뚜기진라면순한컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9A3CD41FDF504629A452952AF1E8B514.jpg',950,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT123','오뚜기진짜짱컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9C988E488F364A6FAD626C7E92255529.jpg',1500,30,0,'인스턴트','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC101','참이슬 fresh',
'http://image.asiatoday.co.kr/file/310975(0)-%5E484%5E1033%5E.jpg',1400,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC102','처음처럼',
'http://www.bizwatch.co.kr/files/2014/02/19/90131d475483dc16998c041ccc708199170636.jpg',1400,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC103','참이슬 자몽에 이슬',
'http://image.newsis.com/2015/06/09/NISI20150609_0011033834_web.jpg',1500,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC104','처음처럼 순하리',
'https://image-proxy.namuwikiusercontent.com/r/http%3A%2F%2Fimg.tf.co.kr%2Farticle%2Fhome%2F2015%2F04%2F28%2F201534091430214707.jpg',1500,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC105','Hite 캔 500ml',
'http://callmart-gimpo.com/data/item/1440839029/thumb-7ZWY7J207Yq4500ml_300x300.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC106','Hite Dry Finish 500ml 캔',
'http://file.hitejinro.com/hitejinro/Cust/Pres/dry_finish_d.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC107','OB Primium 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838900/thumb-OB7ZSE66as6647JeE500ml_300x300.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC108','CASS FRESH 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838986/thumb-7Lm07Iqk500ml_300x300.jpg',2600,30,0,'주류','정자');



insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK101','하늘보리P280ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/79A4191B8B694F5090EAB3CF00A91F7A.jpg',1000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK102','딸기우유250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/24310106D5B24CD7993ED05B43C4DD1F.jpg',1000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK103','지파크캔250ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3AE051F6D7E9439AAEFA45547DF0CB87.jpg',1500,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK104','드링킹복숭아310ml',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1800,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK105','네이처티라임모히또중',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056052997.jpg',2000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK106','커피빈카페라떼P300',
'http://c/.dn2.bgfretail.com/bgfbrand/files/product/E801676D88D548D0A1B4D66C997C2990.jpg',2500,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK107','인삼한뿌리소병',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801007020945.jpg',4000,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK108','립톤복숭아중P',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056044534.jpg',1700,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK109','사과드링크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801056020415.jpg',600,30,0,'음료','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'DRINK110','미에로210',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8806004382119.jpg',1350,30,0,'음료','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK101','내마음속하트도넛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/3F579498A3EC491D9DFBF6552A026D0D.jpg',1300,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK102','갈릭팡',
'http://cdn2.bgfretail.com/bgfbrand/files/product/63CCF2C4D29E49AB9DC621595B072F4A.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK103','ID미스터리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062317752.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK104','오천자일리톨핑크',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062215799.jpg',5000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK105','쟈키쟈키1500',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801111770231.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK106','자가비1700',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801019604997(1).jpg',1700,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK107','홀스체리맛',
'http://cdn2.bgfretail.com/bgfbrand/files/product/01793CF6CF3C4E12AD502AB82DB2639E.jpg',1000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK108','돌풍감자허니치즈',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EB8D2B992E1741A4BFE8E492BEB5FE23.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK109','피카츄상큼패스츄리',
'http://cdn2.bgfretail.com/bgfbrand/files/product/FC428DA0EB7C4601B9A35A23AC160B59.jpg',1200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK110','크라운산도딸기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B8B39C2F0AD1423682543A004657254A.jpg',2400,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK111','오리온눈을감자56g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/02E8667DA3914498B4BDFFE057E7083E.jpg',1500,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK112','롯데몽쉘초코바나나',
'http://cdn2.bgfretail.com/bgfbrand/files/product/A5C2391155B54E41B6E704890972BB8E.jpg',4200,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK113','스피아민트스틱팩',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801062320653.jpg',1000,30,0,'스낵','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'SNACK114','생후라보노',
'http://cdn2.bgfretail.com/bgfbrand/files/product/8801117627102.jpg',500,30,0,'스낵','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT101','팔도탄탄면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/D747D62C269F4B678EC0238BC4C8B39D.jpg',1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT102','한성한입어묵60g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/778FD7ED5B924596A35D2EC40F6F2BE4.jpg',1000,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT103','팔도왕뚜껑',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4DCB16CD577F419E9F4117CA06FB3AE2.jpg',1050,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT104','삼양불닭볶음탕면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/F8E86E1F01504DCAA4781BD4E23109DC.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT105','오뚜기부대찌개라면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/185DB5F492444B4E9A1EA0EBCCA54B92.jpg', 1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT106','팔도김치도시락',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EC28F4E834F44BDE85B8148580D846D7.jpg',850,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT107','불고기사각피자96g',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9D6D9061AA6345DF9DF74BA7D05CB74B.jpg',2800,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT108','오뚜기열떡볶이면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/CDFB85C9ACA94E4DAF7B54951F08C4C9.jpg',1400,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT109','오뚜기볶음진짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/EE63A7E2CE854C9BB9716CCCCA805977.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT110','농심둥지비빔냉면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6214872FA1604352ADCEC82CE11D10C7.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT111','양반전통김',
'http://cdn2.bgfretail.com/bgfbrand/files/product/00F279D5DC324FCABD10450D23CA82D5.jpg',1300,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT112','컵반옐로우커리덮밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/E89308DBC6694851AADB7265B30A8077.jpg',3300,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT113','오뚜기볶음진짬뽕컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B6D39921CEEA4383B608A5A91E5736F9.jpg',1600,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT114','팔도팔도비빔면컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/55290779F8724326AA910F9D627375D7.jpg',1050,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT115','오뚜기새우볶음밥',
'http://cdn2.bgfretail.com/bgfbrand/files/product/6C34044F1D32465FBE94E2B6154EA8CC.jpg',3500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT116','하이면김맛우동',
'http://cdn2.bgfretail.com/bgfbrand/files/product/995FCA2EE0624FCB872979B438F3037D.jpg',2500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT117','팔도짜장면',
'http://cdn2.bgfretail.com/bgfbrand/files/product/B74268DE514C468CB20D5CEBA0EC8113.jpg',1500,30,0,'인스턴트','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT118','농심신라면블랙봉지',
'http://cdn2.bgfretail.com/bgfbrand/files/product/934787B40C0E4F368FCF860F35FDC740.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT119','오뚜기옛날누룽지용기',
'http://cdn2.bgfretail.com/bgfbrand/files/product/AB3611FC4BEA45CE91B3A7B4E582CA26.jpg',1800,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT120','팔도불짬뽕',
'http://cdn2.bgfretail.com/bgfbrand/files/product/4CCD22A75F634FCDB214D811BEE6A2C7.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT121','농심맛짬뽕큰사발',
'http://cdn2.bgfretail.com/bgfbrand/files/product/21DFE67AE2C54DE281519C9D2E0718C1.jpg',1500,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT122','오뚜기진라면순한컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9A3CD41FDF504629A452952AF1E8B514.jpg',950,30,0,'인스턴트','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'INSTANT123','오뚜기진짜짱컵',
'http://cdn2.bgfretail.com/bgfbrand/files/product/9C988E488F364A6FAD626C7E92255529.jpg',1500,30,0,'인스턴트','정자');

insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC101','참이슬 fresh',
'http://image.asiatoday.co.kr/file/310975(0)-%5E484%5E1033%5E.jpg',1400,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC102','처음처럼',
'http://www.bizwatch.co.kr/files/2014/02/19/90131d475483dc16998c041ccc708199170636.jpg',1400,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC103','참이슬 자몽에 이슬',
'http://image.newsis.com/2015/06/09/NISI20150609_0011033834_web.jpg',1500,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC104','처음처럼 순하리',
'https://image-proxy.namuwikiusercontent.com/r/http%3A%2F%2Fimg.tf.co.kr%2Farticle%2Fhome%2F2015%2F04%2F28%2F201534091430214707.jpg',1500,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC105','Hite 캔 500ml',
'http://callmart-gimpo.com/data/item/1440839029/thumb-7ZWY7J207Yq4500ml_300x300.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC106','Hite Dry Finish 500ml 캔',
'http://file.hitejinro.com/hitejinro/Cust/Pres/dry_finish_d.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC107','OB Primium 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838900/thumb-OB7ZSE66as6647JeE500ml_300x300.jpg',2600,30,0,'주류','정자');
insert into p2_item(bno,item_code,item_name,item_image,price,count,hit,category,area) values(p2_item_num.nextVal,'ALCOHOLIC108','CASS FRESH 500ml 캔',
'http://callmart-gimpo.com/data/item/1440838986/thumb-7Lm07Iqk500ml_300x300.jpg',2600,30,0,'주류','정자');




insert into p2_member(id,pwd,name,position,area) values ('admin','1','admin','admin','판교');
insert into p2_member(id,pwd,name,position,area) values ('mina','1','mina','manager','판교');
insert into p2_member(id,pwd,name,position,area) values ('ch','1','choungho','user','판교');
insert into p2_member(id,pwd,name,position,area) values ('repl','1','lws','manager','야탑');



insert into role values('admin', 'ROLE_ADMIN');
insert into role values('mina', 'ROLE_MANAGER');
insert into role values('ch', 'ROLE_USER');
insert into role values('repl', 'ROLE_MANAGER');


insert into p2_item values('1', 'beer', 'beer', '2200', '20', '0', 'drink', 'pangyo');
insert into p2_item values('2', 'beer2', 'beer2', '2200', '20', '0', 'drink', 'pangyo');
insert into p2_item values('3', 'beer3', 'beer3', '2200', '20', '0', 'drink', 'pangyo');
insert into p2_item values('4', 'beer4', 'beer4', '2200', '20', '0', 'drink', 'pangyo');


insert into p2_gps values('판교', '경기도 성남시 분당구 삼평동 682 유스페이스2 B동 8층', 'Pyeon2 판교점' ,'010-6666-8345');
insert into p2_gps values('정자', '경기도 성남시 분당구 정자동 166-1 101호', 'Pyeon2 정자점' , '010-5581-0156');
insert into p2_gps values('야탑', '경기 성남시 분당구 야탑동 355-4 한주코아제상가동', 'Pyeon2 야탑점' , '010-3131-7995');


drop table p2_gps;

select * from 

create table p2_gps(
	area varchar2(30) not null,
	address varchar2(500) not null,
	place varchar2(100) not null,
	phone varchar2(20)
);


CREATE TABLE ROLE(
	ID VARCHAR2(20 BYTE), 	
	ROLE_NAME VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE ;



create table p2_monthCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint monthCalc_pk  primary key(item_code, area)
);


create table p2_weekCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	p2_time date DEFAULT SYSDATE,
	constraint weekCalc_pk  primary key(item_code, area)
);


insert into p2_item(item_code,item_name,item_image,price,count,hit,category,area) values('123','아이스크림','afjlghafjoghaon',2500,5,5,'빙과류','sss')
create table p2_item(
	bno number,
	item_code varchar2(40) not null, 
	item_name varchar2(60) not null, 
	item_image varchar2(500), 
	price number(10) not null, 
	count number(10), 
	hit number(5), 
	category varchar2(20), 
	area varchar2(30) not null,
	constraint item_pk  primary key(item_code, area)
);

drop sequence p2_item_num;

create sequence p2_item_num
   increment by 1
   start with 1
   nocache;

create table p2_member(
	id varchar2(20) not null,
	pwd varchar2(30) not null,
	name varchar2(30) not null,
	position varchar2(20) not null,
	phone varchar2(20),
	age varchar2(20), 
	address varchar2(50),
	gender varchar2(10),
	area varchar2(30) not null,
	constraint member_pk  primary key(id, area)
);

drop table sal

create table sal(
	sold varchar2(10) not null,
	pay number(10) not null,
	paynum number(10) not null,
	sal_time varchar2(30),
	sys_time date default sysdate,
	area varchar2(30) not null
);
create sequence paynum
   increment by 1
   start with 1
   nocache;

drop sequence paynum


create table p2_calc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	constraint calc_pk  primary key(item_code, area)
);


create table p2_dayCalc(
	item_code varchar2(40) not null, 
	item_name varchar2(30) not null, 
	price number(10) not null, 
	count number(10), 
	category varchar2(20), 
	area varchar2(30) not null,
	num number(10) not null,
	p2_time varchar2(30),
	sys_time date default sysdate,
	constraint dayCalc_pk  primary key(item_code, area,sys_time)
);
drop table p2_daymoney
create table p2_daymoney(
	bno number(10),
	num number(10),
	title varchar2(20) not null,
	content varchar2(10) not null,
	pay number(10) not null,
	area varchar2(30) not null,
	year varchar2(20) not null,
	month varchar2(20) not null,
	days varchar2(20) not null,
	dayda date
);
create sequence p2_daymoney_num
   increment by 1
   start with 1
   nocache;
