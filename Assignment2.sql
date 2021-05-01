create table Client_Master(Client_no varchar(6),Name varchar(20),Address1 varchar(30),Address2 varchar(30),City varchar(15),State varchar(15),Pincode number(6),Bal_Due number(10,2));
create table Product_Master(Product_No varchar(6),Description varchar(20),Profit_Percentage number(6),Unit_Measure varchar(10),Qty_On_Hand number(6),Reorder_Lvl number(6),Sell_Price number(7,2),Cost_price number(7,2));
alter table  Client_Master add( DOB  number(10));
alter table  Client_Master modify ( Client_no   number(6));
alter table Client_Master drop column DOB;
alter table Product_Master rename column Sell_Price to SellPrice;
alter table Product_Master rename to ProductMaster;
drop table Product_Master;
drop table Client_Master;
