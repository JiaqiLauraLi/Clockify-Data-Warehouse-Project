![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.001.png)  ![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.002.png)![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.003.png)

Data Sleek Data Warehouse - Clockify Final Project Report![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)

**Group 1**

Dexter Cai Rose Feng Jiaqi Li Esther Chung Yuhao Jiang Lijie Li Shuhan Lu

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.005.png)

**Table of Contents![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

[**Executive Summary ](#_page2_x72.00_y72.00)**2 [Project Statement ](#_page3_x72.00_y72.00)3 [Data Dictionary ](#_page4_x72.00_y72.00)4 [ERD (Entity Relationship Diagram) ](#_page6_x72.00_y72.00)6 [Data Literacy ](#_page7_x72.00_y72.00)7 [Data Processing and Architecture ](#_page9_x72.00_y72.00)9**

1. Time Tracking KPIs 9
1. Financial KPIs 10
1. Employee Performance KPIs 11
1. Time Management KPIs 11

[**Visualization and Insights ](#_page13_x72.00_y72.00)**13**

1. Time Tracking KPIs 13
1. Financial KPIs 14
1. Employee Performance KPIs 15
1. Time Management KPIs 16

[**Project Challenges ](#_page18_x72.00_y72.00)**18**

<a name="_page2_x72.00_y72.00"></a>**Executive Summary:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

Our overarching goal of this project is to help Data Sleek make the best use of its Clockify’s data to empower more informed business decisions. We want to transform information sitting in the data warehouse into a solution that is flexible, intuitive, and actionable for the executives at Data Sleek. With this objective in mind, we have designed 8 KPIs (Key Performance Indicators) that we believe to be the most insightful ones, and have consolidated our visualizations and analyses into dynamic dashboards.

We want to help our clients carry out projects in a more efficient, cost-effective, productive, and organized manner, and that’s why our KPIs target 4 main aspects: time-tracking, financials, employee performance, and time management, each with 2 meaningful metrics underneath.

One of our key findings is that data-science-related projects take significantly longer to complete than others. At a more granular level, implementation, optimization, and migration are the most timely tasks to complete on average, and these differences become even more drastic for certain clients. Interestingly, project management and data warehouse-related projects bring in the most money overall. On the other side, our time tracking dashboard and employee performance dashboard allows us to see and compare the productivity, performance, and contribution at the employee and department levels;

One can easily navigate through all of these aggregated metrics and granular metrics in our dashboards, as users can choose to sort, filter, and interact with them dynamically. It is definitely meaningful to find out the top-performing aspects of the projects, but we believe what’s more valuable is perhaps to further analyze and diagnose the low-performing areas. This way we can help our clients easily locate their pain points and bottlenecks so that a more strategic decision can be made. Our dashboard can be both a solution and a starting point for stakeholders to analyze a problem of their interest. Regardless of how it will be used, what we can all agree on is that these data are all the incredibly valuable information that would otherwise be difficult to measure, and this is the key reason Data Sleek puts a tremendous emphasis on services like Clockify.

<a name="_page3_x72.00_y72.00"></a>**Project Statement:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

In today’s increasingly complex and hybrid business environment, companies are seeking new ways of tracking employees’ time and efficiency with the use of data. With this goal in mind, many tools have emerged over the years, and Clockify is one of them. Clockify is a time-tracking software that lets companies monitor hours across projects, groups, and employees. Employees can start and stop the timer as they work, log their weekly hours in a timesheet, clock in from their device, and many more, all from Clockify’s app or website. It can be integrated with other apps like Quickbooks and Jira, and work collectively to help companies improve their productivity and clarity of project management.

Data Sleek is a data management and consulting company that makes extensive use of Clockify. As a company that aims to unleash the power of data and provide data solutions to clients worldwide, one of the key challenges is to figure out how to organize data, analyze the information, and extract valuable business insights from its data sources such as Clockify.

Our team, consisting of 7 data experts, has partnered with Data Sleek to help drive the most value from Clockify's data. We have queried data from Data Sleek’s cloud data warehouse using Snowflake, analyzed and identified 8 KPIs (Key Performance Indicators), and put together a customizable dashboard displaying real-time information using Tableau, all of which will be explained in much more detail below. We believe that our solution will provide the convenience, flexibility, and clarity executives need to get a high-level understanding of Clockify’s data, and consequently, help Data Sleek and its clients make more strategic business decisions.

<a name="_page4_x72.00_y72.00"></a>**Data Dictionary** ([ 3 - Data Dict ](https://docs.google.com/spreadsheets/d/1-cWaJpcwgRYCpkhuI08gbKInL-aE3D4uUAfIWQrXD60/edit#gid=112578048))**:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.006.png)![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

We created or made use of the following 18 tables in the database:



|**Table**|**# Columns**|**# Records**|**Description**|
| - | - | - | - |
|DIM\_CLIENT|21|201|Clients' high-level information, including their corresponding Clockify, Jira, and Quickbooks information|
|DIM\_CLOCKIFY\_PROJECT|10|327|Project-level information tracked by Clockify, including its time, hourly rate, client, and more|
|DIM\_CLOCKIFY\_TASK|8|1,767|Task-level information tracked by Clockify. Below Clockify's projects in terms of hierarchy|
|DIM\_CLOCKIFY\_TIME\_ENTRY|5|26,069|Employees' time entry data for Clockify's projects and tasks|
|DIM\_EMPLOYEE|43|98|Exhaustive table of employee's information, including demographics, credentials, and more|
|FACT\_EMPLOYEE\_TIME\_ENTRY|12|26,069|Pulling the above information together and displaying the "time entry"-level information in much more details|
|KPI\_DURATION\_BY\_TYPE\_DIM|9|17,985|KPI to examine the average time of each project by its types (Project Management, Database Administration, Database Architecture, Data Warehouse, Data Lake, Data Visualization, Web, Engineering, Optimization)|
|KPI\_CLIENT\_PROJECT\_DIM|3|210|KPI to examine the average project duration of each client by types (same as KPI\_DURATION\_BY\_TYPE\_DIM)|
|KPI\_CLIENT\_TASK\_DIM|3|425|KPI to examine the average task duration of each client by types (same as KPI\_DURATION\_BY\_TYPE\_DIM)|
|KPI\_BILLABLE\_HOURS|2|48|Total billable hours of each client|
|KPI\_PROJECT\_PROFIT|3|257|Total Profit earned from each project|
|KPI\_CLIENT\_PROFIT|2|52|Total profit that each client earned from projects|
|KPI\_AVG\_TASK\_DURATION|4|85|Average time each employee spent on tasks|
|KPI\_TOTAL\_PROJECT\_DURATIO N|4|85|Total time each employee spent on tasks|
|KPI\_DAILY\_WORKTIME|5|6,337|Total time spent by each employee per day|
|KPI\_WEEKLY\_WORKTIME|6|1,726|Total time spent by each employee per week|
|KPI\_EMPLOYEE\_PRODUCTIVITY|8|85|Amount of work completed by employees in a given time period|
|KPI\_EMPLOYEE\_CONTRIBUTIO N\_RATE|6|85|Hourly revenue the employee generated vs. the employee’s hourly rate|

Here are the key columns that we made use of in designing our KPIs:



|**Name**|**Table**|**Type**|**Description**|
| - | - | - | - |
|CLIENT\_KEY|DIM\_CLIENT|VARCHAR(32)|Uniquely identifies a client|
|CLIENT\_NAME|DIM\_CLIENT|VARCHAR(16777216)|Name of a client|
|CLOCKIFY\_PROJECT\_KEY|DIM\_CLOCKIFY\_PROJECT|VARCHAR(32)|Uniquely identifies a project; matched with PROJECT\_KEY|
|CLOCKIFY\_PROJECT\_NAME|DIM\_CLOCKIFY\_PROJECT|VARCHAR(16777216)|Name of a project (we used this to categorize project types)|
|CLOCKIFY\_TASK\_IS\_BILLABLE|DIM\_CLOCKIFY\_TASK|BOOLEAN|Indicating whether the client will be charged for this task|
|CLOCKIFY\_TASK\_KEY|DIM\_CLOCKIFY\_TASK|VARCHAR(32)|Uniquely identifies a task; matched with TASK\_KEY|
|CLOCKIFY\_TASK\_NAME|DIM\_CLOCKIFY\_TASK|VARCHAR(16777216)|Name of a task (we used this to categorize task types)|
|EMPLOYEE\_DEPARTMENT|DIM\_EMPLOYEE|VARCHAR(16777216)|Department of an employee|
|EMPLOYEE\_HOURLY\_RATE|DIM\_EMPLOYEE|VARCHAR(16777216)|Hourly rate at which an employee is paid at|
|EMPLOYEE\_KEY|FACT\_EMPLOYEE\_TIME\_ENTRY|VARCHAR(32)|Uniquely identifies an employee|
|EMPLOYEE\_NAME|DIM\_EMPLOYEE|VARCHAR(16777216)|Name of an employee|
|PROJECT\_KEY|FACT\_EMPLOYEE\_TIME\_ENTRY|VARCHAR(16777216)|Uniquely identifies a project; matched with CLOCKIFY\_PROJECT\_KEY|
|TASK\_KEY|FACT\_EMPLOYEE\_TIME\_ENTRY|VARCHAR(16777216)|Uniquely identifies a task; matched with CLOCKIFY\_TASK\_KEY|
|TIME\_INTERVAL\_DURATION|FACT\_EMPLOYEE\_TIME\_ENTRY|NUMBER(18,0)|Duration of a time interval; duration between start time and end time|
|TIME\_INTERVAL\_END|FACT\_EMPLOYEE\_TIME\_ENTRY|TIMESTAMP\_NTZ(9)|Timestamp of when an employee "punches out"|
|TIME\_INTERVAL\_START|FACT\_EMPLOYEE\_TIME\_ENTRY|TIMESTAMP\_NTZ(9)|Timestamp of when an employee "punches in"|
|PROJECT\_TYPE|KPI\_DURATION\_BY\_TYPE\_DIM|VARCHAR(16777216)|Categorizes the projects by specific words from project name|
|TASK\_TYPE|KPI\_DURATION\_BY\_TYPE\_DIM|VARCHAR(16777216)|Categorizes the tasks by specific words from task name|
|AVG\_DURATION|KPI\_CLIENT\_PROJECT\_DIM|NUMBER(38,0)|Average duration for a specific task type|
|BILLABLE\_HOURS|KPI\_BILLABLE\_HOURS|NUMBER(18,0)|Total billable hours of a client|
|PROJECT\_PROFIT|KPI\_PROJECT\_PROFIT|VARCHAR(16777216)|Profit of a project|
|CLIENT\_PROFIT|KPI\_CLIENT\_PROFIT|VARCHAR(16777216)|Profit of a client|
|AVG\_TASK\_SECONDS|KPI\_AVG\_TASK\_DURATION|NUMBER(38,2)|Average time taken by an employee to complete a task in seconds|
|AVG\_TASK\_HOURS|KPI\_AVG\_TASK\_DURATION|NUMBER(38,2)|Average time taken by an employee to complete a task in hours|
|TOTAL\_PROJECT\_SECONDS|KPI\_TOTAL\_PROJECT\_DURATIO N|NUMBER(38,0)|Total time taken by an employee to complete a project in seconds|
|TOTAL\_PROJECT\_HOURS|KPI\_TOTAL\_PROJECT\_DURATIO N|NUMBER(38,0)|Total time taken by an employee to complete a project in hours|
|TOTAL\_WORK\_SECONDS (D)|KPI\_DAILY\_WORKTIME|NUMBER(38,0)|Total work time of an employee in seconds per day|
|TOTAL\_WORK\_HOURS (D)|KPI\_DAILY\_WORKTIME|NUMBER(38,0)|Total work time of an employee in hours per day|
|YEAR|KPI\_WEEKLY\_WORKTIME|NUMBER(38,0)|Year scope for an employee's weekly performance|
|WEEK\_NUMBER|KPI\_WEEKLY\_WORKTIME|NUMBER(38,0)|Week scope for an employee's weekly performance|
|TOTAL\_WORK\_SECONDS (W)|KPI\_WEEKLY\_WORKTIME|NUMBER(38,0)|Total work time of an employee in seconds per week|
|TOTAL\_WORK\_HOURS (W)|KPI\_WEEKLY\_WORKTIME|NUMBER(38,0)|Total work time of an employee in hours per week|
|TOTAL\_PROJECTS|KPI\_EMPLOYEE\_PRODUCTIVIT Y|NUMBER(38,0)|Number of project done by an employee|
|TOTAL\_TASKS|KPI\_EMPLOYEE\_PRODUCTIVIT Y|NUMBER(38,0)|Number of task done by an employee|
|REVENUE\_GENERATED\_PER\_H OUR\_BILLABLE|KPI\_EMPLOYEE\_PRODUCTIVIT Y|NUMBER(38,2)|Average revenue generated by an employee per billable hour|
|REVENUE\_GENERATED\_PER\_H OUR\_TOTAL|KPI\_EMPLOYEE\_PRODUCTIVIT Y|NUMBER(38,2)|Average revenue generated by an employee per hour (includes non-billable hours)|
|EMPLOYEE\_CONTRIBUTION\_R ATE|KPI\_EMPLOYEE\_CONTRIBUTIO N\_RATE|NUMBER(38,2)|Hourly revenue an employee generated vs. employee’s hourly rate|

<a name="_page6_x72.00_y72.00"></a>**ERD (Entity Relationship Diagram):![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.007.jpeg)

<a name="_page7_x72.00_y72.00"></a>**Data Literacy:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.004.png)**

In this section, we will describe the source of our data by its structure, size, and analytical inference. Clockify is a time-tracking software that helps individuals and teams improve productivity, efficiency, and billable hours by monitoring and recording their time spent on various tasks and projects.

The primary sources of data sources for this project are as follows:

- DIM\_CLIENT
- DIM\_EMPLOYEE
- DIM\_CLOCKIFY\_PROJECT
- DIM\_CLOCKIFY\_TASK
- DIM\_EMPLOYEE\_CLOCKIFY\_TIME\_ENTRY
- FACT\_EMPLOYEE\_TIME\_ENTRY

These data sources include information about the time employees spend, costs that customers and Datasleek spend, and revenue that customers and Datasleek earned on various tasks and projects.

The amount of data in these sources may vary depending on the size of the client and the number of employees using Clockify software. As of the snapshot of the schema information from the dataset Datasleek shared with us, the size of DS\_DWH\_UCLA is approximately 5.4 Mb which contains 21 tables.



|**Schema Name**|**Byte Size**|
| - | - |
|DBT\_DWH|5,663,232|
|DS\_DWH\_UCLA|5,394,944|

And for this project, we will focus on the following tables,



|**Table Name**|**# Rows**|**Byte Size**|
| - | - | - |
|FACT\_EMPLOYEE\_TIME\_ENTRY|26,069|2,511,360|
|DIM\_CLOCKIFY\_TIME\_ENTRY|26,069|1,347,072|

|DIM\_CLOCKIFY\_TASK|1,767|121,344|
| - | - | - |
|DIM\_EMPLOYEE|98|33,792|
|DIM\_CLIENT|201|32,768|
|DIM\_CLOCKIFY\_PROJECT|327|29,696|

To extract meaningful KPIs out of these tables, the first step is to identify relevant data fields and variables that can be used to create meaningful KPIs that align with business goals, monitoring productivity and enhancing efficiency for employees. And the next step is to design distinctive dimensions for KPIs. Once the dimensions are established and relevant data fields are identified, we can proceed to restructure the dataset, building new tables for storing indicators that capture patterns, trends, and insights into business operations.

Overall, effective data analysis requires an in-depth understanding of data sources, business context, and analytical tools and techniques. By leveraging these resources, it is possible to gain valuable insights and make informed business decisions based on a designed KPI dashboard.

<a name="_page9_x72.00_y72.00"></a>**Data Processing and Architecture ([ KPI Queries](https://docs.google.com/document/d/1sRFTmsjSHgm176RsG5-rFmAN3Cj792Sa7kk7zAoM6SU/edit)):![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.008.png)![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.009.png)**

In this section, we will discuss the process of scripting the SQL code for data preprocessing using Clockify data. The objective of this process is to extract relevant data and transform it into a format that can be used to calculate Key Performance Indicators (KPIs). The SQL code has been written to extract the columns required for calculating KPIs and categorize the tasks and projects based on specific keywords.

Categorizing these 8 different KPIs into 4 groups serves the purpose of organizing and better understanding key performance indicators related to time tracking, financials, employee performance, and time management. By grouping these KPIs together, it allows businesses to analyze and track different aspects of their operations in a more structured and comprehensive way. For example, time-tracking KPIs can help businesses monitor the time spent on different tasks, while financial KPIs can provide insights into profitability and billing practices. Meanwhile, employee performance KPIs can help track productivity and task completion rates, and time management KPIs can help identify areas where time is being spent inefficiently. By categorizing these KPIs, businesses can gain a clearer understanding of their performance across different areas, and make more informed decisions based on the insights gained.

1. **Time Tracking KPIs [KPI1-1.sql](https://drive.google.com/file/d/1_CAYj_NvaE_cFO0nzLMgOrBMeg2t9WZ4/view?usp=share_link) [KPI1-2.sql**](https://drive.google.com/file/d/1eZax9wIsTqXszRB4KHBPTRkH9-VuhBnF/view?usp=share_link)**

The first Time Tracking KPI is the amount of time employees spend at their workplace on a daily and weekly basis. Generally, it is calculated by first joining the fact\_employee\_time\_entry table and dim\_employee\_table by employee\_key, and then taking the sum of time\_interval\_duration field and grouping the sum of time duration by each date\_key in the fact\_employee\_time\_entry table and by each employee\_key in the dim\_employee table in our data source. To make our data source more structured and help companies make better decisions on each employee’s performance, we created two result tables for the daily work time and weekly work time. One result table would display the employee key, employee name, date, and daily work time in seconds and hours; and the other result table would show the employee key, employee name, year, week of the year, and weekly work time in seconds and hours. This KPI is particularly important for our project because it shows some fundamental problems with employees’ work efficiency and work habits, allowing us to dig deeper into these issues in the next steps.

However, while working on the first Time Tracking KPI, we found that one employee, Franck Leveneur, may have entered the wrong working hours because his work start time was entered twice in the data

source for two days on 2021-07-12 and 2021-07-19, and his total daily work time exceeds 24 hours on these days. This is something we’re looking to address with the company in the future.

The second Time Tracking KPI is the average time employees spend to complete a task and the total time they spend to complete a project. This KPI is also calculated by first joining the tables, which are dim\_clockify\_task, dim\_clockify\_project, fact\_employee\_time\_entry, and dim\_employee, based on employee\_key, clockify\_project\_key, and clockify\_task\_key. Afterward, the average time per task KPI is calculated by taking the average of the time\_interval\_duration field for all the tasks and grouping the average of task time duration by each employee\_key in the dim\_employee table. The total time employees spend on a project is calculated by taking the sum of the time\_interval\_duration field for all the projects and grouping the sum of project time duration by each employee\_key in the dim\_employee table in our data source. This KPI allows us to understand the type of tasks and projects that employees usually spend the most time on on an employee level and help the companies to think of some personalized strategies they can enforce to help increase the work efficiency of their employees. Querying data for this KPI also builds a foundation for our analysis of the Time Management KPIs later.

2. **Financial KPIs [KPI2-1.sql](https://drive.google.com/file/d/1q0F0GQ4LTy2tG3lfIDvJwCqF8OYaZef-/view?usp=share_link) [KPI2-2.sql**](https://drive.google.com/file/d/1BRIQ3U61Logovayf7wq1pfCUdU2_f-41/view?usp=share_link)**

The first part of Financial KPIs is about the project and client profitability. For a project’s profit, we need to calculate its cost and revenue. A project’s cost refers to the salaries of employees who worked on the project. Therefore, we calculate the hours each employee spent on each project using the time\_interval\_duration column from the fact\_employee\_time\_entry table and multiply them with employee\_hourly\_rate, and then we sum the multiplications together grouped by project, thereby getting the costs of projects. In order to calculate each project’s revenue, we calculate the hours of each project using the time\_interval\_duration and multiply them with clockify\_project\_hourly\_rate\_amount. After we obtain both the costs and revenues of projects, project profits are calculated as revenues minus costs. This KPI can help the company identify which projects are worth pursuing and which ones may need to be reevaluated.

For a client’s profit, similarly, we need to calculate its cost and revenue. Its cost is also from the salaries of employees, so we use the same logic and method to calculate the costs. Clients' revenues are calculated from the client\_payment\_amount column from the fact\_client\_payment table. Therefore, clients' profits are calculated as revenues minus costs. This KPI can help us identify which clients are well profitable and which are not.

The second part of Financial KPIs is about client billable hours. Targeting billable tasks that are found by the where clause setting clockify\_task\_is\_billable = TRUE, we calculate billable hours using client\_payment\_amount divided by clockify\_project\_hourly\_rate\_amount and sum it together based on different clients. This KPI measures the amount of time that is billed to the client on Clockify. It can help the company ensure that employees are spending their time on billable tasks and not on non-billable administrative tasks.

3. **Employee Performance KPI [KPI3-1.sql](https://drive.google.com/file/d/1m6hl2wLESYZ_zdWwyfm9k6RvvU2UKbZ4/view?usp=share_link) [KPI3-2.sql**](https://drive.google.com/file/d/1JD1iNTSDc2FBve1SDBYTP5Sc43hKsiaz/view?usp=share_link)**

The first KPI we chose for measuring and evaluating employee performance is **employee productivity**, measured by how much revenue each employee made on average across all the projects they took part in. REVENUE\_GENERATED\_PER\_HOUR\_BILLABLE uses the total billable hours of each employee to calculate the average hourly revenue generated, while REVENUE\_GENERATED\_PER\_HOUR\_TOTAL uses the total hours (both billable and non-billable) as the denominator for the calculation. By looking at this KPI, Clockify can get a sense of how each employee is performing in the sense of generating revenue.

The second KPI is **employee contribution rate**, which measures the size of the employee’s hourly generated revenue relative to their hourly wage. This KPI allows the company to understand the “cost-effectiveness” of hiring different employees and make future decisions on their human resource decisions. Given departmental information, we can also calculate the average contribution rate and average productivity of each department to get a general understanding of each department’s contribution to revenue generation, as well as each employee’s performance relative to the department they are in.

4. **Time Management KPIs [KPI4-1.sql](https://drive.google.com/file/d/1JD1iNTSDc2FBve1SDBYTP5Sc43hKsiaz/view?usp=share_link) [KPI4-2.sql**](https://drive.google.com/file/d/1ZXAK3IYskaX87qrp0Igtm3idB_a89Mqc/view?usp=share_link)**

The first step is to extract the relevant columns from the Clockify data that are required for calculating KPIs. The SQL code starts with a SELECT statement, which selects the CLOCKIFY\_TASK\_KEY, CLOCKIFY\_TASK\_IS\_BILLABLE, CLOCKIFY\_TASK\_NAME, TIME\_INTERVAL\_START, TIME\_INTERVAL\_END, TIME\_INTERVAL\_DURATION as DURATION, c.CLIENT\_KEY, and c.CLIENT\_NAME columns.

Next, the projects are categorized into different types based on specific keywords using a CASE statement. The SQL code checks the CLOCKIFY\_PROJECT\_NAME column for specific keywords and categorizes the projects accordingly. For instance, if the project name contains the keyword 'Project Management,' it is categorized as a 'Project Management' project. Similarly, if the project name contains the keyword 'Data Warehouse,' it is categorized as a 'Data Warehouse' project.

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.010.jpeg)

The same process is repeated for categorizing tasks based on specific keywords. The SQL code checks the CLOCKIFY\_TASK\_NAME column for specific keywords and categorizes the tasks accordingly. For instance, if the task name contains the keyword 'Communication,' it is categorized as a 'Communication' task. Similarly, if the task name contains the keyword 'Meeting,' it is categorized as a 'Meeting' task.

The SQL code then joins the tables to extract the necessary data. It joins the DIM\_CLOCKIFY\_TASK, FACT\_EMPLOYEE\_TIME\_ENTRY, DIM\_CLOCKIFY\_PROJECT, and DIM\_CLIENT tables using the relevant keys.

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.011.jpeg)

The code then joins the tables to extract the necessary data. It joins the DIM\_CLOCKIFY\_TASK, FACT\_EMPLOYEE\_TIME\_ENTRY, DIM\_CLOCKIFY\_PROJECT, and DIM\_CLIENT tables using the relevant keys.

In summary, the SQL code is used to extract relevant columns from the Clockify data, categorize projects and tasks based on specific keywords, join the relevant tables, and filter the data to exclude null values.

<a name="_page13_x72.00_y72.00"></a>**Visualization and Insights:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.009.png)**

1. **Time Tracking KPIs Dashboard**

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.012.jpeg)

Tracking employee performance and workload is crucial for companies to ensure productivity and efficiency. The Time-tracking dashboard provides valuable insights into employee performance, and their productivity.

1. **Top performing employees**: From the Time-tracking dashboard, we can see that Melissa Alvarez, Franck Leveneur, and Balakrishna are among the top 5 employees in both total project time/employee and weekly project time/employee table. This suggests their hard-workingness and ability to complete tasks within the allotted time frame.
1. **Employee productivity analysis**: On the other hand, employee Manu has an average task work time significantly higher than the second-highest employee's. While this could imply his working capability, more information is needed to make a solid conclusion. Therefore, Clockify should consider conducting further analysis to identify the underlying factors causing this trend.
2. **Financial KPIs Dashboard**

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.013.jpeg)

Understanding financial performance is essential for any business to make informed decisions and plan for the future. The Financials dashboard provides a comprehensive view of the company's revenue, billable hours, and profitability by project type and client.

1. **Revenue by project type**: According to the Financials dashboard, Data Warehouse projects and Project Management brought the most revenue for the company. This provides insights on the types of projects that Clockify has considerable audiences for and the ones they should focus on to maximize their revenue.
1. **Top clients by billable hours and profit:** Furthermore, the top 5 clients in both the billable hour and profit tables are Seismos, Aestuary, and Mirai. This information is crucial for maintaining Clockify's relationships with these clients and identifying potential areas for growth.
3. **Employee Performance KPIs**

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.014.jpeg)

Employee productivity and performance are critical factors for any organization's success. The Employee Performance dashboard offers valuable insights into employee performance, contribution, and cost-effectiveness.

1. **Employee productivity and cost:** From the Employee Performance dashboard, Clockify should focus on the top and bottom employees from the Employee Productivity table. Additionally, they should conduct a cost analysis to determine whether the high productivity translates into higher profits or if it is cost-ineffective for the company.
1. **Departmental performance:** Moreover, Clockify should be aware of the department or individual with significantly low contributions as they might be cost-ineffective to the company's operations. Therefore, conducting a performance analysis on a departmental and individual basis can help the company identify areas for improvement and optimize its resources.
4. **Time Management**

![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.015.jpeg)

Finally, the Time Management visualization has revealed the following noteworthy findings:

1. **Task duration**: The average duration of implementation tasks is the longest, followed by migration and optimization tasks. This suggests that these tasks may be more complex or require more resources to complete. In contrast, Communication, Management, and Documentation are tasks that have the shortest average duration, which may indicate that they are relatively straightforward.
1. **Project duration**: Among the different project types, data science projects have the longest average duration, followed by data architecture and reach reporting projects. This could be due to the nature of these projects, which may involve more complex data analysis or modeling. In contrast, projects such as Meeting, Optimization, and Discovery have the shortest average duration, which may suggest that they are simpler or more routine in nature.
1. **Client spending**: Customily Inc is the top spending client, followed by Rapid Performance, Eplexity, and Scissors&Scotch. This could indicate that these clients have a higher demand for the services offered by the company or require more extensive projects.
4. **Data-related projects**: Eplexity spends the most on data-related projects, followed by Trimbite, Reveneer, and Mirai. This suggests that these clients may have a greater need for data-related services or that the company has specialized expertise in this area.
4. **Task allocation**: Meeting, Data, and Discovery tasks are the most commonly allocated tasks among clients. This could indicate that these tasks are essential components of many projects or that clients require a significant amount of time for communication and data-related activities. In contrast, implementation, migration, research, and fact & dim tasks are less commonly allocated, which may suggest that they are more specialized or require a narrower set of skills.

<a name="_page18_x72.00_y72.00"></a>**Project Challenges:![](Aspose.Words.02ac4932-adaa-406a-9ac5-6f9d33be5dd9.016.png)**

This was a challenging project that we collectively tackled. The open-endedness and complexity of the project brought us difficulties, but they also allowed us to put together a more sophisticated solution. We made use of multiple tools, references, and data sources. Throughout the process, there were a few challenges that we encountered, and we would like to discuss them in two aspects.

On the technical side, data reliability and data integrity is our top problem. Due to man-made errors, recorded data itself may not perfectly reflect the actual situation. For instance, in our dashboard, we have some data points showing an employee has more than 24 hours of daily working time. As we do not know what the “authentic” data looks like, we might give biased/inaccurate interpretations. We believe this is critical for a project like this; corporate executives base their decisions on data for the most part, and therefore the least we should do is to ensure that the data we collect is authentic and ethical, and that the metrics we provide are unbiased and straightforward. This would take a collective effort across multiple teams. We had limited transparency into certain parts of the data lifecycle for this project, but in the future, we would definitely like to work cross-functionally to ensure our data is accurate and authentic.

On the other side, we had some difficulties “understanding” the data. The existing documentation was helpful for us to get started, but it took some time for us to fully understand every single data table and attribute. Some of the namings of columns were not entirely intuitive. We had to look into the data and sometimes join across tables to figure out the meaning of a certain column, or whether the relationship between two entities is 1-to-1 or 1-to-many. For example, it took some time for us to figure out that [total revenue] = [the total amount of billable hours] \* [hourly rate for that project], and [total cost] = sum([billable hours] \* [hourly rate for each employee]. These are fundamental pieces of information we had to sort out before designing the KPIs. The slightest misunderstanding could lead to incorrect metrics and KPIs, so we could not afford any “guesses”. Therefore, one of our key takeaways is that whenever someone designs a table or metric, that person should be responsible for keeping clear documentation of what each new variable means and how it is derived, as we believe it would have been much easier if there was more first-hand, detailed documentation for the data sources.

Regardless of the challenges, we were able to cruise through this project. Most of these issues could have been manually prevented, so it was truly valuable for us to pin down these challenges, reflect on how we would resolve them from the roots, and apply these lessons to our future data projects.
19
