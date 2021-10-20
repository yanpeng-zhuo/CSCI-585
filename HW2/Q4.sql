-- Database used: MySQL.
-- given period: from "2021-10-01" to "2021-10-03"
-- number of scan
select count(*) as NUM_SCANS from SCAN WHERE SCAN_DATE BETWEEN "2021-10-01" AND "2021-10-03";
-- number of tests
select count(*) as NUM_TESTS from TEST WHERE TEST_DATE BETWEEN "2021-10-01" AND "2021-10-03";
-- number of employees
select count(*) as NUM_SYMPTOMS from SYMPTOM WHERE REPORT_DATE BETWEEN "2021-10-01" AND "2021-10-03";
-- number of positive cases
select count(*) as NUM_POSITIVES from CASES WHERE CASE_DATE BETWEEN "2021-10-01" AND "2021-10-03";