--Additional SELECT �ǽ�����

/* 1. ������а�(�а��ڵ� 002) �л����� �й��� �̸�, ���� �⵵�� ���� �⵵�� ����
������ ǥ���ϴ� SQL ������ �ۼ��Ͻÿ�.( ��, ����� "�й�", "�̸�", "���г⵵" ��
ǥ�õǵ��� ����.)*/

SELECT STUDENT_NO �й�,
       STUDENT_NAME �̸�,
       TO_CHAR(TO_DATE(ENTRANCE_DATE, 'RR/MM/DD'),'YYYY-MM-DD') ���г⵵
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY ���г⵵;
    
SELECT *
FROM TB_STUDENT;

/*2. �� ������б��� ���� �� �̸��� �� ���ڰ� �ƴ� ������ �� �� �ִٰ� ����. �� ������
�̸��� �ֹι�ȣ�� ȭ�鿡 ����ϴ� SQL ������ �ۼ��� ����. (* �̶� �ùٸ��� �ۼ��� SQL
������ ��� ���� ����� �ٸ��� ���� �� �ִ�. ������ �������� �����غ� ��)
*/
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME)!=3;

/* 3. �� ������б��� ���� �������� �̸��� ���̸� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��
�̶� ���̰� ���� ������� ���� ��� ������ ȭ�鿡 ��µǵ��� ����ÿ�. (��, ���� ��
2000 �� ���� ����ڴ� ������ ��� ����� "�����̸�", "����"�� ����. ���̴� ����������
�������.)
*/

SELECT PROFESSOR_NAME �����̸�,
       2020-(SUBSTR(PROFESSOR_SSN, 1, 2)+1900) ����      
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1)=1
ORDER BY ����;

--TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(SUBSTR(PROFESSOR_SSN, 1, 2)+1900)


/*4. �������� �̸� �� ���� ������ �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�. ��� �����
?�̸�? �� �������� ����. (���� 2 ���� ���� ������ ���ٰ� �����Ͻÿ�)
*/

SELECT SUBSTR(PROFESSOR_NAME,2) �̸�
FROM TB_PROFESSOR;

/*5. �� ������б��� ����� �����ڸ� ���Ϸ��� ����. ��� ã�Ƴ� ���ΰ�? �̶�,
19 �쿡 �����ϸ� ����� ���� ���� ������ �A������.
*/

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE TO_CHAR(TO_DATE(ENTRANCE_DATE,'RR/MM/DD'),'RRRR')-TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RRMMDD'),'RRRR')>19;

--2020�� ũ���������� ���� �����ΰ�?
SELECT TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')
FROM DUAL;

/* 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') �� ���� �� �� ��
�� �� ���� �ǹ�����? �� TO_DATE('99/10/11','RR/MM/DD'),
TO_DATE('49/10/11','RR/MM/DD') �� ���� �� �� �� �� �� ���� �ǹ�����? */

SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'RRRR"��"MM"��"DD"��"'),
       TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'RRRR"��"MM"��"DD"��"'),
       TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'RRRR"��"MM"��"DD"��"'),
       TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'RRRR"��"MM"��"DD"��"')
FROM DUAL;

/*8. �� ������б��� 2000 �⵵ ���� �����ڵ��� �й��� A �� �����ϰ� �Ǿ��ִ�. 2000 �⵵
�̠� �й��� ���� �л����� �й��� �̸��� �����ִ� SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NO �й�,
       STUDENT_NAME �̸�
FROM TB_STUDENT
WHERE TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE, 1, 2),'RR'),'RRRR')<2000;

/* 9. �й��� A517178 �� ���Ƹ� �л��� ���� �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
�̶� ��� ȭ���� ����� "����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ� �Ҽ��� ���� ��
�ڸ������� ǥ������.
*/

SELECT ROUND(AVG(POINT),1) ����
FROM TB_GRADE
WHERE STUDENT_NO='A517178'
GROUP BY STUDENT_NO;

SELECT *
FROM TB_DEPARTMENT;

/* 10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���(��)" �� ���·� ����� ����� �������
��µǵ��� �Ͻÿ�. */
SELECT DEPARTMENT_NO �а���ȣ,
       COUNT(DEPARTMENT_NO) "�л���(��)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

/*11. ���� ������ �������� ���� �л��� ���� �� �� ���� �Ǵ� �˾Ƴ��� SQL ����
�ۼ��Ͻÿ�.
*/
SELECT COUNT(*)
FROM TB_STUDENT
WHERE coach_professor_no IS NULL;

SELECT *
FROM TB_STUDENT;

/* 
12. �й��� A112113 �� ���� �л��� �⵵ �� ������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. ��,
�̶� ��� ȭ���� ����� "�⵵", "�⵵ �� ����" �̶�� ������ �ϰ�, ������ �ݿø��Ͽ�
�Ҽ��� ���� �� �ڸ������� ǥ������.
*/
SELECT SUBSTR(TERM_NO,1,4) �⵵,
       ROUND(AVG(POINT),1) "�⵵ �� ����"
