# Part 15. 딥러닝의 성능개선을 위한 Regularizations



## 01. Regularization이란

- Overfitting을 막기 위해 Train set, Valid set, Test set으로 분리해서 모델 구축
- Overfitting을 막기 위한 추가적인 방법인 Regularization
  - training error가 높아질 수 있다. → training data에서의 noise, bias를 배우는 것을 막기 때문
  - Data Augmentation, Weight Decay, Dropout, Batch Normalization, Early Stopping, Bagging & Ensemble



## 02. Weight Decay

- Weight에 penalty를 부여해 줄여나가는 것
- 보통은 학습이 진행될수록 Weight parameter는 점점 커져 원점에서 멀어진다.
- **L2 Norm**을 통해 weight parameter가 원점에서 멀어지는 것을 방지하는 것을 Weight decay라고 한다.

$$
\tilde L(\theta) = L(\theta) + \alpha ||W||_2^2 \\ = L(\theta) + \alpha W^T \times W, \\ where \space \theta = {W,b}.
$$

- Bias는 penalty 대상에서 제외
- Weight parameter는 노드와 노드 간의 관계로, weight decay는 전체적인 관계의 강도를 제한
- **L1 Norm**을 사용하면 노드 사이의 관계가 희소(sparse)하도록 제한
- Loss 함수에 최소화를 방해하는 term을 넣음, hyper-parameter $\alpha$를 통해 두 term 사이의 균형을 조절
- 파이토치에서는 SGD, Adam의 초기화 파라미터로 제공
- 너무 강력한 결과를 제공해서 실용성이 크지는 않다.
- Loss 함수 수정을 통한 regularization 방식의 대표 주자



## 03. Data Augmentation

- 핵심 특징(feature)를 간직한 채, noise를 더하여 데이터를 확장하는 방법
- 보통 핵심 특징을 보존하기 위한 휴리스틱한 방법 사용
- noise robust한 모델을 얻을 수 있다.
- 규칙을 통해 증강(augment)하는 것은 옳지 않다. 랜덤이어야 한다.
- 예시) 이미지 증강 - Rotation(회전), Flipping(좌우전환), Shifting(일정 pixel 이내로 좌우상하 이동)
- 예시) 텍스트 증강 - Dropping(임의 단어 생략), Exchange(주변 단어와 위치 교환)
- Generative Models(Autoencoder, GAN)을 통해 이미지 증강
- 하지만, 새로운 지식을 배울 수 없다.



## 04. Dropout

- 신경망 중간에 noise 추가하는 것
- 피드 포워드 학습 중에 노드를 임의로 제외하는 것 (매번 다르게 적용)
- **학습**할 때는 확률 p에 따라 노드를 turn-off(dropout 적용)
- **추론**할 때는 모든 노드를 turn-on, 학습 때보다 평균적으로 1/p배 더 큰 입력을 받으므로 p를 W에 곱해 이를 상쇄
- 레이어 → 활성함수 → **Dropout** with hyerparameter p→ 레이어
- Training 과정에서는 dropout 활성화(`model.train()`), Validation 과정에서는 비활성화(`model.eval()`)
- Generalization error 감소
- 학습 속도 저하, hyper parameter 추가(drop 확률 p)



## 05. Batch Normalization

- Internal Covariance Shift Problem(첫번째 파라미터에 맞춰 두번째 파라미터가 업데이트를 했는데 그 업데이트 시 첫번째 파라미터도 업데이트를 했기에 나오는 문제) 해결을 위해
- 미니배치 기준으로 정규화(standardization) 후, shifting($\gamma$) + scaling($\beta$)
- Input Tensor Shape |x| = (batch_size, vector_size)

$$
y = \gamma \times x-\mu /\sqrt {\sigma^2 + \epsilon} + \beta \\ \mu = x.mean(dim=0) \\ \sigma = x.std(dim=0)
$$

- *학습*에서는 mini-batch 내에서 계산, batch_size는 항상 1보다 커야 한다.
- *추론*에서는 mini-batch 내에서 계산하는 것은 다음 입력을 보는 것과 같음. → 통계를 구하는 것이 아니라 **이제까지의 입력의 moving average, std**를 구해야 한다.
- Training 과정에서는 활성화(`model.train()`), Validation 과정에서는 비활성화(`model.eval()`)
- 레이어 → 활성함수 → **BatchNorm** → 레이어 or 레이어 → **BatchNorm** → 활성함수 → 레이어
- dropout 대체 가능
- hyper parameter 추가 없이 빠른 학습과 높은 성능 보장
- RNN에서는 사용 불가(Layer Normalization 사용)



## 06. 실습 Regularization

jupyter notebook으로 진행