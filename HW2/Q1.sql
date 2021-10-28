-- Dtabase used: MySQL.

CREATE TABLE EMPLOYEE(
   EMP_ID INT NOT NULL AUTO_INCREMENT,
   EMP_NAME VARCHAR(100) NOT NULL,
   EMP_OFFICE INT NOT NULL,
   EMP_FLOOR INT NOT NULL,
   EMP_PHONE VARCHAR(100) NOT NULL,
   EMP_EMAIL VARCHAR(100),
   PRIMARY KEY ( EMP_ID )
);
insert INTO EMPLOYEE
values
(DEFAULT, 'A', 101, 1, '2131111111', 'A@usc.edu'), 
(DEFAULT, 'B', 102, 1, '2131111111', 'B@usc.edu'),
(DEFAULT, 'C', 201, 2, '2131111111', 'C@usc.edu'),
(DEFAULT, 'D', 202, 2, '2131111111', ''),
(DEFAULT, 'E', 301, 3, '2131111111', 'E@usc.edu'),
(DEFAULT, 'F', 302, 3, '2131111111', 'F@usc.edu'),
(DEFAULT, 'G', 401, 4, '2131111111', 'G@usc.edu'),
(DEFAULT, 'H', 402, 4, '2131111111', ''),
(DEFAULT, 'I', 501, 5, '2131111111', 'I@usc.edu'),
(DEFAULT, 'J', 502, 5, '2131111111', 'J@usc.edu'),
(DEFAULT, 'K', 601, 6, '2131111111', 'K@usc.edu'),
(DEFAULT, 'L', 602, 6, '2131111111', 'L@usc.edu'),
(DEFAULT, 'M', 701, 7, '2131111111', 'M@usc.edu'),
(DEFAULT, 'N', 702, 7, '2131111111', 'N@usc.edu'),
(DEFAULT, 'O', 703, 7, '2131111111', 'O@usc.edu'),
(DEFAULT, 'P', 801, 8, '2131111111', 'P@usc.edu'),
(DEFAULT, 'Q', 802, 8, '2131111111', 'Q@usc.edu'),
(DEFAULT, 'R', 901, 9, '2131111111', 'R@usc.edu'),
(DEFAULT, 'S', 902, 9, '2131111111', 'S@usc.edu'),
(DEFAULT, 'T', 1001, 10, '2131111111', 'T@usc.edu'),
(DEFAULT, 'U', 1002, 10, '2131111111', 'U@usc.edu'),
(DEFAULT, 'V', 1003, 10, '2131111111', 'V@usc.edu'),
(DEFAULT, 'W', 1004, 10, '2131111111', 'W@usc.edu'),
(DEFAULT, 'X', 1005, 10, '2131111111', 'X@usc.edu'),
(DEFAULT, 'Y', 1006, 10, '2131111111', 'Y@usc.edu'),
(DEFAULT, 'Z', 1007, 10, '2131111111', 'Z@usc.edu');

CREATE TABLE MEETING(
   MEET_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   MEET_ROOM INT NOT NULL,
   MEET_FLOOR INT NOT NULL,
   MEET_TIME INT NOT NULL,
   PRIMARY KEY ( MEET_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID)
);
insert INTO MEETING
values
(DEFAULT, 1, 103, 1, 8),(DEFAULT, 2, 103, 1, 8),(DEFAULT, 1, 104, 1, 10),(DEFAULT, 3, 104, 1, 10),(DEFAULT, 4, 104, 1, 10),
(DEFAULT, 5, 203, 2, 8),(DEFAULT, 6, 203, 2, 8),(DEFAULT, 7, 204, 2, 10),(DEFAULT, 8, 204, 2, 10),(DEFAULT, 5, 204, 2, 10),
(DEFAULT, 7, 303, 3, 8),(DEFAULT, 8, 303, 3, 8),(DEFAULT, 9, 303, 3, 8),(DEFAULT, 10, 303, 3, 8),(DEFAULT, 11, 303, 3, 8),
(DEFAULT, 8, 403, 4, 12),(DEFAULT, 9, 403, 4, 12),(DEFAULT, 10, 403, 4, 12),(DEFAULT, 11, 404, 4, 14),(DEFAULT, 12, 404, 4, 14),
(DEFAULT, 12, 503, 5, 8),(DEFAULT, 13, 503, 5, 8),(DEFAULT, 14, 503, 5, 8),(DEFAULT, 15, 503, 5, 8),(DEFAULT, 16, 503, 3, 8),
(DEFAULT, 17, 603, 6, 9),(DEFAULT, 18, 603, 6, 9),(DEFAULT, 19, 603, 6, 9),(DEFAULT, 20, 703, 7, 12),(DEFAULT, 21, 703, 7, 12),
(DEFAULT, 22, 803, 8, 14),(DEFAULT, 23, 803, 8, 14),(DEFAULT, 24, 903, 9, 16),(DEFAULT, 25, 903, 9, 16),(DEFAULT, 21, 903, 9, 16);

