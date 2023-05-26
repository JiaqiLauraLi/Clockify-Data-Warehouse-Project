CREATE OR replace TABLE mydb.PUBLIC.client_project_dim
(
client_name  varchar(16777216),
       project_type varchar(16777216),
       avg_duration number(38, 0)
       );
INSERT INTO mydb.PUBLIC.client_project_dim
(
       client_name,
       project_type,
       avg_duration
       )
SELECT DISTINCT client_name,
                project_type,
                Round(Avg(duration), 0) AS avg_duration
FROM mydb.PUBLIC.duration_dim
GROUP BY (client_name, project_type);
–


CREATE OR replace TABLE mydb.PUBLIC.kpi_client_task_dim
(
client_name  varchar(16777216),
       task_type varchar(16777216),
       avg_duration number(38, 0)
       );
INSERT INTO mydb.PUBLIC.kpi_client_task_dim
(
       client_name,
       task_type,
       avg_duration
       )
SELECT DISTINCT client_name,
                task_type,
                Round(Avg(duration), 0) AS avg_duration
FROM mydb.PUBLIC.duration_dim
GROUP BY (client_name, task_type);