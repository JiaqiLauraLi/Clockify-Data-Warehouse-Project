-- 2. Time per Task/Project (Average time taken by employees to complete a task)
-- the average time taken by employees to complete a task and the total time spent on a project. It allows the company to figure out the overall performance of employees
-- the average time employees spent on a task (per task name and per employee)
-- select de.employee_key, de.employee_name, dct.clockify_task_key, dct.clockify_task_name, avg(f.time_interval_duration/3600) as avg_task_hours
-- from dim_clockify_task dct
-- join fact_employee_time_entry as f
-- on dct.clockify_task_key = f.task_key
-- join dim_employee as de
-- on f.employee_key = de.employee_key
-- group by 1,2,3,4
-- order by 2,4;
-- the average time employees spent on a task  (per employee)
—- kpi_avg_task_duration
SELECT de.employee_key,
       de.employee_name,
       Avg(f.time_interval_duration)        AS avg_task_seconds,
       Avg(f.time_interval_duration / 3600) AS avg_task_hours
FROM   dim_clockify_task dct
       JOIN fact_employee_time_entry AS f
         ON dct.clockify_task_key = f.task_key
       JOIN dim_employee AS de
         ON f.employee_key = de.employee_key
GROUP  BY 1,
          2
ORDER  BY 2;

-- the total time employees spent on a project (per project name and per employee)
-- select de.employee_key, de.employee_name, dcp.clockify_project_key, dcp.clockify_project_name, sum(f.time_interval_duration/3600) as total_project_hours
-- from dim_clockify_project dcp
-- join fact_employee_time_entry as f
-- on dcp.clockify_project_key = f.project_key
-- join dim_employee as de
-- on f.employee_key = de.employee_key
-- group by 1,2,3,4
-- order by 2,4;
-- the total time employees spent on a project (per employee)
—- kpi_total_project_duration
SELECT de.employee_key,
       de.employee_name,
       Sum(f.time_interval_duration)        AS total_project_seconds,
       Sum(f.time_interval_duration / 3600) AS total_project_hours
FROM   dim_clockify_project dcp
       JOIN fact_employee_time_entry AS f
         ON dcp.clockify_project_key = f.project_key
       JOIN dim_employee AS de
         ON f.employee_key = de.employee_key
GROUP  BY 1,
          2
ORDER  BY 2; 