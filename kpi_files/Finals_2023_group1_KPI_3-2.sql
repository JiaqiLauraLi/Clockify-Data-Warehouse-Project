-- Employee Contribution Rate:
-- Note: depending on which database location you want to create the final table, you may change the part "MYDB.PUBLIC"
CREATE OR replace TABLE mydb.PUBLIC.kpi_employee_contribution_rate
                        (
                                                employee_key                     varchar(32),
                                                employee_name                    varchar(16777216),
                                                employee_department              varchar(16777216),
                                                employee_hourly_rate             varchar(16777216),
                                                revenue_generated_per_hour_total number(38,2),
                                                employee_contribution_rate       number(38,2)
                        );INSERT INTO mydb.PUBLIC.kpi_employee_contribution_rate
            (
                        employee_key,
                        employee_name,
                        employee_department,
                        employee_hourly_rate,
                        revenue_generated_per_hour_total,
                        employee_contribution_rate
            )
SELECT   employee_key,
         employee_name,
         employee_department,
         employee_hourly_rate,
         revenue_generated_per_hour_total,
         CASE
                  WHEN employee_hourly_rate = ''
                  OR       employee_hourly_rate = '0' THEN NULL
                  ELSE revenue_generated_per_hour_total/Cast(employee_hourly_rate AS INT)
         END AS employee_contribution_rate
FROM     mydb.PUBLIC.employee_productivity
ORDER BY employee_contribution_rate DESC;