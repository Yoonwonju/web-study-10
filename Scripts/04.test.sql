SELECT TITLE_NO, TITLE_NAME
FROM TITLE;

SELECT DEPT_NO, DEPT_NAME, FLOOR
FROM DEPARTMENT;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, HIREDATE FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE e;


SELECT  *
  FROM TITLE;

SELECT  *
  FROM DEPARTMENT;

SELECT EMP_NO, EMP_NAME, TNO, MANAGER, SALARY, DNO, HIREDATE
  FROM EMPLOYEE e ;
  
INSERT INTO EMPLOYEE VALUES (1365, '김상원', 5, 3426, 1500000, 1, 2020-08-30 );

---------------------------

SELECT max(TITLE_NO)+1 FROM TITLE;

SELECT max(DEPT_NO)+1 FROM DEPARTMENT;

INSERT INTO DEPARTMENT VALUES (4, '홍보',  5);

SELECT  *  FROM DEPARTMENT;

DELETE FROM DEPARTMENT WHERE DEPT_NO = 4;

UPDATE DEPARTMENT SET DEPT_NAME = '보홍', FLOOR = '7'  WHERE DEPT_NO = 5;