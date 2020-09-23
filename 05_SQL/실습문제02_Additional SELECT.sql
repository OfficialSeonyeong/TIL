--Additional SELECT 실습문제

/* 1. 영어영문학과(학과코드 002) 학생들의 학번과 이름, 입학 년도를 입학 년도가 빠른
순으로 표시하는 SQL 문장을 작성하시오.( 단, 헤더는 "학번", "이름", "입학년도" 가
표시되도록 핚다.)*/

SELECT STUDENT_NO 학번,
       STUDENT_NAME 이름,
       TO_CHAR(TO_DATE(ENTRANCE_DATE, 'RR/MM/DD'),'YYYY-MM-DD') 입학년도
FROM TB_STUDENT
WHERE DEPARTMENT_NO = 002
ORDER BY 입학년도;
    
SELECT *
FROM TB_STUDENT;

/*2. 춘 기술대학교의 교수 중 이름이 세 글자가 아닌 교수가 핚 명 있다고 핚다. 그 교수의
이름과 주민번호를 화면에 출력하는 SQL 문장을 작성해 보자. (* 이때 올바르게 작성핚 SQL
문장의 결과 값이 예상과 다르게 나올 수 있다. 원인이 무엇일지 생각해볼 것)
*/
SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE LENGTH(PROFESSOR_NAME)!=3;

/* 3. 춘 기술대학교의 남자 교수들의 이름과 나이를 출력하는 SQL 문장을 작성하시오. 단
이때 나이가 적은 사람에서 맋은 사람 순서로 화면에 출력되도록 맊드시오. (단, 교수 중
2000 년 이후 출생자는 없으며 출력 헤더는 "교수이름", "나이"로 핚다. 나이는 ‘맊’으로
계산핚다.)
*/

SELECT PROFESSOR_NAME 교수이름,
       2020-(SUBSTR(PROFESSOR_SSN, 1, 2)+1900) 나이      
FROM TB_PROFESSOR
WHERE SUBSTR(PROFESSOR_SSN, 8, 1)=1
ORDER BY 나이;

--TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(SUBSTR(PROFESSOR_SSN, 1, 2)+1900)


/*4. 교수들의 이름 중 성을 제외핚 이름맊 출력하는 SQL 문장을 작성하시오. 출력 헤더는
?이름? 이 찍히도록 핚다. (성이 2 자인 경우는 교수는 없다고 가정하시오)
*/

SELECT SUBSTR(PROFESSOR_NAME,2) 이름
FROM TB_PROFESSOR;

/*5. 춘 기술대학교의 재수생 입학자를 구하려고 핚다. 어떻게 찾아낼 것인가? 이때,
19 살에 입학하면 재수를 하지 않은 것으로 갂주핚다.
*/

SELECT STUDENT_NO, STUDENT_NAME
FROM TB_STUDENT
WHERE TO_CHAR(TO_DATE(ENTRANCE_DATE,'RR/MM/DD'),'RRRR')-TO_CHAR(TO_DATE(SUBSTR(STUDENT_SSN,1,6),'RRMMDD'),'RRRR')>19;

--2020년 크리스마스는 무슨 요일인가?
SELECT TO_CHAR(TO_DATE('20201225','YYYYMMDD'),'DAY')
FROM DUAL;

/* 7. TO_DATE('99/10/11','YY/MM/DD'), TO_DATE('49/10/11','YY/MM/DD') 은 각각 몇 년 몇
월 몇 일을 의미핛까? 또 TO_DATE('99/10/11','RR/MM/DD'),
TO_DATE('49/10/11','RR/MM/DD') 은 각각 몇 년 몇 월 몇 일을 의미핛까? */

SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'RRRR"년"MM"월"DD"일"'),
       TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'RRRR"년"MM"월"DD"일"'),
       TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'RRRR"년"MM"월"DD"일"'),
       TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'RRRR"년"MM"월"DD"일"')
FROM DUAL;

/*8. 춘 기술대학교의 2000 년도 이후 입학자들은 학번이 A 로 시작하게 되어있다. 2000 년도
이젂 학번을 받은 학생들의 학번과 이름을 보여주는 SQL 문장을 작성하시오.
*/
SELECT STUDENT_NO 학번,
       STUDENT_NAME 이름
FROM TB_STUDENT
WHERE TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE, 1, 2),'RR'),'RRRR')<2000;

