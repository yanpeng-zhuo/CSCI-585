Database used: MySQL.

The EMPLOYEE table has all the employees' information like name, office number, floor number and contact information.
The MEETING table has all meetings between employees (at least one person for each meeting for remote meeting). 

The whole process:
1. It starts with symptoms and scans, once an employee self-report a symptom or scanned a high temperature, he or she will be add into the NOTIFICATION table and required to have a Covid test as soon as possible.
2. After the test result comes out, positive results will be added into CASE	 table. Sick employees who tested positive are required to self-quarantine for two weeks and report their status every day. Their report will be recorded at HEALTH_STATUS table.
3. All employees in the same meeting room with the sick employee will be adding to NOTIFICATION table and be required to do a Covid test as soon as possible. If anyone of them tested positive, the tracking process will keep running. Also, employees on the same floor as the sick employee will be add to the NOTIFICATION table as well with optional message.
4. After 14 days of self-quarantine or back from hospital, their status will be 'well' again and can return to work.

DATABASE USED: MySQL

The process of my Q1 database:
1. Six employees reported their symptoms on "2020-10-01" with different symptom_id. Employee 1 and 6 had the same symptom.
2. Five employees had been scanned on "2020-10-01" in the morning and one of them had an abnormal temperature.
3. These six employees were added into the NOTIFICATION table with mandatory type alert to have test as soon as possible.
4. They had their test on the second day and three of them get positive result.
5. Their positive case had been added to CASES table. They were asked to leave the company to have a self-quarantine for two weeks and report their status everyday. Their daily reports were added into the HEALTH_STATUS table.
6. All direct contacts who were in the same meeting will be added to NOTIFICATION table with mandatory test alert and employees who were in the same floor will get optional reminds. (In the same floor means their office rooms or their meetings are in the same floor).
In my case, five direct contacts were asked to have a test as soon as possible but two of them already got test. So only employees with id 7, 8 and 10 need to go for the test. Unfortunately, one of them got a positive result.
7. Two employees got direct contact with 10 and they received notification but all of them already got negative test result. So the tracking is finished.
8. Once the infected employees had self-quarantine for two weeks and report their status as 'well', they are good back to work. 

Q2: report most-self-reported symptom's name

Q3: 'sickest' floor means the floor with the most cases of employees office rooms, not meeting room.

Q4: the time period is from "2021-10-01" to "2021-10-03"

Q5: My query reports employees' id and name who reported all five SYMPTOMS. It's basically a table division query.