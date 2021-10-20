The ER diagram starts from the COMPANY. It’s linked to DEPARTMENT, EMPLOYEE AND ROOM by three systems which makes them strong relations.


The MEETING IS the connection between EMPLOYEE and ROOM. The Room holds a IF_HOLD_MEETINGS because only meeting rooms can have meetings. 
EMPLOYEE
Entity named EMPLOY contains seven attributes
* PK: EMP_ID
* FK: DEPARTMENT_CODE (weak relation with DEPARTMENT)
* EMP_Phone
* EMP_Email (optional)
* EMP_Symptom (TRUE or FALSE)
* ELIGIBLE_TO_WORK
* COVID_TEST_RESULT
EMP_SYMPTOM is used for self-report covid-19 related symptoms. COVID_TEST_RESULT is used for self-report and onsite covid-19 test results.
ELIGIBLE_TO_WORK is true by default.


Process
There are two ways to trigger the tracking process.
1. Self report symptoms.
2. Self report positive COVID-19 test.
3. Scan abnormal temperature when entering the company.


For case 1, the employee will be added to the tracking system with a COVID_TEST_DEADLINE. The other attributes are set to normal or not by the requirement of the company. The test result will lead the process to the next level.
For case 2, a positive test result will lead the process to the next level.
For case 3, a positive test result will lead the process to the next level.


Next step, a positive test result will trigger the initiating contact tracing and change the status of the employee like QUARANTINE_TIME(14 days) AND EMP_STATUS (sick, well or hospitalized).
Using the MEETING table, we can easily find all the initiating contact employees, then add them to the TRACKING SYSTEM with a COVID_TEST_DEADLINE. A positive test result will lead to the same situation as the first positive employee. And the process will keep going as long as there are new employees with positive test results.
After 14 days of quarantine or back from hospital, the employee will be eligible to work and all the other status will be changed to normal. The record will be removed from the TRACKING_SYSTEM.
For the others who were on the same floor, they will get notified as well. But the company will not track them using a database. We can get a list of employees who are on the same floor using the relations between ROOM and MEETING with a EMP_ID and send them an email if possible or a phone call.