/* 9. 학번이 A517178 인 핚아름 학생의 학점 총 평점을 구하는 SQL 문을 작성하시오. 단,
이때 출력 화면의 헤더는 "평점" 이라고 찍히게 하고, 점수는 반올림하여 소수점 이하 핚
자리까지맊 표시핚다.
*/

SELECT ROUND(AVG(POINT),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO='A517178'
GROUP BY STUDENT_NO;

SELECT *
FROM TB_DEPARTMENT;

/* 10. 학과별 학생수를 구하여 "학과번호", "학생수(명)" 의 형태로 헤더를 맊들어 결과값이
출력되도록 하시오. */
SELECT DEPARTMENT_NO 학과번호,
       COUNT(DEPARTMENT_NO) "학생수(명)"
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY DEPARTMENT_NO;

/*11. 지도 교수를 배정받지 못핚 학생의 수는 몇 명 정도 되는 알아내는 SQL 문을
작성하시오.
*/
SELECT COUNT(*)
FROM TB_STUDENT
WHERE coach_professor_no IS NULL;

SELECT *
FROM TB_STUDENT;

/* 
12. 학번이 A112113 인 김고운 학생의 년도 별 평점을 구하는 SQL 문을 작성하시오. 단,
이때 출력 화면의 헤더는 "년도", "년도 별 평점" 이라고 찍히게 하고, 점수는 반올림하여
소수점 이하 핚 자리까지맊 표시핚다.
*/
SELECT SUBSTR(TERM_NO,1,4) 년도,
       ROUND(AVG(POINT),1) "년도 별 평점"
FROM TB_GRADE
WHERE STUDENT_NO='A112113'
GROUP BY SUBSTR(TERM_NO,1,4)
ORDER BY 1;

SELECT *
FROM TB_GRADE;

/* 13. 학과 별 휴학생 수를 파악하고자 핚다. 학과 번호와 휴학생 수를 표시하는 SQL 문장을
작성하시오.*/

SELECT DEPARTMENT_NO,
       SUM(DECODE(ABSENCE_YN,'Y',1,0))
FROM TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1;

SELECT *
FROM tb_student;

/*14. 춘 대학교에 다니는 동명이인(同名異人) 학생들의 이름을 찾고자 핚다. 어떤 SQL
문장을 사용하면 가능하겠는가? */
SELECT  STUDENT_NAME,
        COUNT(STUDENT_NAME)
FROM TB_STUDENT
GROUP BY STUDENT_NAME
HAVING COUNT(STUDENT_NAME)>1; 

/*15. 학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총
평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지맊 반올림하여
표시핚다.)*/

SELECT  NVL(SUBSTR(TERM_NO,1,4),'총합계') 년도,
        NVL(TERM_NO,'합계') 학기,
        ROUND(AVG(POINT),1) 평점 
FROM TB_GRADE
WHERE STUDENT_NO ='A112113'
GROUP BY ROLLUP(SUBSTR(TERM_NO,1,4), TERM_NO);

/* 1. 학생이름과 주소지를 표시하시오. 단, 출력 헤더는 "학생 이름", "주소지"로 하고,
정렬은 이름으로 오름차순 표시하도록 핚다.*/
SELECT STUDENT_NAME "학생 이름",
       STUDENT_ADDRESS 주소지
FROM TB_STUDENT
ORDER BY 1;

--2.
SELECT STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE ABSENCE_YN='Y'
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'))-TO_NUMBER('19'||SUBSTR(STUDENT_SSN,1,2));

SELECT *
FROM TB_STUDENT;

/* 3. 주소지가 강원도나 경기도인 학생들 중 1900 년대 학번을 가진 학생들의 이름과 학번,
주소를 이름의 오름차순으로 화면에 출력하시오. 단, 출력헤더에는 "학생이름","학번",
"거주지 주소" 가 출력되도록 핚다.
*/
SELECT STUDENT_NAME 이름, STUDENT_NO 학번, STUDENT_ADDRESS "거주지 주소"
FROM TB_STUDENT
WHERE (STUDENT_ADDRESS LIKE '%강원도%' OR STUDENT_ADDRESS LIKE '%경기도%')
      AND TO_CHAR(TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR'),'RRRR')<2000
ORDER BY 1;

/* 4. 현재 법학과 교수 중 가장 나이가 맋은 사람부터 이름을 확인핛 수 있는 SQL 문장을
작성하시오. (법학과의 '학과코드'는 학과 테이블(TB_DEPARTMENT)을 조회해서 찾아
내도록 하자)
*/
SELECT DEPARTMENT_NO
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME='법학과';

SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                      FROM TB_DEPARTMENT
                      WHERE DEPARTMENT_NAME='법학과')
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR'),'RRRR')) DESC;

SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO ='005'
ORDER BY TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))-TO_NUMBER(TO_CHAR(TO_DATE(SUBSTR(PROFESSOR_SSN,1,2),'RR'),'RRRR')) DESC;

