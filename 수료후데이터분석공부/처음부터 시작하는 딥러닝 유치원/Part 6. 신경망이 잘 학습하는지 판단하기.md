# Part 6. 신경망이 잘 학습하는지 판단하기



## 01. Loss Function

### Loss

- 손실값, 원하는 출력값(target, y)과 실제 출력값(output, y^)의 차이의 합
- loss가 작을수록 가상의 함수를 잘 모사하고 있다고 말할 수 있음

### Loss Function

- 입력: Linear Layer의 파라미터
- 출력: Loss

**손실값 도출 방법**

Euclidean Distance(L2)

L1 = 절대값

*차원이 커질수록 손실값이 커진다.* ⇒ RMSE(Root Mean Square Error)

MSE(Mean Square Error) → 많이 쓰이는 함수

결론: Linear Layer 파라미터를 바꾸면서 Loss를 최소화 해야 한다.



## 02. 실습 MSE Loss

jupyter notebook으로 실행