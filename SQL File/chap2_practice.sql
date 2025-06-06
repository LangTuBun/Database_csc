SELECT countrycode, CountryName FROM country;
select * from medals;

-- liệt kê các quốc gia có tham gia thế vận hội
select distinct countrycode from medals 
where countrycode != '';

-- liệt kê các năm tổ chức thế vận hội
select count(distinct year) from medals as memaybeo;

#liệt kê các quốc gia có id < 5
select * from country where id  <5;

#liệt kê của quốc gia việt nam
select * from medals where countrycode = 'vie';

#liệt kê danh sách từ năm 2000 tới 2008
select Athlete from medals where year >= 2000 and year <=2008;
select * from medals where year between 2000 and 2008;

#danh sách các vận động viên tham guia đạt huy chương vào các năm 2000,2004,2008
select * from medals where year in (2000,2004,2008);

#liệt kê danh sách các quốc gia có tên bắt đầu bằng chữ A
select * from country 
where countryname like '^A.*s$';



#liệt kê danh sách các nhân vieen không có commission_pct
select * from employees where COMMISSION_PCT is null;

#sắp xếp các nhân viên theo mức lương giảm dần 
select * from employees order by DEPARTMENT_ID asc, SALARY desc;

select * from employees group by DEPARTMENT_ID ;

select sum(salary) as Total_salary,
		avg(salary) AS lương_trung_bình,
        max(salary) as 'Lương cao nhất',
        min(salary) as 'Lương thấp nhất'
        
from employees;
 #AGGRERATE FUNCITONS
 
SELECT CountryCode, SUM(CASE WHEN Medal = 'gold' THEN 1 ELSE 0 END) AS gold_sum, SUM(CASE WHEN Medal = 'silver' THEN 1 ELSE 0 END) AS gold_sum,SUM(CASE WHEN Medal = 'bronze' THEN 1 ELSE 0 END) AS gold_sum
FROM medals where year = 2012 & year != ''
GROUP BY CountryCode;


select extract(year from hire_date) as nam_vao_lam,
count(*) as 'số nhan vien', sum(salary) as tong_luong, avg(salary) as trung_binh_luong
from employees
group by nam_vao_lam
having count(*) >= 10;



#STRING FUNCTIONS
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees; 
SELECT UPPER(first_name) FROM employees;

#NUMERIC FUNTIONS
SELECT ABS(-5) AS absolute_value;
SELECT ROUND(salary, 2) AS rounded_salary FROM employees;

#DATEFUNCTIONS
SELECT ROUND(salary, 2) AS rounded_salary FROM employees;
SELECT DATEDIFF(CURDATE() , hire_date) AS days_worked FROM employees;

#liệt kê dan ách tổn số huy chương mà mỗi quốc gia đạt được trong năm 2012
select countrycode ,count(*) as number_of_medals
from medals
where year =2012 and countrycode != ''
group by countrycode;
#liệt kê dan ách tổng số huy chương từng loại mà mỗi quốc gia đạt được trong năm 2012
select CountryCode, Medal, count(*) as 'NumberOfMedals'
from medals
where year = 2012 and CountryCode != ''
group by CountryCode, Medal
having NumberOfMedals >= 50
order by countrycode asc;

#built in function
select current_date(),
	   current_time(),
       current_timestamp(),
       year(current_timestamp()) as year_1,
       date_format(current_timestamp(), '%Y') as year_2,
       date_format(current_timestamp(), '%W'),
       date_format(current_timestamp(), '%w'),
       dayname(current_timestamp());
       


