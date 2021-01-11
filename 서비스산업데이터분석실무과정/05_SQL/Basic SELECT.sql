-- SINGLELINE COMMENT
/*
MULTILINE COMMENT
*/
SELECT
    *
FROM
    employee;

SELECT
    slevel
FROM
    sal_grade;

SELECT
    lowest,
    highest
FROM
    sal_grade;

SELECT
    *
FROM
    job;

SELECT
    job_id,
    dept_id
FROM
    employee;

SELECT
    *
FROM
    department;

SELECT
    emp_name AS 이름,
    salary * 12 AS "1년 급여",
    ( salary + ( salary * bonus_pct ) ) * 12 AS "총 소득(원)"
FROM
    employee
WHERE BONUS_PCT IS NOT NULL;

SELECT
    emp_id,
    emp_name,
    '재직' AS 근무여부
FROM
    employee;

SELECT DISTINCT
    job_id,
    dept_id
FROM
    employee
ORDER BY
    job_id;

--행에 대한 제한은 WHERE절.

SELECT
    *
FROM
    employee
WHERE
    dept_id = 90
    AND salary >= 5000000;

--사원테이블에서 90번 부서나 20번 부서에 소속된 사원의 이름, 부서코드, 급여를 조회하세요.

SELECT
    emp_name  이름,
    dept_id 부서,
    salary 급여
FROM
    employee
WHERE
    (DEPT_ID = '20'
    OR dept_id = '90')
    AND SALARY >=3000000;
    
SELECT EMP_NAME||'의 월급은 '||SALARY||'원 입니다.' MONTH_SALARY
FROM EMPLOYEE;

SELECT EMP_NAME,
       SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 5500000
ORDER BY SALARY;

SELECT EMP_NAME,
       SALARY
FROM EMPLOYEE
WHERE SALARY >= 3500000
AND SALARY<=5500000
ORDER BY SALARY;

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE EMP_NAME NOT LIKE '김%';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE NOT EMP_NAME LIKE '김%';

SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE PHONE LIKE '___9_______';

SELECT EMP_NAME, EMAIL
FROM EMPLOYEE
WHERE EMAIL LIKE '___^_%'ESCAPE '^';

SELECT EMP_NAME, MGR_ID, DEPT_ID
FROM EMPLOYEE
WHERE MGR_ID IS NULL
AND DEPT_ID IS NULL;

SELECT EMP_NAME, DEPT_ID, BONUS_PCT
FROM EMPLOYEE
WHERE DEPT_ID IS NULL
AND BONUS_PCT IS NOT NULL;

----------------------------------------------------------------------------------------------------------


