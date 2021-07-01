# Part 9. 로지스틱 회귀(Logistic Regression)



## 01. Activation Functions: Sigmoid & TahH

- Sigmoid는 **0 ~ 1** 의 값을 가진다.  $\sigma(x)$
- TahH는 **-1 ~ 1** 의 값을 가진다.   $Tanh(x)$



## 02. 실습 Sigmoid Function

jupyter notebook으로 실행



## 03. Logistic Regression

- **참(True)/거짓(False)**으로 결과가 나뉘는 함수들도 존재한다.
- Linear Regression과 비슷한 구조이나, 마지막에 Sigmoid 함수를 통과 시킴
- 1(True)과 0(False) 사이의 값 반환 - 0.5 이상이면 True, 0.5 이하이면 False
- sigmoid의 출력 값은 확률 값 $P(y|x)$으로 생각해볼 수 있다.
- **이진 분류(binary classification)** 문제이다.

