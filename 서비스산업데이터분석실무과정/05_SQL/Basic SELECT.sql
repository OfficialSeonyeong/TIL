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
    emp_name AS �̸�,
    salary * 12 AS "1�� �޿�",
    ( salary + ( salary * bonus_pct ) ) * 12 AS "�� �ҵ�(��)"
FROM
    employee
WHERE BONUS_PCT IS NOT NULL;

SELECT
    emp_id,
    emp_name,
    '����' AS �ٹ�����
FROM
    employee;

SELECT DISTINCT
    job_id,
    dept_id
FROM
    employee
ORDER BY
    job_id;

--�࿡ ���� ������ WHERE��.

SELECT
    *
FROM
    employee
WHERE
    dept_id = 90
    AND salary >= 5000000;

--������̺��� 90�� �μ��� 20�� �μ��� �Ҽӵ� ����� �̸�, �μ��ڵ�, �޿��� ��ȸ�ϼ���.

SELECT
    emp_name  �̸�,
    dept_id �μ�,
    salary �޿�
FROM
    employee
WHERE
    (DEPT_ID = '20'
    OR dept_id = '90')
    AND SALARY >=3000000;
    
SELECT EMP_NAME||'�� ������ '||SALARY||'�� �Դϴ�.' MONTH_SALARY
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
WHERE EMP_NAME NOT LIKE '��%';

SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE NOT EMP_NAME LIKE '��%';

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


