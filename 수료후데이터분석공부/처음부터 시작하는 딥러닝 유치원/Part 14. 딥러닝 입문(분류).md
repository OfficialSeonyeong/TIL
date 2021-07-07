# Part 14. 딥러닝 입문(분류)



## 01. Deep Binary Classification

- Binary Classification은 Logistic Regression에서 레이어가 깊어진 것 이외에는 전부 똑같다. (**BCE Loss Function**)
- Deep Regression과 마찬가지로, 모델을 DNN으로 교체 후, sigmoid를 마지막에 넣어준다.



## 02. Precision & Recall

- Threshold

  에 따라 성능의 성격이 달라진다. (0.5 말고 다르게 기준선으로 정할 수 있다.)

  - 경우에 따라 중요한 지표에 맞춰 설정

<img src="./Image/precision & recall.png" style="zoom:60%;" />

- **Precision** - 참이라고 예측한 것 중 실제 참인 확률

- **Recall** - 실제 참인 것 중에서 참이라고 예측한 확률

- $$
  F1\space score = 2 \times (Recall \times Precision) / (Recall+Precision)
  $$

- AUROC (Area Under Receiver Operating Characteristic) - 두 클래스의 분포 간의 분리(separation)정도를 나타낼 수 있는 metric

  - Area Under ROC curve로 1에 가까워질수록 두 클래스 간 분리가 잘 되었다는 것을 의미
  - 같은 accuracy라도 분리 정도에 따라 Classification 기준 정하는 것에 예민(robustness) 정도가 다르다.



## 03. 실습 Deep Binary Classification

jupyter notebook에서 진행



## 04. 분류(Classification)

- Binary Classification에서는 True 클래스의 확률 값이 나왔다.
- 확장해보면 신경망이 각 클래스 별 확률 값을 보여주는 것! 클래스 별 확률 값을 전부 더하면 1
- **Softmax 함수** layer를 마지막에 사용
- **Cross Entropy Loss** 사용



## 05. Softmax & Cross Entropy

### Softmax

- 입력 벡터를 discrete(이산) 확률 분포 형태로 바꿔주는 함수

- 각 클래스 별 확률 값들의 합은 1

- y 정답지는 0과 1로 이루어진 one-hot encoding vector

  <img src="./Image/softmax.png" alt="https://s3-us-west-2.amazonaws.com/secure.notion-static.com/02f1123f-5fc8-4013-bca3-61847f697202/softmax.png" style="zoom:60%;" />

### Cross Entropy Loss

- Binary Cross Entropy의 일반화 버전

  <img src="./Image/Cross Entropy.png" style="zoom:60%;" />

### NLL Loss with Log-Softmax

<img src="./Image/NLL Loss with Log-Softmax.png" style="zoom:60%;" />



## 06. Confusion Matrix

- Accuracy는 Multi-class Classification에서 쓰기 충분하지 않다.
- Confusion Matrix를 사용하면 어떤 class 사이의 추론 성능이 떨어지는지 쉽게 확인 & 대처 가능