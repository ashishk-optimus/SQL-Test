--Solution Optimus


-----------------------------------------------------Question : 1 -------------------------------------

--Return all the information related to each department

SELECT e.*, d.*, p.*, ep.work_date, ep.work_hrs
FROM Employee e
INNER JOIN Employee_project ep
ON e.emp_id = ep.emp_id
INNER JOIN Projects p
ON ep.proj_id = p.proj_id
INNER JOIN Departments d
ON p.dept_id = d.dept_id
-----------------------------------------------------Question : 2(a) -------------------------------------

--Return total number of hours spent as each engineer in their respective project

SELECT e.first_name + ' ' + e.last_name AS Name, p.proj_name, ep.work_hrs
FROM Employee e
INNER JOIN Employee_project ep
ON e.emp_id = ep.emp_id
INNER JOIN Projects p
ON ep.proj_id = p.proj_id
INNER JOIN Departments d
ON p.dept_id = d.dept_id

-----------------------------------------------------Question : 2(b) -------------------------------------

--Return total number of hours spent as each project in their respective department

SELECT  d.dept_name, p.proj_name, SUM(ep.work_hrs) AS [Total Working Hours]
FROM Employee_project ep
INNER JOIN Projects p
ON ep.proj_id = p.proj_id
INNER JOIN Departments d
ON p.dept_id = d.dept_id
GROUP BY d.dept_name, p.proj_name