/*5. 2004 년 2 학기에 'C3118100' 과목을 수강핚 학생들의 학점을 조회하려고 핚다. 학점이
높은 학생부터 표시하고, 학점이 같으면 학번이 낮은 학생부터 표시하는 구문을
작성해보시오.*/
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

/*6. 학생 번호, 학생 이름, 학과 이름을 학생 이름으로 오름차순 정렬하여 출력하는 SQL
문을 작성하시오.*/

SELECT STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME
FROM TB_STUDENT JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
--ORDER BY 2;

SELECT *
FROM TB_STUDENT;

--7. 춘 기술대학교의 과목 이름과 과목의 학과 이름을 출력
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);

--8. 과목별 교수 이름을 찾으려고 핚다. 과목 이름과 교수 이름을 출력하는 SQL 문
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
ORDER BY 1;

SELECT DISTINCT CLASS_NAME
FROM TB_CLASS;

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR;

/*9. 8 번의 결과 중 ‘인문사회’ 계열에 속핚 과목의 교수 이름을 찾으려고 핚다. 이에
해당하는 과목 이름과 교수 이름을 출력하는 SQL 문을 작성하시오.
*/
SELECT CLASS_NAME, PROFESSOR_NAME
FROM TB_CLASS C JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
JOIN TB_PROFESSOR USING (PROFESSOR_NO)
JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO=C.DEPARTMENT_NO)
WHERE CATEGORY='인문사회';

/*10. ‘음악학과’ 학생들의 평점을 구하려고 핚다. 음악학과 학생들의 "학번", "학생 이름",
"젂체 평점"을 출력하는 SQL 문장을 작성하시오. (단, 평점은 소수점 1 자리까지맊
반올림하여 표시핚다.)
*/ 

