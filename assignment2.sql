CREATE TABLE EMP (
 EMPNO INT PRIMARY KEY,
 EMAME VARCHAR(20),
 JOB VARCHAR(10),
 MRGID INT,
 HIREDATE DATE,
 SAL INT,
 COMM INT,
 DEPTNO INT
 )
 
 CREATE TABLE DEPT(
 DEPTNO INT PRIMARY KEY,
 DNAME VARCHAR(20),
 LOC VARCHAR(10)
 )
 
 INSERT INTO EMP
 VALUES
(7369,    'SMITH' ,     'CLERK',	      7902 ,  	'1980-01-23',     	 800,	 0,          20),
(7499,   'ALLEN'  ,    'SALESMAN',     7698  ,    '1988-02-24' ,   	 1600,     300 ,   30),
(7521,  'WARD'	  ,    'SALESMAN',     7698 ,    '1980-04-29' , 		 1250 ,    500 ,   30),
(7566,    'JONES' ,     'MANAGER',      7839 ,     '1988-04-03',   	 2975 ,   0,       20),
(7654,    'MARTIN',     'SALESMAN',     7698 ,     '1980-01-23' , 	     1250,    1400 ,   30),
(7698,	  'BLAKE' ,	     'MANAGER', 	 7839, 	  '1983-07-18'    ,	      2850,    0,        30),
(7782, 	  'CLARK' ,    'MANAGER' ,      7839 ,     '1980-01-23'  , 	 2450 ,    0,       10),
(7788,    'SCOTT'  ,   'ANALYST'  ,     7566 ,     '1983-07-18' ,     3000,    0,        20),
(7839,    'KING'   ,   'PRESIDENT',            	 '1988-04-03'  ,   	 5000,     0,       10),
(7844,    'TURNER' ,   'SALESMAN' ,     7698 ,  	 '1980-01-23' ,   	 1500 ,     0 ,    30),
(7876,    'ADAMS'  ,   'CLERK ' ,       7788 ,  	 '1988-04-03' ,     1100 ,     0,       20),
(7900,    'JAMES'  ,   'CLERK' ,        7698 ,  	 '1988-02-24' , 	  950  ,   0,       30),
(7902,    'FORD'   ,   'ANALYST',       7566 ,  	 '1980-01-23' ,  	 3000 ,    0,       20),
(7934,    'MILLER' ,  'CLERK' ,        7782  ,  	 '1988-02-24' ,	  1300 ,      0,     10)

INSERT INTO DEPT
VALUES
(10,     'ACCOUNTING',    'NEW YORK'), 
(20 ,    'RESEARCH',      'DALLAS '),
(30 ,    'SALES' ,        'CHICAGO '),
(40 ,    'OPERATIONS',    'BOSTON ')

/*List all employees whose name begins with 'A' */

-> SELECT * FROM EMP WHERE ENAME LIKE 'A%';

/*Select all those employees who don't have a manager. */

-> SELECT * FROM EMP WHERE MRG-ID IS NULL;

/*List employee name, number and salary for those employees who earn in the range 1200 to 1400.*/

-> SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL BETWEEN 1200 AND 1400;

/*Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise.*/

-> Select EMPNO, ENAME, SAL as 'BEFORE-SAL', 1.10*SAL as 'AFTER-SAL' from EMP where JOB = 'RESEARCH';

/*Find the number of CLERKS employed. Give it a descriptive heading. */

-> Select JOB COUNT(*) as 'NO OF EMPLOYEE' from EMP where JOB = 'CLERKS' group by JOB;

/*Find the average salary for each job type and the number of people employed in each job. */

-> select DEPTNO, average(SAL) as average_salary, count(EMPNO) as total_employee from EMP group by DEPTNO;

/*List the employees with the lowest and highest salary. */

-> select  EMPNO, ENAME, SAL from EMP where SAL = (select MAX(SAL) from EMP) or SAL = (select MIN(SAL) from EMP);

/*List full details of departments that don't have any employees. */

-> Select * from DEPT where DEPTNO not in (Select DEPTNO from emp);

/*Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. */

-> select EMPNO, ENAME, SAL from EMP where JOB = 'ANALYST' and SAL > 1200 and DEPTNO = 20 order by ENAME;

/*Find out salary of both MILLER and SMITH. */

-> SELECT ENAME, 12*(sal+NVL(comm,0)) AS “annual Sal” FROM EMP where ENAME = 'SMITH' OR ENAME = 'MILLER' ;

/*Find out the names of the employees whose name begin with ‘A’ or ‘M’. */

-> SELECT * FROM EMP WHERE ENAME LIKE 'A%' OR ENAME LIKE 'M%';

/*Compute yearly salary of SMITH. */

-> SELECT ENAME, 12*(sal+NVL(comm,0)) AS “annual Sal” FROM EMP where ENAME = 'SMITH' ;

/*List the name and salary for all employees whose salary is not in the range of 1500 and 2850. */

-> SELECT ENAME, SAL FROM EMP WHERE SAL NOT BETWEEN 1500 AND 2850;

/*display list of managers who have more than 2 employees reporting to them */

-> select MRG-ID, count(EMPNO) as 'No of Employee' from EMP group by MRG-ID having count(EMPNO)>2;
