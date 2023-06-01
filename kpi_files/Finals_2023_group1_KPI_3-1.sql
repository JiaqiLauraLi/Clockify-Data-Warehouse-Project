-- Employee productivity:
-- Note: depending on which database location you want to create the final table, you may change the part "MYDB.PUBLIC"
CREATE OR replace TABLE mydb.PUBLIC.kpi_employee_productivity
                        (
                                                employee_key                        varchar(32),
                                                employee_name                       varchar(16777216),
                                                employee_department                 varchar(16777216),
                                                employee_hourly_rate                varchar(16777216),
                                                total_projects                      number(38,0),
                                                total_tasks                         number(38,0),
                                                revenue_generated_per_hour_billable number(38,2),
                                                revenue_generated_per_hour_total    number(38,2)
                        );INSERT INTO mydb.PUBLIC.kpi_employee_productivity
            (
                        employee_key,
                        employee_name,
                        employee_department,
                        employee_hourly_rate,
                        total_projects,
                        total_tasks,
                        revenue_generated_per_hour_billable,
                        revenue_generated_per_hour_total
            )
SELECT   t.employee_key,
         de.employee_name,
         de.employee_department,
         de.employee_hourly_rate,
         Count(DISTINCT t.clockify_project_key) AS total_projects,
         Sum(t.total_tasks)                     AS total_tasks,
         CASE
                  WHEN Sum(t.billable_hours) > 0 THEN Sum(t.billable_hours * cp.clockify_project_hourly_rate_amount)/Sum(t.billable_hours)
                  ELSE 0
         END AS revenue_generated_per_hour_billable,
         CASE
                  WHEN Sum(t.billable_hours + t.non_billable_hours) > 0 THEN Sum(t.billable_hours * cp.clockify_project_hourly_rate_amount)/Sum(t.billable_hours + t.non_billable_hours)
                  ELSE 0
         END AS revenue_generated_per_hour_total
FROM     (
                  SELECT   de.employee_key,
                           cp.clockify_project_key,
                           Count(DISTINCT ct.clockify_task_key) AS total_tasks,
                           Sum(
                           CASE
                                    WHEN ct.clockify_task_is_billable = true THEN ete.time_interval_duration
                                    ELSE 0
                           END)/3600 AS billable_hours,
                           Sum(
                           CASE
                                    WHEN ct.clockify_task_is_billable = false THEN ete.time_interval_duration
                                    ELSE 0
                           END)/3600 AS non_billable_hours
                  FROM     dim_clockify_project cp
                  JOIN     dim_clockify_task ct
                  ON       cp.clockify_project_key = ct.clockify_project_key
                  JOIN     fact_employee_time_entry ete
                  ON       ete.task_key = ct.clockify_task_key
                  JOIN     dim_employee de
                  ON       ete.employee_key = de.employee_key
                  GROUP BY de.employee_key,
                           cp.clockify_project_key) t
JOIN     dim_employee de
ON       t.employee_key = de.employee_key
JOIN     dim_clockify_project cp
ON       t.clockify_project_key = cp.clockify_project_key
GROUP BY t.employee_key,
         de.employee_name,
         de.employee_hourly_rate,
         de.employee_department
ORDER BY revenue_generated_per_hour_total;