#1
select country from customers order by country ;

#2
select city from customers where country = 'France' order by city;
 
 #3
 select * from suppliers where contactname = 'Holm, Michael';
 select * from products where supplierid = (select supplierid from suppliers where contactname = 'Holm, Michael');
 
#4
select * from products where  discontinued is true order by unitprice desc;

#5 
select * from categories;

#6
select productname,  unitprice from products where categoryid = 1
order by unitprice desc;

#7
select orderid, orderdate, requireddate, shipcountry from orders 
order by requireddate desc
limit 10;

#8 
select orderid, orderdate, requireddate, shipcountry from orders where shippeddate is null
order by orderdate desc
limit 10;

#9
select orderid, orderdate, requireddate from orders where shippeddate is null and shipcountry = 'Germany'
order by orderdate desc;

#10
select orderid, orderdate, requireddate, shipcountry from orders 
where orderdate >= '2008-01-01'
  AND orderdate < '2008-07-01' AND shippeddate is null
order by shipcountry