CREATE TABLE NOTIFICATION(
   NOTIFICATION_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   MEET_ID INT NOT NULL,
   TEST_ID INT NOT NULL,
   NOTIFICATION_DATE DATE NOT NULL,
   NOTIFICATION_TYPE VARCHAR(20) NOT NULL,
   PRIMARY KEY ( NOTIFICATION_ID ),
   
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID)
);
insert INTO NOTIFICATION
values
-- first round:
(DEFAULT, 2, 1, 1, "2021-10-02", "mandatory"),
(DEFAULT, 3, 3, 1, "2021-10-02", "mandatory"),
(DEFAULT, 7, 13, 7, "2021-10-02", "mandatory"),
(DEFAULT, 8, 13, 7, "2021-10-02", "mandatory"),
(DEFAULT, 10, 14, 7, "2021-10-02", "mandatory"),

-- second round:
(DEFAULT, 8, 14, 11, "2021-10-03", "mandatory"),
(DEFAULT, 9, 14, 11, "2021-10-03", "mandatory"),

(DEFAULT, 7, 14, 11, "2021-10-03", "optional"),
(DEFAULT, 11, 14, 11, "2021-10-03", "optional"),
(DEFAULT, 12, 14, 11, "2021-10-03", "optional");

CREATE TABLE SYMPTOM_DETAIL(
   SYMPTOM_ID INT NOT NULL,
   DETAIL VARCHAR(20) NOT NULL,
   PRIMARY KEY ( SYMPTOM_ID )
);

insert INTO SYMPTOM_DETAIL
values
(1, "Fever"),
(2, "Difficulty breathing"),
(3, "Diarrhea"),
(4, "Headache"),
(5, "Vomiting");

CREATE TABLE SYMPTOM(
   ROW_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   REPORT_DATE DATE NOT NULL,
   SYMPTOM_ID INT NOT NULL,
   PRIMARY KEY ( ROW_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID),
   FOREIGN KEY ( SYMPTOM_ID ) references SYMPTOM_DETAIL(SYMPTOM_ID)
);

insert INTO SYMPTOM
values
(DEFAULT, 1, "2021-10-01", 1),
(DEFAULT, 1, "2021-10-01", 2),
(DEFAULT, 1, "2021-10-01", 3),
(DEFAULT, 1, "2021-10-01", 4),
(DEFAULT, 1, "2021-10-01", 5),
(DEFAULT, 2, "2021-10-01", 1),
(DEFAULT, 3, "2021-10-01", 1),
(DEFAULT, 4, "2021-10-01", 4),
(DEFAULT, 5, "2021-10-01", 5),
(DEFAULT, 6, "2021-10-01", 1);

CREATE TABLE SCAN(
   SCAN_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   SCAN_DATE DATE NOT NULL,
   SCAN_TIME VARCHAR(20) NOT NULL,
   SCAN_TEMP INT NOT NULL,
   PRIMARY KEY ( SCAN_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID)
);
insert INTO SCAN
values
(DEFAULT, 7, '2021-10-01', '07:30', 98),
(DEFAULT, 8, '2021-10-01', '07:30', 98),
(DEFAULT, 9, '2021-10-01', '07:40', 101),
(DEFAULT, 10, '2021-10-01', '07:40', 98),
(DEFAULT, 11, '2021-10-01', '07:50', 98);

CREATE TABLE TEST(
   TEST_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   TEST_LOCATION VARCHAR(20) NOT NULL,
   TEST_DATE DATE NOT NULL,
   TEST_TIME TIME NOT NULL,
   TEST_RESULT VARCHAR(20) NOT NULL,
   PRIMARY KEY ( TEST_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID)
);