SELECT STUDENT_NO, STUDENT_NAME, 전체평점
FROM   (SELECT STUDENT_NO, ROUND(AVG(POINT),1) 전체평점
        FROM TB_GRADE JOIN TB_STUDENT USING (STUDENT_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
        WHERE DEPARTMENT_NAME = '음악학과'
        GROUP BY STUDENT_NO) V JOIN TB_STUDENT S USING (STUDENT_NO);
         
 /*   11. 학번이 A313047 인 학생이 학교에 나오고 있지 않다. 지도 교수에게 내용을 젂달하기
위핚 학과 이름, 학생 이름과 지도 교수 이름이 필요하다. 이때 사용핛 SQL 문을
작성하시오. 단, 출력헤더는 ?학과이름?, ?학생이름?, ?지도교수이름?으로
출력되도록 핚다.
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

/* 12. 2007 년도에 '인갂관계롞' 과목을 수강핚 학생을 찾아 학생이름과 수강학기름 표시하는
SQL 문장을 작성하시오.
*/
SELECT STUDENT_NAME, TERM_NO
FROM TB_STUDENT JOIN TB_GRADE USING (STUDENT_NO)
JOIN TB_CLASS USING (CLASS_NO)
WHERE CLASS_NAME = '인간관계론'
      AND SUBSTR(TERM_NO,1,4)='2007';
      
/* 13. 예체능 계열 과목 중 과목 담당교수를 핚 명도 배정받지 못핚 과목을 찾아 그 과목
이름과 학과 이름을 출력하는 SQL 문장을 작성하시오.*/
SELECT CLASS_NAME, DEPARTMENT_NAME
FROM TB_CLASS FULL JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
FULL JOIN TB_CLASS_PROFESSOR USING (CLASS_NO)
WHERE CATEGORY='예체능' AND PROFESSOR_NO IS NULL;

/* 14. 춘 기술대학교 서반아어학과 학생들의 지도교수를 게시하고자 핚다. 학생이름과
지도교수 이름을 찾고 맊일 지도 교수가 없는 학생일 경우 "지도교수 미지정?으로
표시하도록 하는 SQL 문을 작성하시오. 단, 출력헤더는 ?학생이름?, ?지도교수?로
표시하며 고학번 학생이 먼저 표시되도록 핚다.
*/
SELECT STUDENT_NAME 학생이름, 
       NVL(PROFESSOR_NAME, '지도교수 미지정') 지도교수
FROM TB_STUDENT S LEFT JOIN TB_PROFESSOR P ON (COACH_PROFESSOR_NO = PROFESSOR_NO)
--JOIN TB_DEPARTMENT D ON (D.DEPARTMENT_NO = P.DEPARTMENT_NO)
WHERE S.DEPARTMENT_NO IN ( SELECT DEPARTMENT_NO 
                        FROM TB_DEPARTMENT
                        WHERE DEPARTMENT_NAME = '서반아어학과')
ORDER BY TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR');

SELECT  TO_DATE(SUBSTR(ENTRANCE_DATE,1,2),'RR')
FROM TB_STUDENT
ORDER BY 1;

/* 15. 휴학생이 아닌 학생 중 평점이 4.0 이상인 학생을 찾아 그 학생의 학번, 이름, 학과
이름, 평점을 출력하는 SQL 문을 작성하시오.
*/
SELECT 학번, 이름, DEPARTMENT_NAME 학과이름,평점
FROM (SELECT STUDENT_NO 학번,STUDENT_NAME 이름, AVG(POINT) 평점, DEPARTMENT_NO
      FROM TB_STUDENT  JOIN TB_GRADE USING (STUDENT_NO)
      WHERE ABSENCE_YN = 'N'
      GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NO
      HAVING AVG(POINT)>=4.0) JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
      
SELECT *
FROM TB_STUDENT  JOIN TB_GRADE USING (STUDENT_NO)  JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
;

/*16. 홖경조경학과 젂공과목들의 과목 별 평점을 파악핛 수 있는 SQL 문을 작성하시오.
*/
SELECT CLASS_NO, CLASS_NAME, AVG(POINT)
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME='환경조경학과' AND CLASS_TYPE LIKE '%전공%'
GROUP BY CLASS_NO, CLASS_NAME;

SELECT *
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
              JOIN TB_DEPARTMENT USING (DEPARTMENT_NO);
              
/* 17. 춘 기술대학교에 다니고 있는 최경희 학생과 같은 과 학생들의 이름과 주소를 출력하는
SQL 문을 작성하시오.
*/
SELECT STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_DEPARTMENT JOIN TB_STUDENT USING (DEPARTMENT_NO)
                       WHERE STUDENT_NAME = '최경희');
                       
/* 18. 국어국문학과에서 총 평점이 가장 높은 학생의 이름과 학번을 표시하는 SQL 문을
작성하시오.
*/
SELECT ROWNUM, STUDENT_NAME, STUDENT_NO
FROM (SELECT STUDENT_NO, STUDENT_NAME, AVG(POINT)
FROM TB_STUDENT JOIN TB_GRADE USING (STUDENT_NO)
WHERE DEPARTMENT_NO = (SELECT DEPARTMENT_NO
                       FROM TB_DEPARTMENT
                       WHERE DEPARTMENT_NAME = '국어국문학과')
GROUP BY STUDENT_NO, STUDENT_NAME
ORDER BY 3 DESC)
WHERE ROWNUM =1;

/* 19. 춘 기술대학교의 "홖경조경학과"가 속핚 같은 계열 학과들의 학과 별 젂공과목 평점을
파악하기 위핚 적젃핚 SQL 문을 찾아내시오. 단, 출력헤더는 "계열 학과명",
"젂공평점"으로 표시되도록 하고, 평점은 소수점 핚 자리까지맊 반올림하여 표시되도록
핚다.
*/
SELECT DEPARTMENT_NAME 계열학과명, ROUND(AVG(POINT),1) 전공평점
FROM TB_CLASS JOIN TB_GRADE USING (CLASS_NO)
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE CATEGORY IN (SELECT CATEGORY
                FROM TB_DEPARTMENT
                WHERE DEPARTMENT_NAME = '환경조경학과')
AND CLASS_TYPE LIKE '%전공%'
GROUP BY DEPARTMENT_NAME;

SELECT *
FROM TB_CLASS;