FROM TB_GRADE
WHERE STUDENT_NO='A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

SELECT *
FROM TB_GRADE;

/* 13. �а� �� ���л� ���� �ľ��ϰ��� ����. �а� ��ȣ�� ���л� ���� ǥ���ϴ� SQL ������
�ۼ��Ͻÿ�.*/

SELECT DEPARTMENT_NO,
       SUM(DECODE(ABSENCE_YN,'Y',1,0))
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

SELECT *
FROM tb_student;

/*14. �� ���б��� �ٴϴ� ��������(��٣���) �л����� �̸��� ã���� ����. � SQL
������ ����ϸ� �����ϰڴ°�? */
SELECT  STUDENT_NAME,
        COUNT(STUDENT_NAME)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(STUDENT_NAME)>1; 

/*15. �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ�
ǥ������.)*/

SELECT  NVL(SUBSTR(TERM_NO,1,4),'���հ�') �⵵,
        NVL(TERM_NO,'�հ�') �б�,
        ROUND(AVG(POINT),1) ���� 
FROM TB_GRADE
WHERE STUDENT_NO ='A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4), TERM_NO);

/* 1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,
������ �̸����� �������� ǥ���ϵ��� ����.*/
SELECT STUDENT_NAME "�л� �̸�",
       STUDENT_ADDRESS �ּ���
FROM TB_STUDENT
ORDER BY 1;

--2.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN='Y'
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-TO_NUMBER('19'||SUBSTR(STUDENT_SSN,1,2));

SELECT *
FROM TB_STUDENT;

/* 3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�,
�ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�",
"������ �ּ�" �� ��µǵ��� ����.
*/
SELECT STUDENT_NAME �̸�, STUDENT_NO �й�, STUDENT_ADDRESS "������ �ּ�"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%������%' OR STUDENT_ADDRESS LIKE '%��⵵%')
      AND TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR'),'RRRR')<2000
ORDER BY 1;

/* 4. ���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���� �� �ִ� SQL ������
�ۼ��Ͻÿ�. (���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
������ ����)
*/
SELECT DEPARTMENT_NO
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME='���а�';

SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                      FROM TB_DEPARTMENT
                      WHERE DEPARTMENT_NAME='���а�')
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR'),'RRRR')) DESC;

SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO ='005'
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR'),'RRRR')) DESC;

/*5. 2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������
���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������
�ۼ��غ��ÿ�.*/
SELECT POINT,
       STUDENT_NO
FROM TB_GRADE
WHERE CLASS_NO='C3118100' AND TERM_NO='200402'
ORDER BY POINT DESC, STUDENT_NO;

SELECT *
FROM TB_GRADE;

SELECT EMP_NAME,
       DEPT_NAME
FROM EMPLOYEE, DEPARTMENT;

/*6. �л� ��ȣ, �л� �̸�, �а� �̸��� �л� �̸����� �������� �����Ͽ� ����ϴ� SQL
���� �ۼ��Ͻÿ�.*/

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
--ORDER BY 2;

SELECT *
FROM TB_STUDENT;

--7. �� ������б��� ���� �̸��� ������ �а� �̸��� ���
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);

--8. ���� ���� �̸��� ã������ ����. ���� �̸��� ���� �̸��� ����ϴ� SQL ��
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
ORDER BY 1;

SELECT DISTINCT CLASS_NAME
FROM TB_CLASS;

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR;

/*9. 8 ���� ��� �� ���ι���ȸ�� �迭�� ���� ������ ���� �̸��� ã������ ����. �̿�
�ش��ϴ� ���� �̸��� ���� �̸��� ����ϴ� SQL ���� �ۼ��Ͻÿ�.
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO=C.DEPARTMENT_NO)
WHERE CATEGORY='�ι���ȸ';

/*10. �������а��� �л����� ������ ���Ϸ��� ����. �����а� �л����� "�й�", "�л� �̸�",
"��ü ����"�� ����ϴ� SQL ������ �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ�������
�ݿø��Ͽ� ǥ������.)
*/ 

