﻿CREATE OR REPLACE PROCEDURE FACULTY_INSERT_OPTION_ONE
(
  FACULTY_NAME IN VARCHAR2 
, FACULTY_ID IN NUMBER 
, FACULTY_DEPARTMENT IN NUMBER 
) AS
  V_SALARY REAL := 0;
BEGIN
  SELECT AVG(SALARY) INTO V_SALARY FROM FACULTY WHERE DEPTID = FACULTY_DEPARTMENT;
  IF V_SALARY > 50000 THEN
    V_SALARY := V_SALARY * 0.9;
  ELSIF V_SALARY >= 30000 THEN
    V_SALARY := V_SALARY * 0.8;
  END IF;
  INSERT INTO FACULTY VALUES (FACULTY_ID, FACULTY_NAME, FACULTY_DEPARTMENT, V_SALARY);
END FACULTY_INSERT_OPTION_ONE;