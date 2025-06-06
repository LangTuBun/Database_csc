SET SQL_SAFE_UPDATES = 0;
update employees
set commission_pct = null
where commision_pct = '';
SET SQL_SAFE_UPDATES =1;
select * 
from employees
where commission_pct = null;