SELECT STUDENT_NO, STUDENT_NAME, ��ü����
FROM   (SELECT STUDENT_NO, ROUND(AVG(POINT),1) ��ü����
        FROM TB_GRADE JOIN TB_STUDENT USING (STUDENT_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        WHERE DEPARTMENT_NAME = '�����а�'
        GROUP BY STUDENT_NO) V JOIN TB_STUDENT S USING (STUDENT_NO);
         
 /*   11. �й��� A313047 �� �л��� �б��� ������ ���� �ʴ�. ���� �������� ������ �����ϱ�
���� �а� �̸�, �л� �̸��� ���� ���� �̸��� �ʿ��ϴ�. �̶� ����� SQL ����
�ۼ��Ͻÿ�. ��, �������� ?�а��̸�?, ?�л��̸�?, ?���������̸�?����
��µǵ��� ����.
*/
SELECT *
FROM TB_STUDENT
WHERE STUDENT_NO = 'A313047';

SELECT DEPARTMENT_NAME, STUDENT_NAME, PROFESSOR_NAME
FROM TB_STUDENT S JOIN TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
JOIN TB_PROFESSOR P ON (S.COACH_PROFESSOR_NO = P.PROFESSOR_NO)
WHERE STUDENT_NO = 'A313047';

    
SELECT *
FROM TB_STUDENT S JOIN TB_DEPARTMENT D ON (S.DEPARTMENT_NO = D.DEPARTMENT_NO)
JOIN TB_PROFESSOR P ON (S.COACH_PROFESSOR_NO = P.PROFESSOR_NO);

/* 12. 2007 �⵵�� '�΁A�����' ������ ������ �л��� ã�� �л��̸��� �����б⸧ ǥ���ϴ�
SQL ������ �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_CLASS USING (CLASS_NO)
WHERE CLASS_NAME = '�ΰ������'
      AND SUBSTR(TERM_NO,1,4)='2007';
      
/* 13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� ����
�̸��� �а� �̸��� ����ϴ� SQL ������ �ۼ��Ͻÿ�.*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS FULL JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
FULL JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE CATEGORY='��ü��' AND PROFESSOR_NO IS NULL;

/* 14. �� ������б� ���ݾƾ��а� �л����� ���������� �Խ��ϰ��� ����. �л��̸���
�������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� "�������� ������?����
ǥ���ϵ��� �ϴ� SQL ���� �ۼ��Ͻÿ�. ��, �������� ?�л��̸�?, ?��������?��
ǥ���ϸ� ���й� �л��� ���� ǥ�õǵ��� ����.
*/
SELECT STUDENT_NAME �л��̸�, 
       NVL(PROFESSOR_NAME, '�������� ������') ��������
FROM TB_STUDENT S LEFT JOIN TB_PROFESSOR P ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
--JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO = P.DEPARTMENT_NO)
WHERE S.DEPARTMENT_NO IN ( SELECT DEPARTMENT_NO 
                        FROM TB_DEPARTMENT
                        WHERE DEPARTMENT_NAME = '���ݾƾ��а�')
ORDER BY TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR');

SELECT  TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR')
FROM TB_STUDENT
ORDER BY 1;

/* 15. ���л��� �ƴ� �л� �� ������ 4.0 �̻��� �л��� ã�� �� �л��� �й�, �̸�, �а�
�̸�, ������ ����ϴ� SQL ���� �ۼ��Ͻÿ�.
*/
SELECT �й�, �̸�, DEPARTMENT_NAME �а��̸�,����
FROM (SELECT STUDENT_NO �й�,STUDENT_NAME �̸�, AVG(POINT) ����, DEPARTMENT_NO
      FROM TB_STUDENT  JOIN TB_GRADE USING (STUDENT_NO)
      WHERE ABSENCE_YN = 'N'
      GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NO
      HAVING AVG(POINT)>=4.0) JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
      
SELECT *
FROM TB_STUDENT  JOIN TB_GRADE USING (STUDENT_NO)  JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
;

/*16. �Q�������а� ����������� ���� �� ������ �ľ��� �� �ִ� SQL ���� �ۼ��Ͻÿ�.
*/
SELECT CLASS_NO, CLASS_NAME, AVG(POINT)
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME='ȯ�������а�' AND CLASS_TYPE LIKE '%����%'
GROUP BY CLASS_NO, CLASS_NAME;

SELECT *
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
              
/* 17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ�
SQL ���� �ۼ��Ͻÿ�.
*/
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_DEPARTMENT JOIN TB_STUDENT USING (DEPARTMENT_NO)
                       WHERE STUDENT_NAME = '�ְ���');
                       
/* 18. ������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL ����
�ۼ��Ͻÿ�.
*/
SELECT ROWNUM, STUDENT_NAME, STUDENT_NO
FROM (SELECT STUDENT_NO, STUDENT_NAME, AVG(POINT)
FROM TB_STUDENT JOIN TB_GRADE USING (STUDENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_DEPARTMENT
                       WHERE DEPARTMENT_NAME = '������а�')
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 3 DESC)
WHERE ROWNUM =1;

/* 19. �� ������б��� "�Q�������а�"�� ���� ���� �迭 �а����� �а� �� �������� ������
�ľ��ϱ� ���� ������ SQL ���� ã�Ƴ��ÿ�. ��, �������� "�迭 �а���",
"��������"���� ǥ�õǵ��� �ϰ�, ������ �Ҽ��� �� �ڸ������� �ݿø��Ͽ� ǥ�õǵ���
����.
*/
SELECT DEPARTMENT_NAME �迭�а���, ROUND(AVG(POINT),1) ��������
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE CATEGORY IN (SELECT CATEGORY
                FROM TB_DEPARTMENT
                WHERE DEPARTMENT_NAME = 'ȯ�������а�')
AND CLASS_TYPE LIKE '%����%'
GROUP BY DEPARTMENT_NAME;

SELECT *
FROM TB_CLASS;