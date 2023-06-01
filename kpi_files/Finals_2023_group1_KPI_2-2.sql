-- billable hours
SELECT client_name,
       Sum(client_payment_amount / clockify_project_hourly_rate_amount) AS
       billable_hours
FROM   fact_client_payment AS fact
       JOIN dim_client AS client
         ON fact.client_key = client.client_key
       JOIN dim_clockify_project AS project
         ON fact.client_key = project.client_key
       JOIN dim_clockify_task AS task
         ON project.clockify_project_key = task.clockify_project_key
WHERE  clockify_task_is_billable = true
GROUP  BY 1
ORDER  BY 1;