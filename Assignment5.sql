create table Sales_Master(Salesman_no varchar2(6) Primary key CHECK(salesman_no LIKE 's%'),Sal_name varchar2 (20) Not null,Address varchar2 (20) Not null,City varchar2 (20),State varchar2(20),Pincode Number (6), 
    Sal_Amount number(8,2)NOT NULL, tgt_to_get number(6,2)NOT NULL,ytd_sales number(6,2)NOT NULL,remarks varchar2(30),CHECK(tgt_to_get !=0),CHECK(sal_amount !=0),CHECK(ytd_sales!=0 ));

create table Sales_Order(s_order_no varchar2(6) Primary Key,s_order_date date,client_no varchar2(6),salesman_no varchar2(6),dely_type char(1) default('f'),
    billed_yn char(1),dely_date date,order_status varchar2(10),CHECK(s_order_date<dely_date),CHECK(order_status IN('inprocess','fulfilled','backorder','canceled')),
   CHECK(dely_type IN('p','f')));

create table Sales_Order_Details(s_order_no varchar2(6)PRIMARY KEY,product_no varchar2(6),qty_no number(8),qty_disp number(8),product_rate number(10,2), FOREIGN KEY(s_order_no )REFERENCES Sales_Order);

insert into Sales_Master values('s00001','Kiran','A/14 worli','Mumbai','Mah',400002,3000,100,50,'Good');
insert into Sales_Master values('s00002','Manish','65,nariman','Mumbai','Mah',400001,3000,200,100,'Good');
insert into Sales_Master values('s00003','Ravi','P-7 Bandra','Mumbai','Mah',400032,3000,200,100,'Good');
insert into Sales_Master values('s00004','Ashish','A/5 Juhu Bombay','Mumbai','Mah',400044,3500,200,150,'Good');

insert into Sales_Order values(019001,'12-jan-96',0001,500001,'f','N','20-jan-96','inprocess');
insert into Sales_Order values(019002,'25-jan-96',0002,500002,'p','N','27-jan-96','canceled');
insert into Sales_Order values(016865,'18-feb-96',0003,500003,'f','Y','20-feb-96','fulfilled');
insert into Sales_Order values(019003,'03-apr-96',0001,500001,'f','Y','07-apr-96','fulfilled');
insert into Sales_Order values(046866,'20-may-96',0004,500002,'p','N','22-may-96','canceled');
insert into Sales_Order values(010008,'24-may-96',0005,500004,'f','N','26-may-96','inprocess');

insert into Sales_Order_Details values(019001,'P00001',4,4,525);
insert into Sales_Order_Details values(019001,'P07965',2,1,8400);
insert into Sales_Order_Details values(019001,'P07885',2,1,5250);
insert into Sales_Order_Details values(019002,'P00001',10,0,525);
insert into Sales_Order_Details values(046865,'P07868',3,3,3150);
insert into Sales_Order_Details values(046865,'P07885',10,10,5250);
insert into Sales_Order_Details values(019003,'P00001',4,4,1050);
insert into Sales_Order_Details values(019003,'P03453',2,2,1050);
insert into Sales_Order_Details values(046866,'P06734',1,1,12000);
insert into Sales_Order_Details values(046866,'P07965',1,0,8400);
insert into Sales_Order_Details values(010008,'P07975',1,0,1050);
insert into Sales_Order_Details values(010008,'P00001',10,5,525);

select * from Sales_Master;
select * from Sales_Order;
select * from Sales_Order_Details;

alter table Sales_Order add Primary Key(client_no);
alter table Sales_Order add (phone_no varchar(10));
alter table Sales_Master modify (Pincode Number (6) not null);
alter table Sales_Master modify (Pincode Number (10));
select Salesman_no, Sal_Amount from Sales_Master where  Sal_Amount between 2000 and 3100;
