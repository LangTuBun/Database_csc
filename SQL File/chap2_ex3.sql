#5
select count(orderid) as cnt_order , count(requireddate) as cnt_1, sum(case when shippeddate is null then 1 else 0 end) as cnt_2,
		count(requireddate) / count(orderid) as cnt_1_rate, sum(case when shippeddate is null then 1 else 0 end) / count(orderid) as cnt_2_rate
from orders