insert INTO TEST
values
-- first round: five from self-report, one from scan
(DEFAULT, 1, "clinic", "2021-10-02", "08:30:00", "positive"),
(DEFAULT, 2, "clinic", "2021-10-02", "08:30:00", "negative"),
(DEFAULT, 3, "clinic", "2021-10-02", "08:30:00", "negative"),
(DEFAULT, 4, "clinic", "2021-10-02", "08:30:00", "positive"),
(DEFAULT, 5, "clinic", "2021-10-02", "08:30:00", "negative"),
(DEFAULT, 6, "clinic", "2021-10-02", "08:30:00", "negative"),
(DEFAULT, 9, "company", "2021-10-02", "08:30:00", "positive"),
-- second round
(DEFAULT, 7, "company", "2021-10-03", "08:30:00", "negative"),
(DEFAULT, 8, "company", "2021-10-03", "08:30:00", "negative"),
(DEFAULT, 10, "company", "2021-10-03", "08:30:00", "positive");


CREATE TABLE CASES(
   CASE_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   CASE_DATE DATE NOT NULL,
   CASE_RESOLUTION VARCHAR(20) NOT NULL,
   TEST_ID INT NOT NULL, 
   PRIMARY KEY ( CASE_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID),
   FOREIGN KEY ( TEST_ID ) references TEST(TEST_ID)
);

insert INTO CASES
values
-- first round: five from self-report, one from scan, three got positive result
(DEFAULT, 1, "2021-10-02", "left the company", 1),
(DEFAULT, 4, "2021-10-02", "left the company", 4),
(DEFAULT, 9, "2021-10-02", "left the company", 7),
(DEFAULT, 10, "2021-10-03", "left the company", 10);


CREATE TABLE HEALTH_STATUS(
   ROW_ID INT AUTO_INCREMENT,
   EMP_ID INT NOT NULL,
   STATUS_DATE DATE NOT NULL,
   STATUS VARCHAR(20) NOT NULL,
   CASE_ID INT NOT NULL,
   PRIMARY KEY ( ROW_ID ),
   FOREIGN KEY ( EMP_ID ) references EMPLOYEE(EMP_ID),
   FOREIGN KEY ( CASE_ID ) references CASES(CASE_ID)
);

insert INTO HEALTH_STATUS
values
(DEFAULT, 1, "2021-10-02", "sick", 1),
(DEFAULT, 4, "2021-10-02", "sick", 2),
(DEFAULT, 9, "2021-10-02", "sick", 3),

(DEFAULT, 1, "2021-10-03", "sick", 1),
(DEFAULT, 4, "2021-10-03", "sick", 2),
(DEFAULT, 9, "2021-10-03", "sick", 3),
(DEFAULT, 10, "2021-10-03", "sick", 4),

(DEFAULT, 1, "2021-10-04", "sick", 1),
(DEFAULT, 4, "2021-10-04", "sick", 2),
(DEFAULT, 9, "2021-10-04", "sick", 3),
(DEFAULT, 10, "2021-10-04", "sick", 4),

(DEFAULT, 1, "2021-10-05", "sick", 1),
(DEFAULT, 4, "2021-10-05", "sick", 2),
(DEFAULT, 9, "2021-10-05", "sick", 3),
(DEFAULT, 10, "2021-10-05", "sick", 4),

(DEFAULT, 1, "2021-10-06", "well", 1),
(DEFAULT, 4, "2021-10-06", "sick", 2),
(DEFAULT, 9, "2021-10-06", "sick", 3),
(DEFAULT, 10, "2021-10-06", "sick", 4),

(DEFAULT, 1, "2021-10-07", "well", 1),
(DEFAULT, 4, "2021-10-07", "well", 2),
(DEFAULT, 9, "2021-10-07", "sick", 3),
(DEFAULT, 10, "2021-10-07", "sick", 4),

(DEFAULT, 1, "2021-10-08", "well", 1),
(DEFAULT, 4, "2021-10-08", "well", 2),
(DEFAULT, 9, "2021-10-08", "well", 3),
(DEFAULT, 10, "2021-10-08", "sick", 4),

(DEFAULT, 1, "2021-10-09", "well", 1),
(DEFAULT, 4, "2021-10-09", "well", 2),
(DEFAULT, 9, "2021-10-09", "well", 3),
(DEFAULT, 10, "2021-10-09", "well", 4)


;