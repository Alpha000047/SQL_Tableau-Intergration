
SELECT 
    de.dept_name,
    ee.emp_no,
    ee.gender,
    dm.from_date,
    dm.to_date,
    e.calender_year,
    CASE
        WHEN
            calender_year >= YEAR(dm.from_date)
                AND calender_year <= YEAR(dm.to_date)
        THEN
            1
        ELSE 0
    END AS is_active
FROM
    (SELECT 
        YEAR(hire_date) AS calender_year
    FROM
        t_employees
    GROUP BY calender_year) AS e
        CROSS JOIN
    t_departments de
        JOIN
    t_dept_manager dm ON dm.dept_no = de.dept_no
        JOIN
    t_employees ee ON ee.emp_no = dm.emp_no
WHERE
    calender_year >= 1990
ORDER BY dm.emp_no , calender_year;
