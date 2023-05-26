-- Time Tracking KPIs (Rose)
-- 1. Daily/Weekly Productive Time (Total spent time by employees)
-- the total time spent by employees, working each day(and week). It also gives access to the employee’s previous productive time data.
-- Daily total time spent by employees
—- kpi_daily_worktime
SELECT de.employee_key,
       de.employee_name,
       f.date_key                           AS date,
       Sum(f.time_interval_duration)        AS total_work_seconds,
       Sum(f.time_interval_duration / 3600) AS total_work_hours
FROM   fact_employee_time_entry f
       JOIN dim_employee de
         ON f.employee_key = de.employee_key
GROUP  BY 1,
          2,
          3
ORDER  BY 2,
          3;

-- Weekly total time spent by employees
—- kpi_weekly_worktime
SELECT de.employee_key,
       de.employee_name,
       Year(f.date_key)                     AS year,
       Weekofyear(f.date_key)               AS week_number,
       Sum(f.time_interval_duration)        AS total_work_seconds,
       Sum(f.time_interval_duration / 3600) AS total_work_hours
FROM   fact_employee_time_entry f
       JOIN dim_employee de
         ON f.employee_key = de.employee_key
GROUP  BY 1,
          2,
          3,
          4
ORDER  BY 2,
          3,
          4;