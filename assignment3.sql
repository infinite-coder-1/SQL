/*Retrieve a list of MANAGERS.*/
SELECT * FROM EMP WHERE JOB = 'MANAGERS'
/* Find out the names and salaries of all employees earning more than 1000 per month. */
SELECT ENAME, SAL FROM EMP WHERE SAL > 1000;
/*Display the names and salaries of all employees except JAMES. */
SELECT ENAME, SAL FROM EMP WHERE NOT EMANE = 'JAMES';
/*Find out the details of employees whose names begin with ‘S’. */
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
/*Find out the names of all employees that have ‘A’ anywhere in their name. */
SELECT ENAME FROM EMP WHERE ENAME LIKE '%A%';
/*Find out the names of all employees that have ‘L’ as their third character in their name. */
SELECT ENAME FROM EMP WHERE ENAME LIKE '__L%';
/*Compute daily salary of JONES. */
SELECT ENAME, SAL/30 AS 'DAILY SALARY' FROM EMP WHERE ENAME = 'JONES';
/*Calculate the total monthly salary of all employees. */
SELECT SUM(SAL) AS 'TOTAL MONTHLY SALARY' FROM EMP;
/*Print the average annual salary . */
SELECT AVG(SAL*12) AS 'AVERAGE SALARY' FROM EMP;
/*Select the name, job, salary, department number of all employees except SALESMAN from department number 30. */
SELECT ENAME, JOB, SAL, DEPTNO FROM EMP WHERE DEPTNO=30 AND NOT job='SALESMAN';
/*List unique departments of the EMP table. */
SELECT DISTINCT DEPTNO FROM EMP;
/*List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively. */
SELECT ENAME AS 'EMPLOYEE', SAL AS 'MONTHLY SALARY' FROM EMP WHERE SAL > 1500 AND (DEPTNO=10 OR DEPTNO=30);
/*Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. */
SELECT ENAME, JOB, SAL FROM EMP WHERE SAL NOT IN(1000, 3000, 5000) AND(JOB='MANAGER' OR JOB='ANALYST');
/*Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. */
SELECT ENAME, SAL, COMM FRPM EMP WHERE COMM > SAL*1.1;
/*Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. */
SELECT ENAME FROM EMP WHERE ENAME LIKE '%L%L%' AND (DEPTNO=30 OR MRG_ID=7782);
/*Retrieve the names of departments in ascending order and their employees in descending order. */
SELECT DEPT.DNAME, EMP.ENAME FROM DEPT INNER JOIN EMP ON DEPT.DEPTNO=EMP.DEPTNO ORDERBY DNAME ASC, ENAME DESC; 
/*Find out experience of MILLER. */
SELECT EMPNO, ENMAE, HIREDATE, DATEDIFF(SYSDATE(),HIREDATE)/365 AS 'EXPERIENCE'FROM EMP WHERE ENAME = 'MILLER';