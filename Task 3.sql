SELECT 
    ee.gender,
    ROUND(AVG(s.salary), 2) AS avg_salary,
    YEAR(s.from_date) AS calender_year,
    dm.dept_name
FROM
    t_employees ee
        JOIN
    t_salaries s ON s.emp_no = ee.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = s.emp_no
        JOIN
    t_departments dm ON dm.dept_no = de.dept_no
GROUP BY ee.gender , calender_year , dm.dept_no
HAVING calender_year <= 2002
ORDER BY  dm.dept_no, calender_year;

