#productshipping
select * from suppliers;
SELECT 'Customer' AS Type, REPLACE(contactname, ",", "") AS Contactname, city, country, phone
FROM customers
UNION
SELECT 'Supplier' , contactname , city, country, phone
FROM suppliers;

#VIEW_EXAMPLE
CREATE OR REPLACE VIEW VTRUONGPHONG
AS 
SELECT employee_id, first_name, last_name, salary, department_id 
from employees 
where employee_id in (select manager_id from departments);
select * from VTRUONGPHONG
ORDER BY SALARY DESC;

SELECT employee_id, first_name, last_name, salary, department_id ,
sum(salary) over( order by department_id) as sum_sal
from employees;
select * from departments;
#liệt kê danh sách các nhân viên có mức lương lớn hơn lương trung bình 
select * from employees
where salary > (select avg(salary) from employees);

#câu lệnh truy vấn con trả về nhiều giá trị
#liệt kê danh sách các phòng ban có nhân viên đang có mức lương lớn hơn hoặc bằng 12k
select DISTINCT D.DEPARTMENT_ID, D.DEPARTMENT_NAME, D.LOCATION_ID
FROM DEPARTMENTS D INNER JOIN EMPLOYEES E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.SALARY > 12000;
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID 
FROM DEPARTMENTS
WHERE department_ID IN (SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE SALARY >= 12000);

SELECT FULL_NAME
FROM (SELECT EMPLOYEE_ID, concat(LAST_NAME, ' ', FIRST_NAME) AS FULL_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES) AS EMPLOYEES_TEMP;#TAT CA DERIVED TABLE PHAI CO ALIAS;

-- Hay hien thi thong tin sv va diem cua sv do
select *
from ketqua as kq, sinhvien as sv
where kq.SinhVienID = sv.SinhVienID; -- khon quan trong nay la crossjoin

select sv.*, kq.Diem, kq.MonHocID,mh.TenMonHoc,k.TenKhoa
from sinhvien as sv inner join ketqua as kq on sv.SinhVienID = kq.SinhVienID
					inner join monhoc as mh on kq.MonHocID = mh.MonHocID
                    inner join khoa as k on k.KhoaID = sv.KhoaID;

-- hay liet ke danh sach cac sv va ket qua cua sv do. Lay luon ca nhung sv chua co diem
select sv.*, kq.diem
from sinhvien as sv left join ketqua as kq on sv.sinhvienid = kq.sinhvienid;
select * from ketqua;
select * from sinhvien;
select sv.*,  kq.diem
from sinhvien as sv cross join ketqua as kq;

-- UNION
select 'Customer' as 'Type',companyname,contactname,address,city,phone  -- hien thi theo truy xuat thu 1
from productshipping.customers
union
select 'Supplier' as 'Type', companyname,contactname,address,city,phone
from productshipping.suppliers;

-- CTE 
with cte_employees_all as 
(
	select EMPLOYEE_ID, CONCAT(LAST_NAME, ' ' , FIRST_NAME) AS FULL_NAME, SALARY, DEPARTMENT_ID
    FROM EMPLOYEES
), 
cte_employees_mgr as
(
	select employee_id, concat(last_name, ' ', first_name) as full_name, salary, department_id
    from employees
    where employee_id in (select distinct manager_id from employees)
)
select full_name from cte_employees_all;

-- VIEW
CREATE view view_employees_all
as select employee_id, concat(last_name, ' ' , first_name) as fill_name, salary, department_id
from employees;


CREATE view view_employees_mgr
as select employee_id, concat(last_name, ' ' , first_name) as fill_name, salary, department_id
from employees
where employee_id in (select distinct manager_id from employees);

select * from view_employees_all;
select * from view_employees_mgr;


-- WINDOW FUNCTION
SELECT  FIRST_NAME, DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY, employee_ID 
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID, EMPLOYEE_ID;

SELECT employee_ID,  DEPARTMENT_ID, SALARY, AVG(SALARY)  OVER(ORDER BY SALARY DESC) AS AVG_SALARY, employee_ID
FROM EMPLOYEES;

SELECT ROW_NUMBER() OVER() AS 'NO', EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES;
SELECT dense_rank() OVER( partition by department_id order by salary desc) AS 'NO', EMPLOYEE_ID, FIRST_NAME, SALARY, department_id
FROM EMPLOYEES;

SELECT ntile(20) OVER(  order by salary desc) AS 'GROUP', EMPLOYEE_ID, FIRST_NAME, SALARY, department_id
FROM EMPLOYEES; 




