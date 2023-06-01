-- project profit : kpi_project_profit
WITH temp1
     AS (SELECT employee_key,
                fact.client_key,
                fact.project_key,
                client_name,
                Sum(time_interval_duration) / 3600 AS employee_project_hours
         FROM   fact_employee_time_entry AS fact
                JOIN dim_client AS client
                  ON fact.client_key = client.client_key
                JOIN dim_clockify_project AS project
                  ON fact.project_key = project.clockify_project_key
         GROUP  BY 1,
                   2,
                   3,
                   4),
     temp2
     AS (SELECT project_key,
                Sum(time_interval_duration) / 3600 AS project_hours
         FROM   fact_employee_time_entry AS fact
         GROUP  BY 1),
     temp3
     AS (SELECT project_key,
                client_key,
                client_name,
                Sum(COALESCE(NULLIF(employee_hourly_rate, ''), 0) *
                    employee_project_hours) AS
                project_cost
         FROM   dim_employee AS employee
                JOIN temp1
                  ON temp1.employee_key = employee.employee_key
         GROUP  BY 1,
                   2,
                   3)
SELECT DISTINCT temp3.client_name
                AS
                client_name,
                clockify_project_name
                AS project_name,
                ( clockify_project_hourly_rate_amount * project_hours
                  - project_cost ) AS
                project_profit
FROM   temp3
       JOIN temp2
         ON temp3.project_key = temp2.project_key
       JOIN dim_clockify_project AS project
         ON project.clockify_project_key = temp3.project_key
ORDER  BY 1;

-- client profit : kpi_client_profit
WITH temp1
     AS (SELECT employee_key,
                fact.client_key,
                client_name,
                Sum(time_interval_duration) / 3600 AS employee_client_hours
         FROM   fact_employee_time_entry AS fact
                JOIN dim_client AS client
                  ON fact.client_key = client.client_key
         GROUP  BY 1,
                   2,
                   3),
     temp2
     AS (SELECT client_key,
                Sum(time_interval_duration) / 3600 AS client_hours
         FROM   fact_employee_time_entry AS fact
         GROUP  BY 1),
     temp3
     AS (SELECT client_key,
                client_name,
                Sum(COALESCE(NULLIF(employee_hourly_rate, ''), 0) *
                    employee_client_hours) AS
                client_cost
         FROM   dim_employee AS employee
                JOIN temp1
                  ON temp1.employee_key = employee.employee_key
         GROUP  BY 1,
                   2),
     temp4
     AS (SELECT client_key,
                Sum(client_payment_amount) AS client_revenue
         FROM   fact_client_payment
         GROUP  BY 1)
SELECT DISTINCT temp1.client_name,
                ( client_revenue - client_cost ) AS client_profit
FROM   temp1
       JOIN temp2
         ON temp1.client_key = temp2.client_key
       JOIN temp3
         ON temp1.client_key = temp3.client_key
       JOIN temp4
         ON temp1.client_key = temp4.client_key
ORDER  BY 1; 