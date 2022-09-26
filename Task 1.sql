use employees_mod;

SELECT 
    YEAR(de.from_date) AS current_year,
    e.gender,
    COUNT(e.emp_no) AS no_of_employees
FROM
    t_employees e
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
GROUP BY current_year , e.gender
HAVING current_year >= 1990
ORDER BY current_year;