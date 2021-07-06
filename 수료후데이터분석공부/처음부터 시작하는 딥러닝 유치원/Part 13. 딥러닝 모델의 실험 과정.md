# Part 13. 딥러닝 모델의 실험 과정



## 01. 실험 과정 소개

### 평가(Evaluation)

실제 서비스에서 들어올 데이터와 최대한 비슷한 테스트 데이터를 활용한 평가

- 테스트 셋은 너무 쉽거나 어렵다면 변별력이 떨어지게 되고, 학습 데이터와 절대 겹치면 안된다. ⇒ 테스트 셋을 공들여 만들어야 한다.

실제 평가가 진행되는 과정의 예

1. 모델과 테스트셋을 만든다.
2. 테스트셋을 기존의 다른 모델(경쟁사 서비스)에 넣어 결과(baseline) 얻기
3. (정성 평가의 경우, **blind test** 진행)
4. 나의 모델의 결과와 baseline과 비교하기 + 보고

*정성(intrinsic) 평가*

- 테스트 셋 결과물에 대해 보통 사람이 채점을 진행
- 평가 비용이 비싸고 소요 시간이 크다.
- 가장 정확한 방법이지만 채점자마다 달리 답이 모호한 경우가 많다.

*정량(extrinsic) 평가*

- Score metric에 의해서 테스트 셋 결과물의 채점을 진행
- 대량 평가 및 자동화 가능
- 정성 평가와 비슷한 metric일수록 좋은 정량 평가 방법

서비스 배포 계획이라면 정성 평가를 꼭 해야 함.



## 02. 오버피팅이란

- 학습 데이터 상에 편향(bias)이나 noise가 존재할 수 있다.
- 우리의 목표는 unseen data에 대해 좋은 prediction을 하는 것 = Generalization
- 따라서 training error를 최소화하는 것이 최종 목표가 아니고 최종 목표는 generalization error를 최소화하는 것!

**Overfitting**

- Training error가 generalization error에 비해 현격히 낮아지는 현상
- 학습에 불필요한 bias, noise까지 모두 학습하는 현상
- *underfitting: 모델의 capacity가 부족해 training error가 충분히 낮지 않은 현상*
- Overfitting 현상이 꼭 나쁜 것은 아니다. 모델의 capacity가 충분한지 확인하는 한 방법이다.

**Validation Set**

- 학습 데이터를 정해진 비율로 **random split**하여 train/valid set 구성
- training error는 낮지만 validation error는 높다면 overfitting이 일어난 것
- 따라서 매 epoch가 끝나면 validation error를 측정하여 모델의 generalization을 평가해야 한다.

⇒ Validation Loss를 최소화하는 파라미터를 찾자!

**Early Stopping**

Validation loss가 일정 기간동안 개선이 없을 때, 학습 종료

**Test Set**

- Validation error를 최소화하기 위해 hyper-parameter 조절
- Validation set에 overfitting 될 가능성
- **Test Set**을 따로 두어, 최종적으로 모델의 성능 평가
- 보통은 6:2:2의 비율로 train/validation/test set을 **임의 분할**

**Conclusion**

Training set

- Parameter 학습을 위한 데이터

Validation set

- Parameter의 generalization 검증
- Hyper-parameter 튜닝을 위한 데이터

Test set

- Parameter의 generalization 검증
- Hyper-parameter의 generalization 검증
- 알고리즘 비교 및 결정

**Training Procedure**

1. 데이터 분할 - 랜덤 분할
2. Epoch 시작
3. 학습(Training) - feed forward, Loss 계산, Back-propagation, Gradient Descent
4. 검증(Validation) - feed forward, Loss 계산
5. Best loss 체크 후 모델 저장
6. Epoch 종료
7. 테스트(Test) - feed forwad, Loss 계산



## 03. 실습 실험 환경 구성하기

jupyter notebook으로 진행