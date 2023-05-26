CREATE OR replace TABLE mydb.PUBLIC.duration_dim
(
       clockify_task_key varchar(32),
       clockify_task_is_billable boolean,
       clockify_task_name varchar(16777216),
       time_interval_start datetime,
       time_interval_end datetime,
       time_interval_duration number(38, 0),
       client_key varchar(32),
       client_name varchar(16777216),
       project_type varchar(16777216),
       task_type varchar(16777216)
       );
INSERT INTO mydb.PUBLIC.duration_dim
       (
       clockify_task_key,
       clockify_task_is_billable,
       clockify_task_name,
       time_interval_start,
       time_interval_end,
       time_interval_duration,
       client_key,
       client_name,
       project_type,
       task_type
       )
SELECT   clockify_task_key,
         clockify_task_is_billable,
         clockify_task_name,
         time_interval_start,
         time_interval_end,
         time_interval_duration AS duration,
         c.client_key,
         c.client_name,
         //categorize the projects BY specific words
         CASE
                  WHEN clockify_project_name LIKE '%Project Management%' THEN 'Project Management'
                  WHEN clockify_project_name LIKE '%Database Administration%' THEN 'Database Administration'
                  WHEN clockify_project_name LIKE '%Database Architecture%' THEN 'Database Architecture'
                  WHEN clockify_project_name LIKE '%Data Warehouse%' THEN 'Data Warehouse'
                  WHEN clockify_project_name LIKE '%Data Lake%' THEN 'Data Lake'
                  WHEN clockify_project_name LIKE '%Data Visualization%' THEN 'Data Visualization'
                  WHEN clockify_project_name LIKE '%Web%' THEN 'Web'
                  WHEN clockify_project_name LIKE '%Engineering%' THEN 'Engineering'
                  WHEN clockify_project_name LIKE '%Optimiz%' THEN 'Optimization'
                  ELSE clockify_project_name
         END AS project_type,
         //categorize the tasks BY specific words
         CASE
                  WHEN clockify_task_name LIKE '%Communication%' THEN 'Communication'
                  WHEN clockify_task_name LIKE '%Technical Meeting%' THEN 'Meeting'
                  WHEN clockify_task_name LIKE '%Meeting%' THEN 'Meeting'
                  WHEN clockify_task_name LIKE '%Infrastructure%' THEN 'Infrastructure'
                  WHEN clockify_task_name LIKE '%Discovery%' THEN 'Discovery'
                  WHEN clockify_task_name LIKE '%Data%' THEN 'Data'
                  WHEN clockify_task_name LIKE '%Onboarding%' THEN 'Onboarding'
                  WHEN clockify_task_name LIKE '%Documentation%' THEN 'Documentation'
                  WHEN clockify_task_name LIKE '%Management%' THEN 'Management'
                  WHEN clockify_task_name LIKE '%Connectivity%' THEN 'Connectivity'
                  WHEN clockify_task_name LIKE '%Proposal%' THEN 'Proposal'
                  WHEN clockify_task_name LIKE '%Implementation%' THEN 'Implementation'
                  WHEN clockify_task_name LIKE '%Optimization%' THEN 'Optimization'
                  WHEN clockify_task_name LIKE '%Research%' THEN 'Research'
                  WHEN clockify_task_name LIKE '%Fact & Dim%' THEN 'Fact & Dim'
                  WHEN clockify_task_name LIKE '%Migration%' THEN 'Migration'
                           //    ELSE 'Other'
         END                                               AS task_type
FROM     datasleek_dw.ds_dwh_ucla.dim_clockify_task        AS t1
JOIN     datasleek_dw.ds_dwh_ucla.fact_employee_time_entry AS t2
ON       t1.clockify_task_key = t2.task_key
JOIN     datasleek_dw.ds_dwh_ucla.dim_clockify_project p
ON       t1.clockify_project_key = p.clockify_project_key
JOIN     datasleek_dw.ds_dwh_ucla.dim_client c
ON       p.client_key = c.client_key
WHERE    task_type IS NOT NULL
AND      clockify_task_duration IS NOT NULL
ORDER BY clockify_task_key;